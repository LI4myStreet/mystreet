using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Entity;

namespace REST.Models
{
    public class MyStreetContextInitializer : DropCreateDatabaseAlways<MyStreetContext>
    {
        protected override void Seed(MyStreetContext context)
        {
            var utilizadores = new List<Utilizador>()
            {
                new Utilizador() { Nome = "Miguel Fernandes", Morada = "Braga", Username = "mpf", Password = "123456", Tipo = "A" },
                new Utilizador() { Nome = "Bruno Matos", Morada = "Macieira da Maia", Username = "bmm", Password = "123456", Tipo = "U" },
                new Utilizador() { Nome = "Jorge Rodrigues", Morada = "Braga", Username = "jr", Password = "123456", Tipo = "U" },
                new Utilizador() { Nome = "Rui Silva", Morada = "Braga", Username = "rs", Password = "123456", Tipo = "U" },
                new Utilizador() { Nome = "Carlos Cosio", Morada = "Espanha", Username = "cc", Password = "123456", Tipo = "F" }
            };

            utilizadores.ForEach(p => context.Utilizadores.Add(p));
            context.SaveChanges();

            var intervencoes = new List<Intervencao>()
            {
                new Intervencao() { UtilID = 1, OID = 1, Descricao = "Test quacker!" } 
            };

            intervencoes.ForEach(p => context.Intervencoes.Add(p));
            context.SaveChanges();

            var occorrencias = new List<Ocorrencia>()
            {
                new Ocorrencia() { Descricao = "Passeio estragado", Coordenadas = "0.120,0.1234", Estado = "Reportado", Morada = "Rua dos Moinhos, Macieira da Maia", Utilizador = utilizadores[1] },
                new Ocorrencia() { Descricao = "Lâmpada fundida", Coordenadas = "0.120,0.1234", Estado = "Reportado", Morada = "Av. Liberdade, Braga", Utilizador = utilizadores[2] },
                new Ocorrencia() { Descricao = "Muro caído", Coordenadas = "0.120,0.1234", Estado = "Em estudo", Morada = "Rua Nova St. Cruz, Braga", Utilizador = utilizadores[3] }                
            };

            occorrencias.ForEach(o => context.Ocorrencias.Add(o));
            context.SaveChanges();
        }
    }
}