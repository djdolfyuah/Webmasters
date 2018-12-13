﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using WorldTours;
using System.Net.Http;

namespace WorldTours.Controllers
{
    public class UsuariosController : Controller
    {
        private WorldToursDBModelContext db = new WorldToursDBModelContext();

        // GET: Usuarios/Create
        public ActionResult Signup()
        {
            return View();
        }

        // POST: Usuarios/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Signup([Bind(Include = "UsuarioId,Nombre,Apellidos,Telefono,Email,Contrasena,Descripcion,Sexo,Edad,Foto,Contacto,Tipo")] Usuarios usuarios)
        {
            if (ModelState.IsValid)
            {
                db.UsuariosSet.Add(usuarios);
                db.SaveChanges();
                return RedirectToAction("Login");
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

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }



        public ActionResult Login()
        {
            return View();
        }

        //public async System.Threading.Tasks.Task<ActionResult> CheckCaptcha()
        //{
        //    HttpClient client = new HttpClient();
        //    var values = new Dictionary<string, string>
        //                {
        //                   { "thing1", "hello" },
        //                   { "thing2", "world" }
        //                };

        //    var content = new FormUrlEncodedContent(values);

        //    var response = await client.PostAsync("http://www.example.com/recepticle.aspx", content);

        //    var responseString = await response.Content.ReadAsStringAsync();
        //}

        [HttpPost]
        public ActionResult Login(Usuarios user)
        {
            var usr = db.UsuariosSet.Where(u => u.Email == user.Email && u.Contrasena == user.Contrasena).FirstOrDefault();

            if (usr != null)
            {
                Session["UserID"] = usr.UsuarioId;
                return RedirectToAction("", "Dashboard", new { area = "" });
            }
            else
            {
                ModelState.AddModelError("", "EMail o Contraseña incorrectos.");
            }
            return View();
        }

        public ActionResult Logout()
        {
            Session["UserID"] = null;
            return RedirectToAction("", "Home", new { area = "" });
        }
    }
}
