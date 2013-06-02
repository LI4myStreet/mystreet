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
    public class LocalidadesController : ApiController
    {
        private MyStreetContext db = new MyStreetContext();

        // GET api/Localidades
        public IEnumerable<Localidade> GetLocalidades()
        {
            return db.Localidades.AsEnumerable();
        }

        // GET api/Localidades/5
        public Localidade GetLocalidade(int id)
        {
            Localidade localidade = db.Localidades.Find(id);
            if (localidade == null)
            {
                throw new HttpResponseException(Request.CreateResponse(HttpStatusCode.NotFound));
            }

            return localidade;
        }

        // GET api/Localidades/?nome=somename
        public Localidade GetLocalidade(string nome)
        {
            Localidade localidade = db.Localidades.FirstOrDefault(l => l.Nome == nome);
            if (localidade == null)
            {
                throw new HttpResponseException(Request.CreateResponse(HttpStatusCode.NotFound));
            }

            return localidade;
        }

        // PUT api/Localidades/5
        public HttpResponseMessage PutLocalidade(int id, Localidade localidade)
        {
            if (ModelState.IsValid && id == localidade.ID)
            {
                db.Entry(localidade).State = EntityState.Modified;

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

        // POST api/Localidades
        public HttpResponseMessage PostLocalidade(Localidade localidade)
        {
            if (ModelState.IsValid)
            {
                db.Localidades.Add(localidade);
                db.SaveChanges();

                HttpResponseMessage response = Request.CreateResponse(HttpStatusCode.Created, localidade);
                response.Headers.Location = new Uri(Url.Link("DefaultApi", new { id = localidade.ID }));
                return response;
            }
            else
            {
                return Request.CreateResponse(HttpStatusCode.BadRequest);
            }
        }

        // DELETE api/Localidades/5
        public HttpResponseMessage DeleteLocalidade(int id)
        {
            Localidade localidade = db.Localidades.Find(id);
            if (localidade == null)
            {
                return Request.CreateResponse(HttpStatusCode.NotFound);
            }

            db.Localidades.Remove(localidade);

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                return Request.CreateResponse(HttpStatusCode.NotFound);
            }

            return Request.CreateResponse(HttpStatusCode.OK, localidade);
        }

        protected override void Dispose(bool disposing)
        {
            db.Dispose();
            base.Dispose(disposing);
        }
    }
}