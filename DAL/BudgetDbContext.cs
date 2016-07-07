using mvctest.Models;
using System;
using System.Linq;
using Microsoft.EntityFrameworkCore;
using Npgsql;

namespace mvctest.DAL
{
	public class BudgetdbContext : DbContext
	{
		public BudgetdbContext(DbContextOptions<BudgetdbContext> options)
		:base(options)
		{
		}

		public DbSet<Account> Accounts { get; set; }
		public DbSet<Income> Incomes { get; set; }

		protected override void OnModelCreating(ModelBuilder builder)
		{
			builder.Entity<Account>().HasKey(m => m.AccountID);
			builder.Entity<Income>().HasKey(m => m.IncomeID);
			base.OnModelCreating(builder);
		}

		public override int SaveChanges()
		{
			ChangeTracker.DetectChanges();

			updateUpdatedProperty<Account>();
			updateUpdatedProperty<Income>();

			return base.SaveChanges();
		}

		private void updateUpdatedProperty<T>() where T : class
		{
			var modifiedSourceInfo =
				ChangeTracker.Entries<T>()
					.Where(e => e.State == EntityState.Added || e.State == EntityState.Modified);

			// foreach (var entry in modifiedSourceInfo)
			// {
			//     entry.Property("UpdatedTimestamp").CurrentValue = DateTime.UtcNow;
			// }
		}

	}
}
