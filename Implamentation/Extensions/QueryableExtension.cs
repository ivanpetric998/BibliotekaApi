using Application.Queries;
using Application.Searches;
using AutoMapper;
using Domain;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Text;

namespace Implamentation.Extensions
{
    public static class QueryableExtension
    {
        public static PagedResponse<TDto> Paged<TDto, TSource>
            (this IQueryable<TSource> query, PagedSearch search, IMapper mapper) where TDto : class
        {
            var skip = (search.Page - 1) * search.PerPage;

            return new PagedResponse<TDto>()
            {
                TotalCount = query.Count(),
                ItemsPerPage = search.PerPage,
                CurrentPage = search.Page,
                Items = mapper.Map<IEnumerable<TDto>>(query.Skip(skip).Take(search.PerPage).ToList())
            };
        }

        public static IQueryable<TDto> DefaultFilter<TDto>(this IQueryable<TDto> query, PagedSearch search) where TDto : BaseEntity
        {
            if(search.IsActive != null)
            {
                query = query.Where(x => x.IsActive == search.IsActive);
            }

            return query;
        }
    }
}
