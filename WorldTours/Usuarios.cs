//-------------------------------------

namespace WorldTours
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;

    public partial class Usuarios
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Usuarios()
        {
            this.Registros = new HashSet<Registros>();
        }

        public int UsuarioId { get; set; }

        [Required(ErrorMessage = "Name is required.")]
        public string Nombre { get; set; }
        public string Apellidos { get; set; }
        public string Telefono { get; set; }
        public string Email { get; set; }
        [DataType(DataType.Password)]
        public string Contrasena { get; set; }
        public string Descripcion { get; set; }
        public string Sexo { get; set; }
        public string Edad { get; set; }
        public string Foto { get; set; }
        public string Contacto { get; set; }
        public string Tipo { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Registros> Registros { get; set; }
    }
}
