using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
using Newtonsoft.Json;
using System.Runtime.Serialization;

namespace myStreet.Models
{
    public class Comentario
    {
        public int Id { get; set; }
        public int UtilizadorId { get; set; }
        public int OcorrenciaId { get; set; }
        public int ImagemId { get; set; }
        public string Conteudo { get; set; }

        [JsonIgnore, IgnoreDataMember]
        public Utilizador Utilizador { get; set; }

        [JsonIgnore, IgnoreDataMember]
        public Ocorrencia Ocorrencia { get; set; }

        [JsonIgnore, IgnoreDataMember]
        public Imagem Imagem { get; set; }
        
        public Comentario()
        {
            Id = -1;
            UtilizadorId = -1;
            OcorrenciaId = -1;
            Conteudo = "";
            ImagemId = -1;
        }

        public Comentario(int uid, int oid, string conteudo)
        {
            this.UtilizadorId = uid;
            this.OcorrenciaId = oid;
            this.Conteudo = conteudo;
            ImagemId = -1;
        }

        public Comentario(int uid, int oid, string conteudo, int imgid)
        {
            this.UtilizadorId = uid;
            this.OcorrenciaId = oid;
            this.Conteudo = conteudo;
            this.ImagemId = imgid;
        }

        public Comentario(Comentario c)
        {
            this.Id = c.Id;
            this.UtilizadorId = c.UtilizadorId;
            this.OcorrenciaId = c.OcorrenciaId;
            this.Conteudo = c.Conteudo;
            this.ImagemId = c.ImagemId;
        }

        public override string ToString()
        {
            return string.Format("Comentario: \nConteudo: {0}\nImagem: {1}\n",Conteudo,ImagemId);
        }

        public bool Compara(object obj)
        {
            if (obj == null) return false;
            Comentario c = obj as Comentario;
            if ((object)c == null) return false;
            if (Id==c.Id&&UtilizadorId==c.UtilizadorId&&OcorrenciaId==c.OcorrenciaId&&Conteudo.Equals(c.Conteudo)&&ImagemId.Equals(c.ImagemId)) return true;
            return false;
        }

        public Comentario Clone()
        {
            return new Comentario(this);
        }
    }
}