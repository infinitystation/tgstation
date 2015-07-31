var/datum/economy_system/economy_system = new()

/datum/economy_system
	var/list/personal_accounts
	var/list/station_accounts
	var/list/logs

/datum/economy_system/New()
	station_accounts = (list new /datum/economy_account/department/station(), \
	new /datum/economy_account/department/cargo(), \
	new /datum/economy_account/department/civil(), \
	new /datum/economy_account/department/engineering(), \
	new /datum/economy_account/department/medical(), \
	new /datum/economy_account/department/research(), \
	new /datum/economy_account/department/security(), \
	new /datum/economy_account/department/service())

	for(var/Saccount in station_accounts)
		Saccount.load_starting_from_DB()

/datum/economy_system/proc/give_global_salary()
	for(var/Paccount in personal_accounts)
		Paccount.amount += Paccount.salary	// give salary!
		Paccount.salary = 0					// salary is given...
	return 1

/datum/economy_system/proc/save_system_to_DB()
	if(!establish_db_connection())
		world.log << "WARNING! Economy system not synced to DB!"
		diary << "WARNING! Economy system not synced to DB!"
		return 0

	for(var/Saccount in station_accounts)
		var/DBQuery/query_SA_check("SELECT * FROM economy WHERE (name = '[Saccount.name]') and (station = '[station]')")
		if(query_SA.Execute())
			var/DBQuery/query_SA_update("UPDATE economy SET amount = [Saccount.amount] WHERE (name = '[Saccount.name]') and (station = '[station]')")
			query_SA_update.Execute()
		else
			var/DBQuery/query_SA_insert("INSERT INTO economy(name, ckey, amount, station) VALUES ('[Saccount.name]', null, [Saccount.amount], '[station]')") //NEW DEPARTMENT!
			query_SA_insert.Execute()

	for(var/Paccount in personal_accounts)
		var/DBQuery/query_PA_check("SELECT * FROM economy WHERE (name = '[Paccount.name]') and (ckey = '[Paccount.ckey]') and (station = '[station]')")
		if(query_PA.Execute())
			var/DBQuery/query_PA_update("UPDATE economy SET amount = [Paccount.amount] WHERE (name = '[Paccount.name]') and (ckey = '[Paccount.ckey]') and (station = '[station]')")
			query_PA_update.Execute()
		else
			var/DBQuery/query_PA_insert("INSERT INTO economy(name, ckey, amount, station) VALUES ('[Paccount.name]', '[Paccount.ckey]', [Paccount.amount], '[station]')") //NEW ACCOUNT!
			query_PA_insert.Execute()

	return 1
