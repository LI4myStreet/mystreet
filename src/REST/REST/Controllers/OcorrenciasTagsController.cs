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
using REST.App_Start;

namespace REST.Controllers
{
    [AllowCrossSiteJson]
    public class OcorrenciasTagsController : ApiController
    {
        private MyStreetContext db = new MyStreetContext();

        // GET api/OcorrenciasTags
        public IEnumerable<OcorrenciaTags> GetOcorrenciaTags()
        {
            var ocorrenciastags = db.OcorrenciasTags.Include(o => o.Ocorrencia).Include(o => o.Tag);
            return ocorrenciastags.AsEnumerable();
        }

        // GET api/OcorrenciasTags/5
        public IEnumerable<OcorrenciaTags> GetOcorrenciaTags(int id)
        {
            var ocorrenciastags = db.OcorrenciasTags.Where(o => o.OcorrenciaId == id);
            return ocorrenciastags.AsEnumerable();
        }

        // PUT api/OcorrenciasTags/5
        public HttpResponseMessage PutOcorrenciaTags(int id, OcorrenciaTags ocorrenciatags)
        {
            if (ModelState.IsValid && id == ocorrenciatags.OcorrenciaId)
            {
                db.Entry(ocorrenciatags).State = EntityState.Modified;

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

        // POST api/OcorrenciasTags
        public HttpResponseMessage PostOcorrenciaTags(OcorrenciaTags ocorrenciatags)
        {
            if (ModelState.IsValid)
            {
                db.OcorrenciasTags.Add(ocorrenciatags);
                db.SaveChanges();

                HttpResponseMessage response = Request.CreateResponse(HttpStatusCode.Created, ocorrenciatags);
                response.Headers.Location = new Uri(Url.Link("DefaultApi", new { id = ocorrenciatags.OcorrenciaId }));
                return response;
            }
            else
            {
                return Request.CreateResponse(HttpStatusCode.BadRequest);
            }
        }

        // DELETE api/OcorrenciasTags/5
        public HttpResponseMessage DeleteOcorrenciaTags(int id)
        {
            OcorrenciaTags ocorrenciatags = db.OcorrenciasTags.Find(id);
            if (ocorrenciatags == null)
            {
                return Request.CreateResponse(HttpStatusCode.NotFound);
            }

            db.OcorrenciasTags.Remove(ocorrenciatags);

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                return Request.CreateResponse(HttpStatusCode.NotFound);
            }

            return Request.CreateResponse(HttpStatusCode.OK, ocorrenciatags);
        }

        protected override void Dispose(bool disposing)
        {
            db.Dispose();
            base.Dispose(disposing);
        }
    }
}