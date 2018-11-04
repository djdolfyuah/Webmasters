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
    public class UsuariosController : Controller
    {
        private BBDDContext db = new BBDDContext();

        // GET: Usuarios
        public ActionResult Index()
        {
            return View(db.UsuariosSet.ToList());
        }

        // GET: Usuarios/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Usuarios usuarios = db.UsuariosSet.Find(id);
            if (usuarios == null)
            {
                return HttpNotFound();
            }
            return View(usuarios);
        }

        // GET: Usuarios/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Usuarios/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "UsuarioId,Nombre,Apellidos,Telefono,Email,Contrasena,Descripcion,Sexo,Edad,Foto,Contacto,Tipo")] Usuarios usuarios)
        {
            if (ModelState.IsValid)
            {
                db.UsuariosSet.Add(usuarios);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(usuarios);
        }

        // GET: Usuarios/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Usuarios usuarios = db.UsuariosSet.Find(id);
            if (usuarios == null)
            {
                return HttpNotFound();
            }
            return View(usuarios);
        }

        // POST: Usuarios/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "UsuarioId,Nombre,Apellidos,Telefono,Email,Contrasena,Descripcion,Sexo,Edad,Foto,Contacto,Tipo")] Usuarios usuarios)
        {
            if (ModelState.IsValid)
            {
                db.Entry(usuarios).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(usuarios);
        }

        // GET: Usuarios/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Usuarios usuarios = db.UsuariosSet.Find(id);
            if (usuarios == null)
            {
                return HttpNotFound();
            }
            return View(usuarios);
        }

        // POST: Usuarios/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Usuarios usuarios = db.UsuariosSet.Find(id);
            db.UsuariosSet.Remove(usuarios);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        // GET: Usuarios/Login/5
        public ActionResult Login()
        {
            return View();
        }

        // GET: Usuarios/Confirm/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Login(string email, string contrasena, int? tipo)
        {
            var user = (from Usuarios in db.UsuariosSet
                                where Usuarios.Email == email
                                select Usuarios);

            if (user.Count() == 0)
            {
                return View();
            }
            


           
                

  


            return Edit(user.First().UsuarioId);
            
            
            
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
