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


        // GET: Catalogs
        public ActionResult Index()
        {
            return View();
        }

        // Objectives

        public ActionResult Objectives(int? id)
        {
            return View();
        }

        public ActionResult ObjectivesListDataTables()
        {
            try
            {

                var list_object = db.objective_info;

                var jsondata = (from object_db in list_object
                                select new
                                {
                                    id = object_db.objective.id,
                                    code = object_db.objective.code,
                                    code_short = object_db.objective.short_,
                                    name = object_db.name,
                                    short_name = object_db.short_name,
                                    @language = object_db.language.name,
                                    code_group_info = object_db.code_info

                                }).ToArray();

                return Json(jsondata, JsonRequestBehavior.AllowGet);
            }
            catch (Exception e)
            {
                ViewBag.Message = e.Message;
            }
            return null;
        }

        public ActionResult ObjectiveGet(int id)
        {
            try
            {
                var list_objectives = db.objective_info.Where(x => x.objective_id == id);

                var jsondata = (from objective_db in list_objectives
                                select new
                                {
                                    id = objective_db.objective_id,
                                    code = objective_db.objective.code,
                                    code_short = objective_db.objective.short_,
                                    name = objective_db.name,
                                    short_name = objective_db.short_name,
                                    language_id = objective_db.language_id,
                                    code_group_info = objective_db.code_info

                                }).ToArray();

                return Json(jsondata, JsonRequestBehavior.AllowGet);
            }
            catch (Exception e)
            {
                ViewBag.Message = e.Message;
            }
            return null;
        }

        [HttpPost]
        public ActionResult ObjectiveSave(FormCollection frm)
        {
            try
            {
                // TODO: Add update logic here
                objective_info objective_;
                var id_objective = (frm["id"] == "") ? 0 : Convert.ToInt32(frm["id"]);
                var id_language = (frm["language"] == "") ? 0 : Convert.ToInt32(frm["language"]);

                if (id_objective == 0)
                {
                    objective_ = new objective_info();
                    db.Entry(objective_).State = EntityState.Added;
                }
                else
                {
                    objective_ = db.objective_info.Find(id_objective, id_language);
                    db.Entry(objective_).State = EntityState.Modified;
                }


                objective_.objective.code = frm["code_intern"];
                objective_.objective.short_ = frm["code_short"];
                objective_.name = frm["name"];
                objective_.short_name = frm["short_name"];
                objective_.code_info = frm["Code_group_visual"];

                db.SaveChanges();

                return Json("Success");
            }
            catch (Exception e)
            {
                ViewBag.Message = e.Message;
            }
            return null;
        }

        [HttpPost]
        public ActionResult ObjectiveCreate(FormCollection frm)
        {
            try
            {
                objective_info objective_;
                objective objective_orig;
                var id_language = (frm["language"] == "") ? 0 : Convert.ToInt32(frm["language"]);
                var id_objective = 0;
                var cod_objective = frm["code_intern"]; ;
                if (db.objectives.Where(z => z.code.ToUpper() == cod_objective.ToUpper()).Any())
                    id_objective = db.objectives.Where(z => z.code.ToUpper() == cod_objective.ToUpper()).SingleOrDefault().id;

                objective_orig = new objective();

                if (id_objective == 0)
                {

                    objective_orig.code = cod_objective;
                    db.Entry(objective_orig).State = EntityState.Added;
                    db.SaveChanges();
                }

                objective_ = new objective_info();

                objective_.objective_id = objective_orig.id;
                objective_.name = frm["name"];
                objective_.short_name = frm["short_name"]; ;
                objective_.name = frm["name"];
                objective_.language_id = id_language;
                db.Entry(objective_).State = EntityState.Added;

                db.SaveChanges();

                return Json("Success");
            }
            catch (Exception e)
            {
                ViewBag.Message = e.Message;
            }
            return null;
        }

        // Languages

        public ActionResult Languages(int? id)
        {
            return View();
        }


        public ActionResult LanguagesListDataTables()
        {
            try
            {

                var list_languages = db.languages;

                var jsondata = (from languages_db in list_languages
                                select new
                                {
                                    id = languages_db.id,
                                    code = languages_db.code,
                                    name = languages_db.name

                                }).ToArray();

                return Json(jsondata, JsonRequestBehavior.AllowGet);
            }
            catch (Exception e)
            {
                ViewBag.Message = e.Message;
            }
            return null;
        }

        public ActionResult LanguageGet(int id)
        {
            try
            {
                var list_languages = db.languages.Where(x => x.id == id);

                var jsondata = (from languages_db in list_languages
                                select new
                                {
                                    id = languages_db.id,
                                    code = languages_db.code,
                                    name = languages_db.name
                                }).ToArray();

                return Json(jsondata, JsonRequestBehavior.AllowGet);
            }
            catch (Exception e)
            {
                ViewBag.Message = e.Message;
            }
            return null;
        }


        public ActionResult LanguageSave(FormCollection frm)
        {
            try
            {
                // TODO: Add update logic here
                language language_;
                var id_language = (frm["id"] == "") ? 0 : Convert.ToInt32(frm["id"]);

                if (id_language == 0)
                {
                    language_ = new language();
                    db.Entry(language_).State = EntityState.Added;
                }
                else
                {
                    language_ = db.languages.Find(id_language);
                    db.Entry(language_).State = EntityState.Modified;
                }


                language_.code = frm["code"];
                language_.name = frm["name"];

                db.SaveChanges();

                return Json("Success");
            }
            catch
            {
                return View();
            }
        }

        [HttpPost]
        public ActionResult LanguageCreate(FormCollection frm)
        {
            try
            {
                language language_;
                var id_language = (frm["language"] == "") ? 0 : Convert.ToInt32(frm["language"]);
                var code_language = frm["code"].ToUpper();
                var any_language_code = db.languages.Where(z => z.code.ToUpper() == code_language).Any();

                language_ = new language();



                if (any_language_code == true)
                {
                    return Json("El código ya existe, ingrese de nuevo los datos con otro código");
                } else if (id_language == 0)
                {
                    db.Entry(language_).State = EntityState.Added;
                    language_.code = frm["code"];
                    language_.name = frm["name"];
                    db.SaveChanges();
                    return Json("Lenguaje agregado");
                }
                else
                {
                    return Json("Error al agregar");
                }

            }
            catch (Exception e)
            {
                ViewBag.Message = e.Message;
            }
            return null;
        }

        [HttpPost]
        public ActionResult LanguageDelete(FormCollection frm)
        {
            try
            {

                var id_language = (frm["language"] == "") ? 0 : Convert.ToInt32(frm["language"]);
                var catalog = db.languages.Find(id_language);
                db.languages.Remove(catalog);
                db.SaveChanges();
                return Json("Registro eliminado");
            }
            catch (Exception e)
            {
                ViewBag.Message = e.Message;

                return Json(e.Message);
            }
            return null;
        }


        //  Countries

        public ActionResult Countries(int? id)
        {
            return View();
        }

        public ActionResult CountriesListDataTables()
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
        // POST: Catalogs/Create
        [HttpPost]
        public ActionResult CountryCreate(FormCollection frm)
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
        public ActionResult CountryGet(int id)
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
        public ActionResult CountrySave(FormCollection frm)
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
            catch (Exception e)
            {
                ViewBag.Message = e.Message;
            }
            return null;
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
