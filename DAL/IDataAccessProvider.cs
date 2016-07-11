using System.Collections.Generic;
using mvctest.Models;

namespace mvctest.DAL
{
    public interface IDataAccessProvider
	{
        List<Account> GetAccounts();
        List<Income> GetIncomes();
        void AddAccount(Account acct);
    }
}
