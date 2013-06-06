using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace myStreet.Models
{
    public class Imagem
    {
        public int Id { get; set; }
        [Required]
        public byte[] Bytes { get; set; }
    }
}