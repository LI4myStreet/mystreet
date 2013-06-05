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
    public class OcorrenciaTags
    {
        [Column(Order = 0), Key, ForeignKey("Ocorrencia")]
        public int OcorrenciaId { get; set; }
        [Column(Order = 1), Key, ForeignKey("Tag")]
        public int TagId { get; set; }

        [JsonIgnore, IgnoreDataMember]
        public Ocorrencia Ocorrencia { get; set; }

        [JsonIgnore, IgnoreDataMember]
        public Tag Tag { get; set; }
    }
}