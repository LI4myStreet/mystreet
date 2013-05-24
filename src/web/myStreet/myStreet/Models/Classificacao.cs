using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace myStreet.Models
{
    public class Classificacao
    {
        int ID { get; set; }
        int UtilID { get; set; }
        int InterID { get; set; }
        int Valor { get; set; }

        public Classificacao()
        {
            ID = -1;
            UtilID = -1;
            InterID = -1;
            Valor = 0;
        }

        public Classificacao(int utilid, int interid, int valor)
        {
            this.UtilID = utilid;
            this.InterID = interid;
            this.Valor = valor;
        }

        public Classificacao(Classificacao c)
        {
            this.ID = c.ID;
            this.UtilID = c.UtilID;
            this.InterID = c.InterID;
            this.Valor = c.Valor;
        }

        public override string ToString()
        {
            return string.Format("Classificacao: {0}",Valor);
        }

        public override bool Equals(object obj)
        {
            if (obj == null) return false;
            Classificacao c = obj as Classificacao;
            if ((object)c == null) return false;
            if (ID == c.ID&&UtilID==c.UtilID&&InterID==c.InterID&&Valor==c.Valor) return true;
            return false;
        }

        public Classificacao Clone()
        {
            return new Classificacao(this);
        }
    }
}