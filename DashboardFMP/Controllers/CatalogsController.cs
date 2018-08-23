using DashboardFMP.Models;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace DashboardFMP.Controllers
{
    public class CatalogsController : Controller
    {
        private DefaultConnection db = new DefaultConnection();

        public ActionResult ListCountries()
        {
            try
            {
                //var jsondata = new List<Object>();
            var jsondata_app = new List<Object>();
            var list_countries = db.country_info;

                //JArray blogPostsArray = new JArray(list_countries.Select(x => new { x.country.code, x.name, x.group, x.description, language = x.language.name }));

                ////var countries_list_object = list_countries.Select(x => new { id = x.country_id.ToString(), code = x.country.code, name = x.name,
                //                            group = x.group.ToString(), description = x.description, language = x.language.name }).ToArray();


                var Array_countries_list = (from countries_db in list_countries
                                            select new
                {
                    id = countries_db.country_id.ToString(),
                    code = countries_db.country.code.ToString(),
                    name = countries_db.name.ToString(),
                    description  = countries_db.description.ToString(),
                    @group = countries_db.@group.ToString(),
                    @language = countries_db.language.name.ToString()

                }).ToArray(); 


                //(from flucase in flucases
                // select new
                // {
                //     surv_ID = flucase.Surv,
                //     surv_IDInusual = flucase.SurvInusual,    //#### CAFQ: 180604 - Jamaica Universal
                //     ready_close = ((flucase.flow == db.InstitutionsConfiguration.Where(i => i.InstitutionParentID == flucase.HospitalID).OrderByDescending(x => x.Priority).FirstOrDefault().Priority && flucase.statement == 2) || (flucase.IsSample == false)) ? 1 : 0,
                //     id_D = flucase.ID,
                //     H_D = flucase.HospitalDate,
                //     LN_D = flucase.LName1 + " " + flucase.LName2 ?? "",
                //     FN_D = flucase.FName1 + " " + flucase.FName2 ?? "",
                //     NE_D = flucase.NoExpediente ?? "",
                //     IS_D = flucase.IsSample,
                //     FR_D = flucase.FinalResult,
                //     FR_D_C = flucase.CatVirusType_FR1,
                //     D_D = flucase.Destin,
                //     FRVT_D = flucase.FinalResultVirusTypeID,
                //     P_D = flucase.Processed,
                //     CS_D = flucase.CaseStatus,
                //     CS_D_Cat = flucase.CatStatusCase,
                //     VR_IF_D = flucase.CaseLabTests.Where(e => e.TestType == 1 && e.Processed != null).OrderBy(y => y.CatVirusType.orden).ThenBy(d => d.SampleNumber).ThenBy(u => u.TestDate).FirstOrDefault(),
                //     VR_PCR_D = flucase.CaseLabTests.Where(e => e.TestType == 2 && e.Processed != null).OrderBy(y => y.CatVirusType.orden).ThenBy(d => d.SampleNumber).ThenBy(u => u.TestDate).FirstOrDefault(),
                //     HEALTH_INST = flucase.Hospital.Name ?? ""
                // })



                // Json general
                //    jsondata.Add(new
                //{
                //    data = Array_countries_list
                //    });

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

        // GET: Catalogs/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        // POST: Catalogs/Edit/5
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
