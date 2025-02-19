namespace Backend.Models;

public partial class User
{
    public string Userid { get; set; } = null!;

    public string Password { get; set; } = null!;

    public string Firstname { get; set; } = null!;

    public string Lastname { get; set; } = null!;

    public DateOnly? Dateofbirth { get; set; }

    public string? Phonenumber { get; set; }

    public string? Email { get; set; }

    public string? Address { get; set; }

    public decimal? Usertype { get; set; }

    public byte[]? Faceimg { get; set; }

    public virtual ICollection<Appointment> Appointments { get; set; } = new List<Appointment>();

    public virtual Donor? Donor { get; set; }

    public virtual ICollection<Notification> Notifications { get; set; } = new List<Notification>();

    public virtual Staff? Staff { get; set; }

    public virtual ICollection<UsersAppointment> Usersappointments { get; set; } = new List<UsersAppointment>();
}
