using DashboardFMP.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace DashboardFMP.Controllers
{
    public class DashboardController : Controller
    {
        private DefaultConnection db = new DefaultConnection();
        // GET: Dashboard
        public ActionResult Index()
        {
            return View();
        }

        // GET: Dashboard/Details/5
        public ActionResult Details(int id)
        {
            return View();
        }

        // GET: Dashboard/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Dashboard/Create
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

        // GET: Dashboard/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        // POST: Dashboard/Edit/5
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

        // GET: Dashboard/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: Dashboard/Delete/5
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

        public ActionResult config()
        {
            try
            {
                var Language_ = "ES";

                // Countries
                IQueryable<country> countries_ = db.countries;
                IQueryable<country_info> countries_info = db.country_info;


                var jsondata = new List<Object>();
                var jsondata_app = new List<Object>();
                var countries_object = new Dictionary<string, Dictionary<string, Object>>();

                string[] countries_list_object = countries_info.Where(z => z.language.code == Language_).OrderBy(y => y.country_id).Select(x => x.country.code).ToArray();  // Nodo countries_list
                var countries = countries_info.Where(z => z.language.code == Language_).OrderBy(y => y.country_id).Select(x => new { x.country, x.name, x.language }).ToArray(); // Nodo countries

                foreach (country_info item_foreach in countries_info)
                {
                    var item_data = new Dictionary<string, Object>();
                    item_data.Add("name", item_foreach.name);
                    if (item_foreach.group != null)
                        if (item_foreach.group == true)
                            item_data.Add("group", item_foreach.group);
                    item_data.Add("code", (item_foreach.country.code.Length > 3) ? item_foreach.country.code : item_foreach.country.code.ToUpper().Substring(1));
                    countries_object.Add(item_foreach.country.code, item_data);
                }

                jsondata_app.Add(new
                {
                    countries_list = countries_list_object,
                    countries = countries_object
                });

                // Labels
                //IQueryable<indicatorgroup> labels_ = db.indicatorgroups;
                //IQueryable<objective> objetives_ = db.objectives;

                IQueryable<indicator_group_info> labels_info = db.indicator_group_info;
                IQueryable<objective_info> objectives_info = db.objective_info;

                var jsondata_labels = new List<Object>();
                var groups_object = new Dictionary<string, string>();
                var objcetive_object = new Dictionary<string, Dictionary<string, string[]>>();
                var objectives_short = new Dictionary<string, string>();
                //var objetive_list_object = new Dictionary<string, string>();

                string[] group_list_object = labels_info.Where(z => z.language.code == Language_).OrderBy(y => y.indicatorgroup.code).Select(x => x.indicatorgroup.code).ToArray();  // Nodo groups_list

                var groups = labels_info.Where(z => z.language.code == Language_).OrderBy(y => y.indicatorgroup.code).ToArray();

                foreach (indicator_group_info item_foreach in groups)
                {
                    groups_object.Add(item_foreach.indicatorgroup.code, item_foreach.name);
                }

                string[] objective_list_object = objectives_info.Where(z => z.language.code == Language_).OrderBy(y => y.objective.code).Select(x => x.objective.code).ToArray();  // Nodo groups_list

                var objectives = objectives_info.Where(z => z.language.code == Language_).OrderBy(y => y.code).ToArray();

                foreach (objective_info item_foreach in objectives)
                {
                    objectives_short.Add(item_foreach.code, item_foreach.objective.short_);
                }

                jsondata_labels.Add(new
                {
                    groups_list = group_list_object,
                    groups = groups_object,
                    objectives = 0,
                    objectives_list = objective_list_object,
                    objectives_short = objectives_short
                });




                // Json general
                jsondata.Add(new
                {
                    app = jsondata_app,
                    labels = jsondata_labels
                });

                return Json(jsondata, JsonRequestBehavior.AllowGet);

            }
            catch (Exception e)
            {
                ViewBag.Message = e.Message;
            }

            return null;

        }

        public ActionResult variablesnames()
        {
            try
            {
                var Language_ = "ES";

                // Variables
                IQueryable<indicator_info> indicador_info = db.indicator_info;


                var jsondata = new List<Object>();
                var VariablesNames_object = new Dictionary<string, Dictionary<string, Object>>();

                string[] VariablesIds = indicador_info.Where(z => z.language.code == Language_).OrderBy(y => y.indicator_id).Select(x => x.code).ToArray();  // Nodo countries_list
                //var indicators = indicador_info.Where(z => z.language.code == Language_).OrderBy(y => y.indicator_id).Select(x => new { x.country, x.name, x.language }).ToArray(); // Nodo countries

                foreach (indicator_info item_foreach in indicador_info)
                {
                    var item_data = new Dictionary<string, Object>();
                    item_data.Add("name", item_foreach.name);
                    item_data.Add("shortname", item_foreach.short_);
                    item_data.Add("objective", item_foreach.indicator.objective.code);
                    item_data.Add("group", item_foreach.indicator.indicatorgroup.code);
                    item_data.Add("type", item_foreach.indicator.mode);
                    VariablesNames_object.Add(item_foreach.code, item_data);
                }

                jsondata.Add(new
                {
                    VariablesIds = VariablesIds,
                    VariablesNames = VariablesNames_object
                });


                return Json(jsondata, JsonRequestBehavior.AllowGet);

            }
            catch (Exception e)
            {
                ViewBag.Message = e.Message;
            }

            return null;

        }


        public ActionResult variables()
        {
            try
            {
                var Language_ = "ES";

                // Variables
                IQueryable<country> country_ = db.countries.OrderBy(z => z.code);
                IQueryable<indicator> indicator_ = db.indicators;
                IQueryable<country_indicator> country_indicador_ = db.country_indicator.OrderBy(z => z.country.code).ThenBy(y => y.indicator_id).ThenBy(x => x.quarter);


                var jsondata = new List<Object>();
                var Variables_object = new Dictionary<string, Dictionary<string, Object>>();
                var Indicador_object = new Dictionary<string, Dictionary<string, Object>>();
                var Group_object = new Dictionary<string, Dictionary<string, Object>>();

                foreach (country item_country in country_)
                {
                    var item_data = new Dictionary<string, Object>();
                    var item_data_subitem = new Dictionary<string, Object>();
                    item_data_subitem.Add("name",item_country.code.ToUpper());
                    item_data.Add(item_country.code, item_data_subitem);
                }

                //foreach (country_indicator item_foreach in country_indicador_)
                //{
                //    var item_data = new Dictionary<string, Object>();
                //    item_data.Add("name", item_foreach.name);
                //    item_data.Add("shortname", item_foreach.short_);
                //    item_data.Add("objective", item_foreach.indicator.objective.code);
                //    item_data.Add("group", item_foreach.indicator.indicatorgroup.code);
                //    item_data.Add("type", item_foreach.indicator.mode);
                //    VariablesNames_object.Add(item_foreach.code, item_data);
                //}

                jsondata.Add(new
                {
                    Variables = Variables_object
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
