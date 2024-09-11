using CMSS.Areas.Identity.Model;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;
using CMSS.DataModel;
using CMSS.ViewModel;

namespace CMSS.Data;

public class CMSSContext : IdentityDbContext<ApplicationUser>
{

    public CMSSContext(DbContextOptions<CMSSContext> options)
        : base(options)
    {
    }

    protected override void OnModelCreating(ModelBuilder builder)
    {
        base.OnModelCreating(builder);
        // Customize the ASP.NET Identity model and override the defaults if needed.
        // For example, you can rename the ASP.NET Identity table names and more.
        // Add your customizations after calling base.OnModelCreating(builder);
        //builder.ApplyConfiguration(new ApplicationUserEntityConfiguration());
    }

public DbSet<CMSS.DataModel.CustomerInfo> CustomerInfo { get; set; } = default!;

public DbSet<CMSS.DataModel.ParcelInfo> ParcelInfo { get; set; } = default!;

public DbSet<CMSS.DataModel.lookup> lookup { get; set; } = default!;

}
