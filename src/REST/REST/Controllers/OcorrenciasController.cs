using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using REST.Models;
using System.Data;
using System.Data.Entity.Infrastructure;

namespace REST.Controllers
{
    public class OcorrenciasController : ApiController
    {
        private MyStreetContext db = new MyStreetContext();

        // GET api/Ocorrencias
        public IEnumerable<Ocorrencia> GetOcorrencias()
        {
            return db.Ocorrencias.AsEnumerable();
        }

        // GET api/Ocorrencias/5
        public Ocorrencia GetOcorrencia(int id)
        {
            Ocorrencia ocorrencia = db.Ocorrencias.Find(id);
            if (ocorrencia == null)
            {
                throw new HttpResponseException(Request.CreateResponse(HttpStatusCode.NotFound));
            }

            return ocorrencia;
        }

        // PUT api/Ocorrencias/5
        public HttpResponseMessage PutOcorrencia(int id, Ocorrencia ocorrencia)
        {
            if (ModelState.IsValid && id == ocorrencia.Id)
            {
                db.Entry(ocorrencia).State = EntityState.Modified;

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

        // POST api/Ocorrencias
        public HttpResponseMessage PostOcorrencia(Ocorrencia ocorrencia)
        {
            if (ModelState.IsValid)
            {
                db.Ocorrencias.Add(ocorrencia);
                db.SaveChanges();

                HttpResponseMessage response = Request.CreateResponse(HttpStatusCode.Created, ocorrencia);
                response.Headers.Location = new Uri(Url.Link("DefaultApi", new { id = ocorrencia.Id }));
                return response;
            }
            else
            {
                return Request.CreateResponse(HttpStatusCode.BadRequest);
            }
        }

        // DELETE api/Ocorrencias/5
        public HttpResponseMessage DeleteOcorrencia(int id)
        {
            Ocorrencia ocorrencia = db.Ocorrencias.Find(id);
            if (ocorrencia == null)
            {
                return Request.CreateResponse(HttpStatusCode.NotFound);
            }

            db.Ocorrencias.Remove(ocorrencia);

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                return Request.CreateResponse(HttpStatusCode.NotFound);
            }

            return Request.CreateResponse(HttpStatusCode.OK, ocorrencia);
        }

        protected override void Dispose(bool disposing)
        {
            db.Dispose();
            base.Dispose(disposing);
        }
    }
}
