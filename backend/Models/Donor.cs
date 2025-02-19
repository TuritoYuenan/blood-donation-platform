namespace Backend.Models;

public partial class Donor
{
    public string Donorid { get; set; } = null!;

    public float? Weight { get; set; }

    public float? Height { get; set; }

    public string? Lastdonation { get; set; }

    public string? Bloodtype { get; set; }

    public string? Healthhistory { get; set; }

    public virtual Bloodtype? BloodtypeNavigation { get; set; }

    public virtual User DonorNavigation { get; set; } = null!;
}
