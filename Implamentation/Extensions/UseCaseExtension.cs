using Domain;
using System;
using System.Collections.Generic;
using System.Text;

namespace Implamentation.Extensions
{
    public static class UseCaseExtension
    {
        public static void AddDefaultUseCasesForRole(this User user)
        {
            var list = new HashSet<UserUseCase>();

            if(user.RoleId == (int)RoleEnum.Admin)
            {
                list.Add(new UserUseCase { UseCaseId = (int)UseCasesEnum.EFCreateRole });
                list.Add(new UserUseCase { UseCaseId = (int)UseCasesEnum.EFDeleteRole });
                list.Add(new UserUseCase { UseCaseId = (int)UseCasesEnum.EFGetOneRole });
                list.Add(new UserUseCase { UseCaseId = (int)UseCasesEnum.EFGetRoles });
                list.Add(new UserUseCase { UseCaseId = (int)UseCasesEnum.EFUpdateRole });

                list.Add(new UserUseCase { UseCaseId = (int)UseCasesEnum.EFCreateUser });
                list.Add(new UserUseCase { UseCaseId = (int)UseCasesEnum.EFDeleteUser });
                list.Add(new UserUseCase { UseCaseId = (int)UseCasesEnum.EFGetOneUser });
                list.Add(new UserUseCase { UseCaseId = (int)UseCasesEnum.EFGetUsers });
                list.Add(new UserUseCase { UseCaseId = (int)UseCasesEnum.EFUpdateUser });

                list.Add(new UserUseCase { UseCaseId = (int)UseCasesEnum.EFAdminSendEmail });

                list.Add(new UserUseCase { UseCaseId = (int)UseCasesEnum.EFGetLogs });
            }
            else if(user.RoleId == (int)RoleEnum.Bibliotekar)
            {
                list.Add(new UserUseCase { UseCaseId = (int)UseCasesEnum.EFCreateAuthor });
                list.Add(new UserUseCase { UseCaseId = (int)UseCasesEnum.EFDeleteAuthor });
                list.Add(new UserUseCase { UseCaseId = (int)UseCasesEnum.EFGetAuthors });
                list.Add(new UserUseCase { UseCaseId = (int)UseCasesEnum.EFGetOneAuthor });
                list.Add(new UserUseCase { UseCaseId = (int)UseCasesEnum.EFUpdateAuthor });

                list.Add(new UserUseCase { UseCaseId = (int)UseCasesEnum.EFCreatePublisher });
                list.Add(new UserUseCase { UseCaseId = (int)UseCasesEnum.EFDeletePublisher });
                list.Add(new UserUseCase { UseCaseId = (int)UseCasesEnum.EFGetOnePublisher });
                list.Add(new UserUseCase { UseCaseId = (int)UseCasesEnum.EFGetPublishers });
                list.Add(new UserUseCase { UseCaseId = (int)UseCasesEnum.EFUpdatePublisher });

                list.Add(new UserUseCase { UseCaseId = (int)UseCasesEnum.EFCreateCategory });
                list.Add(new UserUseCase { UseCaseId = (int)UseCasesEnum.EFDeleteCategory });
                list.Add(new UserUseCase { UseCaseId = (int)UseCasesEnum.EFGetCategories });
                list.Add(new UserUseCase { UseCaseId = (int)UseCasesEnum.EFGetOneCategory });
                list.Add(new UserUseCase { UseCaseId = (int)UseCasesEnum.EFUpdateCategory });

                list.Add(new UserUseCase { UseCaseId = (int)UseCasesEnum.EFCreatePrice });
                list.Add(new UserUseCase { UseCaseId = (int)UseCasesEnum.EFGetPricelists });

                list.Add(new UserUseCase { UseCaseId = (int)UseCasesEnum.EFCreateNumberAllowedDays });
                list.Add(new UserUseCase { UseCaseId = (int)UseCasesEnum.EFGetNumberAllowedDays });

                list.Add(new UserUseCase { UseCaseId = (int)UseCasesEnum.EFCreateMember });
                list.Add(new UserUseCase { UseCaseId = (int)UseCasesEnum.EFDeleteMember });
                list.Add(new UserUseCase { UseCaseId = (int)UseCasesEnum.EFGetMembers });
                list.Add(new UserUseCase { UseCaseId = (int)UseCasesEnum.EFGetOneMember });
                list.Add(new UserUseCase { UseCaseId = (int)UseCasesEnum.EFUpdateMember });

                list.Add(new UserUseCase { UseCaseId = (int)UseCasesEnum.EFCreateBook });
                list.Add(new UserUseCase { UseCaseId = (int)UseCasesEnum.EFDeleteBook });
                list.Add(new UserUseCase { UseCaseId = (int)UseCasesEnum.EFGetBooks });
                list.Add(new UserUseCase { UseCaseId = (int)UseCasesEnum.EFGetOneBook });
                list.Add(new UserUseCase { UseCaseId = (int)UseCasesEnum.EFUpdateBook });


                list.Add(new UserUseCase { UseCaseId = (int)UseCasesEnum.EFCreateTitle });
                list.Add(new UserUseCase { UseCaseId = (int)UseCasesEnum.EFDeleteTitle });
                list.Add(new UserUseCase { UseCaseId = (int)UseCasesEnum.EFGetOneTitle });
                list.Add(new UserUseCase { UseCaseId = (int)UseCasesEnum.EFGetTitles });
                list.Add(new UserUseCase { UseCaseId = (int)UseCasesEnum.EFUpdateTitle });


                list.Add(new UserUseCase { UseCaseId = (int)UseCasesEnum.EFRentBook });
                list.Add(new UserUseCase { UseCaseId = (int)UseCasesEnum.EFReturnBook });
                list.Add(new UserUseCase { UseCaseId = (int)UseCasesEnum.EFGetIssuances });
                list.Add(new UserUseCase { UseCaseId = (int)UseCasesEnum.EFGetOneIssuance });


                list.Add(new UserUseCase { UseCaseId = (int)UseCasesEnum.EFGetRecompenses });

            }

            user.UserUseCases = list;
        }
    }
}
