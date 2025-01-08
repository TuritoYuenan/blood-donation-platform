namespace Backend;

public partial class Usersappointment
{
    public string Userid { get; set; } = null!;

    public string Appointmentid { get; set; } = null!;

    public DateOnly Aptdate { get; set; }

    public string Centerid { get; set; } = null!;

    public string? Operatingstaff { get; set; }

    public decimal Status { get; set; }

    public string? Bloodtype { get; set; }

    public float? Amount { get; set; }

    public string? Note { get; set; }

    public virtual Appointment Appointment { get; set; } = null!;

    public virtual Bloodtype? BloodtypeNavigation { get; set; }

    public virtual Donationcenter Center { get; set; } = null!;

    public virtual Staff? OperatingstaffNavigation { get; set; }

    public virtual User User { get; set; } = null!;
}
