﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace myStreet.Models
{
    public class Comentario
    {
        int ID { get; set; }
        int UtilID { get; set; }
        int OID { get; set; }
        string Conteudo { get; set; }
        string ImgID { get; set; }

        public Comentario()
        {
            ID = -1;
            UtilID = -1;
            OID = -1;
            Conteudo = "";
            ImgID = "";
        }

        public Comentario(int uid, int oid, string conteudo)
        {
            this.UtilID = uid;
            this.OID = oid;
            this.Conteudo = conteudo;
            ImgID = "";
        }

        public Comentario(int uid, int oid, string conteudo, string imgid)
        {
            this.UtilID = uid;
            this.OID = oid;
            this.Conteudo = conteudo;
            this.ImgID = imgid;
        }

        public Comentario(Comentario c)
        {
            this.ID = c.ID;
            this.UtilID = c.UtilID;
            this.OID = c.OID;
            this.Conteudo = c.Conteudo;
            this.ImgID = c.ImgID;
        }

        public override string ToString()
        {
            return string.Format("Comentario: \nConteudo: {0}\nImagem: {1}\n",Conteudo,ImgID);
        }

        public override bool Equals(object obj)
        {
            if (obj == null) return false;
            Comentario c = obj as Comentario;
            if ((object)c == null) return false;
            if (ID==c.ID&&UtilID==c.UtilID&&OID==c.OID&&Conteudo.Equals(c.Conteudo)&&ImgID.Equals(c.ImgID)) return true;
            return false;
        }

        public Comentario Clone()
        {
            return new Comentario(this);
        }
    }
}