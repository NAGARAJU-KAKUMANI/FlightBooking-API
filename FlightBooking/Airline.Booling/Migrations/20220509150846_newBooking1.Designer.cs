﻿// <auto-generated />
using System;
using Airline.Booking.DBContext;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Metadata;
using Microsoft.EntityFrameworkCore.Migrations;
using Microsoft.EntityFrameworkCore.Storage.ValueConversion;

namespace Airline.Booking.Migrations
{
    [DbContext(typeof(ApplicationBookDbcontext))]
    [Migration("20220509150846_newBooking1")]
    partial class newBooking1
    {
        protected override void BuildTargetModel(ModelBuilder modelBuilder)
        {
#pragma warning disable 612, 618
            modelBuilder
                .HasAnnotation("Relational:MaxIdentifierLength", 128)
                .HasAnnotation("ProductVersion", "5.0.16")
                .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

            modelBuilder.Entity("Airline.Booking.Models.Bookings", b =>
                {
                    b.Property<string>("TicketID")
                        .HasColumnType("nvarchar(450)");

                    b.Property<int>("Age")
                        .HasColumnType("int");

                    b.Property<string>("BoardingTime")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("BookingID")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("CreatedBy")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.Property<DateTime>("CreatedDate")
                        .HasColumnType("datetime2");

                    b.Property<DateTime>("DateOfJourney")
                        .HasColumnType("datetime2");

                    b.Property<string>("EmailID")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("FlightNumber")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("FromPlace")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.Property<int>("SeatNumber")
                        .HasColumnType("int");

                    b.Property<int>("Seattype")
                        .HasColumnType("int");

                    b.Property<int>("Status")
                        .HasColumnType("int");

                    b.Property<string>("Statusstr")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("ToPlace")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.Property<DateTime?>("UpdatedDate")
                        .HasColumnType("datetime2");

                    b.Property<string>("Updatedby")
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("UserName")
                        .IsRequired()
                        .HasMaxLength(50)
                        .HasColumnType("nvarchar(50)");

                    b.Property<string>("passportNumber")
                        .IsRequired()
                        .HasMaxLength(20)
                        .HasColumnType("nvarchar(20)");

                    b.HasKey("TicketID");

                    b.ToTable("tblBookings");

                    b.HasData(
                        new
                        {
                            TicketID = "TICK585755",
                            Age = 25,
                            BoardingTime = "10.00 AM",
                            BookingID = "BCK125458",
                            CreatedBy = "NAGARAJU",
                            CreatedDate = new DateTime(2022, 5, 9, 20, 38, 46, 520, DateTimeKind.Local).AddTicks(8288),
                            DateOfJourney = new DateTime(2022, 5, 19, 20, 38, 46, 519, DateTimeKind.Local).AddTicks(5297),
                            EmailID = "kakumani15@gmail.com",
                            FlightNumber = "V12345",
                            FromPlace = "Hyderabd",
                            SeatNumber = 2,
                            Seattype = 0,
                            Status = 1,
                            Statusstr = "TicketBooked",
                            ToPlace = "BASR",
                            UpdatedDate = new DateTime(2022, 5, 9, 20, 38, 46, 520, DateTimeKind.Local).AddTicks(8578),
                            Updatedby = "NAGARAJU",
                            UserName = "NAGARAJU",
                            passportNumber = "V655585"
                        });
                });
#pragma warning restore 612, 618
        }
    }
}