using HsrOrderApp.DAL.Repositories;
using Microsoft.Practices.EnterpriseLibrary.ExceptionHandling;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using HsrOrderApp.BL.DomainModel;
using HsrOrderApp.DAL.Providers.EntityFramework.Repositories.Adapters;
using HsrOrderApp.BL.DomainModel.SpecialCases;

namespace HsrOrderApp.DAL.Providers.EntityFramework.Repositories
{
    public class SupplierRepository : RepositoryBase, ISupplierRepository
    {
        public SupplierRepository(HsrOrderAppEntities db) : base(db)
        { }


        public int SaveSupplier(HsrOrderApp.BL.DomainModel.Supplier supplier)
        {
            Supplier dbSupplier = SaveSupplierInternal(supplier);
            supplier.AccountNumber = dbSupplier.AccountNumber;
            return supplier.AccountNumber;
        }

        internal Supplier SaveSupplierInternal(BL.DomainModel.Supplier supplier)
        {
            try
            {
                string setname = "SupplierSet";
                Supplier dbSupplier;
                bool isNew = false;
                if (supplier.AccountNumber == default(int) || supplier.AccountNumber <= 0)
                {
                    isNew = true;
                    dbSupplier = new Supplier();
                }
                else
                {
                    dbSupplier = new Supplier() { AccountNumber = supplier.AccountNumber, Version = supplier.Version.ToTimestamp() };
                    dbSupplier.EntityKey = db.CreateEntityKey(setname, dbSupplier);
                    db.AttachTo(setname, dbSupplier);
                }
                dbSupplier.CreditRating = supplier.CreditRating;
                dbSupplier.PreferedSupplier = supplier.PreferedSupplier;
                dbSupplier.ActiveFlag = supplier.ActiveFlag;
                dbSupplier.PurchaseWebserviceUrl = supplier.PuchraseWebserviceUrl;


                if (isNew)
                {
                    db.AddToSupplierSet(dbSupplier);
                }
                db.SaveChanges();

                return dbSupplier;
            }
            catch (OptimisticConcurrencyException ex)
            {
                if (ExceptionPolicy.HandleException(ex, "DA Policy")) throw;
                return null;
            }
        }

        public void DeleteSupplier(int accountNumber)
        {
            Supplier cu = db.SupplierSet.FirstOrDefault(c => c.AccountNumber == accountNumber);
            if (cu != null)
            {
                db.DeleteObject(cu);
                db.SaveChanges();
            }
        }

        public IQueryable<BL.DomainModel.Supplier> GetAll()
        {
            var customers = from s in this.db.SupplierSet
                            select SupplierAdapter.AdaptSupplier(s);

            return customers.AsQueryable();
        }

        public BL.DomainModel.Supplier GetByAccountNumber(int accountNumber)
        {
            try
            {
                var suppliers = from s in this.db.SupplierSet
                                where s.AccountNumber == accountNumber
                                select SupplierAdapter.AdaptSupplier(s);

                return suppliers.First();
            }
            catch (ArgumentNullException ex)
            {
                if (ExceptionPolicy.HandleException(ex, "DA Policy")) throw;
                return new MissingSupplier();
            }
        }
    }
}