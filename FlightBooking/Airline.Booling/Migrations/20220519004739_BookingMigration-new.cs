using System;
using Microsoft.EntityFrameworkCore.Migrations;

namespace Airline.Booking.Migrations
{
    public partial class BookingMigrationnew : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<string>(
                name: "IsActive",
                table: "tblInventoy",
                type: "nvarchar(1)",
                nullable: false,
                defaultValue: "");

            migrationBuilder.UpdateData(
                table: "tblBookings",
                keyColumn: "TicketID",
                keyValue: "TICK585755",
                columns: new[] { "CreatedDate", "DateOfJourney", "Seattype", "UpdatedDate" },
                values: new object[] { new DateTime(2022, 5, 19, 6, 17, 38, 672, DateTimeKind.Local).AddTicks(4296), new DateTime(2022, 5, 29, 6, 17, 38, 671, DateTimeKind.Local).AddTicks(1704), 1, new DateTime(2022, 5, 19, 6, 17, 38, 672, DateTimeKind.Local).AddTicks(4594) });
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "IsActive",
                table: "tblInventoy");

            migrationBuilder.UpdateData(
                table: "tblBookings",
                keyColumn: "TicketID",
                keyValue: "TICK585755",
                columns: new[] { "CreatedDate", "DateOfJourney", "Seattype", "UpdatedDate" },
                values: new object[] { new DateTime(2022, 5, 9, 20, 56, 40, 489, DateTimeKind.Local).AddTicks(7328), new DateTime(2022, 5, 19, 20, 56, 40, 488, DateTimeKind.Local).AddTicks(8624), 0, new DateTime(2022, 5, 9, 20, 56, 40, 489, DateTimeKind.Local).AddTicks(7604) });
        }
    }
}
