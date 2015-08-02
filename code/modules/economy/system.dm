var/datum/economy_system/economy_system = new()

/datum/economy_system
	var/list/personal_accounts = list()
	var/list/station_accounts = list()
	var/list/logs = list()

/datum/economy_system/proc/start()
	var/list/depts = list(new /datum/economy_account/department/station(), \
	new /datum/economy_account/department/cargo(), \
	new /datum/economy_account/department/civil(), \
	new /datum/economy_account/department/engineering(), \
	new /datum/economy_account/department/medical(), \
	new /datum/economy_account/department/research(), \
	new /datum/economy_account/department/security(), \
	new /datum/economy_account/department/service())

	for(var/datum/economy_account/department/Saccount in depts)
		Saccount.load_starting_from_DB()
		station_accounts[Saccount.name] = Saccount

/datum/economy_system/proc/give_global_salary()
	for(var/datum/economy_account/Paccount in personal_accounts)
		Paccount.amount += Paccount.salary	// give salary!
		Paccount.salary = 0					// salary is given...
	return 1

/datum/economy_system/proc/save_system_to_DB()
	if(!establish_db_connection())
		world.log << "WARNING! Economy system not synced to DB!"
		diary << "WARNING! Economy system not synced to DB!"
		return 0

	for(var/S in station_accounts)
		var/datum/economy_account/department/Saccount = station_accounts[S]
		world << "ACCOUNT [Saccount] SAVING TO DB"
		var/DBQuery/query_SA_check = dbcon.NewQuery("SELECT * FROM economy WHERE (name = '[Saccount.name]') and (station = '[Saccount.station]')")
		if(query_SA_check.Execute() && query_SA_check.NextRow())
			var/DBQuery/query_SA_update = dbcon.NewQuery("UPDATE economy SET amount = [Saccount.amount] WHERE (name = '[Saccount.name]') and (station = '[Saccount.station]')")
			query_SA_update.Execute()
		else
			var/DBQuery/query_SA_insert = dbcon.NewQuery("INSERT INTO economy(name, ckey, amount, station) VALUES ('[Saccount.name]', null, [Saccount.amount], '[Saccount.station]')") //NEW DEPARTMENT!
			query_SA_insert.Execute()

	for(var/datum/economy_account/Paccount in personal_accounts)
		var/DBQuery/query_PA_check = dbcon.NewQuery("SELECT * FROM economy WHERE (name = '[Paccount.name]') and (ckey = '[Paccount.ckey]') and (station = '[Paccount.station]')")
		if(query_PA_check.Execute() && query_PA_check.NextRow())
			var/DBQuery/query_PA_update = dbcon.NewQuery("UPDATE economy SET amount = [Paccount.amount] WHERE (name = '[Paccount.name]') and (ckey = '[Paccount.ckey]') and (station = '[Paccount.station]')")
			query_PA_update.Execute()
		else
			var/DBQuery/query_PA_insert = dbcon.NewQuery("INSERT INTO economy(name, ckey, amount, station) VALUES ('[Paccount.name]', '[Paccount.ckey]', [Paccount.amount], '[Paccount.station]')") //NEW ACCOUNT!
			query_PA_insert.Execute()

	return 1