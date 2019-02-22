//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace DashboardFMP.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;

    public  class CatIndicatorMode
    {
        [Key]
        public string name { get; set; }
        public string orden { get; set; }
    
    }

    public  class CatIndicatorFrequency
    {
        [Key]
        public string name { get; set; }
        public string orden { get; set; }

    }

    public  class CatIndicatorInputType
    {
        [Key]
        public string name { get; set; }
        public string orden { get; set; }

    }

    public class CatYears
    {
        [Key]
        public int id { get; set; }
        public int? year_name { get; set; }
        public bool? active { get; set; }

    }

    public class CatAnnualCalculation
    {
        [Key]
        public int id { get; set; }
        public string Name { get; set; }
        public string Instruction { get; set; }
        public int? orden { get; set; }

    }

    public class IndicatorCountry
    {
        public int country_id { get; set; }
        public int indicator_id { get; set; }
        public int year_ { get; set; }
        public int? ind_Q1_ { get; set; }
        public int? ind_Q2_ { get; set; }
        public int? ind_Q3_ { get; set; }
        public int? ind_Q4_ { get; set; }

    }

    public class IndicatorByCountryActive
    {
        public int country_id { get; set; }
        public int indicator_id { get; set; }
        public int year_select { get; set; }
        public bool? active { get; set; }
        public bool? visible { get; set; }
        public decimal? target_Q1 { get; set; }
        public decimal? target_Q2 { get; set; }
        public decimal? target_Q3 { get; set; }
        public decimal? target_Q4 { get; set; }
        public string inputtype { get; set; }

    }

    public class ConsolidatedIndicatorCountry
    {
        public int country_id { get; set; }
        public int indicator_id { get; set; }
        public int year_ind_country { get; set; }
        public List<country_indicator> children_1 { get; set; }
    }


}
