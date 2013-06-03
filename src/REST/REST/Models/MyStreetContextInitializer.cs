using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Entity;
using System.IO;
using System.Drawing;
using System.Net;

namespace REST.Models
{
    public class MyStreetContextInitializer : DropCreateDatabaseAlways<MyStreetContext>
    {
        protected override void Seed(MyStreetContext context)
        {
            var utilizadores = new List<Utilizador>()
            {
                new Utilizador() { Nome = "Miguel Fernandes", Morada = "Braga", Username = "mpf", Password = "123456", Tipo = 1 },
                new Utilizador() { Nome = "Bruno Matos", Morada = "Macieira da Maia", Username = "bmm", Password = "123456", Tipo = 3 },
                new Utilizador() { Nome = "Jorge Rodrigues", Morada = "Braga", Username = "jr", Password = "123456", Tipo = 3 },
                new Utilizador() { Nome = "Rui Silva", Morada = "Braga", Username = "rs", Password = "123456", Tipo = 3 },
                new Utilizador() { Nome = "Carlos Cosio", Morada = "Espanha", Username = "cc", Password = "123456", Tipo = 2 }
            };

            utilizadores.ForEach(p => context.Utilizadores.Add(p));
            context.SaveChanges();

            var localidades = new List<Localidade>()
            {
                new Localidade() { Nome = "Braga", Coordenadas = "0.123, 0.123" },
                new Localidade() { Nome = "Macieira da Maia", Coordenadas = "0.234, 0.234" },
                new Localidade() { Nome = "Porto", Coordenadas = "0.345, 0.345" }
            };

            localidades.ForEach(l => context.Localidades.Add(l));
            context.SaveChanges();

            var imagens = new List<Imagem>()
            {
                new Imagem() { Bytes = GetBytesFromImage(0) },
                new Imagem() { Bytes = GetBytesFromImage(1) }
            };

            imagens.ForEach(i => context.Imagens.Add(i));
            context.SaveChanges();

            var ocorrencias = new List<Ocorrencia>()
            {
                new Ocorrencia() { Descricao = "Passeio estragado", Coordenadas = "0.120,0.1234", Estado = "Reportado", Morada = "Rua dos Moinhos", Utilizador = utilizadores[1], Localidade = localidades[1]},
                new Ocorrencia() { Descricao = "Lâmpada fundida", Coordenadas = "0.120,0.1234", Estado = "Reportado", Morada = "Av. Liberdade", Utilizador = utilizadores[2], Localidade = localidades[0] },
                new Ocorrencia() { Descricao = "Muro caído", Coordenadas = "0.120,0.1234", Estado = "Em estudo", Morada = "Rua Nova St. Cruz", Utilizador = utilizadores[3], Localidade = localidades[0] }                
            };

            ocorrencias.ForEach(o => context.Ocorrencias.Add(o));
            context.SaveChanges();

            var intervencoes = new List<Intervencao>()
            {
                new Intervencao() { Utilizador = utilizadores[4], Ocorrencia = ocorrencias[0], Descricao = "Refazer passeio" } 
            };

            intervencoes.ForEach(p => context.Intervencoes.Add(p));
            context.SaveChanges();

            var amigos = new List<Amigo>()
            {
                new Amigo() { Utilizador1 = utilizadores[0], Utilizador2 = utilizadores[1] },
                new Amigo() { Utilizador1 = utilizadores[1], Utilizador2 = utilizadores[2] }
            };

            amigos.ForEach(a => context.Amigos.Add(a));
            context.SaveChanges();

            var likes = new List<Like>()
            {
                new Like() { Ocorrencia = ocorrencias[0], Utilizador = utilizadores[1] }
            };

            likes.ForEach(l => context.Likes.Add(l));
            context.SaveChanges();

            var classificacoes = new List<Classificacao>()
            {
                new Classificacao() { Intervencao = intervencoes[0], Utilizador = utilizadores[1], Valor = 5 }
            };

            classificacoes.ForEach(c => context.Classificacoes.Add(c));
            context.SaveChanges();

           
            var comentarios = new List<Comentario>()
            {
                new Comentario() { Utilizador = utilizadores[1], Ocorrencia = ocorrencias[0], Imagem = imagens[0], Conteudo = "Foto do local" }
            };

            comentarios.ForEach(i => context.Comentarios.Add(i));
            context.SaveChanges();

            var imagensOcorrencias = new List<ImagemOcorrencia>() 
            {
                new ImagemOcorrencia() { Ocorrencia = ocorrencias[0], Imagem = imagens[0] },
                new ImagemOcorrencia() { Ocorrencia = ocorrencias[0], Imagem = imagens[1] }
            };

            imagensOcorrencias.ForEach(io => context.ImagensOcorrencias.Add(io));
            context.SaveChanges();

            var tags = new List<Tag>()
            {
                new Tag() { Descricao = "Passeio" }
            };

            tags.ForEach(t => context.Tags.Add(t));
            context.SaveChanges();

            var ocorrenciasTags = new List<OcorrenciaTags>() 
            {
                new OcorrenciaTags() { Ocorrencia = ocorrencias[0], Tag = tags[0] }
            };

            ocorrenciasTags.ForEach(ot => context.OcorrenciasTags.Add(ot));
            context.SaveChanges();
        }

        private byte[] GetBytesFromImage(int pos)
        {
            var images = new String[] 
            { 
                "http://4.bp.blogspot.com/_sq37vVrtWR4/TIeeGjzgiII/AAAAAAAAACA/021fBYB8isg/s1600/2RoadHoleR_468x314.jpg",
                "http://kirkwells.co.uk/wp-content/uploads/2013/03/hole-in-road.jpg"
            };
            
            WebClient client = new WebClient();
            return client.DownloadData(images[0]);         
        }
    }
}