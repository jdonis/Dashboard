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
    using System.ComponentModel.DataAnnotations.Schema;
    public partial class question_value
    {
        [Column(Order = 0), Key]
        public int country_indicator_country_id { get; set; }
        [Column(Order = 1), Key]
        public int country_indicator_indicator_id { get; set; }
        [Column(Order = 2), Key]
        public int checklistquestion_id { get; set; }
        public Nullable<int> value { get; set; }
        public Nullable<int> target { get; set; }

        [ForeignKey("checklistquestion_id")]
        public virtual checklistquestion checklistquestion { get; set; }
        //[ForeignKey("country_indicator_indicator_id,country_indicator_country_id")]
        //public virtual country_indicator country_indicator { get; set; }
    }
}