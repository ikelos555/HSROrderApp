using HsrOrderApp.BL.DomainModel;
using HsrOrderApp.DAL.Repositories;
using HsrOrderApp.SharedLibraries.SharedEnums;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Transactions;

namespace HsrOrderApp.BL.BusinessComponents
{
    public class SupplierBusinessComponent
    {
        private ISupplierRepository rep;

        public SupplierBusinessComponent()
        {
        }

        public SupplierBusinessComponent(ISupplierRepository unitOfWork)
        {
            this.rep = unitOfWork;
        }

        public ISupplierRepository Repository
        {
            get { return this.rep; }
            set { this.rep = value; }
        }

        public Supplier GetByAccountNumber(int accountNumber)
        {
            Supplier customer = rep.GetByAccountNumber(accountNumber);
            return customer;
        }

        public IQueryable<Supplier> GetSupplierByCriteria(int preferred, bool active, CreditRating creditRating)
        {
            IQueryable<Supplier> customers = new List<Supplier>().AsQueryable();
            
            customers = rep.GetAll().Where(s => s.ActiveFlag == active && 
                                                s.PreferedSupplier == preferred && 
                                                s.CreditRating == (int) creditRating);
            
            return customers;
        }

        public int StoreSupplier(Supplier supplier, IEnumerable<ChangeItem> changeItems)
        {
            int accountNumber = default(int);
            using (TransactionScope transaction = new TransactionScope())
            {
                accountNumber = rep.SaveSupplier(supplier);
                
                transaction.Complete();
            }

            return accountNumber;
        }

        public void DeleteSupplier(int accountNumber)
        {
            rep.DeleteSupplier(accountNumber);
        }
    }
}
