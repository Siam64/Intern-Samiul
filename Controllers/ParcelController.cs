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
using System.Diagnostics;
using Microsoft.AspNetCore.Authorization;

namespace CMSS.Controllers
{
    //[Authorize]
    public class ParcelController : Controller
    {
        private readonly CMSSContext _context;
        bool isSave = false;

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

        //[Authorize(Roles ="SuperAdmin")]
        public IActionResult CreateLookup()
        {
            ViewBag.List = _context.lookup
                .OrderBy(x => x.Id)
                .ToList();
            return View(); 
        }
        //[Authorize(Roles = "SuperAdmin")]

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

            lookup data = new lookup();
            data.Name = model.Name;
            data.Value = model.Value;
            data.Type = model.Type;
            data.Serial = model.Serial;
            data.IsActive = model.IsActive;
            data.CreateAt = model.CreateAt;
            data.CreateBy = model.CreateBy;
            data.UpdateBy = model.UpdateBy;
            data.UpdateAt = model.UpdateAt;

            try
            {
                _context.lookup.Add(data);
                _context.SaveChanges();
                ModelState.Clear();

                var dataResult = _context.lookup.OrderBy(x => x.Id).ToList();
                return Json(new { success = true, message = PopupMessage.success, data = dataResult });

            }
            catch (Exception ex)
            {
                return Json(new { success = false, message = PopupMessage.error });
            }
      
            //return Json(new { success = true, message = PopupMessage.success });
        }

        public IActionResult GetUpdateLookup(lookupVM model)
        {
            if (model == null || model.Id < 1)
            {
                return Json(new { success = false, message = PopupMessage.error });

            }
            var result = _context.lookup.Where(x => x.Id == model.Id).First();

            if(result == null)
            {
                return Json(new { success = false, message = PopupMessage.error });

            }
            return Json(new{ success = true,
                message = PopupMessage.success,
                data = new
                {
                    result.Id,
                    result.IsActive,
                    result.Name,
                    result.Serial,
                    result.Type,
                    result.Value
                }

            });

        }

        [HttpPost]
        public IActionResult UpdateLookup(lookupVM model)
        {
            if (model == null || model.Id <0)
                return Json(new { success = false, message = PopupMessage.error });


            var userid = User.FindFirstValue(ClaimTypes.NameIdentifier);
            model.CreateBy = GuidHelper.ToGuidOrDefault(userid);
            model.UpdateBy = GuidHelper.ToGuidOrDefault(userid);

            lookup data = _context.lookup.Where(x => x.Id == model.Id).FirstOrDefault();
            if (data == null)
            {
                return Json(new { success = false, message = PopupMessage.error });

            }
            data.Name = model.Name;
            data.Value = model.Value;
            data.Type = model.Type;
            data.Serial = model.Serial;
            data.IsActive = model.IsActive;
            data.UpdateBy = model.UpdateBy;
            data.UpdateAt = model.UpdateAt;

            try
            {
                _context.lookup.Update(data);
                _context.SaveChanges();
                var dataResult= _context.lookup.OrderBy(x => x.Id).ToList();
                return Json(new { success = true, message = PopupMessage.success, data= dataResult });

            }
            catch (Exception ex)
            {
                return Json(new { success = false, message = PopupMessage.error });
            }

        }



        [HttpPost]
        public IActionResult DeleteLookup(int Id)
        {
            if (Id < 0)
            {
                return Json(new { success = false, message = PopupMessage.error });

            }

            var data = _context.lookup.Where(x => x.Id == Id).FirstOrDefault();
           
            if(data== null)
            {
                return Json(new { success = false, message = PopupMessage.error });
            }
            try
            {
                _context.lookup.Remove(data);
                _context.SaveChanges();
                return Json(new { success = true, message = PopupMessage.success });

            }

            catch (Exception ex)
            {
                return Json(new { success = false, message = PopupMessage.error });
            }

        }


        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create(MultiModelVM model)
        {
            CustomerInfo customerdata= new CustomerInfo();
            ParcelInfo parceldata= new ParcelInfo();
            var userid = User.FindFirstValue(ClaimTypes.NameIdentifier);
            

            //var exCustomer = _context.CustomerInfo.Where(x => x.Number == model.CustomerInfo.Number).FirstOrDefault();

            
            
                customerdata.Name = model.CustomerInfo.Name;
                customerdata.Number = model.CustomerInfo.Number;
                customerdata.Email = model.CustomerInfo.Email;
                customerdata.Address = model.CustomerInfo.Address;
                customerdata.Note = model.CustomerInfo.Note;
                customerdata.city = model.CustomerInfo.city;
                customerdata.CreateBy = GuidHelper.ToGuidOrDefault(userid);
                customerdata.UpdateBy = GuidHelper.ToGuidOrDefault(userid);
                
            
            //else
            //{
            //    ////customerdata.Name = model.CustomerInfo.Name;
            //    ////customerdata.Number = model.CustomerInfo.Number;
            //    ////customerdata.Email = model.CustomerInfo.Email;
            //    ////customerdata.Address = model.CustomerInfo.Address;
            //    ////customerdata.Note = model.CustomerInfo.Note;
            //    ////customerdata.city = model.CustomerInfo.city;
            //    ////customerdata.UpdateBy = GuidHelper.ToGuidOrDefault(userid);
            //    ////_context.Update(customerdata);
            //    ////await _context.SaveChangesAsync();
            //    //return Json(new { message = PopupMessage.notValid });

            //}


            parceldata.ParcelType= model.ParcelInfo.ParcelType;
            parceldata.Weight= model.ParcelInfo.Weight;
            parceldata.Price= model.ParcelInfo.Price;
            parceldata.Note= model.ParcelInfo.Note;
            parceldata.DelivaryDate= model.ParcelInfo.DelivaryDate;
            parceldata.CreateBy = GuidHelper.ToGuidOrDefault(userid);
            parceldata.UpdateBy = GuidHelper.ToGuidOrDefault(userid);

            //if(exCustomer != null)
            //{
            //    parceldata.SenderID = exCustomer;
            //    parceldata.ReceiverID = exCustomer;

            //    _context.Add(parceldata);
            //    await _context.SaveChangesAsync();
            //}
            //else

            isSave = false;

            if (ModelState.IsValid)
            {

                _context.Add(customerdata);
                await _context.SaveChangesAsync();
                
                _context.Add(parceldata);
                await _context.SaveChangesAsync();
                bool isSave = true;

            }

            if(isSave = true)
            {
                parceldata.SenderID = customerdata.CustomerID;
                parceldata.ReceiverID = customerdata.CustomerID;
                _context.Update(parceldata);
                await _context.SaveChangesAsync();
            }
               

            
                return RedirectToAction(nameof(Index));
            



            return View(model);
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
