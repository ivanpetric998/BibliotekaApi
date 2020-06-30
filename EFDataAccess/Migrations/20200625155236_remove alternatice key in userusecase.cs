using Microsoft.EntityFrameworkCore.Migrations;

namespace EFDataAccess.Migrations
{
    public partial class removealternaticekeyinuserusecase : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropUniqueConstraint(
                name: "AK_UserUseCases_UseCaseId_UserId",
                table: "UserUseCases");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddUniqueConstraint(
                name: "AK_UserUseCases_UseCaseId_UserId",
                table: "UserUseCases",
                columns: new[] { "UseCaseId", "UserId" });
        }
    }
}
