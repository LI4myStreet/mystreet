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
    public class ClassificacoesController : ApiController
    {
        private MyStreetContext db = new MyStreetContext();

        // GET api/Classificacoes
        public IEnumerable<Classificacao> GetClassificacaos()
        {
            var classificacoes = db.Classificacoes.Include(c => c.Utilizador).Include(c => c.Intervencao);
            return classificacoes.AsEnumerable();
        }

        // GET api/Classificacoes/5
        public Classificacao GetClassificacao(int id)
        {
            Classificacao classificacao = db.Classificacoes.Find(id);
            if (classificacao == null)
            {
                throw new HttpResponseException(Request.CreateResponse(HttpStatusCode.NotFound));
            }

            return classificacao;
        }

        // PUT api/Classificacoes/5
        public HttpResponseMessage PutClassificacao(int id, Classificacao classificacao)
        {
            if (ModelState.IsValid && id == classificacao.UtilizadorId)
            {
                db.Entry(classificacao).State = EntityState.Modified;

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

        // POST api/Classificacoes
        public HttpResponseMessage PostClassificacao(Classificacao classificacao)
        {
            if (ModelState.IsValid)
            {
                db.Classificacoes.Add(classificacao);
                db.SaveChanges();

                HttpResponseMessage response = Request.CreateResponse(HttpStatusCode.Created, classificacao);
                response.Headers.Location = new Uri(Url.Link("DefaultApi", new { id = classificacao.UtilizadorId }));
                return response;
            }
            else
            {
                return Request.CreateResponse(HttpStatusCode.BadRequest);
            }
        }

        // DELETE api/Classificacoes/5
        public HttpResponseMessage DeleteClassificacao(int id)
        {
            Classificacao classificacao = db.Classificacoes.Find(id);
            if (classificacao == null)
            {
                return Request.CreateResponse(HttpStatusCode.NotFound);
            }

            db.Classificacoes.Remove(classificacao);

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                return Request.CreateResponse(HttpStatusCode.NotFound);
            }

            return Request.CreateResponse(HttpStatusCode.OK, classificacao);
        }

        protected override void Dispose(bool disposing)
        {
            db.Dispose();
            base.Dispose(disposing);
        }
    }
}