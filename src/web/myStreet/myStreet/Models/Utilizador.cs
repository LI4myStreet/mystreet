using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
using System.Xml.Serialization;

namespace myStreet.Models
{
    public class Utilizador
    {
        [XmlElement()]
        public int Id { get; set; }
        [Required, StringLength(255), XmlElement()]
        public string Nome { get; set; }
        [Required, StringLength(255), XmlElement()]
        public string Morada { get; set; }
        [Required, StringLength(255), XmlElement()]
        public string Username { get; set; }
        [Required, StringLength(255), XmlElement()]
        public string Password { get; set; }
        [Required, StringLength(1), XmlElement()]
        public string Tipo { get; set; }
    }
}