//------------------------------------------------------------------------------
// <auto-generated>
//     Este código se generó a partir de una plantilla.
//
//     Los cambios manuales en este archivo pueden causar un comportamiento inesperado de la aplicación.
//     Los cambios manuales en este archivo se sobrescribirán si se regenera el código.
// </auto-generated>
//------------------------------------------------------------------------------

namespace WorldTours
{
    using System;
    using System.Collections.Generic;
    
    public partial class Registros
    {
        public int RegistroId { get; set; }
        public string FechaInscripcion { get; set; }
        public string FechaRealizacion { get; set; }
        public string GuiaId { get; set; }
        public string UsuarioId { get; set; }
        public string TourId { get; set; }
        public int UsuariosUsuarioId { get; set; }
        public int ToursTourId { get; set; }
    
        public virtual Usuarios Usuarios { get; set; }
        public virtual Tours Tours { get; set; }
    }
}