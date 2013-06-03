using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;
using Newtonsoft.Json;
using System.Runtime.Serialization;

namespace REST.Models
{
    public class Classificacao
    {       
        [Column(Order = 0), Key,ForeignKey("Utilizador")]
        public int UtilizadorId { get; set; }
        [Column(Order = 1), Key, ForeignKey("Intervencao")]
        public int IntervencaoId { get; set; }
        [Required]
        public int Valor { get; set; }

        [JsonIgnore, IgnoreDataMember]
        public Utilizador Utilizador { get; set; }

        [JsonIgnore, IgnoreDataMember]
        public Intervencao Intervencao { get; set; }

        public Classificacao()
        {
            UtilizadorId = -1;
            IntervencaoId = -1;
            Valor = 0;
        }

        public Classificacao(int utilid, int interid, int valor)
        {
            this.UtilizadorId = utilid;
            this.IntervencaoId = interid;
            this.Valor = valor;
        }

        public Classificacao(Classificacao c)
        {
            this.UtilizadorId = c.UtilizadorId;
            this.IntervencaoId = c.IntervencaoId;
            this.Valor = c.Valor;
        }

        public override string ToString()
        {
            return string.Format("Classificacao: {0}",Valor);
        }

        public bool Compara(object obj)
        {
            if (obj == null) return false;
            Classificacao c = obj as Classificacao;
            if ((object)c == null) return false;
            if (UtilizadorId==c.UtilizadorId&&IntervencaoId==c.IntervencaoId&&Valor==c.Valor) return true;
            return false;
        }

        public Classificacao Clone()
        {
            return new Classificacao(this);
        }
    }
}