using CustomerProfileCRUD.Models;
using CustomerProfileCRUD.Services;
using Microsoft.AspNetCore.Mvc;
using Microsoft.CodeAnalysis.CSharp.Syntax;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;

namespace CustomerProfileCRUD.Controllers
{
    public class CustomersController : Controller
    {
        private readonly ApplicationDbContext context;
        CustomerAndAddresses customerAndAddresses;
        public CustomersController(ApplicationDbContext context)
        {
            this.context = context;
        }

        public async Task<IActionResult> Index() 
        { 
            var CusAndAdd = await context.GetCustomersAndAddressesAsync(); 
            return View(CusAndAdd); 
        }

        public IActionResult Create()
        {

            return View();
        }
        [HttpPost]
        public async Task<IActionResult> Create(CustomerAndListAddress CustAndLstAdd)
        {
            if (CustAndLstAdd.Name == null)
            {
                ModelState.AddModelError("Customers", "Customer Name is required");
            }
            if (ModelState.IsValid) 
            { 
                await context.InsertCustomerAndAddressesAsync(CustAndLstAdd);
                return RedirectToAction("Index");
            }
            return View(CustAndLstAdd);

        }

        [HttpGet]
        public async Task<IActionResult> Edit(int id)
        {
            if (id == null || id == 0)
            {
                return NotFound();
            }
            customerAndAddresses = await context.GetCustomerAndAddressByIdAsync(id);
            if (customerAndAddresses == null) { return NotFound(); }
            return View(customerAndAddresses);
        }

        [HttpPost, ActionName("Edit")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(CustomerAndAddresses obj)
        {
            if (obj.Name == null)
            {
                ModelState.AddModelError("Customers", "Customer Name is required");
            }

            
            if (ModelState.IsValid)
            {
                try
                {
                    await UpdateCustomerDetailsAsync(obj);
                    return RedirectToAction(nameof(Index));
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!CustomerExists(obj.Id))
                    {
                        return NotFound();
                    }
                    else
                    {
                        throw;
                    }
                }
            }
            

            return View(obj);
        }


        public async Task<IActionResult> Delete(int id)
        {
            if (id == null || id == 0)
            {
                return NotFound();
            }            
            customerAndAddresses = await context.GetCustomerAndAddressByIdAsync(id);            
            if (customerAndAddresses == null) { return NotFound(); }
            return View(customerAndAddresses);
        }

        private async Task UpdateCustomerDetailsAsync(CustomerAndAddresses customer)
        {
            var commandText = "EXEC UpdateCustomerDetails @CustomerID, @Name,@Photo, @Email, @Phone, @Fax, @Internet, @Remarks";
            var parameters = new[]
            {
            new SqlParameter("@CustomerID", customer.Id),
            new SqlParameter("@Name", customer.Name),
            new SqlParameter("@Photo", customer.Photo),
            new SqlParameter("@Email", customer.Email),
            new SqlParameter("@Phone", customer.Phone),
            new SqlParameter("@Fax", customer.Fax),
            new SqlParameter("@Internet", customer.Internet),
            new SqlParameter("@Remarks", customer.Remarks),
            
        };

            await context.Database.ExecuteSqlRawAsync(commandText, parameters);
        }

        private bool CustomerExists(int id)
        {
            return context.Customers.Any(e => e.Id == id);
        }




        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeletePOST(int id)
        {

            await context.DeleteCustomerAndAddressesAsync(id); 
            return RedirectToAction("Index");

        }
    }
}
