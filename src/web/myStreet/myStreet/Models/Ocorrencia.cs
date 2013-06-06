using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
using Newtonsoft.Json;
using System.Runtime.Serialization;

namespace myStreet.Models
{
    public class Ocorrencia
    {
        public int Id { get; set; }
        [Required]
        public int UtilizadorID { get; set; }
        [Required]
        public int LocalidadeID { get; set; }
        public string Descricao { get; set; }
        public string Estado { get; set; }
        public string Morada { get; set; }
        public string Coordenadas { get; set; }

        [JsonIgnore, IgnoreDataMember]
        public Utilizador Utilizador { get; set; }

        [JsonIgnore, IgnoreDataMember]
        public Localidade Localidade { get; set; }
    }
}