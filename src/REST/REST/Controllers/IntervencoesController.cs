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
    public class IntervencoesController : ApiController
    {
        private MyStreetContext db = new MyStreetContext();

        // GET api/Intervencoes
        public IEnumerable<Intervencao> GetIntervencoes()
        {
            var intervencoes = db.Intervencoes.Include(i => i.Utilizador).Include(i => i.Ocorrencia);
            return intervencoes.AsEnumerable();
        }

        // GET api/Intervencoes/5
        public Intervencao GetIntervencao(int id)
        {
            Intervencao intervencao = db.Intervencoes.Find(id);
            if (intervencao == null)
            {
                throw new HttpResponseException(Request.CreateResponse(HttpStatusCode.NotFound));
            }

            return intervencao;
        }

        // PUT api/Intervencoes/5
        public HttpResponseMessage PutIntervencao(int id, Intervencao intervencao)
        {
            if (ModelState.IsValid && id == intervencao.Id)
            {
                db.Entry(intervencao).State = EntityState.Modified;

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

        // POST api/Intervencoes
        public HttpResponseMessage PostIntervencao(Intervencao intervencao)
        {
            if (ModelState.IsValid)
            {
                db.Intervencoes.Add(intervencao);
                db.SaveChanges();

                HttpResponseMessage response = Request.CreateResponse(HttpStatusCode.Created, intervencao);
                response.Headers.Location = new Uri(Url.Link("DefaultApi", new { id = intervencao.Id }));
                return response;
            }
            else
            {
                return Request.CreateResponse(HttpStatusCode.BadRequest);
            }
        }

        // DELETE api/Intervencoes/5
        public HttpResponseMessage DeleteIntervencao(int id)
        {
            Intervencao intervencao = db.Intervencoes.Find(id);
            if (intervencao == null)
            {
                return Request.CreateResponse(HttpStatusCode.NotFound);
            }

            db.Intervencoes.Remove(intervencao);

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                return Request.CreateResponse(HttpStatusCode.NotFound);
            }

            return Request.CreateResponse(HttpStatusCode.OK, intervencao);
        }

        protected override void Dispose(bool disposing)
        {
            db.Dispose();
            base.Dispose(disposing);
        }
    }
}