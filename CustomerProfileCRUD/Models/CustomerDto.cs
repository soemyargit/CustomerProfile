using System.ComponentModel.DataAnnotations;
using System.Net;
namespace CustomerProfileCRUD.Models
{
    public class CustomerDto
    {
        [Required] public string Name { get; set; } = string.Empty;
        public string Photo { get; set; } = string.Empty;
        [EmailAddress] public string Email { get; set; } = string.Empty;
        [Required] public string Phone { get; set; } = string.Empty ;
        public string Fax { get; set; }
        public string Internet { get; set; }
        public string Remarks { get; set; }
        
    }
}
