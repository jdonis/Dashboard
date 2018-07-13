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
    public class question_valueController : Controller
    {
        private DashboardFMPEntities db = new DashboardFMPEntities();

        // GET: question_value
        public ActionResult Index()
        {
            var question_value = db.question_value.Include(q => q.checklistquestion).Include(q => q.country_indicator);
            return View(question_value.ToList());
        }

        // GET: question_value/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            question_value question_value = db.question_value.Find(id);
            if (question_value == null)
            {
                return HttpNotFound();
            }
            return View(question_value);
        }

        // GET: question_value/Create
        public ActionResult Create()
        {
            ViewBag.checklistquestion_id = new SelectList(db.checklistquestions, "id", "code");
            ViewBag.country_indicator_indicator_id = new SelectList(db.country_indicator, "indicator_id", "inputtype");
            return View();
        }

        // POST: question_value/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "country_indicator_country_id,country_indicator_indicator_id,checklistquestion_id,value,target")] question_value question_value)
        {
            if (ModelState.IsValid)
            {
                db.question_value.Add(question_value);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.checklistquestion_id = new SelectList(db.checklistquestions, "id", "code", question_value.checklistquestion_id);
            ViewBag.country_indicator_indicator_id = new SelectList(db.country_indicator, "indicator_id", "inputtype", question_value.country_indicator_indicator_id);
            return View(question_value);
        }

        // GET: question_value/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            question_value question_value = db.question_value.Find(id);
            if (question_value == null)
            {
                return HttpNotFound();
            }
            ViewBag.checklistquestion_id = new SelectList(db.checklistquestions, "id", "code", question_value.checklistquestion_id);
            ViewBag.country_indicator_indicator_id = new SelectList(db.country_indicator, "indicator_id", "inputtype", question_value.country_indicator_indicator_id);
            return View(question_value);
        }

        // POST: question_value/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "country_indicator_country_id,country_indicator_indicator_id,checklistquestion_id,value,target")] question_value question_value)
        {
            if (ModelState.IsValid)
            {
                db.Entry(question_value).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.checklistquestion_id = new SelectList(db.checklistquestions, "id", "code", question_value.checklistquestion_id);
            ViewBag.country_indicator_indicator_id = new SelectList(db.country_indicator, "indicator_id", "inputtype", question_value.country_indicator_indicator_id);
            return View(question_value);
        }

        // GET: question_value/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            question_value question_value = db.question_value.Find(id);
            if (question_value == null)
            {
                return HttpNotFound();
            }
            return View(question_value);
        }

        // POST: question_value/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            question_value question_value = db.question_value.Find(id);
            db.question_value.Remove(question_value);
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
