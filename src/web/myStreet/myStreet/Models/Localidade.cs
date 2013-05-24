using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace myStreet.Models
{
    public class Localidade
    {
        int ID { get; set; }
        string Nome { get; set; }
        string Coordenadas { get; set; }

        public Localidade()
        {
            ID = -1;
            Nome = "";
            Coordenadas = "";
        }

        public Localidade(string nome, string coordenadas)
        {
            this.Nome = nome;
            this.Coordenadas = coordenadas;
        }

        public Localidade(Localidade l)
        {
            this.ID = l.ID;
            this.Nome = l.Nome;
            this.Coordenadas = l.Coordenadas;
        }

        public override string ToString()
        {
            return string.Format("Localidade: {0}\nCoordenadas: {1}\n",Nome,Coordenadas);
        }

        public override bool Equals(object obj)
        {
            if (obj == null) return false;
            Localidade l = obj as Localidade;
            if ((object)l == null) return false;
            if (ID==l.ID&&Nome.Equals(l.Nome)&&Coordenadas.Equals(l.Coordenadas)) return true;
            return false;
        }

        public Localidade Clone()
        {
            return new Localidade(this);
        }
    }
}