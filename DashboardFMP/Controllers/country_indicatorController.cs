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
    public class country_indicatorController : Controller
    {
        private DashboardFMPEntities db = new DashboardFMPEntities();

        // GET: country_indicator
        public ActionResult Index()
        {
            var country_indicator = db.country_indicator.Include(c => c.country).Include(c => c.indicator);
            return View(country_indicator.ToList());
        }

        // GET: country_indicator/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            country_indicator country_indicator = db.country_indicator.Find(id);
            if (country_indicator == null)
            {
                return HttpNotFound();
            }
            return View(country_indicator);
        }

        // GET: country_indicator/Create
        public ActionResult Create()
        {
            ViewBag.country_id = new SelectList(db.countries, "id", "code");
            ViewBag.indicator_id = new SelectList(db.indicators, "id", "code");
            return View();
        }

        // POST: country_indicator/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "indicator_id,country_id,value,inputtype,quarter,target,inputyear")] country_indicator country_indicator)
        {
            if (ModelState.IsValid)
            {
                db.country_indicator.Add(country_indicator);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.country_id = new SelectList(db.countries, "id", "code", country_indicator.country_id);
            ViewBag.indicator_id = new SelectList(db.indicators, "id", "code", country_indicator.indicator_id);
            return View(country_indicator);
        }

        // GET: country_indicator/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            country_indicator country_indicator = db.country_indicator.Find(id);
            if (country_indicator == null)
            {
                return HttpNotFound();
            }
            ViewBag.country_id = new SelectList(db.countries, "id", "code", country_indicator.country_id);
            ViewBag.indicator_id = new SelectList(db.indicators, "id", "code", country_indicator.indicator_id);
            return View(country_indicator);
        }

        // POST: country_indicator/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "indicator_id,country_id,value,inputtype,quarter,target,inputyear")] country_indicator country_indicator)
        {
            if (ModelState.IsValid)
            {
                db.Entry(country_indicator).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.country_id = new SelectList(db.countries, "id", "code", country_indicator.country_id);
            ViewBag.indicator_id = new SelectList(db.indicators, "id", "code", country_indicator.indicator_id);
            return View(country_indicator);
        }

        // GET: country_indicator/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            country_indicator country_indicator = db.country_indicator.Find(id);
            if (country_indicator == null)
            {
                return HttpNotFound();
            }
            return View(country_indicator);
        }

        // POST: country_indicator/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            country_indicator country_indicator = db.country_indicator.Find(id);
            db.country_indicator.Remove(country_indicator);
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
