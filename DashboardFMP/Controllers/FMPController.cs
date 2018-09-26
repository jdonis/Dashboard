using DashboardFMP.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
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

        // GET: FMP/Details/5
        public ActionResult Details(int id)
        {
            return View();
        }

        // GET: FMP/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: FMP/Create
        [HttpPost]
        public ActionResult Create(FormCollection collection)
        {
            try
            {
                // TODO: Add insert logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: FMP/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        // POST: FMP/Edit/5
        [HttpPost]
        public ActionResult Edit(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add update logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: FMP/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: FMP/Delete/5
        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add delete logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
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

                var subquery = (from u in list_country_indicators
                               select u.country_id).Distinct();

                var jsondata = (from object_db in list_country
                                where subquery.Contains(object_db.country_id)
                                select new
                                {
                                    id = object_db.country_id,
                                    name = object_db.name,
                                    @language = object_db.language.name,
                                    code = object_db.country.code
                                }).ToArray();

                return Json(jsondata, JsonRequestBehavior.AllowGet);
            }
            catch (Exception e)
            {
                ViewBag.Message = e.Message;
            }
            return null;
        }

        public class ConsolidatedIndicatorCountry
        {
            public int country_id { get; set; }
            public int indicator_id { get; set; }
            public int year_ind_country { get; set; }
            public List<country_indicator> children_1 { get; set; }
        }


        [HttpPost]
        public ActionResult IndicatorbyCountrySave(FormCollection frm)
        {
            try
            {
                // TODO: Add update logic here
                objective_info objective_;
                var id_objective = (frm["id"] == "") ? 0 : Convert.ToInt32(frm["id"]);
                var id_language = (frm["language"] == "") ? 0 : Convert.ToInt32(frm["language"]);

                //if (id_objective == 0)
                //{
                //    objective_ = new objective_info();
                //    db.Entry(objective_).State = EntityState.Added;
                //}
                //else
                //{
                //    objective_ = db.objective_info.Find(id_objective, id_language);
                //    db.Entry(objective_).State = EntityState.Modified;
                //}


                //objective_.objective.code = frm["code_intern"];
                //objective_.objective.short_ = frm["code_short"];
                //objective_.name = frm["name"];
                //objective_.short_name = frm["short_name"];
                //objective_.code_info = frm["Code_group_visual"];

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
                var languageid = language_param != ""  ? db.languages.Where(z => z.code == language_param.Trim().ToUpper()).FirstOrDefault().id : 0  ;
                var year_ = year_param > 0 ? year_param : 0;
                var jsondata_app = new List<Object>();

                if (countryid < 1 || languageid < 1 || year_ < 1) return null;
               
                //var list_country_indicators_unique = db.country_indicator.Where(z => z.country_id == countryid
                //                                    //&& z.country.country_info.FirstOrDefault().language_id == languageid
                //                                    && z.year_ind_country == year_ )
                //                                    //.Select(z=> z.indicator_id)
                //                                    .Distinct();

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

                //ConsolidateIndicators()
                //var list_country_indicators = db.country_indicator;
                //var list_country_indicator = db.country_indicator.Where(z=> list_country_indicators_unique.Contains(z.indicator_id)).ToList();

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
                                    order_by_indicator = object_db.children_1.FirstOrDefault().indicator.orden

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
