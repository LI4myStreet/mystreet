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
    public class ComentariosController : ApiController
    {
        private MyStreetContext db = new MyStreetContext();

        // GET api/Comentarios
        public IEnumerable<Comentario> GetComentarios()
        {
            return db.Comentarios.AsEnumerable();
        }

        // GET api/Comentarios/5
        public Comentario GetComentario(int id)
        {
            Comentario comentario = db.Comentarios.Find(id);
            if (comentario == null)
            {
                throw new HttpResponseException(Request.CreateResponse(HttpStatusCode.NotFound));
            }

            return comentario;
        }

        // GET api/Comentarios/5
        public IEnumerable<Comentario> GetComentarios(int ocorrenciaId)
        {
            return db.Comentarios.Where(c => c.OcorrenciaId == ocorrenciaId);
        }

        // PUT api/Comentarios/5
        public HttpResponseMessage PutComentario(int id, Comentario comentario)
        {
            if (ModelState.IsValid && id == comentario.Id)
            {
                db.Entry(comentario).State = EntityState.Modified;

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

        // POST api/Comentarios
        public HttpResponseMessage PostComentario(Comentario comentario)
        {
            if (ModelState.IsValid)
            {
                db.Comentarios.Add(comentario);
                db.SaveChanges();

                HttpResponseMessage response = Request.CreateResponse(HttpStatusCode.Created, comentario);
                response.Headers.Location = new Uri(Url.Link("DefaultApi", new { id = comentario.Id }));
                return response;
            }
            else
            {
                return Request.CreateResponse(HttpStatusCode.BadRequest);
            }
        }

        // DELETE api/Comentarios/5
        public HttpResponseMessage DeleteComentario(int id)
        {
            Comentario comentario = db.Comentarios.Find(id);
            if (comentario == null)
            {
                return Request.CreateResponse(HttpStatusCode.NotFound);
            }

            db.Comentarios.Remove(comentario);

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                return Request.CreateResponse(HttpStatusCode.NotFound);
            }

            return Request.CreateResponse(HttpStatusCode.OK, comentario);
        }

        protected override void Dispose(bool disposing)
        {
            db.Dispose();
            base.Dispose(disposing);
        }
    }
}