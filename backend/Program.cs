namespace Backend;
using Backend.Helpers;

internal class Program
{
	public static void Main(string[] args)
	{
		BloodPlatformContext context = new();

		WebApplication app = WebApplication.Create(args);

		app.MapGet("/donation/centers", () => context.Donationcenters.ToList());
		app.MapGet("/donation/center/{id}", (string id) => context.Donationcenters.Where(x => x.Centerid == id).SingleOrDefault());
		app.MapGet("/bloodtypes", () => context.Bloodtypes.ToList());
		app.MapGet("/users", () => context.Users.ToList());
		app.MapGet("/user/{id}", (string id) => context.Users.Where(x => x.Userid == id).SingleOrDefault());

		app.MapPost("/book", (object data) => "success");

		app.Run();
	}
}
