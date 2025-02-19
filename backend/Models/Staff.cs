namespace Backend.Models;

public partial class Staff
{
    public string Staffid { get; set; } = null!;

    public string? Centerid { get; set; }

    public string? Lastname { get; set; }

    public DateOnly? Dateofbirth { get; set; }

    public string? Phonenumber { get; set; }

    public string? Email { get; set; }

    public List<string>? Workinghours { get; set; }

    public virtual ICollection<Appointment> Appointments { get; set; } = new List<Appointment>();

    public virtual DonationCenter? Center { get; set; }

    public virtual User StaffNavigation { get; set; } = null!;

    public virtual ICollection<UsersAppointment> Usersappointments { get; set; } = new List<UsersAppointment>();
}
