using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;

namespace REST.Models
{
    public class Tag
    {
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int Id { get; set; }
        [Required, MaxLength(255)]
        public string Descricao { get; set; }

        public Tag()
        {
            Id = -1;
            Descricao = "";
        }

        public Tag(string descricao)
        {
            this.Descricao = descricao;
        }

        public Tag(Tag t)
        {
            this.Id = t.Id;
            this.Descricao = t.Descricao;
        }

        public override string ToString()
        {
            return string.Format("Tag: {0}\n",Descricao);
        }

        public bool Compara(object obj)
        {
            if (obj == null) return false;
            Tag t = obj as Tag;
            if ((object)t == null) return false;
            if (Id==t.Id&&Descricao.Equals(t.Descricao)) return true;
            return false;
        }

        public Tag Clone()
        {
            return new Tag(this);
        }
    }
}