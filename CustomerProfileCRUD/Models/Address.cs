using System.ComponentModel.DataAnnotations;

namespace CustomerProfileCRUD.Models
{
    public class Address
    {
         public int? Id { get; set; }
         public string? AddressType { get; set; } = string.Empty;
         public string? AddressLine { get; set; } = string.Empty;
         public string? City { get; set; } = string.Empty;
         public string? Country { get; set; } = string.Empty;
         public string? PostalCode { get; set; } = string.Empty ;
         public int? CustomerId { get; set; } 
        
    }
}
