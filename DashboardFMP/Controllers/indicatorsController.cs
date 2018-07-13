using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;

namespace DashboardFMP.Controllers
{
    public class indicatorsController : Controller
    {
        private DashboardFMPEntities db = new DashboardFMPEntities();

        // GET: indicators
        public ActionResult Index()
        {
            var indicators = db.indicators.Include(i => i.checklist).Include(i => i.indicatorgroup).Include(i => i.objective).Include(i => i.language);
            return View(indicators.ToList());
        }

        // GET: indicators/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            indicator indicator = db.indicators.Find(id);
            if (indicator == null)
            {
                return HttpNotFound();
            }
            return View(indicator);
        }

        // GET: indicators/Create
        public ActionResult Create()
        {
            ViewBag.checklist_id = new SelectList(db.checklists, "id", "code");
            ViewBag.indicatorgroup_id = new SelectList(db.indicatorgroups, "id", "code");
            ViewBag.objective_id = new SelectList(db.objectives, "id", "code");
            ViewBag.language_id = new SelectList(db.languages, "id", "name");
            return View();
        }

        // POST: indicators/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "id,language_id,checklist_id,objective_id,indicatorgroup_id,code,mode,frequency,responsible,contact,inputtype,name,shortname")] indicator indicator)
        {
            if (ModelState.IsValid)
            {
                db.indicators.Add(indicator);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.checklist_id = new SelectList(db.checklists, "id", "code", indicator.checklist_id);
            ViewBag.indicatorgroup_id = new SelectList(db.indicatorgroups, "id", "code", indicator.indicatorgroup_id);
            ViewBag.objective_id = new SelectList(db.objectives, "id", "code", indicator.objective_id);
            ViewBag.language_id = new SelectList(db.languages, "id", "name", indicator.language_id);
            return View(indicator);
        }

        // GET: indicators/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            indicator indicator = db.indicators.Find(id);
            if (indicator == null)
            {
                return HttpNotFound();
            }
            ViewBag.checklist_id = new SelectList(db.checklists, "id", "code", indicator.checklist_id);
            ViewBag.indicatorgroup_id = new SelectList(db.indicatorgroups, "id", "code", indicator.indicatorgroup_id);
            ViewBag.objective_id = new SelectList(db.objectives, "id", "code", indicator.objective_id);
            ViewBag.language_id = new SelectList(db.languages, "id", "name", indicator.language_id);
            return View(indicator);
        }

        // POST: indicators/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "id,language_id,checklist_id,objective_id,indicatorgroup_id,code,mode,frequency,responsible,contact,inputtype,name,shortname")] indicator indicator)
        {
            if (ModelState.IsValid)
            {
                db.Entry(indicator).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.checklist_id = new SelectList(db.checklists, "id", "code", indicator.checklist_id);
            ViewBag.indicatorgroup_id = new SelectList(db.indicatorgroups, "id", "code", indicator.indicatorgroup_id);
            ViewBag.objective_id = new SelectList(db.objectives, "id", "code", indicator.objective_id);
            ViewBag.language_id = new SelectList(db.languages, "id", "name", indicator.language_id);
            return View(indicator);
        }

        // GET: indicators/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            indicator indicator = db.indicators.Find(id);
            if (indicator == null)
            {
                return HttpNotFound();
            }
            return View(indicator);
        }

        // POST: indicators/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            indicator indicator = db.indicators.Find(id);
            db.indicators.Remove(indicator);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
