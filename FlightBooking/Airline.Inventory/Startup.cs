using Airline.Inventory.Consumer;
using Airline.Inventory.DBContext;
using Airline.Inventory.Events;
using Airline.Inventory.Repository;
using MassTransit;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;
using Microsoft.IdentityModel.Tokens;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;

namespace Airline.Inventory
{
    public class Startup
    {
        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        public IConfiguration Configuration { get; }

        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {
            services.AddControllers();
            services.AddDbContext<InventoryDbContext>(o => o.UseSqlServer(Configuration.GetConnectionString("FlightBookingDb")));
            services.AddTransient<IInventoryRepository, InventoryRepository>();
            services.AddAuthentication(x =>
            {
                x.DefaultAuthenticateScheme = "TestKey";
                x.DefaultChallengeScheme = "TestKey";
            }).AddJwtBearer("TestKey", o =>
            {

                var key = Encoding.UTF8.GetBytes(Configuration["JWT:Key"]);
                o.SaveToken = true;
                o.TokenValidationParameters = new TokenValidationParameters
                {
                    ValidateIssuer = false,
                    ValidateAudience = false,
                    ValidateLifetime = true,
                    ValidateIssuerSigningKey = true,
                    ValidIssuer = Configuration["JWT:Issuer"],
                    ValidAudience = Configuration["JWT:Audience"],
                    IssuerSigningKey = new SymmetricSecurityKey(key)
                };
            });
            services.AddSwaggerGen();

            //services.AddMassTransit(x =>
            //{
            //    x.UsingRabbitMq((context, cfg) => cfg.ConfigureEndpoints(context));
            //    x.AddRider(rider =>
            //    {
            //        rider.AddConsumer<BookingConsumer>();
            //        rider.UsingKafka((context, k) =>
            //        {
            //            k.Host("localhost:9092");
            //            k.TopicEndpoint<Bookingcofirm>(nameof(Bookingcofirm), GetUniqueName(nameof(Bookingcofirm)), e =>
            //            {
            //                e.CheckpointInterval = TimeSpan.FromSeconds(10);
            //                e.ConfigureConsumer<BookingConsumer>(context);
            //            });
            //        });
            //    });
            //});
            //services.AddMassTransitHostedService();
            services.AddMassTransit(x =>
            {
                x.UsingRabbitMq((context, cfg) => cfg.ConfigureEndpoints(context));
                x.AddRider(rider =>
                {
                    rider.AddConsumer<BookingEventConsumer>();
                    rider.UsingKafka((context, k) =>
                    {
                        k.Host("localhost:9092");
                        k.TopicEndpoint<BookingEvent>(nameof(BookingEvent), GetUniqueName(nameof(BookingEvent)), e => {
                            e.CheckpointInterval = TimeSpan.FromSeconds(10);
                            e.ConfigureConsumer<BookingEventConsumer>(context);
                        });
                    });
                });
            });
            services.AddMassTransitHostedService();
           
        }
        private string GetUniqueName(string eventname)
        {
            string hostname = Dns.GetHostName();
            string classAssembly = Assembly.GetCallingAssembly().GetName().Name;
            return $"{hostname}.{classAssembly}.{eventname}";
        }
        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }
            app.UseSwagger();
            app.UseSwaggerUI();
            app.UseRouting();
            app.UseCors(x => x.AllowAnyOrigin().AllowAnyMethod().AllowAnyHeader());
            app.UseAuthentication();
            app.UseAuthorization();

            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllers();
            });
        }
    }
}
