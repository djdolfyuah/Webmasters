using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using WebMasters;

namespace WebMasters.Controllers
{
    public class ToursController : Controller
    {
        private BBDDContext db = new BBDDContext();

        // GET: Tours
        public ActionResult Index()
        {
            var toursSet = db.ToursSet.Include(t => t.Ciudades);
            return View(toursSet.ToList());
        }

        // GET: Tours/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Tours tours = db.ToursSet.Find(id);
            if (tours == null)
            {
                return HttpNotFound();
            }
            return View(tours);
        }

        // GET: Tours/Create
        public ActionResult Create()
        {
            ViewBag.CiudadId = new SelectList(db.CiudadesSet, "CiudadId", "Nombre");
            return View();
        }

        // POST: Tours/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "TourId,Descripcion,CiudadId")] Tours tours)
        {
            if (ModelState.IsValid)
            {
                db.ToursSet.Add(tours);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.CiudadId = new SelectList(db.CiudadesSet, "CiudadId", "Nombre", tours.CiudadId);
            return View(tours);
        }

        // GET: Tours/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Tours tours = db.ToursSet.Find(id);
            if (tours == null)
            {
                return HttpNotFound();
            }
            ViewBag.CiudadId = new SelectList(db.CiudadesSet, "CiudadId", "Nombre", tours.CiudadId);
            return View(tours);
        }

        // POST: Tours/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "TourId,Descripcion,CiudadId")] Tours tours)
        {
            if (ModelState.IsValid)
            {
                db.Entry(tours).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.CiudadId = new SelectList(db.CiudadesSet, "CiudadId", "Nombre", tours.CiudadId);
            return View(tours);
        }

        // GET: Tours/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Tours tours = db.ToursSet.Find(id);
            if (tours == null)
            {
                return HttpNotFound();
            }
            return View(tours);
        }

        // POST: Tours/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Tours tours = db.ToursSet.Find(id);
            db.ToursSet.Remove(tours);
            db.SaveChanges();
            return RedirectToAction("Index");
        }


        public ActionResult Find()
        {
            db.
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
