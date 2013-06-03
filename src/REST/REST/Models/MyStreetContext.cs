using System.Data.Entity;

namespace REST.Models
{
    public class MyStreetContext : DbContext
    {
        // You can add custom code to this file. Changes will not be overwritten.
        // 
        // If you want Entity Framework to drop and regenerate your database
        // automatically whenever you change your model schema, add the following
        // code to the Application_Start method in your Global.asax file.
        // Note: this will destroy and re-create your database with every model change.
        // 
        // System.Data.Entity.Database.SetInitializer(new System.Data.Entity.DropCreateDatabaseIfModelChanges<REST.Models.MyStreetContext>());

        public MyStreetContext() : base("name=MyStreetContext")
        {
        }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Amigo>().HasRequired(a => a.Utilizador2).WithMany().WillCascadeOnDelete(false);
            modelBuilder.Entity<Like>().HasRequired(l => l.Ocorrencia).WithMany().WillCascadeOnDelete(false);
            modelBuilder.Entity<Intervencao>().HasRequired(i => i.Ocorrencia).WithMany().WillCascadeOnDelete(false);
            modelBuilder.Entity<Classificacao>().HasRequired(c => c.Intervencao).WithMany().WillCascadeOnDelete(false);
            modelBuilder.Entity<Comentario>().HasRequired(c => c.Ocorrencia).WithMany().WillCascadeOnDelete(false);
            base.OnModelCreating(modelBuilder);
        } 

        public DbSet<Utilizador> Utilizadores { get; set; }
        public DbSet<Intervencao> Intervencoes { get; set; }
        public DbSet<Ocorrencia> Ocorrencias { get; set; }
        public DbSet<Localidade> Localidades { get; set; }
        public DbSet<Amigo> Amigos { get; set; }
        public DbSet<Like> Likes { get; set; }
        public DbSet<Classificacao> Classificacoes { get; set; }
        public DbSet<Imagem> Imagens { get; set; }
        public DbSet<Comentario> Comentarios { get; set; }
        public DbSet<ImagemOcorrencia> ImagensOcorrencias { get; set; }
        public DbSet<Tag> Tags { get; set; }
        public DbSet<OcorrenciaTags> OcorrenciasTags { get; set; }

        
    }
}
