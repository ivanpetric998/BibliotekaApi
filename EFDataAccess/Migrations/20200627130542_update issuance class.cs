using Microsoft.EntityFrameworkCore.Migrations;

namespace EFDataAccess.Migrations
{
    public partial class updateissuanceclass : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Issuances_Users_LibrarianIssuedId",
                table: "Issuances");

            migrationBuilder.DropIndex(
                name: "IX_Issuances_LibrarianIssuedId",
                table: "Issuances");

            migrationBuilder.DropColumn(
                name: "LibrarianIssuedId",
                table: "Issuances");

            migrationBuilder.AddColumn<int>(
                name: "LibrarianRentedId",
                table: "Issuances",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.CreateIndex(
                name: "IX_Issuances_LibrarianRentedId",
                table: "Issuances",
                column: "LibrarianRentedId");

            migrationBuilder.AddForeignKey(
                name: "FK_Issuances_Users_LibrarianRentedId",
                table: "Issuances",
                column: "LibrarianRentedId",
                principalTable: "Users",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Issuances_Users_LibrarianRentedId",
                table: "Issuances");

            migrationBuilder.DropIndex(
                name: "IX_Issuances_LibrarianRentedId",
                table: "Issuances");

            migrationBuilder.DropColumn(
                name: "LibrarianRentedId",
                table: "Issuances");

            migrationBuilder.AddColumn<int>(
                name: "LibrarianIssuedId",
                table: "Issuances",
                type: "int",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.CreateIndex(
                name: "IX_Issuances_LibrarianIssuedId",
                table: "Issuances",
                column: "LibrarianIssuedId");

            migrationBuilder.AddForeignKey(
                name: "FK_Issuances_Users_LibrarianIssuedId",
                table: "Issuances",
                column: "LibrarianIssuedId",
                principalTable: "Users",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);
        }
    }
}
