using System.Collections.Generic;
using Microsoft.AspNetCore.Mvc;
using mvctest.Models;
using mvctest.DAL;

namespace mvctest.Controllers
{
	[Route("api/[controller]")]
	public class IncomesController : Controller
	{
		private readonly IDataAccessProvider _dataAccessProvider;

		public IncomesController(IDataAccessProvider prov)
		{
			_dataAccessProvider = prov;
		}

		[HttpGet]
		public List<Income> Get()
		{
			return _dataAccessProvider.GetIncomes();
		}
	}
}