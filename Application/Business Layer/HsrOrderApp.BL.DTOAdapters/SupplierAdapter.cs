using HsrOrderApp.BL.DomainModel;
using HsrOrderApp.SharedLibraries.DTO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace HsrOrderApp.BL.DTOAdapters
{
    class SupplierAdapter
    {
        #region SupplierToDTO

        public static IList<SupplierListDTO> CustomersToDtos(IQueryable<Supplier> suppliers)
        {
            IQueryable<SupplierListDTO> supplierDtos = from s in suppliers
                                                       select new SupplierListDTO()
                                                       {
                                                           AccountNumber = s.AccountNumber,
                                                           CreditRating = s.CreditRating,
                                                           PreferedSupplier = s.PreferedSupplier,
                                                           ActiveFlag = s.ActiveFlag,

                                                       };
            return supplierDtos.ToList();
        }

        public static CustomerDTO CustomerToDto(Customer c)
        {
            CustomerDTO dto = new CustomerDTO()
            {
                Id = c.CustomerId,
                Name = c.Name,
                FirstName = c.FirstName,
                Version = c.Version,
                Addresses = AddressAdapter.AddressToDtos(c.Addresses)
            };

            return dto;
        }

        #region private helpers

        private static int GetNumberOfOrdersOfCustomer(Customer customer, bool draftOnly)
        {
            if (customer.Orders == null)
            {
                return 0;
            }
            if (draftOnly)
            {
                return customer.Orders.Count(o => o.OrderStatus == OrderStatus.Draft);
            }
            return customer.Orders.Count();
        }

        #endregion

        #endregion

        #region DTOToCustomer

        public static Customer DtoToCustomer(CustomerDTO dto)
        {
            Customer customer = new Customer()
            {
                CustomerId = dto.Id,
                Name = dto.Name,
                FirstName = dto.FirstName,
                Version = dto.Version
            };
            ValidationHelper.Validate(customer);
            return customer;
        }

        public static IEnumerable<ChangeItem> GetChangeItems(CustomerDTO dto, Customer customer)
        {
            IEnumerable<ChangeItem> changeItems = from c in dto.Changes
                                                  select
                                                      new ChangeItem(c.ChangeType,
                                                                     AddressAdapter.DtoToAddress((AddressDTO)c.Object));
            return changeItems;
        }

        #endregion
    }
}
