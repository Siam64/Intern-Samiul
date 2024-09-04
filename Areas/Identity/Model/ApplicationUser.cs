using Microsoft.AspNetCore.Identity;
using System.ComponentModel.DataAnnotations;

namespace CMSS.Areas.Identity.Model
{
    public class ApplicationUser: IdentityUser
    {
        [StringLength(255)]
        [Display(Name = "Firstname")]
        public string FirstName { get; set; }

        [StringLength(255)]
        [Display(Name = "Lastname")]
        public string LastName { get; set; }
    }
}
