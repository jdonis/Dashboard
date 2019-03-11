using DashboardFMP.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Http;
using System.Web.Mvc;

namespace DashboardFMP.Controllers
{
    public class FMPController : Controller
    {

        private DefaultConnection db = new DefaultConnection();
        // GET: FMP
        public ActionResult Index()
        {
            return View();
        }

        // Ingreso datos de indicadores

        public ActionResult FMP()
        {
            return View();
        }

        public ActionResult FMPListDataTables()
        {
            try
            {
                //IQueryable subquery;

                //var list_country_indicators = db.country_info;
                var list_country = db.country_info.Where(y => y.group != true).AsQueryable().Select(x => x.country_id);

                var  subquery = db.country_indicator
                                .Where(z => list_country.Contains(z.country_id))
                                .GroupBy(x => new { x.country, x.year_ind_country })
                                .AsQueryable()
                                .Select(group => new { Peo = group.Key, Count = group.Count() });


                var jsondata = (from object_db in subquery
                                select new
                                {
                                    id = object_db.Peo.country.id,
                                    name = object_db.Peo.country.country_info.FirstOrDefault().name,
                                    code = object_db.Peo.country.code,
                                    @year = object_db.Peo.year_ind_country
                                })
                                .OrderBy(z => z.name)
                                .ToArray();

                return Json(jsondata, JsonRequestBehavior.AllowGet);
            }
            catch (Exception e)
            {
                ViewBag.Message = e.Message;
            }
            return null;
        }



        //[HttpPost]
        //public ActionResult IndicatorbyCountrySave(List<ArrayTotalIndicatorsSave> incoming)
        public ActionResult IndicatorbyCountrySave(ArrayTotalIndicatorsSave incoming)
        {
            //IEnumerable<IndicatorCountry>
            try
            {

                var country_id_dummy = incoming.indicators[0].country_id;
                var year_dummy = incoming.indicators[0].year_;

                db.country_indicator.Where(i => i.country_id == country_id_dummy && i.year_ind_country == year_dummy).ToList()
                    .ForEach(a =>
                    {
                        var indicator_value_Q1 = (incoming.indicators.Where(z => z.indicator_id == a.indicator_id).FirstOrDefault().ind_Q1_ == null) ? incoming.indicators.Where(z => z.indicator_id == a.indicator_id).FirstOrDefault().ind_Q1_ : Convert.ToDecimal( incoming.indicators.Where(z => z.indicator_id == a.indicator_id).FirstOrDefault().ind_Q1_);
                        var indicator_value_Q2 = (incoming.indicators.Where(z => z.indicator_id == a.indicator_id).FirstOrDefault().ind_Q2_ == null) ? incoming.indicators.Where(z => z.indicator_id == a.indicator_id).FirstOrDefault().ind_Q2_ : Convert.ToDecimal(incoming.indicators.Where(z => z.indicator_id == a.indicator_id).FirstOrDefault().ind_Q2_);
                        var indicator_value_Q3 = (incoming.indicators.Where(z => z.indicator_id == a.indicator_id).FirstOrDefault().ind_Q3_ == null) ? incoming.indicators.Where(z => z.indicator_id == a.indicator_id).FirstOrDefault().ind_Q3_ : Convert.ToDecimal(incoming.indicators.Where(z => z.indicator_id == a.indicator_id).FirstOrDefault().ind_Q3_);
                        var indicator_value_Q4 = (incoming.indicators.Where(z => z.indicator_id == a.indicator_id).FirstOrDefault().ind_Q4_ == null) ? incoming.indicators.Where(z => z.indicator_id == a.indicator_id).FirstOrDefault().ind_Q4_ : Convert.ToDecimal(incoming.indicators.Where(z => z.indicator_id == a.indicator_id).FirstOrDefault().ind_Q4_);
                        a.value = (a.quarter == 1) ? indicator_value_Q1
                                    : (a.quarter == 2) ? indicator_value_Q2
                                    : (a.quarter == 3) ? indicator_value_Q3
                                    : indicator_value_Q4;
                    });
                db.SaveChanges();


                foreach (CheckListbyIndicator CheckListIndicator in incoming.checklists)
                {
                    db.question_value
                        .Where(j => j.country_indicator_country_id == CheckListIndicator.country_id
                                                    && j.year_ind_country == CheckListIndicator.year_
                                                    && j.country_indicator_indicator_id == CheckListIndicator.indicator_id
                                                    && j.checklistquestion_id == CheckListIndicator.question_id)
                        .ToList()
                        .ForEach(a =>
                        {

                            var chklist_value_Q1 = (CheckListIndicator.chklist_Q1_ == null) ? CheckListIndicator.chklist_Q1_ : Convert.ToInt32(CheckListIndicator.chklist_Q1_);
                            var chklist_value_Q2 = (CheckListIndicator.chklist_Q2_ == null) ? CheckListIndicator.chklist_Q2_ : Convert.ToInt32(CheckListIndicator.chklist_Q2_);
                            var chklist_value_Q3 = (CheckListIndicator.chklist_Q3_ == null) ? CheckListIndicator.chklist_Q3_ : Convert.ToInt32(CheckListIndicator.chklist_Q3_);
                            var chklist_value_Q4 = (CheckListIndicator.chklist_Q4_ == null) ? CheckListIndicator.chklist_Q4_ : Convert.ToInt32(CheckListIndicator.chklist_Q4_);

                            a.Q1value = chklist_value_Q1;
                            a.Q2value = chklist_value_Q2;
                            a.Q3value = chklist_value_Q3;
                            a.Q4value = chklist_value_Q4;
                         });
                    db.SaveChanges();
                }

                //db.question_value.Where()

                //db.SaveChanges();

                return Json("Success");

            }
            catch (Exception e)
            {
                ViewBag.Message = e.Message;
            }
            return null;
        }


        public ActionResult ListIndicatorbyCountry(int countryid_param, string language_param, int year_param)
        {   
            try
            {
                var countryid = countryid_param > 0 ? countryid_param : 0 ;
                var languageid = language_param != ""  ? db.languages.Where(z => z.code == language_param.Trim().ToUpper()).FirstOrDefault().id : db.country_info.Where(z => z.country_id == countryid).Any() ? db.country_info.Where(z => z.country_id == countryid).FirstOrDefault().language_id : 1  ;
                var year_ = year_param > 0 ? year_param : 0;
                var year_id = db.CatYears.Where(d => d.year_name == year_param).FirstOrDefault().id;
                var jsondata_app = new List<Object>();

                if (countryid < 1 || languageid < 1 || year_ < 1) return null;
               
                //var list_country_indicators_unique_test = db.country_indicator
                //                                            .Where(z => z.country_id == countryid && z.year_ind_country == year_).ToList();

                var list_country_indicators_unique = db.country_indicator.GroupBy( x => new { x.country_id, x.indicator_id, x.year_ind_country})
                                                        .AsQueryable()
                                                        .Select(y => new ConsolidatedIndicatorCountry()
                                                        {
                                                            country_id = y.Key.country_id,
                                                            indicator_id = y.Key.indicator_id,
                                                            year_ind_country = y.Key.year_ind_country,
                                                            children_1 = y.ToList()
                                                        }
                                                        )
                                                        .Where(z => z.country_id == countryid && z.year_ind_country == year_)
                                                        .OrderBy(y => y.children_1.FirstOrDefault().indicator.objective.orden)
                                                        .ThenBy(u => u.children_1.FirstOrDefault().indicator.indicatorgroup.orden)
                                                        .ThenBy(w => w.children_1.FirstOrDefault().indicator.orden)
                                                        .ToList();



                //var country_indicator_ = db.country_indicator.Where(z => z.country_id == countryid && z.year_ind_country == year_).ToList();

                //foreach (ConsolidatedIndicatorCountry incoming_node in list_country_indicators_unique)
                //{

                //}

                    var jsondata = (from object_db in list_country_indicators_unique
                                select new
                                {
                                    id = object_db.children_1.FirstOrDefault().id,
                                    indicator_id = object_db.indicator_id,
                                    country_id = object_db.country_id,
                                    year_ = object_db.year_ind_country,
                                    year_id = year_id,
                                    objective_ = object_db.children_1.FirstOrDefault().indicator.objective.objective_info.Where( y => y.language_id == languageid).FirstOrDefault().name,
                                    indicator_group_ = object_db.children_1.FirstOrDefault().indicator.indicatorgroup.code + " -- " + object_db.children_1.FirstOrDefault().indicator.indicatorgroup.indicator_group_info.Where( x => x.language_id  == languageid).FirstOrDefault().name,
                                    tipo_ = object_db.children_1.FirstOrDefault().indicator.inputtype,
                                    metas_ = object_db.children_1.FirstOrDefault().indicator.indicator_info.Where(u => u.language_id == languageid).FirstOrDefault().name,
                                    Q1_target_ = object_db.children_1.Where(z => z.quarter == 1).FirstOrDefault().target,
                                    Q1_ = object_db.children_1.Where(z => z.quarter == 1).FirstOrDefault().value,
                                    Q2_target_ = object_db.children_1.Where(z =>  z.quarter == 2).FirstOrDefault().target,
                                    Q2_ = object_db.children_1.Where(z =>  z.quarter == 2).FirstOrDefault().value,
                                    Q3_target_ = object_db.children_1.Where(z =>  z.quarter == 3).FirstOrDefault().target,
                                    Q3_ = object_db.children_1.Where(z =>  z.quarter == 3).FirstOrDefault().value,
                                    Q4_target_ = object_db.children_1.Where(z =>  z.quarter == 4).FirstOrDefault().target,
                                    Q4_ = object_db.children_1.Where(z => z.quarter == 4).FirstOrDefault().value,
                                    frec_ = object_db.children_1.FirstOrDefault().indicator.frequency,
                                    frec_Q1 = object_db.children_1.FirstOrDefault().indicator.indicator_info.FirstOrDefault().indicator.Q1 == true ? "Q1" : "",
                                    frec_Q2 = object_db.children_1.FirstOrDefault().indicator.indicator_info.FirstOrDefault().indicator.Q2 == true ? "Q2" : "",
                                    frec_Q3 = object_db.children_1.FirstOrDefault().indicator.indicator_info.FirstOrDefault().indicator.Q3 == true ? "Q3" : "",
                                    frec_Q4 = object_db.children_1.FirstOrDefault().indicator.indicator_info.FirstOrDefault().indicator.Q4 == true ? "Q4" : "",
                                    format_ = object_db.children_1.FirstOrDefault().indicator.mode,
                                    active = object_db.children_1.FirstOrDefault().active,
                                    visible = object_db.children_1.FirstOrDefault().visible,
                                    //CheckList = db.question_value.Where(z => z.country_indicator_country_id == object_db.country_id && z.country_indicator_indicator_id == object_db.indicator_id && z.year_ind_country == object_db.year_ind_country).ToList()
                                    CheckList = (object_db.children_1.FirstOrDefault().indicator.inputtype != "checklist") ? null :
                                                  (  from object_checklist in db.question_value
                                                     where object_checklist.country_indicator_country_id == object_db.country_id 
                                                        && object_checklist.country_indicator_indicator_id == object_db.indicator_id
                                                        && object_checklist.year_ind_country == object_db.year_ind_country
                                                   select new
                                                   {
                                                       link_checklist = object_checklist.checklistquestion.checklist.code,
                                                       id_checklist = object_checklist.checklistquestion.checklist.id,
                                                       orden = object_checklist.checklistquestion.code,
                                                       question = object_checklist.checklistquestion.checklist_question_info.Where(y => y.language_id == languageid).FirstOrDefault().name,
                                                       country_id = object_checklist.country_indicator_country_id,
                                                       indicator_id = object_checklist.country_indicator_indicator_id,
                                                       question_id = object_checklist.checklistquestion_id,
                                                       checklist_year= object_checklist.year_ind_country,
                                                       Q1_value = object_checklist.Q1value,
                                                       Q1_target = object_checklist.Q1target,
                                                       Q2_value = object_checklist.Q2value,
                                                       Q2_target = object_checklist.Q2target,
                                                       Q3_value = object_checklist.Q3value,
                                                       Q3_target = object_checklist.Q3target,
                                                       Q4_value = object_checklist.Q4value,
                                                       Q4_target = object_checklist.Q4target,

                                                   }
                                                  ).OrderBy(z=> z.orden)
                                    

                                })
                                .ToArray();



                jsondata_app.Add(new
                {
                    indicator_by_country = jsondata,
                    check_list_ = 0
                });

                return Json(jsondata, JsonRequestBehavior.AllowGet);
            }
            catch (Exception e)
            {
                ViewBag.Message = e.Message;
            }
            return null;
        }

    }
}
