/datum/economy_account
	var/amount								//how nuch money we have?
	var/ckey								//ckey of holder
	var/list/log							//log for atms
	var/pin_code							//pin code
	var/account_name						//account name ingame
	var/station	= "no"							//station flag
	var/name								//name for db
	var/salary								//salary
	var/mob/living/account_holder			//holder reference for checking lost
	var/list/cards							//accessible cards

/datum/economy_account/load_starting_from_DB()
	if(!establish_db_connection())
		world.log << "WARNING! [name] bank account not synced from DB!"
		return

	var/DBQuery/query_sync("SELECT amount FROM economy WHERE (name = '[name]') and (ckey = '[ckey]') and (station = '[station]')")

	while(query_sync.NextRow())
		amount = query.item[1]

/datum/economy_account/department
	name = "Departnemt"
	amount = 25000
	station = "yes"
	ckey = null								//Not synced by ckey
	account_holder = null					//Cannot be lost by person

/datum/economy_account/department/station
	name = "Station"
	amount = 175000

/datum/economy_account/station/cargo
	name = "Cargo"

/datum/economy_account/station/civil
	name = "Civilian"

/datum/economy_account/station/engineering
	name = "Engineering"

/datum/economy_account/station/medical
	name = "Medical"

/datum/economy_account/station/research
	name = "Research"

/datum/economy_account/station/security
	name = "Security"

/datum/economy_account/station/service
	name = "Service"