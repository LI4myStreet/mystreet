using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Newtonsoft.Json;
using System.Runtime.Serialization;
using System.ComponentModel;

namespace REST.Models
{
    public class Ocorrencia
    {
        [Key, DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int Id { get; set; }
        public int UtilizadorID { get; set; }
        public int LocalidadeID { get; set; }
        [Required, MaxLength(255)]
        public string Descricao { get; set; }
        [DefaultValue("Nova"), MaxLength(255)]
        public string Estado { get; set; }
        [Required, MaxLength(255)]
        public string Morada { get; set; }
        [MaxLength(255)]
        public string Coordenadas { get; set; }

        [JsonIgnore, IgnoreDataMember]
        public Utilizador Utilizador { get; set; }

        [JsonIgnore, IgnoreDataMember]
        public Localidade Localidade { get; set; }
    }
}