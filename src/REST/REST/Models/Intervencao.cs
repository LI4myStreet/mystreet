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
    public class Intervencao
    {
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int Id { get; set; }
        [Required, ForeignKey("Utilizador")]
        public int UtilizadorId { get; set; }
        [Required, ForeignKey("Ocorrencia")]
        public int OcorrenciaId { get; set; }
        [Required, MaxLength(255)]
        public string Descricao { get; set; }

        [JsonIgnore, IgnoreDataMember]
        public Utilizador Utilizador { get; set; }

        [JsonIgnore, IgnoreDataMember]
        public Ocorrencia Ocorrencia { get; set; }

        public Intervencao()
        {
            Id = -1;
            UtilizadorId = -1;
            OcorrenciaId = -1;
            Descricao = "";
        }

        public Intervencao(int utilid, int oid, string descricao)
        {
            this.UtilizadorId = utilid;
            this.OcorrenciaId = oid;
            this.Descricao = descricao;
        }

        public Intervencao(Intervencao i)
        {
            this.Id = i.Id;
            this.UtilizadorId = i.UtilizadorId;
            this.OcorrenciaId = i.OcorrenciaId;
            this.Descricao = i.Descricao;
        }

        public override string ToString()
        {
            return string.Format("Intervencao: {0}\n",Descricao);
        }

        public bool Compara(object obj)
        {
            if (obj == null) return false;
            Intervencao i = obj as Intervencao;
            if ((object)i == null) return false;
            if (Id==i.Id&&UtilizadorId==i.UtilizadorId&&OcorrenciaId==i.OcorrenciaId&&Descricao.Equals(i.Descricao)) return true;
            return false;
        }

    }
}