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
    public class LikesController : ApiController
    {
        private MyStreetContext db = new MyStreetContext();

        // GET api/Likes
        public IEnumerable<Like> GetLikes()
        {
            var likes = db.Likes.Include(l => l.Utilizador).Include(l => l.Ocorrencia);
            return likes.AsEnumerable();
        }

        // GET api/Likes/5
        public Like GetLike(int id)
        {
            Like like = db.Likes.Find(id);
            if (like == null)
            {
                throw new HttpResponseException(Request.CreateResponse(HttpStatusCode.NotFound));
            }

            return like;
        }

        // PUT api/Likes/5
        public HttpResponseMessage PutLike(int id, Like like)
        {
            if (ModelState.IsValid && id == like.UtilizadorId)
            {
                db.Entry(like).State = EntityState.Modified;

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

        // POST api/Likes
        public HttpResponseMessage PostLike(Like like)
        {
            if (ModelState.IsValid)
            {
                db.Likes.Add(like);
                db.SaveChanges();

                HttpResponseMessage response = Request.CreateResponse(HttpStatusCode.Created, like);
                response.Headers.Location = new Uri(Url.Link("DefaultApi", new { id = like.UtilizadorId }));
                return response;
            }
            else
            {
                return Request.CreateResponse(HttpStatusCode.BadRequest);
            }
        }

        // DELETE api/Likes/5
        public HttpResponseMessage DeleteLike(int id)
        {
            Like like = db.Likes.Find(id);
            if (like == null)
            {
                return Request.CreateResponse(HttpStatusCode.NotFound);
            }

            db.Likes.Remove(like);

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                return Request.CreateResponse(HttpStatusCode.NotFound);
            }

            return Request.CreateResponse(HttpStatusCode.OK, like);
        }

        protected override void Dispose(bool disposing)
        {
            db.Dispose();
            base.Dispose(disposing);
        }
    }
}