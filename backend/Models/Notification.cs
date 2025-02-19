namespace Backend.Models;

public partial class Notification
{
    public int Notificationid { get; set; }

    public string Userid { get; set; } = null!;

    public string? Message { get; set; }

    public TimeOnly Senttime { get; set; }

    public DateOnly Sentdate { get; set; }

    public decimal Senttype { get; set; }

    public decimal Status { get; set; }

    public virtual User User { get; set; } = null!;
}
