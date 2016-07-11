using System.ComponentModel.DataAnnotations.Schema;

namespace mvctest.Models
{
	[Table("accounts")]
	public class Account
	{
		private string _acctType;

		[Column("account_id")]
		public int AccountID { get; set; }

		[Column("nickname")]
		public string Nickname { get; set; }

		[Column("account_type")]
		public string AccountType { get; set; }

		[Column("balance")]
		public decimal Balance { get; set; }
	}
}
