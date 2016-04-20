/proc/changemap_alt(var/datum/votablemap/VM)
	if(!istype(VM))
		return
	if(ticker.update_waiting)
		return

	log_game("Changing map to [VM.name]([VM.friendlyname])")
	. = shell("sh map_rotate.sh [VM.name]")
	switch(.)
		if(null)
			message_admins("Failed to change map: Could not run map rotator")
			log_game("Failed to change map: Could not run map rotator")
		if(0)
			log_game("Changed to map [VM.friendlyname]")
			nextmap = VM

		//1x: file errors
		if(1)
			message_admins("Compile failed")
			log_game("Compile failed")

/client/proc/update_server()
	set category = "Server"
	set name = "Update Server"
	if (!usr.client.holder)
		return
	var/confirm = alert("End the round and update server?", "End Round", "Yes", "Cancel")
	if(confirm == "Cancel")
		return
	if(confirm == "Yes")
		message_admins("[key_name_admin(usr)] запустил(а) обновление сервера.")
		log_game("[key_name_admin(usr)] запустил(а) обновление сервера.")
		force_update_server()

/client/proc/update_server_round_end()
	set category = "Server"
	set name = "Update Server at Round End"
	if (!usr.client.holder)
		return
	var/confirm = alert("Инициировать обновление в конце раунда?", "End Round", "Yes", "Cancel")
	if(confirm == "Cancel")
		return
	if(confirm == "Yes")
		message_admins("[key_name_admin(usr)] инициировал(а) обновление сервера в конце текущего раунда.")
		log_game("[key_name_admin(usr)] инициировал(а) обновление сервера в конце текущего раунда.")
		world << "<span class='adminooc'>Администратор [usr.key] инициировал(а) обновление сервера в конце текущего раунда.</span>"
		ticker.updater_ckey = usr.key
		ticker.update_waiting = 1

/proc/force_update_server()
	world << "<span class='adminooc'><FONT size=5>ВНИМАНИЕ! СЕРВЕР ОБНОВЛЯЕТСЯ ЧЕРЕЗ 10 СЕКУНД! СЕРВЕР НЕ БУДЕТ РАБОТАТЬ НЕСКОЛЬКО МИНУТ!</FONT><br>Обновление в конце раунда инициировано администратором [ticker.updater_ckey]</span>."
	playsound_global('sound/effects/alarm.ogg', repeat=0, channel=1, volume=100)
	sleep(100)
	shell("sh update.sh")