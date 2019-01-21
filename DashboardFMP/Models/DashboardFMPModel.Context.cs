﻿//------------------------------------------------------------------------------
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
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    using System.Data.Entity.ModelConfiguration.Conventions;
    public partial class DefaultConnection : DbContext
    {
        public DefaultConnection()
            : base("name=DefaultConnection")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            //throw new UnintentionalCodeFirstException();
            base.OnModelCreating(modelBuilder);
            modelBuilder.Conventions.Remove<PluralizingTableNameConvention>();
        }
    
        public virtual DbSet<checklist> checklists { get; set; }
        public virtual DbSet<checklist_question_info> checklist_question_info { get; set; }
        public virtual DbSet<checklistquestion> checklistquestions { get; set; }
        public virtual DbSet<country> countries { get; set; }
        public virtual DbSet<country_indicator> country_indicator { get; set; }
        public virtual DbSet<country_objective> country_objective { get; set; }
        public virtual DbSet<country_info> country_info { get; set; }
        public virtual DbSet<indicator> indicators { get; set; }
        public virtual DbSet<indicator_group_info> indicator_group_info { get; set; }
        public virtual DbSet<indicator_info> indicator_info { get; set; }
        public virtual DbSet<indicatorgroup> indicatorgroups { get; set; }
        public virtual DbSet<language> languages { get; set; }
        public virtual DbSet<objective> objectives { get; set; }
        public virtual DbSet<objective_info> objective_info { get; set; }
        public virtual DbSet<question_value> question_value { get; set; }

        // Catalogs
        public virtual DbSet<CatIndicatorFrequency> CatIndicatorFrequency { get; set; }
        public virtual DbSet<CatIndicatorInputType> CatIndicatorInputType { get; set; }
        public virtual DbSet<CatIndicatorMode> CatIndicatorMode { get; set; }
        public virtual DbSet<CatYears> CatYears { get; set; }
        public virtual DbSet<CatAnnualCalculation> CatAnnualCalculation { get; set; }
    }
}
