using System.Collections.Generic;
using System.Linq;
using mvctest.Models;
using Microsoft.Extensions.Logging;

namespace mvctest.DAL
{
	public class BudgetDbProvider : IDataAccessProvider
	{
		private readonly BudgetdbContext _context;
		private readonly ILogger _logger;

		public BudgetDbProvider(BudgetdbContext context, ILoggerFactory loggerFactory)
		{
			_context = context;
			_logger = loggerFactory.CreateLogger(this.GetType().Name);
		}

		public List<Account> GetAccounts()
		{
			return _context.Accounts.ToList();
		}

		public List<Income> GetIncomes()
		{
			return _context.Incomes.ToList();
		}
	}
}
