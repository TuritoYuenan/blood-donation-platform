namespace Backend;

public partial class Bloodtype
{
    public string Bloodtype1 { get; set; } = null!;

    public string? Bloodtypedesc { get; set; }

    public virtual ICollection<Donor> Donors { get; set; } = new List<Donor>();

    public virtual ICollection<UsersAppointment> Usersappointments { get; set; } = new List<UsersAppointment>();
}
