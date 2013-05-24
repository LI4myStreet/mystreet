using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace myStreet.Models
{
    public class Tag
    {
        int ID { get; set; }
        string Descricao { get; set; }

        public Tag()
        {
            ID = -1;
            Descricao = "";
        }

        public Tag(string descricao)
        {
            this.Descricao = descricao;
        }

        public Tag(Tag t)
        {
            this.ID = t.ID;
            this.Descricao = t.Descricao;
        }

        public override string ToString()
        {
            return string.Format("Tag: {0}\n",Descricao);
        }

        public override bool Equals(object obj)
        {
            if (obj == null) return false;
            Tag t = obj as Tag;
            if ((object)t == null) return false;
            if (ID==t.ID&&Descricao.Equals(t.Descricao)) return true;
            return false;
        }

        public Tag Clone()
        {
            return new Tag(this);
        }
    }
}