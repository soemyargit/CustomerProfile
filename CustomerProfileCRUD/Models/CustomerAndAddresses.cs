using System.ComponentModel.DataAnnotations;
using System.Net;
namespace CustomerProfileCRUD.Models
{
    public class CustomerAndAddresses
    {
        public int Id { get; set; }
        [Required] public string Name { get; set; } = string.Empty;
        public string Photo { get; set; } = string.Empty;
        [EmailAddress] public string Email { get; set; } = string.Empty;
        [Required] public string Phone { get; set; } = string.Empty;
        public string Fax { get; set; }
        public string Internet { get; set; }
        public string Remarks { get; set; }
        public string? HomeAddress { get; set; }
        public string? OfficeAddress { get; set; }
    }
}
