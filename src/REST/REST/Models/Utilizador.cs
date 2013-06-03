using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel;

namespace REST.Models
{
    public class Utilizador
    {
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int Id { get; set; }
        [Required, MaxLength(255)]
        public string Nome { get; set; }
        [Required, MaxLength(255)]
        public string Morada { get; set; }
        [Required, MaxLength(255)]
        public string Username { get; set; }
        [Required, MaxLength(255)]
        public string Password { get; set; }
        [Required, DefaultValue(-1)]
        public int Tipo { get; set; }

         public Utilizador()
        {
            Id = -1;
            Nome = "";
            Morada = "";
            Tipo = -1;
            Username = "";
            Password = "";
        }

        public Utilizador(string username, string password)
        {
            this.Username = username;
            this.Password = password;
            Nome = "";
            Tipo = 0;
            Morada = "";
        }

        public Utilizador(int id,string nome, string morada, string username, string password)
        {
            this.Id = id;
            this.Nome = nome;
            this.Morada = morada;
            this.Username = username;
            this.Password = password;
            Tipo = 0;
        }

        public Utilizador(Utilizador u)
        {
            this.Id = u.Id;
            this.Nome = u.Nome;
            this.Morada = u.Morada;
            this.Tipo = u.Tipo;
            this.Username = u.Username;
            this.Password = u.Password;
        }

        public override string ToString()
        {
            return string.Format("User: {0}\nNome: {1}\nMorada: {2}\n",Username,Nome,Morada);
        }

        public bool Compara(object obj)
        {
            if (obj == null) return false;
            Utilizador u = obj as Utilizador;
            if ((object)u == null) return false;
            if (Id == u.Id && Nome.Equals(u.Nome) && Morada.Equals(u.Morada) && Tipo == u.Tipo && Username.Equals(u.Username) && Password.Equals(u.Password)) return true;
            return false;
        }

        public Utilizador Clone()
        {
            return new Utilizador(this);
        }
    }
}