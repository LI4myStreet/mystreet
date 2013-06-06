using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
using Newtonsoft.Json;
using System.Runtime.Serialization;

namespace myStreet.Models
{
    public class Like
    {
        public int UtilizadorId { get; set; }
        public int OcorrenciaId { get; set; }

        [JsonIgnore, IgnoreDataMember]
        public Utilizador Utilizador { get; set; }

        [JsonIgnore, IgnoreDataMember]
        public Ocorrencia Ocorrencia { get; set; }
    }
}