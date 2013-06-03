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
    public class ImagensOcorrenciasController : ApiController
    {
        private MyStreetContext db = new MyStreetContext();

        // GET api/ImagensOcorrencias
        public IEnumerable<ImagemOcorrencia> GetImagemOcorencias()
        {
            var imagensocorrencias = db.ImagensOcorrencias.Include(i => i.Ocorrencia).Include(i => i.Imagem);
            return imagensocorrencias.AsEnumerable();
        }

        // GET api/ImagensOcorrencias/5
        public ImagemOcorrencia GetImagemOcorencia(int id)
        {
            ImagemOcorrencia imagemocorencia = db.ImagensOcorrencias.Find(id);
            if (imagemocorencia == null)
            {
                throw new HttpResponseException(Request.CreateResponse(HttpStatusCode.NotFound));
            }

            return imagemocorencia;
        }

        // PUT api/ImagensOcorrencias/5
        public HttpResponseMessage PutImagemOcorencia(int id, ImagemOcorrencia imagemocorencia)
        {
            if (ModelState.IsValid && id == imagemocorencia.OcorrenciaId)
            {
                db.Entry(imagemocorencia).State = EntityState.Modified;

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

        // POST api/ImagensOcorrencias
        public HttpResponseMessage PostImagemOcorencia(ImagemOcorrencia imagemocorencia)
        {
            if (ModelState.IsValid)
            {
                db.ImagensOcorrencias.Add(imagemocorencia);
                db.SaveChanges();

                HttpResponseMessage response = Request.CreateResponse(HttpStatusCode.Created, imagemocorencia);
                response.Headers.Location = new Uri(Url.Link("DefaultApi", new { id = imagemocorencia.OcorrenciaId }));
                return response;
            }
            else
            {
                return Request.CreateResponse(HttpStatusCode.BadRequest);
            }
        }

        // DELETE api/ImagensOcorrencias/5
        public HttpResponseMessage DeleteImagemOcorencia(int id)
        {
            ImagemOcorrencia imagemocorencia = db.ImagensOcorrencias.Find(id);
            if (imagemocorencia == null)
            {
                return Request.CreateResponse(HttpStatusCode.NotFound);
            }

            db.ImagensOcorrencias.Remove(imagemocorencia);

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                return Request.CreateResponse(HttpStatusCode.NotFound);
            }

            return Request.CreateResponse(HttpStatusCode.OK, imagemocorencia);
        }

        protected override void Dispose(bool disposing)
        {
            db.Dispose();
            base.Dispose(disposing);
        }
    }
}