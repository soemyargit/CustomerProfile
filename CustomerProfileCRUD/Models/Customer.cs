using System.ComponentModel.DataAnnotations;
using System.Net;

namespace CustomerProfileCRUD.Models
{
    public class Customer
    {
        public int Id { get; set; }
       [Required] public string Name { get; set; } 
        public string Photo { get; set; } 
        [EmailAddress] public string Email { get; set; } 
        public string Phone { get; set; }
        public string? Fax { get; set; }
        public string? Internet { get; set; }
        public string? Remarks { get; set; }
        //public string? HomeAddress { get; set; } 
        //public string? OfficeAddress { get; set; }

       
    }
}
