using HsrOrderApp.BL.BusinessComponents;
using HsrOrderApp.BL.DomainModel;
using HsrOrderApp.BL.DtoAdapters;
using HsrOrderApp.BL.DTOAdapters.Helper;
using HsrOrderApp.SharedLibraries.DTO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace HsrOrderApp.BL.DTOAdapters
{
    public class SupplierAdapter
    {
        #region SupplierToDTO

        public static IList<SupplierListDTO> CustomersToDtos(IQueryable<Supplier> suppliers)
        {
            IQueryable<SupplierListDTO> supplierDtos = from s in suppliers
                                                       select new SupplierListDTO()
                                                       {
                                                           AccountNumber = s.AccountNumber,
                                                           CreditRating = s.CreditRating,
                                                           PreferedSuppliers = s.PreferedSupplier,
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
