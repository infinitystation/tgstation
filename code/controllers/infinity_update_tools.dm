/datum/subsystem/ticker
	var/update_waiting = 0				//build updating?
	var/updater_ckey = ""				//who updating build?

/client/proc/update_server()
	set category = "Server"
	set name = "Update Server"
	if (!usr.client.holder)
		return
	if(currentbuild.folder == currentbuild.update)
		usr << "Îøèáêà. Ïåðåêëþ÷èòå áèëä íà îñíîâíîé"
		return
	var/confirm = alert("End the round and update server?", "End Round", "Yes", "Cancel")
	if(confirm == "Cancel")
		return
	if(confirm == "Yes")
		message_admins("[key_name_admin(usr)] çàïóñòèë(à) îáíîâëåíèå ñåðâåðà.")
		log_game("[key_name_admin(usr)] çàïóñòèë(à) îáíîâëåíèå ñåðâåðà.")
		force_update_server()

/client/proc/update_server_round_end()
	set category = "Server"
	set name = "Update Server at Round End"
	if (!usr.client.holder)
		return
	if(currentbuild.folder == currentbuild.update)
		usr << "Îøèáêà. Ïåðåêëþ÷èòå áèëä íà îñíîâíîé"
		return
	var/confirm = alert("Èíèöèèðîâàòü îáíîâëåíèå â êîíöå ðàóíäà?", "End Round", "Yes", "Cancel")
	if(confirm == "Cancel")
		return
	if(confirm == "Yes")
		message_admins("[key_name_admin(usr)] èíèöèèðîâàë(à) îáíîâëåíèå ñåðâåðà â êîíöå òåêóùåãî ðàóíäà.")
		log_game("[key_name_admin(usr)] èíèöèèðîâàë(à) îáíîâëåíèå ñåðâåðà â êîíöå òåêóùåãî ðàóíäà.")
		world << "<span class='adminooc'>Àäìèíèñòðàòîð [usr.key] èíèöèèðîâàë(à) îáíîâëåíèå ñåðâåðà â êîíöå òåêóùåãî ðàóíäà.</span>"
		ticker.updater_ckey = usr.key
		ticker.update_waiting = 1

/proc/force_update_server()
	if(currentbuild.folder == currentbuild.update)
		world << "Îøèáêà îáíîâëåíè&#255;. Ïåðåêëþ÷èòåñü èç òåñòîâîãî áèëäà íà îñíîâíîé."
		return
	world << "<span class='adminooc'><FONT size=5>ÂÍÈÌÀÍÈÅ! ÑÅÐÂÅÐ ÎÁÍÎÂËßÅÒÑß ×ÅÐÅÇ 10 ÑÅÊÓÍÄ! ÑÅÐÂÅÐ ÍÅ ÁÓÄÅÒ ÐÀÁÎÒÀÒÜ ÍÅÑÊÎËÜÊÎ ÌÈÍÓÒ!</FONT><br>Îáíîâëåíèå â êîíöå ðàóíäà èíèöèèðîâàíî àäìèíèñòðàòîðîì [ticker.updater_ckey]</span>."
	playsound_global('sound/effects/alarm.ogg', repeat=0, channel=1, volume=100)
	sleep(100)
	shell("infinityctl update -b tgstation --autostart")//TODO: ïîìåíÿòü
