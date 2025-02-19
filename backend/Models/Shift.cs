namespace Backend.Models;

public partial class Shift
{
    public string Shiftid { get; set; } = null!;

    public decimal Dateofweek { get; set; }

    public TimeOnly? Starttime { get; set; }

    public TimeOnly? Endtime { get; set; }
}
