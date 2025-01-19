using System.ComponentModel.DataAnnotations;
using System.Net;
namespace CustomerProfileCRUD.Models
{
    public class CustomerAndListAddress
    {
        public string Name { get; set; }
        public string? Photo { get; set; }
        public string? Email { get; set; }
        public string Phone { get; set; }
        public string? Fax { get; set; }
        public string? Internet { get; set; }
        public string? Remarks { get; set; }

        public List<Address>? lstAddress { get; set; } = new List<Address>();
    }
}
