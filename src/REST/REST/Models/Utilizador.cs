using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel;

namespace REST.Models
{
    public class Utilizador
    {
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int Id { get; set; }
        [Required, MaxLength(255)]
        public string Nome { get; set; }
        [Required, MaxLength(255)]
        public string Morada { get; set; }
        [Required, MaxLength(255)]
        public string Username { get; set; }
        [Required, MaxLength(255)]
        public string Password { get; set; }
        [Required, MaxLength(1), DefaultValue("U")]
        public string Tipo { get; set; }
    }
}