//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace DashboardFMP.Controllers
{
    using System;
    using System.Collections.Generic;
    
    public partial class indicator
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public indicator()
        {
            this.country_indicator = new HashSet<country_indicator>();
        }
    
        public int id { get; set; }
        public int language_id { get; set; }
        public int checklist_id { get; set; }
        public int objective_id { get; set; }
        public int indicatorgroup_id { get; set; }
        public string code { get; set; }
        public string mode { get; set; }
        public string frequency { get; set; }
        public Nullable<int> responsible { get; set; }
        public Nullable<int> contact { get; set; }
        public string inputtype { get; set; }
        public string name { get; set; }
        public string shortname { get; set; }
    
        public virtual checklist checklist { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<country_indicator> country_indicator { get; set; }
        public virtual indicatorgroup indicatorgroup { get; set; }
        public virtual objective objective { get; set; }
        public virtual language language { get; set; }
    }
}