using System;
using System.ComponentModel.DataAnnotations.Schema;

namespace mvctest.Models
{
	[Table("incomes")]
	public class Income
	{
		[Column("income_id")]
		public int IncomeID { get; set; }

		[Column("nickname")]
		public string Nickname { get; set; }

		[Column("recurrences")]
		public int? Recurrences { get; set; }

		[Column("pay_schedule")]
		public string PaySchedule { get; set; }

		[Column("amount_per_paycheck")]
		public decimal PayAmount { get; set; }

		[Column("recurring_date")]
		public DateTime? recurringDate { get; set; }
	}
}
