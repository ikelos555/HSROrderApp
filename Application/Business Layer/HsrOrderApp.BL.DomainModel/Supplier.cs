using HsrOrderApp.BL.DomainModel.HelperObjects;
using Microsoft.Practices.EnterpriseLibrary.Validation.Validators;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace HsrOrderApp.BL.DomainModel
{
    public class Supplier : DomainObject
    {
        public Supplier()
        {
            this.AccountNumber = default(int);
            this.CreditRating = default(int);
            this.PreferedSupplier = default(int);
            this.ActiveFlag = default(bool);
            this.PuchraseWebserviceUrl = string.Empty;
        }

        public int AccountNumber { get; set; }

        [StringLengthValidator(1, 50)]
        public int CreditRating { get; set; }

        [StringLengthValidator(1, 50)]
        public int PreferedSupplier { get; set; }

        [StringLengthValidator(1, 50)]
        public bool ActiveFlag { get; set; }

        [StringLengthValidator(1, 50)]
        public string PuchraseWebserviceUrl { get; set; }

    }
}