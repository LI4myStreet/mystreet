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
    public class ImagemOcorrencia
    {
        [Column(Order = 0), Key, ForeignKey("Ocorrencia")]
        public int OcorrenciaId { get; set; }
        [Column(Order = 1), Key, ForeignKey("Imagem")]
        public int ImagemId { get; set; }

        [JsonIgnore, IgnoreDataMember]
        public Ocorrencia Ocorrencia { get; set; }

        [JsonIgnore, IgnoreDataMember]
        public Imagem Imagem { get; set; }
    }
}