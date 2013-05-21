using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace REST.Models
{
    public class User
    {
        int UtilID { get; set; }
        string Nome { get; set; }
        string Morada { get; set; }
        int Tipo { get; set; }
        string Login { get; set; }
        string Password { get; set; }

        public User()
        {
            UtilID = -1;
            Nome = "";
            Morada = "";
            Tipo = -1;
            Login = "";
            Password = "";
        }

        public User(string login, string password)
        {
            this.Login = login;
            this.Password = password;
            Nome = "";
            Tipo = 0;
            Morada = "";
        }

        public User(int id,string nome, string morada, string login, string password)
        {
            this.UtilID = id;
            this.Nome = nome;
            this.Morada = morada;
            this.Login = login;
            this.Password = password;
            Tipo = 0;
        }

        public User(User u)
        {
            this.UtilID = u.UtilID;
            this.Nome = u.Nome;
            this.Morada = u.Morada;
            this.Tipo = u.Tipo;
            this.Login = u.Login;
            this.Password = u.Password;
        }

        public override string ToString()
        {
            return string.Format("User: {0}\nNome: {1}\nMorada: {2}\n",Login,Nome,Morada);
        }

        public override bool Equals(object obj)
        {
            if (obj == null) return false;
            User u = obj as User;
            if ((object)u == null) return false;
            if (UtilID == u.UtilID && Nome.Equals(u.Nome) && Morada.Equals(u.Morada) && Tipo == u.Tipo && Login.Equals(u.Login) && Password.Equals(u.Password)) return true;
            return false;
        }

        public User Clone()
        {
            return new User(this);
        }

    }
}