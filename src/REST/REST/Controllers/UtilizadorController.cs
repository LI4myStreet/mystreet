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
    public class UtilizadorController : ApiController
    {
        private MyStreetContext db = new MyStreetContext();

        // GET api/Utilizador
        public IEnumerable<Utilizador> GetUtilizadors()
        {
            return db.Utilizadores.AsEnumerable();
        }

        // GET api/Utilizador/5
        public Utilizador GetUtilizador(int id)
        {
            Utilizador utilizador = db.Utilizadores.Find(id);
            if (utilizador == null)
            {
                throw new HttpResponseException(Request.CreateResponse(HttpStatusCode.NotFound));
            }

            return utilizador;
        }

        // GET api/Utilizador/?username=u&password=p
        public Utilizador GetUtilizador(string username, string password)
        {            
            return db.Utilizadores.FirstOrDefault(u => u.Username == username && u.Password == password);            
        }

        // PUT api/Utilizador/5
        public HttpResponseMessage PutUtilizador(int id, Utilizador utilizador)
        {
            if (ModelState.IsValid && id == utilizador.Id)
            {
                db.Entry(utilizador).State = EntityState.Modified;

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

        // POST api/Utilizador
        public HttpResponseMessage PostUtilizador(Utilizador utilizador)
        {
            if (ModelState.IsValid)
            {
                db.Utilizadores.Add(utilizador);
                db.SaveChanges();

                HttpResponseMessage response = Request.CreateResponse(HttpStatusCode.Created, utilizador);
                response.Headers.Location = new Uri(Url.Link("DefaultApi", new { id = utilizador.Id }));
                return response;
            }
            else
            {
                return Request.CreateResponse(HttpStatusCode.BadRequest);
            }
        }

        // DELETE api/Utilizador/5
        public HttpResponseMessage DeleteUtilizador(int id)
        {
            Utilizador utilizador = db.Utilizadores.Find(id);
            if (utilizador == null)
            {
                return Request.CreateResponse(HttpStatusCode.NotFound);
            }

            db.Utilizadores.Remove(utilizador);

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                return Request.CreateResponse(HttpStatusCode.NotFound);
            }

            return Request.CreateResponse(HttpStatusCode.OK, utilizador);
        }

        protected override void Dispose(bool disposing)
        {
            db.Dispose();
            base.Dispose(disposing);
        }
    }
}