﻿namespace Backend;

public partial class Donationcenter
{
    public string Centerid { get; set; } = null!;

    public string Centername { get; set; } = null!;

    public decimal Status { get; set; }

    public string? Phonenumber { get; set; }

    public string? Email { get; set; }

    public List<string>? Operatinghours { get; set; }

    public string? Description { get; set; }

    public virtual ICollection<Appointment> Appointments { get; set; } = new List<Appointment>();

    public virtual ICollection<Staff> Staff { get; set; } = new List<Staff>();

    public virtual ICollection<Usersappointment> Usersappointments { get; set; } = new List<Usersappointment>();
}
