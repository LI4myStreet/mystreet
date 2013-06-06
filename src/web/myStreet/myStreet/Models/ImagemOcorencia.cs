using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
using Newtonsoft.Json;
using System.Runtime.Serialization;

namespace myStreet.Models
{
    public class ImagemOcorrencia
    {
        public int OcorrenciaId { get; set; }
        public int ImagemId { get; set; }

        [JsonIgnore, IgnoreDataMember]
        public Ocorrencia Ocorrencia { get; set; }

        [JsonIgnore, IgnoreDataMember]
        public Imagem Imagem { get; set; }
    }
}