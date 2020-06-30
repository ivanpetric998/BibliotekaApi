using System;
using System.Collections.Generic;
using System.Text;

namespace Implamentation
{
    public enum RoleEnum
    {
        Admin = 2,
        Bibliotekar = 3
    }
    public enum UseCasesEnum
    {
        EFCreateAuthor = 1,
        EFUpdateAuthor = 2,
        EFDeleteAuthor = 3,
        EFGetAuthors = 4,
        EFGetOneAuthor = 5,

        EFCreateCategory = 6,
        EFGetOneCategory = 7,
        EFDeleteCategory = 8,
        EFGetCategories = 9,
        EFUpdateCategory = 10,

        EFCreateRole = 11,
        EFUpdateRole = 12,
        EFDeleteRole = 13,
        EFGetRoles = 14,
        EFGetOneRole = 15,

        EFCreatePublisher = 16,
        EFUpdatePublisher = 17,
        EFDeletePublisher = 18,
        EFGetPublishers = 19,
        EFGetOnePublisher = 20,

        EFCreatePrice = 21,
        EFGetPricelists = 22,

        EFCreateMember = 23,
        EFGetMembers = 24,
        EFUpdateMember =25,
        EFGetOneMember = 26,
        EFDeleteMember = 27,

        EFCreateNumberAllowedDays = 28,
        EFGetNumberAllowedDays = 29,

        EFCreateUser = 30,
        EFGetUsers = 31,
        EFGetOneUser = 32,
        EFDeleteUser = 33,
        EFUpdateUser = 34,

        EFCreateTitle = 35,
        EFGetTitles = 36,
        EFGetOneTitle = 37,
        EFUpdateTitle = 38,
        EFDeleteTitle = 39,

        EFCreateBook = 40,
        EFDeleteBook = 41,
        EFUpdateBook = 42,
        EFGetBooks = 43,
        EFGetOneBook = 44,

        EFRentBook = 45,
        EFGetIssuances = 46,
        EFGetOneIssuance = 47,
        EFReturnBook = 48,

        EFGetRecompenses = 49,

        EFGetLogs = 50,
        EFAdminSendEmail = 51
    }
}
