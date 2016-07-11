using System.Collections.Generic;
using System.IO;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using mvctest.Models;
using mvctest.DAL;

namespace mvctest.Controllers
{
	[Route("api/[controller]")]
	public class AccountsController : Controller
	{
		private readonly IDataAccessProvider _dataAccessProvider;

		public AccountsController(IDataAccessProvider dataAccessProvider)
		{
			_dataAccessProvider = dataAccessProvider;
		}

		// GET api/values
		[HttpGet]
		public List<Account> Get()
		{
			return _dataAccessProvider.GetAccounts();
		}

		// GET api/values/5
		[HttpGet("{id}")]
		public string Get(int id)
		{
			return "value";
		}

		// POST api/values
		[HttpPost]
		public IActionResult Post([FromBody]Account account)
		{
			if (ModelState.IsValid) {
				_dataAccessProvider.AddAccount(account);
				return Created(Path.Combine(Request.Path, account.AccountID.ToString()), 
					account);
			} else {
				return BadRequest();
			}
		}

		// PUT api/values/5
		[HttpPut("{id}")]
		public void Put(int id, [FromBody]string value)
		{
		}

		// DELETE api/values/5
		[HttpDelete("{id}")]
		public void Delete(int id)
		{
		}

		// views
		[HttpGet("AddAccount")]
		public IActionResult AddAccount()
		{
			return View();
		}
	}
}
