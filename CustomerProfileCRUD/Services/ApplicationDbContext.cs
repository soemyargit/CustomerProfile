using CustomerProfileCRUD.Models;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using System.Data;

namespace CustomerProfileCRUD.Services
{
    public class ApplicationDbContext : DbContext
    {
        public ApplicationDbContext(DbContextOptions options) : base(options)   
        {
            
        }
        public DbSet<Customer> Customers { get; set; }
        public DbSet<Address> Addresses { get; set; }

        public DbSet<CustomerAndAddresses> CustomerAndAddresses { get; set; }

        public async Task<List<CustomerAndAddresses>> GetCustomersAndAddressesAsync() 
        { 
            return await CustomerAndAddresses.FromSqlRaw("EXEC GetCustomersAndAddresses").ToListAsync();           

        }

        public async Task<CustomerAndAddresses> GetCustomerAndAddressByIdAsync(int Id) 
        { 
            CustomerAndAddresses customerAddress = null; 
            using (var command = Database.GetDbConnection().CreateCommand()) 
            { 
                command.CommandText = "GetCustomerAndAddressesById"; 
                command.CommandType = CommandType.StoredProcedure; 
                command.Parameters.Add(new SqlParameter("@Id", Id)); 
                await command.Connection.OpenAsync(); 
                using (var reader = await command.ExecuteReaderAsync()) 
                { 
                    if (await reader.ReadAsync()) 
                    { 
                        customerAddress = new CustomerAndAddresses { Id = reader.GetInt32(0), 
                            Name = reader.GetString(1),Photo = reader.GetString(2),
                            Email = reader.GetString(3), Phone = reader.GetString(4), 
                            Fax = reader.GetString(5), Internet = reader.GetString(6),
                            Remarks = reader.GetString(7), HomeAddress = reader.GetString(8),
                            OfficeAddress = reader.GetString(9)
                        
                        }; } } } 
            return customerAddress; 
        }

        public async Task DeleteCustomerAndAddressesAsync(int customerId) 
        { 
            await Database.ExecuteSqlRawAsync("EXEC DeleteCustomerAndAddresses @CustomerID", new SqlParameter("@CustomerID", customerId)); 
        }


        public async Task InsertCustomerAndAddressesAsync(CustomerAndListAddress customerAddress)
        {
            await Database.ExecuteSqlRawAsync("EXEC InsertCustomerAndAddresses @Name,@Photo, @Email,@Phone,@Fax,@Internet,@Remarks," +
                " @AddressLine1,@AddressType1," +
                " @City1, @Country1, @PostalCode1, @AddressLine2, @City2, @Country2, @PostalCode2, @AddressType2",
                new SqlParameter("@Name", customerAddress.Name ?? ""),
                new SqlParameter("@Photo", customerAddress.Photo ?? ""),
                new SqlParameter("@Email", customerAddress.Email ?? ""),
                new SqlParameter("@Phone", customerAddress.Phone ?? ""),
                new SqlParameter("@Fax", customerAddress.Fax ?? ""),
                new SqlParameter("@Internet", customerAddress.Internet ?? ""),
                new SqlParameter("@Remarks", customerAddress.Remarks ?? ""),
                new SqlParameter("@AddressLine1", customerAddress.lstAddress[0].AddressLine ?? ""),
                new SqlParameter("@AddressType1", "Office"),
                new SqlParameter("@City1", customerAddress.lstAddress[0].City ?? ""),
                new SqlParameter("@Country1", customerAddress.lstAddress[0].Country ?? ""),
                new SqlParameter("@PostalCode1", customerAddress.lstAddress[0].PostalCode ?? ""),
                new SqlParameter("@AddressLine2", customerAddress.lstAddress[1].AddressLine ?? ""),
                new SqlParameter("@City2", customerAddress.lstAddress[1].City ?? ""),
                new SqlParameter("@Country2", customerAddress.lstAddress[1].Country ?? ""),
                new SqlParameter("@PostalCode2", customerAddress.lstAddress[1].PostalCode ?? ""),
                new SqlParameter("@AddressType2", "Home"));
        }

        
    } 
    }

