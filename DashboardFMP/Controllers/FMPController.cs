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

                var list_country_indicators = db.country_info;
                var list_country = db.country_info;

                var subquery = db.country_indicator
                                .Where(z => z.country.country_info.FirstOrDefault().group != true)
                                .GroupBy(x => new { x.country, x.year_ind_country })
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
        public ActionResult IndicatorbyCountrySave(List<IndicatorCountry> incoming)
        {
            //IEnumerable<IndicatorCountry>
            try
            {
                country_indicator country_indicator_;
                var id_indicatorybycountry = 0;

                foreach (IndicatorCountry IndicatorCountry in incoming)
                {

                    for (int inc = 1; inc <= 4; inc++)
                    {
                        id_indicatorybycountry = db.country_indicator.Where(z => z.indicator_id == IndicatorCountry.indicator_id 
                                                                            && z.country_id == IndicatorCountry.country_id 
                                                                            && z.year_ind_country == IndicatorCountry.year_ 
                                                                            && z.quarter == inc).FirstOrDefault().id;
                        if (id_indicatorybycountry > 0 )
                        {
                            country_indicator_ = db.country_indicator.Find(id_indicatorybycountry);
                            db.Entry(country_indicator_).State = EntityState.Modified;

                            country_indicator_.value = (inc == 1) ? IndicatorCountry.ind_Q1_ : (inc == 2) ? IndicatorCountry.ind_Q2_ : (inc == 3) ? IndicatorCountry.ind_Q3_ : (inc == 4) ? IndicatorCountry.ind_Q4_ : 0;
                            db.SaveChanges();

                        }
                        
                    }

                }

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
                var languageid = language_param != ""  ? db.languages.Where(z => z.code == language_param.Trim().ToUpper()).FirstOrDefault().id : 0  ;
                var year_ = year_param > 0 ? year_param : 0;
                var jsondata_app = new List<Object>();

                if (countryid < 1 || languageid < 1 || year_ < 1) return null;
               

                var list_country_indicators_unique = db.country_indicator.GroupBy( x => new { x.country_id, x.indicator_id, x.year_ind_country})
                                                        .Select(y => new ConsolidatedIndicatorCountry()
                                                        {
                                                            country_id = y.Key.country_id,
                                                            indicator_id = y.Key.indicator_id,
                                                            year_ind_country = y.Key.year_ind_country,
                                                            children_1 = y.ToList()
                                                        }
                                                        )
                                                        .Where(z => z.country_id == countryid && z.year_ind_country == year_).ToList();


                var jsondata = (from object_db in list_country_indicators_unique
                                select new
                                {
                                    id = object_db.children_1.FirstOrDefault().id,
                                    indicator_id = object_db.indicator_id,
                                    country_id = object_db.country_id,
                                    year_ = object_db.year_ind_country,
                                    objective_ = object_db.children_1.FirstOrDefault().indicator.objective.objective_info.FirstOrDefault().name,
                                    indicator_group_ = object_db.children_1.FirstOrDefault().indicator.indicatorgroup.code + " -- " + object_db.children_1.FirstOrDefault().indicator.indicatorgroup.indicator_group_info.FirstOrDefault().name,
                                    tipo_ = object_db.children_1.FirstOrDefault().indicator.inputtype,
                                    metas_ = object_db.children_1.FirstOrDefault().indicator.indicator_info.FirstOrDefault().name,
                                    Q1_target_ = db.country_indicator.Where(z => z.indicator_id == object_db.indicator_id && z.country_id == object_db.country_id && z.year_ind_country == year_  && z.quarter == 1).FirstOrDefault().target ?? 0,
                                    Q1_ = db.country_indicator.Where(z => z.indicator_id == object_db.indicator_id && z.country_id == object_db.country_id && z.year_ind_country == year_ && z.quarter == 1).FirstOrDefault().value,
                                    Q2_target_ = db.country_indicator.Where(z => z.indicator_id == object_db.indicator_id && z.country_id == object_db.country_id && z.year_ind_country == year_ && z.quarter == 2).FirstOrDefault().target,
                                    Q2_ = db.country_indicator.Where(z => z.indicator_id == object_db.indicator_id && z.country_id == object_db.country_id && z.year_ind_country == year_ && z.quarter == 2).FirstOrDefault().value,
                                    Q3_target_ = db.country_indicator.Where(z => z.indicator_id == object_db.indicator_id && z.country_id == object_db.country_id && z.year_ind_country == year_ && z.quarter == 3).FirstOrDefault().target,
                                    Q3_ = db.country_indicator.Where(z => z.indicator_id == object_db.indicator_id && z.country_id == object_db.country_id && z.year_ind_country == year_ && z.quarter == 3).FirstOrDefault().value,
                                    Q4_target_ = db.country_indicator.Where(z => z.indicator_id == object_db.indicator_id && z.country_id == object_db.country_id && z.year_ind_country == year_ && z.quarter == 4).FirstOrDefault().target,
                                    Q4_ = db.country_indicator.Where(z => z.indicator_id == object_db.indicator_id && z.country_id == object_db.country_id && z.year_ind_country == year_ && z.quarter == 4).FirstOrDefault().value,
                                    frec_ = object_db.children_1.FirstOrDefault().indicator.frequency,
                                    format_ = object_db.children_1.FirstOrDefault().indicator.mode,
                                    order_by_objective = object_db.children_1.FirstOrDefault().indicator.objective.orden,
                                    order_by_indicatorgroup = object_db.children_1.FirstOrDefault().indicator.indicatorgroup.orden,
                                    order_by_indicator = object_db.children_1.FirstOrDefault().indicator.orden,
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
                                                       question = object_checklist.checklistquestion.checklist_question_info.FirstOrDefault().name,
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
                                .OrderBy(z => z.order_by_objective)
                                .ThenBy(y => y.order_by_indicatorgroup)
                                .ThenBy(x => x.order_by_indicator)
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
