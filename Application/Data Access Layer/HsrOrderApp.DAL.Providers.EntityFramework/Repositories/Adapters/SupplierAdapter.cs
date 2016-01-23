using HsrOrderApp.BL.DomainModel;
using System;
using System.Collections.Generic;
using System.Data.Objects.DataClasses;
using System.Linq;
using System.Text;

namespace HsrOrderApp.DAL.Providers.EntityFramework.Repositories.Adapters
{
    public class SupplierAdapter
    {
        internal static IQueryable<BL.DomainModel.Supplier> AdaptSupplier(EntityCollection<Supplier> supplierCollection)
        {
            if (supplierCollection.IsLoaded == false) return null;

            var suppliers = from s in supplierCollection.AsEnumerable()
                            select AdaptSupplier(s);
            return suppliers.AsQueryable();
        }

        internal static BL.DomainModel.Supplier AdaptSupplier(Supplier s)
        {
            return new BL.DomainModel.Supplier()
            {
                AccountNumber = s.AccountNumber,
                CreditRating = s.CreditRating,
                PreferedSupplier = s.PreferedSupplier,
                ActiveFlag = s.ActiveFlag,
                PuchraseWebserviceUrl = s.PurchaseWebserviceUrl,
            };
        }
    }
}
