using Microsoft.EntityFrameworkCore;
namespace Backend.Helpers;

public partial class BloodPlatformContext : DbContext
{
	public BloodPlatformContext() { }

	public BloodPlatformContext(DbContextOptions<BloodPlatformContext> options)
		: base(options) { }

	public virtual DbSet<Appointment> Appointments { get; set; }

	public virtual DbSet<Bloodtype> Bloodtypes { get; set; }

	public virtual DbSet<DonationCenter> Donationcenters { get; set; }

	public virtual DbSet<Donor> Donors { get; set; }

	public virtual DbSet<Notification> Notifications { get; set; }

	public virtual DbSet<Shift> Shifts { get; set; }

	public virtual DbSet<Staff> Staffs { get; set; }

	public virtual DbSet<User> Users { get; set; }

	public virtual DbSet<UsersAppointment> Usersappointments { get; set; }

	protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
	{
		optionsBuilder.UseNpgsql("Server=localhost;Port=5432;Database=blood_platform;User Id=http_member;Password=blood_platform;");
	}

	protected override void OnModelCreating(ModelBuilder modelBuilder)
	{
		modelBuilder.Entity<Appointment>(entity =>
		{
			entity.HasKey(e => e.Appointmentid).HasName("appointments_pkey");

			entity.ToTable("appointments");

			entity.Property(e => e.Appointmentid)
				.HasMaxLength(50)
				.HasColumnName("appointmentid");
			entity.Property(e => e.Aptdate).HasColumnName("aptdate");
			entity.Property(e => e.Apttype).HasColumnName("apttype");
			entity.Property(e => e.Centerid)
				.HasMaxLength(50)
				.HasColumnName("centerid");
			entity.Property(e => e.Email)
				.HasMaxLength(50)
				.HasColumnName("email");
			entity.Property(e => e.Leadstaff)
				.HasMaxLength(50)
				.HasColumnName("leadstaff");
			entity.Property(e => e.Note).HasColumnName("note");
			entity.Property(e => e.Owner)
				.HasMaxLength(50)
				.HasColumnName("owner");
			entity.Property(e => e.Phonenumber)
				.HasMaxLength(15)
				.HasColumnName("phonenumber");
			entity.Property(e => e.Stafflist)
				.HasColumnType("character varying[]")
				.HasColumnName("stafflist");
			entity.Property(e => e.Status).HasColumnName("status");

			entity.HasOne(d => d.Center).WithMany(p => p.Appointments)
				.HasForeignKey(d => d.Centerid)
				.OnDelete(DeleteBehavior.ClientSetNull)
				.HasConstraintName("appointments_centerid_fkey");

			entity.HasOne(d => d.LeadstaffNavigation).WithMany(p => p.Appointments)
				.HasForeignKey(d => d.Leadstaff)
				.HasConstraintName("appointments_leadstaff_fkey");

			entity.HasOne(d => d.OwnerNavigation).WithMany(p => p.Appointments)
				.HasForeignKey(d => d.Owner)
				.OnDelete(DeleteBehavior.ClientSetNull)
				.HasConstraintName("appointments_owner_fkey");
		});

		modelBuilder.Entity<Bloodtype>(entity =>
		{
			entity.HasKey(e => e.Bloodtype1).HasName("bloodtypes_pkey");

			entity.ToTable("bloodtypes");

			entity.Property(e => e.Bloodtype1)
				.HasMaxLength(50)
				.HasColumnName("bloodtype");
			entity.Property(e => e.Bloodtypedesc).HasColumnName("bloodtypedesc");
		});

		modelBuilder.Entity<DonationCenter>(entity =>
		{
			entity.HasKey(e => e.Centerid).HasName("donationcenters_pkey");

			entity.ToTable("donationcenters");

			entity.Property(e => e.Centerid)
				.HasMaxLength(50)
				.HasColumnName("centerid");
			entity.Property(e => e.Centername)
				.HasMaxLength(50)
				.HasColumnName("centername");
			entity.Property(e => e.Description).HasColumnName("description");
			entity.Property(e => e.Email)
				.HasMaxLength(100)
				.HasColumnName("email");
			entity.Property(e => e.Operatinghours)
				.HasColumnType("character varying[]")
				.HasColumnName("operatinghours");
			entity.Property(e => e.Phonenumber)
				.HasMaxLength(15)
				.HasColumnName("phonenumber");
			entity.Property(e => e.Status)
				.HasPrecision(1)
				.HasColumnName("status");
		});

		modelBuilder.Entity<Donor>(entity =>
		{
			entity.HasKey(e => e.Donorid).HasName("donors_pkey");

			entity.ToTable("donors");

			entity.Property(e => e.Donorid)
				.HasMaxLength(50)
				.HasColumnName("donorid");
			entity.Property(e => e.Bloodtype)
				.HasMaxLength(50)
				.HasColumnName("bloodtype");
			entity.Property(e => e.Healthhistory)
				.HasColumnType("json")
				.HasColumnName("healthhistory");
			entity.Property(e => e.Height).HasColumnName("height");
			entity.Property(e => e.Lastdonation)
				.HasColumnType("character varying")
				.HasColumnName("lastdonation");
			entity.Property(e => e.Weight).HasColumnName("weight");

			entity.HasOne(d => d.BloodtypeNavigation).WithMany(p => p.Donors)
				.HasForeignKey(d => d.Bloodtype)
				.HasConstraintName("donors_bloodtype_fkey");

			entity.HasOne(d => d.DonorNavigation).WithOne(p => p.Donor)
				.HasForeignKey<Donor>(d => d.Donorid)
				.OnDelete(DeleteBehavior.ClientSetNull)
				.HasConstraintName("donors_donorid_fkey");
		});

		modelBuilder.Entity<Notification>(entity =>
		{
			entity.HasKey(e => e.Notificationid).HasName("notifications_pkey");

			entity.ToTable("notifications");

			entity.Property(e => e.Notificationid).HasColumnName("notificationid");
			entity.Property(e => e.Message).HasColumnName("message");
			entity.Property(e => e.Sentdate).HasColumnName("sentdate");
			entity.Property(e => e.Senttime).HasColumnName("senttime");
			entity.Property(e => e.Senttype).HasColumnName("senttype");
			entity.Property(e => e.Status).HasColumnName("status");
			entity.Property(e => e.Userid)
				.HasMaxLength(50)
				.HasColumnName("userid");

			entity.HasOne(d => d.User).WithMany(p => p.Notifications)
				.HasForeignKey(d => d.Userid)
				.OnDelete(DeleteBehavior.ClientSetNull)
				.HasConstraintName("notifications_userid_fkey");
		});

		modelBuilder.Entity<Shift>(entity =>
		{
			entity.HasKey(e => e.Shiftid).HasName("shifts_pkey");

			entity.ToTable("shifts");

			entity.Property(e => e.Shiftid)
				.HasMaxLength(50)
				.HasColumnName("shiftid");
			entity.Property(e => e.Dateofweek).HasColumnName("dateofweek");
			entity.Property(e => e.Endtime).HasColumnName("endtime");
			entity.Property(e => e.Starttime).HasColumnName("starttime");
		});

		modelBuilder.Entity<Staff>(entity =>
		{
			entity.HasKey(e => e.Staffid).HasName("staffs_pkey");

			entity.ToTable("staffs");

			entity.Property(e => e.Staffid)
				.HasMaxLength(50)
				.HasColumnName("staffid");
			entity.Property(e => e.Centerid)
				.HasMaxLength(50)
				.HasColumnName("centerid");
			entity.Property(e => e.Dateofbirth).HasColumnName("dateofbirth");
			entity.Property(e => e.Email)
				.HasMaxLength(100)
				.HasColumnName("email");
			entity.Property(e => e.Lastname)
				.HasMaxLength(50)
				.HasColumnName("lastname");
			entity.Property(e => e.Phonenumber)
				.HasMaxLength(15)
				.HasColumnName("phonenumber");
			entity.Property(e => e.Workinghours)
				.HasColumnType("character varying[]")
				.HasColumnName("workinghours");

			entity.HasOne(d => d.Center).WithMany(p => p.Staff)
				.HasForeignKey(d => d.Centerid)
				.HasConstraintName("staffs_centerid_fkey");

			entity.HasOne(d => d.StaffNavigation).WithOne(p => p.Staff)
				.HasForeignKey<Staff>(d => d.Staffid)
				.OnDelete(DeleteBehavior.ClientSetNull)
				.HasConstraintName("staffs_staffid_fkey");
		});

		modelBuilder.Entity<User>(entity =>
		{
			entity.HasKey(e => e.Userid).HasName("users_pkey");

			entity.ToTable("users");

			entity.Property(e => e.Userid)
				.HasMaxLength(50)
				.HasColumnName("userid");
			entity.Property(e => e.Address)
				.HasMaxLength(100)
				.HasColumnName("address");
			entity.Property(e => e.Dateofbirth).HasColumnName("dateofbirth");
			entity.Property(e => e.Email)
				.HasMaxLength(100)
				.HasColumnName("email");
			entity.Property(e => e.Faceimg).HasColumnName("faceimg");
			entity.Property(e => e.Firstname)
				.HasMaxLength(50)
				.HasColumnName("firstname");
			entity.Property(e => e.Lastname)
				.HasMaxLength(50)
				.HasColumnName("lastname");
			entity.Property(e => e.Password)
				.HasMaxLength(50)
				.HasColumnName("password");
			entity.Property(e => e.Phonenumber)
				.HasMaxLength(15)
				.HasColumnName("phonenumber");
			entity.Property(e => e.Usertype).HasColumnName("usertype");
		});

		modelBuilder.Entity<UsersAppointment>(entity =>
		{
			entity.HasKey(e => new { e.Userid, e.Appointmentid }).HasName("usersappointments_pkey");

			entity.ToTable("usersappointments");

			entity.Property(e => e.Userid)
				.HasMaxLength(50)
				.HasColumnName("userid");
			entity.Property(e => e.Appointmentid)
				.HasMaxLength(50)
				.HasColumnName("appointmentid");
			entity.Property(e => e.Amount).HasColumnName("amount");
			entity.Property(e => e.Aptdate).HasColumnName("aptdate");
			entity.Property(e => e.Bloodtype)
				.HasMaxLength(50)
				.HasColumnName("bloodtype");
			entity.Property(e => e.Centerid)
				.HasMaxLength(50)
				.HasColumnName("centerid");
			entity.Property(e => e.Note).HasColumnName("note");
			entity.Property(e => e.Operatingstaff)
				.HasMaxLength(50)
				.HasColumnName("operatingstaff");
			entity.Property(e => e.Status).HasColumnName("status");

			entity.HasOne(d => d.Appointment).WithMany(p => p.Usersappointments)
				.HasForeignKey(d => d.Appointmentid)
				.OnDelete(DeleteBehavior.ClientSetNull)
				.HasConstraintName("usersappointments_appointmentid_fkey");

			entity.HasOne(d => d.BloodtypeNavigation).WithMany(p => p.Usersappointments)
				.HasForeignKey(d => d.Bloodtype)
				.HasConstraintName("usersappointments_bloodtype_fkey");

			entity.HasOne(d => d.Center).WithMany(p => p.Usersappointments)
				.HasForeignKey(d => d.Centerid)
				.OnDelete(DeleteBehavior.ClientSetNull)
				.HasConstraintName("usersappointments_centerid_fkey");

			entity.HasOne(d => d.OperatingstaffNavigation).WithMany(p => p.Usersappointments)
				.HasForeignKey(d => d.Operatingstaff)
				.HasConstraintName("usersappointments_operatingstaff_fkey");

			entity.HasOne(d => d.User).WithMany(p => p.Usersappointments)
				.HasForeignKey(d => d.Userid)
				.OnDelete(DeleteBehavior.ClientSetNull)
				.HasConstraintName("usersappointments_userid_fkey");
		});

		OnModelCreatingPartial(modelBuilder);
	}

	partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
