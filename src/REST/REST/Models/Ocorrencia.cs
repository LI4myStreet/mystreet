using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace REST.Models
{
    public class Ocorrencia
    {
        [Key, DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int Id { get; set; }
        [Required]
        public int UtilizadorID { get; set; }
        [Required, MaxLength(255)]
        public string Descricao { get; set; }
        [Required, MaxLength(255)]
        public string Estado { get; set; }
        [Required, MaxLength(255)]
        public string Morada { get; set; }
        [Required, MaxLength(255)]
        public string Coordenadas { get; set; }

        public Utilizador Utilizador { get; set; }
    }
}