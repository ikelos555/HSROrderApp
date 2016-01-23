﻿using HsrOrderApp.SharedLibraries.DTO.Base;
using Microsoft.Practices.EnterpriseLibrary.Validation.Validators;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Text;

namespace HsrOrderApp.SharedLibraries.DTO
{
    [DataContract]
    public class SupplierListDTO : DTOBase
    {
        public SupplierListDTO()
        {
            
        }

        [DataMember]
        [StringLengthValidator(1, 50)]
        public int AccountNumber{ get; set; }

        [DataMember]
        [StringLengthValidator(1, 50)]
        public bool ActiveFlag{ get; set; }

        [DataMember]
        [RangeValidator(0, RangeBoundaryType.Inclusive, int.MaxValue, RangeBoundaryType.Ignore)]
        public int CreditRating { get; set; }

        [DataMember]
        [RangeValidator(0, RangeBoundaryType.Inclusive, int.MaxValue, RangeBoundaryType.Ignore)]
        public int NumberOfOpenOrders { get; set; }

        public string FullName
        {
            get
            {
                if (Name == string.Empty && FirstName == string.Empty)
                    return string.Empty;
                if (FirstName == string.Empty)
                    return Name;
                else
                    return Name + ", " + FirstName;
            }
        }
    }
}
