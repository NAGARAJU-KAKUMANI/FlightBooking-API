using System;
using Microsoft.EntityFrameworkCore.Migrations;

namespace Airline.Inventory.Migrations
{
    public partial class NewInventorynew : Migration
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
                table: "tblAirLine",
                keyColumn: "AirlineId",
                keyValue: 1,
                column: "CreatedDate",
                value: new DateTime(2022, 5, 19, 6, 16, 11, 248, DateTimeKind.Local).AddTicks(8949));

            migrationBuilder.UpdateData(
                table: "tblAirLine",
                keyColumn: "AirlineId",
                keyValue: 2,
                column: "CreatedDate",
                value: new DateTime(2022, 5, 19, 6, 16, 11, 248, DateTimeKind.Local).AddTicks(9190));

            migrationBuilder.UpdateData(
                table: "tblFlight",
                keyColumn: "FlightID",
                keyValue: 1,
                column: "CreatedDate",
                value: new DateTime(2022, 5, 19, 6, 16, 11, 249, DateTimeKind.Local).AddTicks(199));

            migrationBuilder.UpdateData(
                table: "tblFlight",
                keyColumn: "FlightID",
                keyValue: 2,
                column: "CreatedDate",
                value: new DateTime(2022, 5, 19, 6, 16, 11, 249, DateTimeKind.Local).AddTicks(514));

            migrationBuilder.UpdateData(
                table: "tblInventoy",
                keyColumn: "InventoryId",
                keyValue: 1,
                columns: new[] { "CreatedDate", "EndDate", "StartDate" },
                values: new object[] { new DateTime(2022, 5, 19, 6, 16, 11, 247, DateTimeKind.Local).AddTicks(8257), new DateTime(2022, 5, 29, 6, 16, 11, 247, DateTimeKind.Local).AddTicks(5629), new DateTime(2022, 5, 24, 6, 16, 11, 246, DateTimeKind.Local).AddTicks(4751) });
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "IsActive",
                table: "tblInventoy");

            migrationBuilder.UpdateData(
                table: "tblAirLine",
                keyColumn: "AirlineId",
                keyValue: 1,
                column: "CreatedDate",
                value: new DateTime(2022, 5, 9, 20, 3, 0, 430, DateTimeKind.Local).AddTicks(2117));

            migrationBuilder.UpdateData(
                table: "tblAirLine",
                keyColumn: "AirlineId",
                keyValue: 2,
                column: "CreatedDate",
                value: new DateTime(2022, 5, 9, 20, 3, 0, 430, DateTimeKind.Local).AddTicks(2425));

            migrationBuilder.UpdateData(
                table: "tblFlight",
                keyColumn: "FlightID",
                keyValue: 1,
                column: "CreatedDate",
                value: new DateTime(2022, 5, 9, 20, 3, 0, 430, DateTimeKind.Local).AddTicks(3693));

            migrationBuilder.UpdateData(
                table: "tblFlight",
                keyColumn: "FlightID",
                keyValue: 2,
                column: "CreatedDate",
                value: new DateTime(2022, 5, 9, 20, 3, 0, 430, DateTimeKind.Local).AddTicks(4089));

            migrationBuilder.UpdateData(
                table: "tblInventoy",
                keyColumn: "InventoryId",
                keyValue: 1,
                columns: new[] { "CreatedDate", "EndDate", "StartDate" },
                values: new object[] { new DateTime(2022, 5, 9, 20, 3, 0, 428, DateTimeKind.Local).AddTicks(8583), new DateTime(2022, 5, 19, 20, 3, 0, 428, DateTimeKind.Local).AddTicks(5358), new DateTime(2022, 5, 14, 20, 3, 0, 427, DateTimeKind.Local).AddTicks(2347) });
        }
    }
}
