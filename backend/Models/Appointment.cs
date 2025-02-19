namespace Backend;

public partial class Appointment
{
    public string Appointmentid { get; set; } = null!;

    public string Owner { get; set; } = null!;

    public DateOnly Aptdate { get; set; }

    public string Centerid { get; set; } = null!;

    public string? Leadstaff { get; set; }

    public string? Email { get; set; }

    public string? Phonenumber { get; set; }

    public List<string>? Stafflist { get; set; }

    public decimal Apttype { get; set; }

    public decimal Status { get; set; }

    public string? Note { get; set; }

    public virtual DonationCenter Center { get; set; } = null!;

    public virtual Staff? LeadstaffNavigation { get; set; }

    public virtual User OwnerNavigation { get; set; } = null!;

    public virtual ICollection<UsersAppointment> Usersappointments { get; set; } = [];
}
