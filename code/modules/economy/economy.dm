/datum/economy_account
	var/amount								//how nuch money we have?
	var/ckey								//ckey of holder
	var/list/log							//log for atms
	var/pin_code							//pin code
	var/account_name						//account name ingame
	var/station	= "no"						//station flag
	var/name								//name for db
	var/salary								//salary
	var/mob/living/account_holder			//holder reference for checking lost
	var/list/cards							//accessible cards

/datum/economy_account/proc/load_starting_from_DB()
	if(!establish_db_connection())
		world << "WARNING! [name] bank account not synced from DB!"
		return

	var/query_text = ""
	if(ckey)
		query_text = "SELECT amount FROM economy WHERE (name = '[name]') AND (ckey = '[ckey]') AND (station = '[station]')"
	else
		query_text = "SELECT amount FROM economy WHERE (name = '[name]') AND (ckey is NULL) AND (station = '[station]')"
	var/DBQuery/query_sync = dbcon.NewQuery("[query_text]")

	query_sync.Execute()

	world << "ACCOUNT [name] IS LOADING"

	while(query_sync.NextRow())
		amount = text2num(query_sync.item[1])
		if(!isnum(amount))
			amount = text2num(amount)
		world << "ACCOUNT [name] IS LOADED"

/datum/economy_account/department
	name = "Departnemt"
	amount = 25000
	station = "yes"
	ckey = null								//Not synced by ckey
	account_holder = null					//Cannot be lost by person

/datum/economy_account/department/station
	name = "Station"
	amount = 175000

/datum/economy_account/department/cargo
	name = "Cargo"

/datum/economy_account/department/civil
	name = "Civilian"

/datum/economy_account/department/engineering
	name = "Engineering"

/datum/economy_account/department/medical
	name = "Medical"

/datum/economy_account/department/research
	name = "Research"

/datum/economy_account/department/security
	name = "Security"

/datum/economy_account/department/service
	name = "Service"