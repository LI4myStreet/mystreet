using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace REST.Models
{
    public class Ocorrencia
    {
        int ID { get; set; }
        int UtilID { get; set; }
        string Descricao { get; set; }
        string Estado { get; set; }
        string Morada { get; set; }
        string Coordenadas { get; set; }

        public Ocorrencia()
        {
            ID = -1;
            UtilID = -1;
            Descricao = "";
            Estado = "";
            Morada = "";
            Coordenadas = "";
        }

        public Ocorrencia(int uid, string descricao, string estado, string morada, string coordenadas)
        {
            this.UtilID = uid;
            this.Descricao = descricao;
            this.Estado = estado;
            this.Morada = morada;
            this.Coordenadas = coordenadas;
        }

        public Ocorrencia(int id, int uid, string descricao, string estado, string morada, string coordenadas)
        {
            this.ID = id;
            this.UtilID = uid;
            this.Descricao = descricao;
            this.Estado = estado;
            this.Morada = morada;
            this.Coordenadas = coordenadas;
        }

        public Ocorrencia(Ocorrencia o)
        {
            this.ID = o.ID;
            this.UtilID = o.UtilID;
            this.Descricao = o.Descricao;
            this.Estado = o.Estado;
            this.Morada = o.Morada;
            this.Coordenadas = o.Coordenadas;
        }

        public override string ToString()
        {
            return string.Format("Ocurrencia: \nDescricao: {0}\nEstado: {1}\nMorada: {2}\nCoordenadas: {3}\n",Descricao,Estado,Morada,Coordenadas);
        }

        public override bool Equals(object obj)
        {
            if (obj == null) return false;
            Ocorrencia o = obj as Ocorrencia;
            if ((object)o == null) return false;
            if (ID==o.ID&&UtilID==o.UtilID&&Descricao.Equals(o.Descricao)&&Estado.Equals(o.Estado)&&Morada.Equals(o.Morada)&&Coordenadas.Equals(o.Coordenadas)) return true;
            return false;
        }

        public Ocorrencia Clone()
        {
            return new Ocorrencia(this);
        }
    }
}