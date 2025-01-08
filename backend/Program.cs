namespace Backend;
using Backend.Helpers;

internal class Program
{
	public static void Main(string[] args)
	{
		BloodPlatformContext context = new();

		WebApplicationBuilder builder = WebApplication.CreateSlimBuilder(args);

		WebApplication app = builder.Build();

		app.MapGet("/bloodtypes", () => context.Bloodtypes.ToList());
		app.MapGet("/users", () => context.Users.ToList());
		app.MapGet("/user/{id}", (string id) => context.Users.Where(x => x.Userid == id).SingleOrDefault());

		app.Run();
	}
}
