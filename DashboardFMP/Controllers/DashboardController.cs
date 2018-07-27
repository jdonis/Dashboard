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
                IQueryable<indicatorgroup> labels_ = db.indicatorgroups;
                IQueryable<indicator_group_info> labels_info = db.indicator_group_info;

                var jsondata_labels = new List<Object>();
                var labels_object = new Dictionary<string, string>();

                string[] labels_list_object = labels_info.Where(z => z.language.code == Language_).OrderBy(y => y.indicatorgroup.code).Select(x => x.indicatorgroup.code).ToArray();  // Nodo groups_list

                var labels = labels_info.Where(z=> z.language.code == Language_).OrderBy(y => y.indicatorgroup.code).ToArray();

                foreach (indicator_group_info item_foreach in labels)
                {
                    //var labels_object = new Dictionary<string, string>();
                    labels_object.Add(item_foreach.indicatorgroup.code, item_foreach.name);
                }


                jsondata_labels.Add(new
                {
                    groups_list = labels_list_object,
                    groups = labels_object,
                    objectives = 0
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
    }
}
