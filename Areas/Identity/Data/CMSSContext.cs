using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;

namespace CMSS.Data;

public class CMSSContext : IdentityDbContext<IdentityUser>
{

/*    public string FirstName { get; set; }
    public string LastName { get; set; }*/
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

/*    public class ApplicationUserEntityConfiguration : IEntityTypeConfiguration<CMSSContext>
    {
        public void Configure(Microsoft.EntityFrameworkCore.Metadata.Builders.EntityTypeBuilder<CMSSContext> builder)
        {
            builder.Property(u => u.FirstName).HasMaxLength(255);
            builder.Property(u =>u.LastName).HasMaxLength(255);

        }
    }*/
}
