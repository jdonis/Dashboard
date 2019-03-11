using DashboardFMP.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Globalization;
using System.Linq;
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

        public ActionResult ListCountriesCatalog()
        {

            // Hay que agregar el parametro de idioma
            try
            {
                var list_countries = db.country_info.AsQueryable();
                var jsondata = (from countries_db in list_countries
                                select new
                                {
                                    id = countries_db.country.id,
                                    code = countries_db.country.code,
                                    //name = countries_db.country.country_info.Where(x => x.language_id == 1).FirstOrDefault().name, 
                                    name = countries_db.country.country_info.FirstOrDefault().name,
                                    group_ = countries_db.@group

                                }).Where(z => z.group_ != true).OrderBy(y => y.name).ToArray();

                return Json(jsondata, JsonRequestBehavior.AllowGet);

            }
            catch (Exception e)
            {
                ViewBag.Message = e.Message;
            }
            return null;
        }

        public ActionResult ListYearsCatalog()
        {

            try
            {
                var list_years = db.CatYears.AsQueryable();
                var jsondata = (from years_db in list_years
                                select new
                                {
                                    id = years_db.id,
                                    name = years_db.year_name

                                }).ToArray();

                return Json(jsondata, JsonRequestBehavior.AllowGet);

            }
            catch (Exception e)
            {
                ViewBag.Message = e.Message;
            }
            return null;
        }

        public ActionResult ListAnualCalculationCatalog()
        {

            try
            {
                var list_annualcalculation = db.CatAnnualCalculation.AsQueryable();
                var jsondata = (from annualcalculation_db in list_annualcalculation
                                select new
                                {
                                    id = annualcalculation_db.id,
                                    name = annualcalculation_db.Name

                                }).ToArray();

                return Json(jsondata, JsonRequestBehavior.AllowGet);

            }
            catch (Exception e)
            {
                ViewBag.Message = e.Message;
            }
            return null;
        }

        public ActionResult ListLanguajeCatalog()
        {
            // Hay que agregar el parametro de idioma
            try
            {
                var list_languages = db.languages.AsQueryable();
                var jsondata = (from language_db in list_languages
                                            select new
                                            {
                                                id = language_db.id,
                                                code = language_db.code,
                                                name = language_db.name

                                            }).ToArray();

                return Json(jsondata, JsonRequestBehavior.AllowGet);

            }
            catch (Exception e)
            {
                ViewBag.Message = e.Message;
            }
            return null;
        }

        public ActionResult ListCheckListCatalog()
        {
            try
            {
                var list_checklist = db.checklists.AsQueryable();
                var jsondata = (from checklist_db in list_checklist
                                select new
                                {
                                    id = checklist_db.id,
                                    name = checklist_db.code
                                }).ToArray();

                return Json(jsondata, JsonRequestBehavior.AllowGet);

            }
            catch (Exception e)
            {
                ViewBag.Message = e.Message;
            }
            return null;
        }

        public ActionResult ListModeCatalog()
        {
            try
            {
                var list_modes = db.CatIndicatorMode.AsQueryable();
                var jsondata = (from mode_db in list_modes
                                select new
                                {
                                    id= mode_db.name,
                                    name = mode_db.name
                                }).ToArray();

                return Json(jsondata, JsonRequestBehavior.AllowGet);

            }
            catch (Exception e)
            {
                ViewBag.Message = e.Message;
            }
            return null;
        }

        public ActionResult ListFrequencyCatalog()
        {
            try
            {
                var list_Frequencies = db.CatIndicatorFrequency.AsQueryable();
                var jsondata = (from frequency_db in list_Frequencies
                                select new
                                {
                                    id = frequency_db.name,
                                    name = frequency_db.name
                                }).ToArray();

                return Json(jsondata, JsonRequestBehavior.AllowGet);

            }
            catch (Exception e)
            {
                ViewBag.Message = e.Message;
            }
            return null;
        }

        public ActionResult ListInputTypeCatalog()
        {
            try
            {
                var list_input_type = db.CatIndicatorInputType.AsQueryable();
                var jsondata = (from input_type_db in list_input_type
                                select new
                                {
                                    id = input_type_db.name,
                                    name = input_type_db.name
                                }).ToArray();

                return Json(jsondata, JsonRequestBehavior.AllowGet);

            }
            catch (Exception e)
            {
                ViewBag.Message = e.Message;
            }
            return null;
        }

        public ActionResult ListObjectiveCatalog(int language_id_)
        {
            try
            {
                var list_input_type = db.objective_info.Where(z => z.language_id == language_id_).AsQueryable();
                var jsondata = (from input_type_db in list_input_type
                                select new
                                {
                                    id = input_type_db.objective_id,
                                    name = input_type_db.objective.short_ + " - " + input_type_db.name
                                }).ToArray();

                return Json(jsondata, JsonRequestBehavior.AllowGet);

            }
            catch (Exception e)
            {
                ViewBag.Message = e.Message;
            }
            return null;
        }

        public ActionResult ListGroupCatalog(int language_id_)
        {
            try
            {
                var list_input_type = db.indicator_group_info.Where(z => z.language_id == language_id_).AsQueryable();
                var jsondata = (from input_type_db in list_input_type
                                select new
                                {
                                    id = input_type_db.indicatorgroup_id,
                                    name =  input_type_db.indicatorgroup.code + " - " + input_type_db.name
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

        // Indicator by Country

        public ActionResult IndicatorsbyCountry(int? id)
        {
            return View();
        }

        public ActionResult IndicatorbyCountryListDataTables(string country, int? year_slt)
        {
            try
            {

                var country_id = (country != "" && country != null) ? db.countries.Where(z => z.code == country).FirstOrDefault().id : 0;
                var year_id = (year_slt != null) ? db.CatYears.Where(z => z.year_name == year_slt).FirstOrDefault().id : 0;
                //var list_country_indicators = db.country_info;
                var list_country = db.country_info.Where(y => y.group != true).AsQueryable().Select(x => x.country_id);


                var subquery = db.country_indicator
                                .Where(z => list_country.Contains(z.country_id))
                                .GroupBy(x => new { x.country_id, x.country, x.year_ind_country })
                                .AsQueryable()
                                .Select(group => new { Peo = group.Key, Count = group.Count() });

                if (country_id > 0)
                    subquery = subquery.Where(z => z.Peo.country_id == country_id);


                if (year_id > 0)
                    subquery = subquery.Where(z => z.Peo.year_ind_country == year_slt);

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


        public ActionResult IndicatorbyCountryListGet(int countryid_param, string language_param, int year_param)
        {
            try
            {
                var countryid = countryid_param > 0 ? countryid_param : 0;
                //var languageid = language_param != "" ? db.languages.Where(z => z.code == language_param.Trim().ToUpper()).FirstOrDefault().id : 1;
                var languageid = language_param != "" ? db.languages.Where(z => z.code == language_param.Trim().ToUpper()).FirstOrDefault().id : db.country_info.Where(z => z.country_id == countryid).Any() ? db.country_info.Where(z => z.country_id == countryid).FirstOrDefault().language_id : 1;
                var year_ = year_param > 0 ? year_param : 0;

                if (countryid < 1 || languageid < 1 || year_ < 1) return null;

                var list_country_indicators_unique = db.country_indicator.Where(z => z.country_id == countryid && z.year_ind_country == year_).AsQueryable();

                if (!list_country_indicators_unique.Any())
                {
                    return Json("La combinación NO existe, utilice la opción de Agregar antes para crear los indicadores por país");
                }

                var year_select = db.CatYears.Where(z => z.year_name == year_param);

                var list_indicator_by_country_get = db.indicators
                                                            .Where(z => z.indicator_info.FirstOrDefault().language_id == languageid)
                                                            .AsQueryable()
                                                            .OrderBy(z => z.objective.orden)
                                                            .ThenBy(y => y.indicatorgroup.orden)
                                                            .ThenBy(x => x.orden);
                var specifier = "000.##";
                //var dummy_count = list_indicator_by_country_get.Count();

                var jsondata = (from object_db in list_indicator_by_country_get
                                select new
                                {
                                    indicator_id = object_db.id,
                                    country_id = countryid_param,
                                    year_select = year_select.FirstOrDefault().id,
                                    objective_ = object_db.objective.objective_info.Where(y => y.language_id == languageid).FirstOrDefault().name,
                                    indicator_group_ = object_db.indicatorgroup.code + " -- " + object_db.indicatorgroup.indicator_group_info.Where(y => y.language_id== languageid).FirstOrDefault().name,
                                    tipo_ = object_db.indicator_info.FirstOrDefault().indicator.inputtype,
                                    metas_ = object_db.indicator_info.FirstOrDefault().name,
                                    //indicator_selected = db.country_indicator.Where(z => z.indicator_id == object_db.id && z.country_id == countryid && z.year_ind_country == year_).Any() ? true : false,
                                    //indicator_visible = db.country_indicator.Where(z => z.indicator_id == object_db.id && z.country_id == countryid && z.year_ind_country == year_ && z.visible == true).Any() ? true : false,
                                    indicator_selected = list_country_indicators_unique.Where(z => z.indicator_id == object_db.id && z.country_id == countryid && z.year_ind_country == year_ && z.active == true).Any() ? true : false,
                                    indicator_visible = list_country_indicators_unique.Where(z => z.indicator_id == object_db.id && z.country_id == countryid && z.year_ind_country == year_ && z.visible == true).Any() ? true : false,
                                    frec_Q1 = object_db.indicator_info.FirstOrDefault().indicator.Q1 == true ? "Q1" : "",
                                    frec_Q2 = object_db.indicator_info.FirstOrDefault().indicator.Q2 == true ? "Q2" : "",
                                    frec_Q3 = object_db.indicator_info.FirstOrDefault().indicator.Q3 == true ? "Q3" : "",
                                    frec_Q4 = object_db.indicator_info.FirstOrDefault().indicator.Q4 == true ? "Q4" : "",
                                    target_Q1 = list_country_indicators_unique.Where(z => z.quarter == 1 && z.indicator_id == object_db.id).FirstOrDefault().target,
                                    target_Q2 = list_country_indicators_unique.Where(z => z.quarter == 2 && z.indicator_id == object_db.id).FirstOrDefault().target,
                                    target_Q3 = list_country_indicators_unique.Where(z => z.quarter == 3 && z.indicator_id == object_db.id).FirstOrDefault().target,
                                    target_Q4 = list_country_indicators_unique.Where(z => z.quarter == 4 && z.indicator_id == object_db.id).FirstOrDefault().target,

                                    format_ = object_db.indicator_info.Where(y => y.language_id== languageid).FirstOrDefault().indicator.mode,
                                    //order_by_objective = object_db.indicator_info.FirstOrDefault().indicator.objective.orden,
                                    //order_by_indicatorgroup = object_db.indicatorgroup.orden,
                                    //order_by_indicator = object_db.indicator_info.FirstOrDefault().indicator.orden
                                }).AsEnumerable()
                                   .Select(x => new
                                   {
                                       indicator_id = x.indicator_id,
                                       country_id = x.country_id,
                                       year_select = x.year_select,
                                       objective_ = x.objective_,
                                       indicator_group_ = x.indicator_group_,
                                       tipo_ = x.tipo_,
                                       metas_ = x.metas_,
                                       indicator_selected = x.indicator_selected,
                                       indicator_visible = x.indicator_visible,
                                       frec_Q1 = x.frec_Q1,
                                       frec_Q2 = x.frec_Q2,
                                       frec_Q3 = x.frec_Q3,
                                       frec_Q4 = x.frec_Q4,
                                       target_Q1 = x.target_Q1 == null ? "" : String.Format("{0:0.00}", x.target_Q1) ,
                                       target_Q2 = x.target_Q2 == null ? "" : String.Format("{0:0.00}", x.target_Q2),
                                       target_Q3 = x.target_Q3 == null ? "" : String.Format("{0:0.00}", x.target_Q3),
                                       target_Q4 = x.target_Q4 == null ? "" : String.Format("{0:0.00}", x.target_Q4),
                                   }
                                ).ToArray();



                return Json(jsondata, JsonRequestBehavior.AllowGet);
            }
            catch (Exception e)
            {
                ViewBag.Message = e.Message;
            }
            return null;
        }

        public ActionResult IndicatorbyCountryListGetByActivation(int countryid_param, string language_param, int year_param)
        {
            try
            {
                var countryid = countryid_param > 0 ? countryid_param : 0;
                //var languageid = language_param != "" ? db.languages.Where(z => z.code == language_param.Trim().ToUpper()).FirstOrDefault().id : 1;
                var languageid = language_param != "" ? db.languages.Where(z => z.code == language_param.Trim().ToUpper()).FirstOrDefault().id : db.country_info.Where(z => z.country_id == countryid).Any() ? db.country_info.Where(z => z.country_id == countryid).FirstOrDefault().language_id : 1;
                var year_ = year_param > 0 ? db.CatYears.Where(z => z.id == year_param).FirstOrDefault().year_name : 0;

                if (countryid < 1 || languageid < 1 || year_ < 1) return null;

                var list_country_indicators_unique = db.country_indicator.Where(z => z.country_id == countryid && z.year_ind_country == year_);

                if (list_country_indicators_unique.Any())
                {
                    //return "La combinación ya existe, utilice la opción de Editar modificar los indicadores del país";
                    return Content("La combinación ya existe, utilice la opción de editar");
                }

                var list_indicator_by_country_get = db.indicators
                                                       .Where(z => z.indicator_info.FirstOrDefault().language_id == languageid)
                                                       .OrderBy(z => z.objective.orden)
                                                       .ThenBy(y => y.indicatorgroup.orden)
                                                       .ThenBy(x => x.orden);

                var jsondata = (from object_db in list_indicator_by_country_get
                                select new
                                {
                                    indicator_id = object_db.id,
                                    country_id = countryid_param,
                                    year_select = year_param,
                                    objective_ = object_db.objective.objective_info.Where(y => y.language_id == languageid).FirstOrDefault().name,
                                    indicator_group_ = object_db.indicatorgroup.code + " -- " + object_db.indicatorgroup.indicator_group_info.Where(y=>y.language_id == languageid).FirstOrDefault().name,
                                    tipo_ = object_db.indicator_info.FirstOrDefault().indicator.inputtype,
                                    metas_ = object_db.indicator_info.FirstOrDefault().name,
                                    indicator_selected = false,
                                    indicator_visible = false,
                                    frec_Q1 = object_db.indicator_info.FirstOrDefault().indicator.Q1 == true ? "Q1" : "",
                                    frec_Q2 = object_db.indicator_info.FirstOrDefault().indicator.Q2 == true ? "Q2" : "",
                                    frec_Q3 = object_db.indicator_info.FirstOrDefault().indicator.Q3 == true ? "Q3" : "",
                                    frec_Q4 = object_db.indicator_info.FirstOrDefault().indicator.Q4 == true ? "Q4" : "",
                                    target_Q1 = "",
                                    target_Q2 =  "",
                                    target_Q3 =  "",
                                    target_Q4 =  "",
                                    format_ = object_db.indicator_info.Where(y => y.language_id==languageid).FirstOrDefault().indicator.mode,
                                    //order_by_objective = object_db.indicator_info.FirstOrDefault().indicator.objective.orden,
                                    //order_by_indicatorgroup = object_db.indicatorgroup.orden,
                                    //order_by_indicator = object_db.indicator_info.FirstOrDefault().indicator.orden
                                }
                                ).ToArray();



                return Json(jsondata, JsonRequestBehavior.AllowGet);
            }
            catch (Exception e)
            {
                ViewBag.Message = e.Message;
            }
            return null;
        }

        public ActionResult IndicatorbyCountryListGetSave(List<IndicatorByCountryActive> incoming)
        {
            try
            {
                country_indicator country_indicator__;
                var dummy_year = incoming[0].year_select;
                //var prueba = db.CatYears.Where(z => z.id == dummy_);
                var year_name = Convert.ToInt32( db.CatYears.Where(z => z.id == dummy_year).FirstOrDefault().year_name);

                foreach (IndicatorByCountryActive IndicatorByCountryActive_node in incoming)
                {

                    db.country_indicator.Where(i => i.country_id == IndicatorByCountryActive_node.country_id && i.indicator_id == IndicatorByCountryActive_node.indicator_id && i.year_ind_country == year_name).ToList()
                    .ForEach(a =>
                   {
                       a.target = (a.quarter == 1) ? IndicatorByCountryActive_node.target_Q1 : (a.quarter == 2) ? IndicatorByCountryActive_node.target_Q2 : (a.quarter == 3) ? IndicatorByCountryActive_node.target_Q3 : IndicatorByCountryActive_node.target_Q4;
                        a.visible = IndicatorByCountryActive_node.visible == true ? IndicatorByCountryActive_node.visible : false;
                       a.active = IndicatorByCountryActive_node.active == true ? IndicatorByCountryActive_node.active : false;

                    });





                }
                db.SaveChanges();

                var jsondata = new List<Object>();

                return Json("Success");

            }
            catch (Exception e)
            {
                ViewBag.Message = e.Message;
            }
            return null;
        }

        public ActionResult IndicatorbyCountryListGetCreateNew(List<IndicatorByCountryActive> incoming)
        {
            try
            {
                country_indicator country_indicator__;
                var dummy_year = incoming[0].year_select;
                var dummy_country = incoming[0].country_id;
                var year_name = Convert.ToInt32(db.CatYears.Where(z => z.id == dummy_year).FirstOrDefault().year_name);

                if (dummy_country < 1 ||  year_name < 1) return null;

                var list_country_indicators_unique = db.country_indicator.Where(z => z.country_id == dummy_country && z.year_ind_country == year_name);

                if (list_country_indicators_unique.Any())
                {
                    return Json("La combinación ya existe, utilice la opción de editar");
                }

                // Creación de indicadores

                foreach (IndicatorByCountryActive incoming_node in incoming)
                {

                        db.country_indicator.Add(new country_indicator
                        {
                            indicator_id = incoming_node.indicator_id,
                            country_id = incoming_node.country_id,
                            year_ind_country = year_name,
                            value = null,
                            quarter = 1,
                            target = incoming_node.target_Q1 == null ? null : incoming_node.target_Q1, 
                            inputyear = DateTime.Now,
                            active = incoming_node.active,
                            visible = incoming_node.visible
                        });
                        db.country_indicator.Add(new country_indicator
                        {
                            indicator_id = incoming_node.indicator_id,
                            country_id = incoming_node.country_id,
                            year_ind_country = year_name,
                            value = null,
                            quarter = 2,
                            target = incoming_node.target_Q2 == null ? null : incoming_node.target_Q2,
                            inputyear = DateTime.Now,
                            active = incoming_node.active,
                            visible = incoming_node.visible
                        });
                        db.country_indicator.Add(new country_indicator
                        {
                            indicator_id = incoming_node.indicator_id,
                            country_id = incoming_node.country_id,
                            year_ind_country = year_name,
                            value = null,
                            quarter = 3,
                            target = incoming_node.target_Q3 == null ? null : incoming_node.target_Q3,
                            inputyear = DateTime.Now,
                            active = incoming_node.active,
                            visible = incoming_node.visible
                        });
                        db.country_indicator.Add(new country_indicator
                        {
                            indicator_id = incoming_node.indicator_id,
                            country_id = incoming_node.country_id,
                            year_ind_country = year_name,
                            value = null,
                            quarter = 4,
                            target = incoming_node.target_Q4 == null ? null : incoming_node.target_Q4,
                            inputyear = DateTime.Now,
                            active = incoming_node.active,
                            visible = incoming_node.visible
                        });

                    if (incoming_node.inputtype == "checklist")
                    {
                        var list_indicator_checklist_number = db.indicators.Where(z => z.id == incoming_node.indicator_id);

                        var check_list_question = db.checklistquestions.Where(z => z.checklist_id == list_indicator_checklist_number.FirstOrDefault().checklist_id).ToList();


                        foreach (checklistquestion question_ in check_list_question)
                        {
                            db.question_value.Add(new question_value
                            {
                                country_indicator_country_id = incoming_node.country_id,
                                country_indicator_indicator_id = incoming_node.indicator_id,
                                year_ind_country = year_name,
                                checklistquestion_id = question_.id,
                                Q1target = null,
                                Q2target = null,
                                Q3target = null,
                                Q4target = null,
                                Q1value = null,
                                Q2value = null,
                                Q3value = null,
                                Q4value = null
                            });
                        };


                        //db.SaveChanges();
                    }
                    //db.SaveChanges();
                }

                db.SaveChanges();

                // Incluir los checklist para cada indicador que se creo.

                //foreach (indicator indicator_checklist in db.indicators.Where(z => z.inputtype == "checklist"))
                //{
                //    db.question_value.Add(new question_value
                //    {
                //        country_indicator_country_id = incoming_node.indicator_id,
                //        country_indicator_indicator_id = incoming_node.country_id,
                //        year_ind_country = year_name,
                //        value = null,
                //        quarter = 1,
                //        target = null, // falta averiguar que target es para cada indicador
                //        inputyear = null,
                //        active = incoming_node.active,
                //        visible = incoming_node.visible
                //    });
                //}


                    return Json("Success");
                //return Json(jsondata, JsonRequestBehavior.AllowGet);
            }
            catch (Exception e)
            {
                ViewBag.Message = e.Message;
            }
            return null;
        }

        // Indicators

        public ActionResult Indicators(int? id)
        {
            return View();
        }

        public ActionResult IndicatorListDataTables()
        {
            try
            {

                var list_indicator = db.indicator_info;

                var jsondata = (from indicator_db in list_indicator
                                select new
                                {
                                    @language = indicator_db.language.name,
                                    language_id = indicator_db.language_id,
                                    id = indicator_db.indicator.id,
                                    objective = indicator_db.indicator.objective.short_,
                                    indicatorgroup = indicator_db.indicator.indicatorgroup.code,
                                    name = indicator_db.name,
                                    short_name = indicator_db.short_,
                                    mode = indicator_db.indicator.mode,
                                    //frequency = indicator_db.indicator.frequency,
                                    frequency = (indicator_db.indicator.Q1 == true ? "Q1 " : "") + (indicator_db.indicator.Q2 == true ? "Q2 " : "") + (indicator_db.indicator.Q3 == true ? "Q3 " : "") + (indicator_db.indicator.Q4 == true ? "Q4 " : ""),
                                    inputtype = indicator_db.indicator.inputtype


                                })
                                .OrderBy(y => y.objective)
                                .ThenBy(x => x.indicatorgroup)
                                .ToArray();

                return Json(jsondata, JsonRequestBehavior.AllowGet);
            }
            catch (Exception e)
            {
                ViewBag.Message = e.Message;
            }
            return null;
        }

        public ActionResult IndicatorGet(int id)
        {
            try
            {
                var list_indicators = db.indicator_info.Where(x => x.indicator_id == id);

                var jsondata = (from indicator_db in list_indicators
                                select new
                                {
                                    id = indicator_db.indicator_id,
                                    objective = indicator_db.indicator.objective_id,
                                    name = indicator_db.name,
                                    short_name = indicator_db.short_,
                                    ind_num_visible = indicator_db.ind_num_visible,
                                    language_id = indicator_db.language_id,
                                    group_id = indicator_db.indicator.indicatorgroup_id,
                                    checklist_id = indicator_db.indicator.checklist_id,
                                    mode = indicator_db.indicator.mode,
                                    frequency = indicator_db.indicator.frequency,
                                    Q1 = indicator_db.indicator.Q1,
                                    Q2 = indicator_db.indicator.Q2,
                                    Q3 = indicator_db.indicator.Q3,
                                    Q4 = indicator_db.indicator.Q4,
                                    anual_calculation_id = indicator_db.indicator.anual_calculation_id,
                                    inputtype = indicator_db.indicator.inputtype

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
        public ActionResult IndicatorSave(FormCollection frm)
        {
            try
            {
                // TODO: Add update logic here
                indicator_info indicator_;
                var id_indicator = (frm["id"] == "") ? 0 : Convert.ToInt32(frm["id"]);
                var id_language = (frm["language"] == "") ? 0 : Convert.ToInt32(frm["language"]);

                if (id_indicator == 0)
                {
                    indicator_ = new indicator_info();
                    db.Entry(indicator_).State = EntityState.Added;
                }
                else
                {
                    indicator_ = db.indicator_info.Find( id_language, id_indicator);
                    db.Entry(indicator_).State = EntityState.Modified;
                }


                indicator_.indicator.indicatorgroup_id = Convert.ToInt32(frm["group"]);
                indicator_.indicator.objective_id = Convert.ToInt32(frm["objective"]);
                indicator_.name = frm["name"];
                indicator_.short_ = frm["short_"];
                indicator_.indicator.mode = frm["mode"];
                indicator_.indicator.frequency = frm["frequency"];
                indicator_.indicator.inputtype = frm["input_type"];
                indicator_.ind_num_visible = frm["ind_num_visible"];
                indicator_.indicator.Q1 = frm["frequency_Q1"] == "1" ? true : false ;
                indicator_.indicator.Q2 = frm["frequency_Q2"] == "2" ? true : false;
                indicator_.indicator.Q3 = frm["frequency_Q3"] == "3" ? true : false;
                indicator_.indicator.Q4 = frm["frequency_Q4"] == "4" ? true : false;
                indicator_.indicator.anual_calculation_id = Convert.ToInt32(frm["annual_calculation"]);
                if (frm["checklist"] != "" )
                    indicator_.indicator.checklist_id = Convert.ToInt32(frm["checklist"]);

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
        public ActionResult IndicatorCreate(FormCollection frm)
        {
            try
            {
                indicator_info indicator_info_;
                indicator indicator_;
                //objective objective_orig;
                var id_language = (frm["language"] == "") ? 1 : Convert.ToInt32(frm["language"]);
                var id_indicator = 0;
                var clave = "";

                if (id_indicator == 0)
                {
                    indicator_ = new indicator();
                    indicator_.indicatorgroup_id = Convert.ToInt32(frm["group"]);
                    indicator_.objective_id = Convert.ToInt32(frm["objective"]);
                    indicator_.mode = frm["mode"];
                    indicator_.frequency = frm["frequency"];
                    indicator_.inputtype = frm["input_type"];
                    indicator_.Q1 = frm["frequency_Q1"] == "1" ? true : false;
                    indicator_.Q2 = frm["frequency_Q2"] == "2" ? true : false;
                    indicator_.Q3 = frm["frequency_Q3"] == "3" ? true : false;
                    indicator_.Q4 = frm["frequency_Q4"] == "4" ? true : false;
                    indicator_.anual_calculation_id = Convert.ToInt32(frm["annual_calculation"]);
                    if (frm["checklist"] != "")
                        indicator_.checklist_id = Convert.ToInt32(frm["checklist"]);

                    db.Entry(indicator_).State = EntityState.Added;
                    db.SaveChanges();
                    id_indicator = indicator_.id;
                    //clave = db.indicators.Where(z => z.id== id_indicator).FirstOrDefault().clave.ToString("N");
                    //clave = indicator_.clave;
                }
                else
                {
                    indicator_ = db.indicators.Find(id_indicator);
                }

                indicator_info_ = new indicator_info();
                indicator_info_.indicator_id = id_indicator;
                indicator_info_.language_id = id_language;
                //indicator_info_.code = indicator_.clave;
                indicator_info_.ind_num_visible = frm["ind_num_visible"];
                indicator_info_.name = frm["name"];
                indicator_info_.short_ = frm["short_"];

                db.Entry(indicator_info_).State = EntityState.Added;
                db.SaveChanges();

                return Json("Success");
            }
            catch (Exception e)
            {
                ViewBag.Message = e.Message;
            }
            return null;
        }

        public ActionResult IndicatorDelete(FormCollection frm)
        {
            try
            {
                var id_language = (frm["language"] == "") ? 1 : Convert.ToInt32(frm["language"]);
                var id_indicator = (frm["id"] == "") ? 0 : Convert.ToInt32(frm["id"]);
                var objectives_length = db.indicator_info.Where(z => z.indicator_id == id_indicator).Count();

                var catalog = db.indicator_info.Find(id_language, id_indicator);
                db.indicator_info.Remove(catalog);
                db.SaveChanges();

                if (objectives_length > 0)
                {
                    var catalog_indicator = db.indicators.Find(id_indicator);
                    db.indicators.Remove(catalog_indicator);
                    db.SaveChanges();
                }

                return Json("Success");
            }
            catch (Exception e)
            {
                ViewBag.Message = e.Message;
            }
            return null;
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
                var id_language = (frm["language"] == "") ? 1 : Convert.ToInt32(frm["language"]);

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
                var id_language = (frm["language"] == "") ? 1 : Convert.ToInt32(frm["language"]);
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
                    id_objective = objective_orig.id;
                } else
                {
                    objective_orig = db.objectives.Find(id_objective);
                }

                objective_ = new objective_info();
                objective_.objective_id = id_objective;
                objective_.name = frm["Name"];
                objective_.short_name = frm["Short_name"];
                objective_.code_info = frm["Code_group_visual"];
                objective_.language_id = id_language;
                db.Entry(objective_).State = EntityState.Added;
                db.SaveChanges();

                objective_.objective.code = frm["Code_intern"];
                objective_.objective.short_ = frm["Code_short"];
                db.SaveChanges();

                return Json("Success");
            }
            catch (Exception e)
            {
                ViewBag.Message = e.Message;
            }
            return null;
        }

        public ActionResult ObjectiveDelete(FormCollection frm)
        {
            try
            {
                var id_language = (frm["language"] == "") ? 1 : Convert.ToInt32(frm["language"]);
                var id_objective = (frm["id"] == "") ? 0 : Convert.ToInt32(frm["id"]);
                var objectives_length = db.objective_info.Where(z => z.objective_id == id_objective).Count();

                var catalog = db.objective_info.Find(id_objective, id_language);
                db.objective_info.Remove(catalog);
                db.SaveChanges();

                if (objectives_length > 1)
                {
                    var catalog_objective = db.objectives.Find(id_objective);
                    db.objectives.Remove(catalog_objective);
                    db.SaveChanges();
                }
                    
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

        public ActionResult Years(int? id)
        {
            return View();
        }

        public ActionResult YearGet(int id)
        {
            try
            {
                var list_years = db.CatYears.Where(x => x.id == id);

                var jsondata = (from years_db in list_years
                                select new
                                {
                                    id = years_db.id,
                                    active = years_db.active,
                                    name = years_db.year_name
                                }).ToArray();

                return Json(jsondata, JsonRequestBehavior.AllowGet);
            }
            catch (Exception e)
            {
                ViewBag.Message = e.Message;
            }
            return null;
        }

        public ActionResult YearSave(FormCollection frm)
        {
            try
            {
                // TODO: Add update logic here
                CatYears Year_;
                var id_year = (frm["id"] == "") ? 0 : Convert.ToInt32(frm["id"]);

                if (id_year == 0)
                {
                    Year_ = new CatYears();
                    db.Entry(Year_).State = EntityState.Added;
                }
                else
                {
                    Year_ = db.CatYears.Find(id_year);
                    db.Entry(Year_).State = EntityState.Modified;
                }

                Year_.active = Convert.ToBoolean(frm["activated"]);
                Year_.year_name = Convert.ToInt32(frm["name"]);

                db.SaveChanges();

                return Json("Success");
            }
            catch
            {
                return View();
            }
        }


        public ActionResult YearCreate(FormCollection frm)
        {
            try
            {
                CatYears year_;
                var id_year = (frm["id"] == "") ? 0 : Convert.ToInt32(frm["id"]);
                var name_year_ = Convert.ToInt32(frm["name"]);
                var any_year_name = db.CatYears.Where(z => z.year_name == name_year_).Any();

                year_ = new CatYears();



                if (any_year_name == true)
                {
                    return Json("El año ya existe, ingrese de nuevo los datos");
                }
                else if (id_year == 0)
                {
                    //id_year = Convert.ToInt32(frm["name"]);
                    db.Entry(year_).State = EntityState.Added;
                    //year_.id = id_year;
                    //db.SaveChanges();
                    year_.active = Convert.ToBoolean(frm["activated"]);
                    year_.year_name = Convert.ToInt32(frm["name"]);
                    db.SaveChanges();
                    return Json("Año agregado");
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
        public ActionResult YearDelete(FormCollection frm)
        {
            try
            {

                var id_year = (frm["id"] == "") ? 0 : Convert.ToInt32(frm["id"]);
                var catalog = db.CatYears.Find(id_year);
                db.CatYears.Remove(catalog);
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


        public ActionResult YearsListDataTables()
        {
            try
            {

                var list_Years = db.CatYears;

                var jsondata = (from Years_db in list_Years
                                select new
                                {
                                    id = Years_db.id,
                                    active = Years_db.active,
                                    name = Years_db.year_name

                                }).OrderBy(z=> z.name).ToArray();

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
                var id_language = (frm["id"] == "") ? 1 : Convert.ToInt32(frm["id"]);

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
                var id_language = (frm["language"] == "") ? 1 : Convert.ToInt32(frm["language"]);
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

                var id_language = (frm["language"] == "") ? 1 : Convert.ToInt32(frm["language"]);
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
                var id_language = (frm["language"] == "") ? 1 : Convert.ToInt32(frm["language"]);
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
                var id_language = (frm["language"] == "") ? 1 : Convert.ToInt32(frm["language"]);

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

        public ActionResult CountryDelete(FormCollection frm)
        {
            try
            {

                var id_country = (frm["country"] == "") ? 0 : Convert.ToInt32(frm["country"]);
                var catalog = db.countries.Find(id_country);
                db.countries.Remove(catalog);
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

        //  Check Question List

        public ActionResult CheckListQuestion(int? id)
        {
            return View();
        }
        public ActionResult CheckListQuestionListDataTables()
        {
            try
            {

                var list_object = db.checklistquestions.AsQueryable();

                var jsondata = (from object_db in list_object
                                select new
                                {
                                    id = object_db.id,
                                    orden_despliegue = object_db.code,
                                    name = object_db.checklist_question_info.FirstOrDefault().name,
                                    checklist = object_db.checklist.code,
                                    language = object_db.checklist_question_info.FirstOrDefault().language.name,
                                    

                                    //code = object_db.

                                })
                                .OrderBy(x=> x.checklist)
                                .ThenBy(z=> z.orden_despliegue)
                                .ToArray();

                return Json(jsondata, JsonRequestBehavior.AllowGet);
            }
            catch (Exception e)
            {
                ViewBag.Message = e.Message;
            }
            return null;
        }

        public ActionResult CheckListQuestionGet(int id)
        {
            try
            {
                var list_checklistquestion = db.checklistquestions.Where(x => x.id == id);

                var jsondata = (from checklistquestion_db in list_checklistquestion
                                select new
                                {
                                    id = checklistquestion_db.id,
                                    name = checklistquestion_db.checklist_question_info.FirstOrDefault().name,
                                    language_id = checklistquestion_db.checklist_question_info.FirstOrDefault().language_id,
                                    checklist_id = checklistquestion_db.checklist_id,
                                    orden_view = checklistquestion_db.code
                                }).ToArray();

                return Json(jsondata, JsonRequestBehavior.AllowGet);
            }
            catch (Exception e)
            {
                ViewBag.Message = e.Message;
            }
            return null;
        }

        public ActionResult CheckListQuestionSave(FormCollection frm)
        {
            try
            {
                // TODO: Add update logic here
                checklist_question_info checklist_question_;
                var id_checklistquestion = (frm["id"] == "") ? 0 : Convert.ToInt32(frm["id"]);
                var id_language = (frm["language"] == "") ? 1 : Convert.ToInt32(frm["language"]);
                var id_checklist = (frm["checklist"] == "") ? 0 : Convert.ToInt32(frm["checklist"]);

                if (id_checklistquestion == 0)
                {
                    checklist_question_ = new checklist_question_info();
                    db.Entry(checklist_question_).State = EntityState.Added;
                }
                else
                {
                    checklist_question_ = db.checklist_question_info.Find(id_checklistquestion, id_language);
                    db.Entry(checklist_question_).State = EntityState.Modified;
                }


                checklist_question_.name = frm["name"];
                checklist_question_.checklistquestion.code = frm["order_view"];
                checklist_question_.checklistquestion.checklist_id = id_checklist;


                db.SaveChanges();

                return Json("Success");
            }
            catch (Exception e)
            {
                ViewBag.Message = e.Message;
            }
            return null;
        }

        public ActionResult CheckListQuestionDelete(FormCollection frm)
        {
            try
            {

                var id_checklist = (frm["id"] == "") ? 0 : Convert.ToInt32(frm["id"]);
                var catalog = db.checklists.Find(id_checklist);
                db.checklists.Remove(catalog);
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


        //  Check List

        public ActionResult CheckList(int? id)
        {
            return View();
        }
        public ActionResult CheckListListDataTables()
        {
            try
            {

                var list_object = db.checklists.AsQueryable();

                var jsondata = (from object_db in list_object
                                select new
                                {
                                    id = object_db.id,
                                    code = object_db.code

                                }).ToArray();

                return Json(jsondata, JsonRequestBehavior.AllowGet);
            }
            catch (Exception e)
            {
                ViewBag.Message = e.Message;
            }
            return null;
        }

        public ActionResult CheckListGet(int id)
        {
            try
            {
                var list_checklist = db.checklists.Where(x => x.id == id);

                var jsondata = (from checklist_db in list_checklist
                                select new
                                {
                                    id = checklist_db.id,
                                    code = checklist_db.code
                                }).ToArray();

                return Json(jsondata, JsonRequestBehavior.AllowGet);
            }
            catch (Exception e)
            {
                ViewBag.Message = e.Message;
            }
            return null;
        }

        public ActionResult CheckListSave(FormCollection frm)
        {
            try
            {
                // TODO: Add update logic here
                checklist checklist_;
                var id_checklist = (frm["id"] == "") ? 0 : Convert.ToInt32(frm["id"]);

                if (id_checklist == 0)
                {
                    checklist_ = new checklist();
                    db.Entry(checklist_).State = EntityState.Added;
                }
                else
                {
                    checklist_ = db.checklists.Find(id_checklist);
                    db.Entry(checklist_).State = EntityState.Modified;
                }


                checklist_.code = frm["code"];
                //checklist_.name = frm["name"];

                db.SaveChanges();

                return Json("Success");
            }
            catch
            {
                return View();
            }
        }

        public ActionResult CheckListDelete(FormCollection frm)
        {
            try
            {

                var id_checklist = (frm["id"] == "") ? 0 : Convert.ToInt32(frm["id"]);
                var catalog = db.checklists.Find(id_checklist);
                db.checklists.Remove(catalog);
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

        public ActionResult CheckListCreate(FormCollection frm)
        {
            try
            {
                checklist checklist_;
                var id_checklist = (frm["id"] == "") ? 0 : Convert.ToInt32(frm["id"]);
                var code_checklist = frm["code"].ToUpper();
                var any_checklist_code = db.checklists.Where(z => z.code.ToUpper() == code_checklist).Any();

                checklist_ = new checklist();

                if (any_checklist_code == true)
                {
                    return Json("El código de Check List ya existe, ingrese de nuevo los datos con otro código");
                }
                else if (id_checklist == 0)
                {
                    db.Entry(checklist_).State = EntityState.Added;
                    checklist_.code = frm["code"];
                    //language_.name = frm["name"];
                    db.SaveChanges();
                    return Json("Check List agregado");
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
