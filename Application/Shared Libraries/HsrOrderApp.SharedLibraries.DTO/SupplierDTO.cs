using HsrOrderApp.SharedLibraries.DTO.Base;
using Microsoft.Practices.EnterpriseLibrary.Validation.Validators;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Text;

namespace HsrOrderApp.SharedLibraries.DTO
{
    [DataContract]
    public class SupplierDTO : DTOParentObject
    {
        private int _creditRating;
        private int _preferredSupplier;
        private bool _activeFlag;
        private string _purchaseWebserviceUrl;

        public SupplierDTO()
        {
            this.CreditRating = default(int);
            this.PreferredSupplier = default(int);
            this.ActiveFlag = default(bool);
            this.PurchaseWebserivceUrl = string.Empty;
        }

        [DataMember]
        public int CreditRating
        {
            get { return _creditRating; }
            set
            {
                if (value != _creditRating)
                {
                    this._creditRating= value;
                    OnPropertyChanged(() => CreditRating);
                }
            }
        }

        [DataMember]
        public int PreferredSupplier
        {
            get { return _preferredSupplier; }
            set
            {
                if (value != _preferredSupplier)
                {
                    this._preferredSupplier = value;
                    OnPropertyChanged(() => PreferredSupplier);
                }
            }
        }

        [DataMember]
        public bool ActiveFlag
        {
            get { return _activeFlag; }
            set
            {
                if (value != _activeFlag)
                {
                    this._activeFlag = value;
                    OnPropertyChanged(() => ActiveFlag);
                }
            }
        }

        [DataMember]
        public string PurchaseWebserivceUrl
        {
            get { return _purchaseWebserviceUrl; }
            set
            {
                if (value != _purchaseWebserviceUrl)
                {
                    this._purchaseWebserviceUrl = value;
                    OnPropertyChanged(() => PurchaseWebserivceUrl);
                }
            }
        }
    }
}
