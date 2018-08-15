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

        private string calculate_actual_node(string mode, string Q1, string Q2, string Q3, string Q4)
        {
            var result = "";
            var count = 0;
            var Q1_value = Q1 == "" ? 0 : Decimal.Parse(Q1);
            var Q2_value = Q2 == "" ? 0 : Decimal.Parse(Q2);
            var Q3_value = Q3 == "" ? 0 : Decimal.Parse(Q3);
            var Q4_value = Q4 == "" ? 0 : Decimal.Parse(Q4);

            if (Q1 == "" && Q2 == "" && Q3 == "" && Q4 == "") return "";
            if (Q1 != "") count = +1;
            if (Q2 != "") count = +1;
            if (Q3 != "") count = +1;
            if (Q4 != "") count = +1;

            if (mode == "percent")
            {
                result = (((Q1_value + Q2_value + Q3_value + Q4_value) / count) / 100).ToString();
            }else if (mode == "value")
            {
                result = (((Q1_value + Q2_value + Q3_value + Q4_value) / count)).ToString();
            }

            return result;
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
                var item_data = new Dictionary<string, Object>();

                foreach (country item_country in country_)
                {

                    var item_data_subitem = new Dictionary<string, Object>();
                    var item_data_variables = new Dictionary<string, Object>();
                    var item_data_variables_names = new Dictionary<string, Object>();
                    var item_data_quarters = new Dictionary<string, string>();

                    // Groups
                    var item_data_groups = new Dictionary<string, Object>();
                    var item_data_Groups_quarters = new Dictionary<string, decimal>();

                    var indicator_by_country = country_indicador_.Where(x=> x.country_id == item_country.id).OrderBy(z => z.indicator.indicatorgroup.code).ThenBy(y => y.indicator_id).ThenBy(x => x.quarter);
                    var indicator_by_country_list = country_indicador_.Where(x => x.country_id == item_country.id && x.target != null).Select(y => y.indicator_id);
                    var group_indicator_by_country = country_indicador_.Where(x => x.country_id == item_country.id && indicator_by_country_list.Contains(x.indicator_id)).OrderBy(z => z.indicator.indicatorgroup.code).ThenBy(y => y.indicator_id).ThenBy(x => x.quarter);

                    var item_name = "";
                    var item_name_target = "";
                    var item_name_count = "";
                    var indicator_actual = "";
                    var indicator_back = "";
                    var indicator_back_mode = "";

                    // Variables for Groups
                    var group_actual = "";
                    var group_back = "";
                    var count_Q1 = 0;
                    var count_Q2 = 0;
                    var count_Q3 = 0;
                    var count_Q4 = 0;
                    var count_Actual = 0;
                    var item_for_actual_node_calculate = new object();

                    foreach (country_indicator item_indicatorbycountry in indicator_by_country)
                    {
                        
                        if (indicator_actual == "" && indicator_back == "")
                        {

                            indicator_actual = indicator_back = item_indicatorbycountry.indicator.indicator_info.FirstOrDefault().code;
                            indicator_back_mode = item_indicatorbycountry.indicator.mode;
                        }
                        else
                        {
                            indicator_actual = item_indicatorbycountry.indicator.indicator_info.FirstOrDefault().code;
                        }


                        if (indicator_actual != indicator_back)
                        {
                            item_data_quarters.Add("Actual", "");
                            item_data_quarters.Add("Actual_target", "");

                            item_data_quarters["Actual"] = calculate_actual_node(indicator_back_mode, item_data_quarters["Q1"], item_data_quarters["Q2"], item_data_quarters["Q3"], item_data_quarters["Q4"]);
                            item_data_quarters["Actual_target"] = calculate_actual_node(indicator_back_mode, item_data_quarters["Q1_target"], item_data_quarters["Q2_target"], item_data_quarters["Q3_target"], item_data_quarters["Q4_target"]);

                            item_data_variables.Add(indicator_back, item_data_quarters);
                            item_data_quarters = new Dictionary<string, string>();


                        }

                            switch (item_indicatorbycountry.quarter)
                            {
                                case 1:
                                    item_name = "Q1";
                                    item_name_target = "Q1_target";
                                    break;
                                case 2:
                                    item_name = "Q2";
                                    item_name_target = "Q2_target";
                                    break;
                                case 3:
                                    item_name = "Q3";
                                    item_name_target = "Q3_target";
                                    break;
                                case 4:
                                    item_name = "Q4";
                                    item_name_target = "Q4_target";
                                    break;
                                case 0:
                                    item_name = "Actual";
                                    item_name_target = "Actual_target";
                                    break;
                            }
                            item_data_quarters.Add(item_name, item_indicatorbycountry.value.ToString());
                            item_data_quarters.Add(item_name_target, item_indicatorbycountry.target.ToString());



                        indicator_back = indicator_actual;
                        indicator_back_mode = item_indicatorbycountry.indicator.mode;

                    }

                    // Groups

                    foreach (country_indicator item_indicatorbycountry in group_indicator_by_country)
                    {

                        // Groups

                        if (group_actual == "" && group_back == "")
                        {
                            group_actual = group_back = item_indicatorbycountry.indicator.indicatorgroup.code;
                            indicator_back_mode = item_indicatorbycountry.indicator.mode;
                        }
                        else
                        {
                            group_actual = item_indicatorbycountry.indicator.indicatorgroup.code;
                        }

                        if (group_actual != group_back)
                        {

                            item_data_Groups_quarters.Add("Actual", 0);
                            item_data_Groups_quarters.Add("Actual_target", 0);
                            item_data_Groups_quarters.Add("Actual_count", 0);

                            // Calculo de promedio para que refleje los datos reales en porcentajes

                            if (item_data_Groups_quarters["Q1_count"] > 0)
                            {
                                item_data_Groups_quarters["Q1"] = (item_data_Groups_quarters["Q1"] / item_data_Groups_quarters["Q1_count"]);
                                item_data_Groups_quarters["Q1_target"] = (item_data_Groups_quarters["Q1_target"] / item_data_Groups_quarters["Q1_count"]);
                            }
                                
                            if (item_data_Groups_quarters["Q2_count"] > 0)
                            {
                                item_data_Groups_quarters["Q2"] = (item_data_Groups_quarters["Q2"] / item_data_Groups_quarters["Q2_count"]);
                                item_data_Groups_quarters["Q2_target"] = (item_data_Groups_quarters["Q2_target"] / item_data_Groups_quarters["Q2_count"]);
                            }
                                
                            if (item_data_Groups_quarters["Q3_count"] > 0)
                            {
                                item_data_Groups_quarters["Q3"] = (item_data_Groups_quarters["Q3"] / item_data_Groups_quarters["Q3_count"]);
                                item_data_Groups_quarters["Q3_target"] = (item_data_Groups_quarters["Q3_target"] / item_data_Groups_quarters["Q3_count"]);
                            }
                                
                            if (item_data_Groups_quarters["Q4_count"] > 0)
                            {
                                item_data_Groups_quarters["Q4"] = (item_data_Groups_quarters["Q4"] / item_data_Groups_quarters["Q4_count"]);
                                item_data_Groups_quarters["Q4_target"] = (item_data_Groups_quarters["Q4_target"] / item_data_Groups_quarters["Q4_count"]);
                            }

                            if (item_data_Groups_quarters["Actual_count"] > 0)
                            {
                                item_data_Groups_quarters["Actual"] = (item_data_Groups_quarters["Actual"] / item_data_Groups_quarters["Actual_count"]);
                                item_data_Groups_quarters["Actual_target"] = (item_data_Groups_quarters["Actual_target"] / item_data_Groups_quarters["Actual_count"]);
                            }

                            item_data_groups.Add(group_back, item_data_Groups_quarters);
                            item_data_Groups_quarters = new Dictionary<string, decimal>(); ;
                        }

                        switch (item_indicatorbycountry.quarter)
                        {
                            case 1:
                                item_name = "Q1";
                                item_name_target = "Q1_target";
                                item_name_count = "Q1_count";
                                break;
                            case 2:
                                item_name = "Q2";
                                item_name_target = "Q2_target";
                                item_name_count = "Q2_count";
                                break;
                            case 3:
                                item_name = "Q3";
                                item_name_target = "Q3_target";
                                item_name_count = "Q3_count";
                                break;
                            case 4:
                                item_name = "Q4";
                                item_name_target = "Q4_target";
                                item_name_count = "Q4_count";
                                break;
                            case 0:
                                item_name = "Actual";
                                item_name_target = "Actual_target";
                                item_name_count = "Actual_count";
                                break;
                        }

                        //count_Q1 =  item_data_Groups_quarters.GetType().GetProperty("Q1_count");
                        item_for_actual_node_calculate = item_data_Groups_quarters.Where(x => x.Key == "Q1");
                        if (!item_data_Groups_quarters.ContainsKey("Q1") && item_name == "Q1" && item_indicatorbycountry.value.ToString() != "") count_Q1 = 1;
                        if (!item_data_Groups_quarters.ContainsKey("Q2") && item_name == "Q2" && item_indicatorbycountry.value.ToString() != "") count_Q2 = 1;
                        if (!item_data_Groups_quarters.ContainsKey("Q3") && item_name == "Q3" && item_indicatorbycountry.value.ToString() != "") count_Q3 = 1;
                        if (!item_data_Groups_quarters.ContainsKey("Q4") && item_name == "Q4" && item_indicatorbycountry.value.ToString() != "") count_Q4 = 1;

                        if ((item_name == "Q1" && !item_data_Groups_quarters.ContainsKey("Q1")) || (item_name == "Q2" && !item_data_Groups_quarters.ContainsKey("Q2")) || (item_name == "Q3" && !item_data_Groups_quarters.ContainsKey("Q3")) || (item_name == "Q4" && !item_data_Groups_quarters.ContainsKey("Q4")))
                        {
                                item_data_Groups_quarters.Add(item_name, (item_indicatorbycountry.value == null) ? 0 : (decimal)item_indicatorbycountry.value);
                                item_data_Groups_quarters.Add(item_name_target, (item_indicatorbycountry.target == null) ? 0 :  (decimal)item_indicatorbycountry.target);
                                item_data_Groups_quarters.Add(item_name_count, (item_indicatorbycountry.value == null )? 0 : 1);
                        }
                        else
                        {
                            if (item_name == "Q1" && item_indicatorbycountry.value.ToString() != "") count_Q1 += 1;
                            if (item_name == "Q2" && item_indicatorbycountry.value.ToString() != "") count_Q2 += 1;
                            if (item_name == "Q3" && item_indicatorbycountry.value.ToString() != "") count_Q3 += 1;
                            if (item_name == "Q4" && item_indicatorbycountry.value.ToString() != "") count_Q4 += 1;

                            item_data_Groups_quarters[item_name] = ((item_data_Groups_quarters[item_name] == 0 && item_indicatorbycountry.value == null) ? 0 : (item_data_Groups_quarters[item_name] != 0) ? item_data_Groups_quarters[item_name] : 0) + ((item_indicatorbycountry.value != null) ? (decimal)item_indicatorbycountry.value : 0);
                            item_data_Groups_quarters[item_name_target] = (item_data_Groups_quarters[item_name_target] == 0 && item_indicatorbycountry.target == null) ? 0 : ((item_data_Groups_quarters[item_name_target] != 0) ? item_data_Groups_quarters[item_name_target] : 0) + ((item_indicatorbycountry.target != null) ? (decimal)item_indicatorbycountry.target : 0);
                            item_data_Groups_quarters[item_name_count] = (item_name == "Q1" && count_Q1 > 0) ? count_Q1 : (item_name == "Q2" && count_Q2 > 0) ? count_Q2 : (item_name == "Q3" && count_Q3 > 0) ? count_Q3 : (item_name == "Q4" && count_Q4 > 0) ? count_Q4 :  (item_data_Groups_quarters[item_name_count] != 0) ? item_data_Groups_quarters[item_name_count] : 0;

                        }

                        group_back = group_actual;
                        indicator_back_mode = item_indicatorbycountry.indicator.mode;

                    }

                    item_data_subitem.Add("name",item_country.code.ToUpper() + " NAMES");
                    item_data_subitem.Add("variables", item_data_variables);
                    item_data_subitem.Add("groups", item_data_groups);
                    item_data.Add(item_country.code, item_data_subitem);

                }


                jsondata.Add(new
                {
                    Variables = item_data
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
