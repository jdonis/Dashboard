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
    using System.ComponentModel.DataAnnotations.Schema;
    public partial class country_objective
    {
        public int id { get; set; }
        public int objective_id { get; set; }
        public int country_id { get; set; }
        public decimal target { get; set; }
        public int year_obj_country { get; set; }
        public int quarter { get; set; }

        [ForeignKey("country_id")]
        public virtual country country { get; set; }
        [ForeignKey("objective_id")]
        public virtual objective objective { get; set; }
    }
}
