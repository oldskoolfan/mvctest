function submitAccount() {
	var nameBox = document.getElementById('nickname'),
		balBox = document.getElementById('balance'),
		typeBtns = document.getElementsByName('account-type'),
		name,
		balance,
		type;
	name = nameBox.value;
	balance = balBox.value;
	for (var i = 0, btn; i < typeBtns.length; i++) {
		btn = typeBtns[i];
		if (btn.checked) {
			type = btn.value;
			break;
		}
	}
	console.log('name: ' + name + ', type: ' + type + ', bal: ' + balance);
	// perform ajax post request
	axios.post('/api/Accounts', {nickname: name, accountType: type, balance: balance})
	.then(function(resp) {
		console.log(resp);
	}).catch(function(error) {
		console.log(error);
	});
}

function clearForm() {
	var nameBox = document.getElementById('nickname'),
		balBox = document.getElementById('balance'),
		typeBtns = document.getElementsByName('account-type');
	nameBox.value = '';
	balBox.value = '';
	typeBtns.forEach(function(btn) {
		btn.checked = false;
	});
}