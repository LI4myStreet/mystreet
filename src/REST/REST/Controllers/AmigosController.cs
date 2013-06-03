using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web;
using System.Web.Http;
using REST.Models;

namespace REST.Controllers
{
    public class AmigosController : ApiController
    {
        private MyStreetContext db = new MyStreetContext();

        // GET api/Amigos
        public IEnumerable<Amigo> GetAmigos()
        {
            //var amigos = db.Amigos.Include(a => a.Utilizador1).Include(a => a.Utilizador2);
            return db.Amigos.AsEnumerable();
        }
/*
        // GET api/Amigos/5
        public Amigo GetAmigo(int id)
        {
            Amigo amigo = db.Amigos.Find(id);
            if (amigo == null)
            {
                throw new HttpResponseException(Request.CreateResponse(HttpStatusCode.NotFound));
            }

            return amigo;
        }

        // PUT api/Amigos/5
        public HttpResponseMessage PutAmigo(int id, Amigo amigo)
        {
            if (ModelState.IsValid && id == amigo.Utilizador1Id)
            {
                db.Entry(amigo).State = EntityState.Modified;

                try
                {
                    db.SaveChanges();
                }
                catch (DbUpdateConcurrencyException)
                {
                    return Request.CreateResponse(HttpStatusCode.NotFound);
                }

                return Request.CreateResponse(HttpStatusCode.OK);
            }
            else
            {
                return Request.CreateResponse(HttpStatusCode.BadRequest);
            }
        }

        // POST api/Amigos
        public HttpResponseMessage PostAmigo(Amigo amigo)
        {
            if (ModelState.IsValid)
            {
                db.Amigos.Add(amigo);
                db.SaveChanges();

                HttpResponseMessage response = Request.CreateResponse(HttpStatusCode.Created, amigo);
                response.Headers.Location = new Uri(Url.Link("DefaultApi", new { id = amigo.Utilizador1Id }));
                return response;
            }
            else
            {
                return Request.CreateResponse(HttpStatusCode.BadRequest);
            }
        }

        // DELETE api/Amigos/5
        public HttpResponseMessage DeleteAmigo(int id)
        {
            Amigo amigo = db.Amigos.Find(id);
            if (amigo == null)
            {
                return Request.CreateResponse(HttpStatusCode.NotFound);
            }

            db.Amigos.Remove(amigo);

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                return Request.CreateResponse(HttpStatusCode.NotFound);
            }

            return Request.CreateResponse(HttpStatusCode.OK, amigo);
        }

        protected override void Dispose(bool disposing)
        {
            db.Dispose();
            base.Dispose(disposing);
        }*/
    }
}