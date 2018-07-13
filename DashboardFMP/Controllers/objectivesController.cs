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
    public class objectivesController : Controller
    {
        private DashboardFMPEntities db = new DashboardFMPEntities();

        // GET: objectives
        public ActionResult Index()
        {
            var objectives = db.objectives.Include(o => o.language);
            return View(objectives.ToList());
        }

        // GET: objectives/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            objective objective = db.objectives.Find(id);
            if (objective == null)
            {
                return HttpNotFound();
            }
            return View(objective);
        }

        // GET: objectives/Create
        public ActionResult Create()
        {
            ViewBag.language_id = new SelectList(db.languages, "id", "name");
            return View();
        }

        // POST: objectives/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "id,language_id,code,name,text")] objective objective)
        {
            if (ModelState.IsValid)
            {
                db.objectives.Add(objective);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.language_id = new SelectList(db.languages, "id", "name", objective.language_id);
            return View(objective);
        }

        // GET: objectives/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            objective objective = db.objectives.Find(id);
            if (objective == null)
            {
                return HttpNotFound();
            }
            ViewBag.language_id = new SelectList(db.languages, "id", "name", objective.language_id);
            return View(objective);
        }

        // POST: objectives/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "id,language_id,code,name,text")] objective objective)
        {
            if (ModelState.IsValid)
            {
                db.Entry(objective).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.language_id = new SelectList(db.languages, "id", "name", objective.language_id);
            return View(objective);
        }

        // GET: objectives/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            objective objective = db.objectives.Find(id);
            if (objective == null)
            {
                return HttpNotFound();
            }
            return View(objective);
        }

        // POST: objectives/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            objective objective = db.objectives.Find(id);
            db.objectives.Remove(objective);
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
