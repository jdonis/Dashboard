//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace DashboardFMP.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class checklist
    {
        public checklist()
        {
            this.checklistquestions = new HashSet<checklistquestion>();
            this.indicators = new HashSet<indicator>();
        }
    
        public int id { get; set; }
        public string code { get; set; }
    
        public virtual ICollection<checklistquestion> checklistquestions { get; set; }
        public virtual ICollection<indicator> indicators { get; set; }
    }
}