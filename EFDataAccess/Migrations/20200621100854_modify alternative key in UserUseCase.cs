using Microsoft.EntityFrameworkCore.Migrations;

namespace EFDataAccess.Migrations
{
    public partial class modifyalternativekeyinUserUseCase : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddUniqueConstraint(
                name: "AK_UserUseCase_UseCaseId_UserId",
                table: "UserUseCase",
                columns: new[] { "UseCaseId", "UserId" });
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropUniqueConstraint(
                name: "AK_UserUseCase_UseCaseId_UserId",
                table: "UserUseCase");
        }
    }
}
