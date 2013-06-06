using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
using Newtonsoft.Json;
using System.Runtime.Serialization;

namespace myStreet.Models
{
    public class Amigo
    {
        public int Utilizador1Id { get; set; }
        public int Utilizador2Id { get; set; }
        
        [JsonIgnore, IgnoreDataMember]
        public Utilizador Utilizador1 { get; set; }

        [JsonIgnore, IgnoreDataMember]
        public Utilizador Utilizador2 { get; set; }
    }
}