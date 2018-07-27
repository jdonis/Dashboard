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
    public partial class country_indicator
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        //public country_indicator()
        //{
        //    this.question_value = new HashSet<question_value>();
        //}

        [Column(Order = 0), Key]
        public int indicator_id { get; set; }
        [Column(Order = 1), Key]
        public int country_id { get; set; }
        public int value { get; set; }
        public string inputtype { get; set; }
        public int quarter { get; set; }
        public Nullable<int> target { get; set; }
        public Nullable<System.DateTime> inputyear { get; set; }

        [ForeignKey("country_id")]
        public virtual country country { get; set; }
        [ForeignKey("indicator_id")]
        public virtual indicator indicator { get; set; }
        //[System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        //public virtual ICollection<question_value> question_value { get; set; }
    }
}
