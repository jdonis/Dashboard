using DashboardFMP.Models;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace DashboardFMP.Controllers
{
    public class CatalogsController : Controller
    {
        private DefaultConnection db = new DefaultConnection();

        private JsonResult SaveChanges()
        {
            db.SaveChanges();
            return Json("Success");
        }

        public ActionResult ListLanguajeCatalog()
        {
            try
            {
                var list_languages = db.languages;
                var jsondata = (from countries_db in list_languages
                                            select new
                                            {
                                                id = countries_db.id,
                                                code = countries_db.code,
                                                name = countries_db.name

                                            }).ToArray();

                return Json(jsondata, JsonRequestBehavior.AllowGet);

            }
            catch (Exception e)
            {
                ViewBag.Message = e.Message;
            }
            return null;
        }

        public ActionResult ListCountriesDataTables()
        {
            try
            {

            var list_countries = db.country_info; 

                var jsondata = (from countries_db in list_countries
                                select new
                                {
                                    id = countries_db.country_id.ToString(),
                                    code = countries_db.country.code.ToString(),
                                    name = countries_db.name.ToString(),
                                    description = countries_db.description.ToString(),
                                    @group = countries_db.@group.ToString(),
                                    @language = countries_db.language.name.ToString()

                                }).ToArray();

                return Json(jsondata, JsonRequestBehavior.AllowGet);
            }
            catch (Exception e)
            {
                ViewBag.Message = e.Message;
            }
            return null;
        }
        // GET: Catalogs
        public ActionResult Index()
        {
            return View();
        }

        // GET: Catalogs/Details/5
        public ActionResult Details(int id)
        {
            return View();
        }

        public ActionResult Countries(int? id)
        {
            return View();
        }

        // GET: Catalogs/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Catalogs/Create
        [HttpPost]
        public ActionResult CreateCountry(FormCollection frm)
        {
            try
            {
                country_info country_;
                country country_orig;
                var id_language = (frm["language"] == "") ? 0 : Convert.ToInt32(frm["language"]);
                var id_country = 0;
                var cod_country = frm["code"];
                if (db.countries.Where(z => z.code.ToUpper() == cod_country.ToUpper()).Any())
                  id_country = db.countries.Where(z => z.code.ToUpper() == frm["code"].ToUpper()).SingleOrDefault().id;

                country_orig = new country();

                if (id_country == 0  )
                {

                    country_orig.code = cod_country;
                    db.Entry(country_orig).State = EntityState.Added;
                    db.SaveChanges();
                }

                country_ = new country_info();
                
                country_.country_id = country_orig.id;
                country_.description = frm["description"];
                country_.group = Convert.ToBoolean(frm["group"]);
                country_.name = frm["name"];
                country_.language_id = id_language;
                db.Entry(country_).State = EntityState.Added;

                db.SaveChanges();

                return Json("Success");
            }
            catch (Exception e)
            {
                ViewBag.Message = e.Message;
            }
            return null;
        }

        // GET: Catalogs/Edit/5
        public ActionResult GetCountry(int id)
        {
            try
            {
                var list_countries = db.country_info.Where(x => x.country_id == id);

                var jsondata = (from countries_db in list_countries
                                select new
                                {
                                    id = countries_db.country_id.ToString(),
                                    code = countries_db.country.code.ToString(),
                                    name = countries_db.name.ToString(),
                                    description = countries_db.description.ToString(),
                                    @group = countries_db.@group,
                                    language_id = countries_db.language.id

                                }).ToArray();

                return Json(jsondata, JsonRequestBehavior.AllowGet);
            }
            catch (Exception e)
            {
                ViewBag.Message = e.Message;
            }
            return null;
        }

        // POST: Catalogs/Edit/5
        [HttpPost]
        public ActionResult SaveCountry(FormCollection frm)
        {
            try
            {
                // TODO: Add update logic here
                country_info country_;
                var id_country = (frm["id"] == "" ) ? 0 : Convert.ToInt32(frm["id"]);
                var id_language = (frm["language"] == "") ? 0 : Convert.ToInt32(frm["language"]);

                if (id_country == 0)
                {
                        country_ = new country_info();
                        db.Entry(country_).State = EntityState.Added;
                } else
                {
                    country_ = db.country_info.Find(id_country,id_language);
                    db.Entry(country_).State = EntityState.Modified;
                }

                country_.description = frm["description"];
                country_.group =  Convert.ToBoolean(frm["group"]);
                country_.country.code = frm["code"];
                country_.name = frm["name"];

                db.SaveChanges();

                return Json("Success");
            }
            catch
            {
                return View();
            }
        }

        // GET: Catalogs/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: Catalogs/Delete/5
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
    }
}
