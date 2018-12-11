using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using WorldTours;

namespace WorldTours.Controllers
{
    public class DashboardController : Controller
    {
        private WorldToursDBModelContext db = new WorldToursDBModelContext();

        // GET: Dashboard
        public ActionResult Index()
        {
            Usuarios usuario = CheckUser();
            if (usuario == null)
            {
                return RedirectToAction("Index", "Home", new { area = "" });
            }
            return View(usuario);
        }

        // GET: Usuarios/Details/5
        public ActionResult Details()
        {
            Usuarios usuario = CheckUser();
            if (usuario == null)
            {
                return RedirectToAction("Index", "Home", new { area = "" });
            }
            return View(usuario);
        }

        // GET: Usuarios/Edit/5
        public ActionResult Edit()
        {
            Usuarios usuario = CheckUser();
            if (usuario == null)
            {
                return RedirectToAction("Index", "Home", new { area = "" });
            }
            return View(usuario);
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

        private Usuarios CheckUser()
        {
            var id = Session["UserID"];
            Usuarios usuario = db.UsuariosSet.Find(id);
            return usuario;
        }

    }
}
