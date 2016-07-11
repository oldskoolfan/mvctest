using Microsoft.AspNetCore.Mvc;

namespace mvctest.Controllers
{
	public class HomeController : Controller
	{
		public IActionResult Index()
		{
			return View();
		}
	}
}