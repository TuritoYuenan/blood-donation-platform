namespace Backend;
using Backend.Helpers;

internal class Program
{
	public static void Main(string[] args)
	{
		BloodPlatformContext context = new();

		WebApplication app = WebApplication.Create(args);

		app.MapGet("/bloodtypes", () => context.Bloodtypes.ToList());
		app.MapGet("/users", () => context.Users.ToList());
		app.MapGet("/user/{id}", (string id) => context.Users.Where(x => x.Userid == id).SingleOrDefault());

		app.Run();
	}
}
