using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using CMSS.Data;
using CMSS.DataModel;
using CMSS.Models;
using CMSS.ViewModel;
using NuGet.Protocol.Plugins;
using System.Security.Claims;

namespace CMSS.Controllers
{
    public class ParcelController : Controller
    {
        private readonly CMSSContext _context;

        public ParcelController(CMSSContext context)
        {
            _context = context;
        }

        // GET: Parcel
        public async Task<IActionResult> Index()
        {
            return View(await _context.CustomerInfo.ToListAsync());
        }

        // GET: Parcel/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var customerInfo = await _context.CustomerInfo
                .FirstOrDefaultAsync(m => m.ID == id);
            if (customerInfo == null)
            {
                return NotFound();
            }

            return View(customerInfo);
        }

        // GET: Parcel/Create
        public IActionResult Create()
        {
            ViewBag.ParcelList = _context.lookup
                .Where(x => x.Type == LookupTypes.ParcelType && x.IsActive)
                .OrderBy(x => x.Serial)
                .ToList();

            ViewBag.CityList = _context.lookup
                .Where(x=> x.Type == LookupTypes.City && x.IsActive)
                .OrderBy(x => x.Serial)
                .ToList();
            return View();
        }

        public IActionResult CreateLookup()
        {
            ViewBag.List = _context.lookup
                .OrderBy(x => x.Id)
                .ToList();
            return View(); 
        }

        [HttpPost]
        public IActionResult CreateLookup(lookupVM model)
        {
            if(model == null)
                return Json(new { success = false, message = PopupMessage.error });

            var userid = User.FindFirstValue(ClaimTypes.NameIdentifier);
            model.CreateAt = DateTime.UtcNow;
            model.UpdateAt = DateTime.UtcNow;
            model.CreateBy = GuidHelper.ToGuidOrDefault(userid);
            model.UpdateBy = GuidHelper.ToGuidOrDefault(userid);
            
            return Json(new { success = true, message = PopupMessage.success });
        }







        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create(CustomerInfo customerInfo)
        {
            var userid = User.FindFirstValue(ClaimTypes.NameIdentifier);
            customerInfo.CreateBy= GuidHelper.ToGuidOrDefault(userid);
            customerInfo.UpdateBy= GuidHelper.ToGuidOrDefault(userid);

            if (ModelState.IsValid)
            {
                _context.Add(customerInfo);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            return View(customerInfo);
        }

        // GET: Parcel/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var customerInfo = await _context.CustomerInfo.FindAsync(id);
            if (customerInfo == null)
            {
                return NotFound();
            }
            return View(customerInfo);
        }

        // POST: Parcel/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("ID,CustomerID,Name,Number,Email,Address,Note,city,CreateAt,CreateBy,UpdateAt,UpdateBy")] CustomerInfo customerInfo)
        {
            if (id != customerInfo.ID)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(customerInfo);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!CustomerInfoExists(customerInfo.ID))
                    {
                        return NotFound();
                    }
                    else
                    {
                        throw;
                    }
                }
                return RedirectToAction(nameof(Index));
            }
            return View(customerInfo);
        }

        // GET: Parcel/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var customerInfo = await _context.CustomerInfo
                .FirstOrDefaultAsync(m => m.ID == id);
            if (customerInfo == null)
            {
                return NotFound();
            }

            return View(customerInfo);
        }

        // POST: Parcel/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var customerInfo = await _context.CustomerInfo.FindAsync(id);
            if (customerInfo != null)
            {
                _context.CustomerInfo.Remove(customerInfo);
            }

            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool CustomerInfoExists(int id)
        {
            return _context.CustomerInfo.Any(e => e.ID == id);
        }
    }
}
