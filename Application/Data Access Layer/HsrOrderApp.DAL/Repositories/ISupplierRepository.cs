using HsrOrderApp.BL.DomainModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace HsrOrderApp.DAL.Repositories
{
   
        public interface ISupplierRepository
        {
            IQueryable<Supplier> GetAll();
            Supplier GetByAccountNumber(int asccountNumber);

            int SaveSupplier(Supplier supplier);

            void DeleteSupplier(int accountNumber);
        
    }
}
