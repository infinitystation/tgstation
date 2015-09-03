/mob/verb/test_economy()
	set category = "Debug"
	set name = "Test economy A"
	var/datum/economy_account/department/asd = economy_system.station_accounts["Station"]
	asd.amount -= 1000
	world << "STATION MONEY IS USED! AMOUNT IS [asd.amount]"
	return

/mob/verb/test_economy_2()
	set category = "Debug"
	set name = "Test economy B"
	var/datum/economy_account/department/asd = economy_system.station_accounts["Station"]
	world << "STATION MONEY AMOUNT IS [asd.amount]"
	return

/mob/verb/test_economy_3()
	set category = "Debug"
	set name = "Test economy C"
	var/datum/economy_account/department/asd = economy_system.station_accounts["Civilian"]
	asd.amount -= 1000
	world << "CIVILIAN MONEY IS USED! AMOUNT IS [asd.amount]"
	return

/mob/verb/test_economy_4()
	set category = "Debug"
	set name = "Test economy D"
	var/datum/economy_account/department/asd = economy_system.station_accounts["Civilian"]
	world << "CIVILIAN MONEY AMOUNT IS [asd.amount]"
	return

/obj/item/money_debugger
	name = "MONEY DEBUGGER"
	icon_state = "table_parts"
	var/list/money_acc_1 = list()
	var/list/money_acc_2 = list()

/obj/item/money_debugger/New()
	if(economy_system)
		money_acc_1 = economy_system.personal_accounts
		money_acc_2 = economy_system.station_accounts
