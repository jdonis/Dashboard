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
    public class indicatorgroupsController : Controller
    {
        private DashboardFMPEntities db = new DashboardFMPEntities();

        // GET: indicatorgroups
        public ActionResult Index()
        {
            var indicatorgroups = db.indicatorgroups.Include(i => i.language);
            return View(indicatorgroups.ToList());
        }

        // GET: indicatorgroups/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            indicatorgroup indicatorgroup = db.indicatorgroups.Find(id);
            if (indicatorgroup == null)
            {
                return HttpNotFound();
            }
            return View(indicatorgroup);
        }

        // GET: indicatorgroups/Create
        public ActionResult Create()
        {
            ViewBag.language_id = new SelectList(db.languages, "id", "name");
            return View();
        }

        // POST: indicatorgroups/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "id,language_id,code,name,description")] indicatorgroup indicatorgroup)
        {
            if (ModelState.IsValid)
            {
                db.indicatorgroups.Add(indicatorgroup);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.language_id = new SelectList(db.languages, "id", "name", indicatorgroup.language_id);
            return View(indicatorgroup);
        }

        // GET: indicatorgroups/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            indicatorgroup indicatorgroup = db.indicatorgroups.Find(id);
            if (indicatorgroup == null)
            {
                return HttpNotFound();
            }
            ViewBag.language_id = new SelectList(db.languages, "id", "name", indicatorgroup.language_id);
            return View(indicatorgroup);
        }

        // POST: indicatorgroups/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "id,language_id,code,name,description")] indicatorgroup indicatorgroup)
        {
            if (ModelState.IsValid)
            {
                db.Entry(indicatorgroup).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.language_id = new SelectList(db.languages, "id", "name", indicatorgroup.language_id);
            return View(indicatorgroup);
        }

        // GET: indicatorgroups/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            indicatorgroup indicatorgroup = db.indicatorgroups.Find(id);
            if (indicatorgroup == null)
            {
                return HttpNotFound();
            }
            return View(indicatorgroup);
        }

        // POST: indicatorgroups/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            indicatorgroup indicatorgroup = db.indicatorgroups.Find(id);
            db.indicatorgroups.Remove(indicatorgroup);
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
