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
    public class Amigo
    {
        [Column(Order = 0), Required, Key, ForeignKey("Utilizador1")]
        public int Utilizador1Id { get; set; }
        [Column(Order = 1), Required, Key, ForeignKey("Utilizador2")]
        public int Utilizador2Id { get; set; }
        
        [JsonIgnore, IgnoreDataMember]
        public Utilizador Utilizador1 { get; set; }

        [JsonIgnore, IgnoreDataMember]
        public Utilizador Utilizador2 { get; set; }
    }
}