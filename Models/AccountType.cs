
namespace mvctest.Models
{
	/// <summary>
    /// this enum can't be used until EF core supports Postgresql enum types 
    /// </summary>
    public enum AccountType
	{
		Checking, Savings
	}
}
