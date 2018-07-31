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
    public partial class indicator_info
    {
        [Column(Order = 0), Key]
        public int language_id { get; set; }
        [Column(Order = 1), Key]
        public int indicator_id { get; set; }
        public string name { get; set; }
        public string short_ { get; set; }
        public string code { get; set; }

        [ForeignKey("indicator_id")]
        public virtual indicator indicator { get; set; }
        [ForeignKey("language_id")]
        public virtual language language { get; set; }
    }
}
