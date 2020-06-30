using Microsoft.EntityFrameworkCore.Migrations;

namespace EFDataAccess.Migrations
{
    public partial class addusecaseindbContext : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_UserUseCase_Users_UserId",
                table: "UserUseCase");

            migrationBuilder.DropPrimaryKey(
                name: "PK_UserUseCase",
                table: "UserUseCase");

            migrationBuilder.DropUniqueConstraint(
                name: "AK_UserUseCase_UseCaseId_UserId",
                table: "UserUseCase");

            migrationBuilder.RenameTable(
                name: "UserUseCase",
                newName: "UserUseCases");

            migrationBuilder.RenameIndex(
                name: "IX_UserUseCase_UserId",
                table: "UserUseCases",
                newName: "IX_UserUseCases_UserId");

            migrationBuilder.AddPrimaryKey(
                name: "PK_UserUseCases",
                table: "UserUseCases",
                column: "Id");

            migrationBuilder.AddUniqueConstraint(
                name: "AK_UserUseCases_UseCaseId_UserId",
                table: "UserUseCases",
                columns: new[] { "UseCaseId", "UserId" });

            migrationBuilder.AddForeignKey(
                name: "FK_UserUseCases_Users_UserId",
                table: "UserUseCases",
                column: "UserId",
                principalTable: "Users",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_UserUseCases_Users_UserId",
                table: "UserUseCases");

            migrationBuilder.DropPrimaryKey(
                name: "PK_UserUseCases",
                table: "UserUseCases");

            migrationBuilder.DropUniqueConstraint(
                name: "AK_UserUseCases_UseCaseId_UserId",
                table: "UserUseCases");

            migrationBuilder.RenameTable(
                name: "UserUseCases",
                newName: "UserUseCase");

            migrationBuilder.RenameIndex(
                name: "IX_UserUseCases_UserId",
                table: "UserUseCase",
                newName: "IX_UserUseCase_UserId");

            migrationBuilder.AddPrimaryKey(
                name: "PK_UserUseCase",
                table: "UserUseCase",
                column: "Id");

            migrationBuilder.AddUniqueConstraint(
                name: "AK_UserUseCase_UseCaseId_UserId",
                table: "UserUseCase",
                columns: new[] { "UseCaseId", "UserId" });

            migrationBuilder.AddForeignKey(
                name: "FK_UserUseCase_Users_UserId",
                table: "UserUseCase",
                column: "UserId",
                principalTable: "Users",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);
        }
    }
}
