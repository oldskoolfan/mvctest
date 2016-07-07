using Microsoft.AspNetCore.Mvc;

namespace mvctest.Controllers
{
	public class HomeController : Controller
	{
		public ActionResult Index()
		{
			return View();
		}
	}
}