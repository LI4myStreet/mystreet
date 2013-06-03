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
    public class ImagensController : ApiController
    {
        private MyStreetContext db = new MyStreetContext();

        // GET api/Imagens
        public IEnumerable<Imagem> GetImagems()
        {
            return db.Imagens.AsEnumerable();
        }

        // GET api/Imagens/5
        public Imagem GetImagem(int id)
        {
            Imagem imagem = db.Imagens.Find(id);
            if (imagem == null)
            {
                throw new HttpResponseException(Request.CreateResponse(HttpStatusCode.NotFound));
            }

            return imagem;
        }

        // PUT api/Imagens/5
        public HttpResponseMessage PutImagem(int id, Imagem imagem)
        {
            if (ModelState.IsValid && id == imagem.Id)
            {
                db.Entry(imagem).State = EntityState.Modified;

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

        // POST api/Imagens
        public HttpResponseMessage PostImagem(Imagem imagem)
        {
            if (ModelState.IsValid)
            {
                db.Imagens.Add(imagem);
                db.SaveChanges();

                HttpResponseMessage response = Request.CreateResponse(HttpStatusCode.Created, imagem);
                response.Headers.Location = new Uri(Url.Link("DefaultApi", new { id = imagem.Id }));
                return response;
            }
            else
            {
                return Request.CreateResponse(HttpStatusCode.BadRequest);
            }
        }

        // DELETE api/Imagens/5
        public HttpResponseMessage DeleteImagem(int id)
        {
            Imagem imagem = db.Imagens.Find(id);
            if (imagem == null)
            {
                return Request.CreateResponse(HttpStatusCode.NotFound);
            }

            db.Imagens.Remove(imagem);

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                return Request.CreateResponse(HttpStatusCode.NotFound);
            }

            return Request.CreateResponse(HttpStatusCode.OK, imagem);
        }

        protected override void Dispose(bool disposing)
        {
            db.Dispose();
            base.Dispose(disposing);
        }
    }
}