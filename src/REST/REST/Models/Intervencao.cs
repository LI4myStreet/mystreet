using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;


namespace REST.Models
{
    public class Intervencao
    {
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int ID { get; set; }
        [Required]
        public int UtilID { get; set; }
        [Required]
        public int OID { get; set; }
        [Required, MaxLength(255)]
        public string Descricao { get; set; }

        public Intervencao()
        {
            ID = -1;
            UtilID = -1;
            OID = -1;
            Descricao = "";
        }

        public Intervencao(int utilid, int oid, string descricao)
        {
            this.UtilID = utilid;
            this.OID = oid;
            this.Descricao = descricao;
        }

        public Intervencao(Intervencao i)
        {
            this.ID = i.ID;
            this.UtilID = i.UtilID;
            this.OID = i.OID;
            this.Descricao = i.Descricao;
        }

        public override string ToString()
        {
            return string.Format("Intervencao: {0}\n",Descricao);
        }

        public bool Compara(object obj)
        {
            if (obj == null) return false;
            Intervencao i = obj as Intervencao;
            if ((object)i == null) return false;
            if (ID==i.ID&&UtilID==i.UtilID&&OID==i.OID&&Descricao.Equals(i.Descricao)) return true;
            return false;
        }

    }
}