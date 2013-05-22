using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Entity;

namespace REST.Models
{
    public class MyStreetContextInitializer : DropCreateDatabaseIfModelChanges<MyStreetContext>
    {
        protected override void Seed(MyStreetContext context)
        {
            var utilizadores = new List<Utilizador>()
            {
                new Utilizador() { Nome = "Bruno Matos", Morada = "Rua de cima", Username = "bmm", Password = "123456", Tipo = "A" } 
            };

            utilizadores.ForEach(p => context.Utilizadores.Add(p));
            context.SaveChanges();
        }
    }
}