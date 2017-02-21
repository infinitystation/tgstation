/datum/money_account
	var/owner_name = ""
	var/account_number = 0
	var/remote_access_pin = 0
	var/money = 0
	var/list/transaction_log = list()
	var/suspended = 0
	var/security_level = 0	//0 - auto-identify from worn ID, require only account number
							//1 - require manual login / account number and pin
							//2 - require card and manual login

/datum/money_account/proc/do_transaction(var/datum/transaction/T)
	money = max(0, money + T.amount)
	transaction_log += T

/datum/money_account/proc/get_balance(var/acc_num)
	acc_num = 0
	for(var/datum/transaction/T in transaction_log)
		if(T.purpose == "Account creation")
			continue
		acc_num += T.amount

/datum/transaction
	var/target_name = ""
	var/purpose = ""
	var/amount = 0
	var/date = ""
	var/time = ""
	var/source_terminal = "" //not yet used

/datum/transaction/New(_target, _purpose, _amount, _source)
	..()
	date = current_date_string
	time = worldtime2text()
	target_name = _target
	purpose = _purpose
	amount = _amount
	source_terminal = _source

/proc/create_account(var/new_owner_name, var/starting_funds = 0)

	//create a new account
	var/datum/money_account/M = new()
	M.owner_name = new_owner_name
	M.remote_access_pin = rand(1111, 111111)
	M.money = starting_funds

	//create an entry in the account transaction log for when it was created
	var/datum/transaction/T = new()
	T.target_name = new_owner_name
	T.purpose = "Account creation"
	T.amount = starting_funds

	//add the account
	M.transaction_log.Add(T)
	all_money_accounts.Add(M)

	return M

/proc/charge_to_account(var/attempt_account_number, var/source_name, var/purpose, var/terminal_id, var/amount)
	var/datum/money_account/D = get_account(attempt_account_number)
	if(!D || D.suspended)
		return 0
	D.money = max(0, D.money + amount)

	//create a transaction log entry
	var/datum/transaction/T = new(source_name, purpose, amount, terminal_id)
	D.transaction_log.Add(T)

	return 1

//this returns the first account datum that matches the supplied accnum/pin combination, it returns null if the combination did not match any account
/proc/attempt_account_access(var/attempt_account_number, var/attempt_pin_number, var/security_level_passed = 0)
	var/datum/money_account/D = get_account(attempt_account_number)
	if(D.security_level <= security_level_passed && (!D.security_level || D.remote_access_pin == attempt_pin_number) )
		return D

/proc/get_account(var/account_number)
	for(var/datum/money_account/D in all_money_accounts)
		if(D.account_number == account_number)
			return D
