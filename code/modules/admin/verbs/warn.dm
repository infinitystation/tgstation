#define MAX_WARNS 3
#define AUTOBANTIME 20

/client/proc/warn(warned_ckey)
	if(!check_rights(R_ADMIN))
		return
	if(!warned_ckey || !istext(warned_ckey))
		return
	if(warned_ckey in GLOB.admin_datums)
		usr << "<font color='red'>Error: warn(): You can't warn admins.</font>"
		return

	var/datum/preferences/D
	var/client/C = GLOB.directory[warned_ckey]
	if(C)
		D = C.prefs
	else
		D = GLOB.preferences_datums[warned_ckey]

	if(!D)
		src << "<font color='red'>Error: warn(): No such ckey found.</font>"
		return

	if(++D.warns >= MAX_WARNS)					//uh ohhhh...you'reee iiiiin trouuuubble O:)
		ban_unban_log_save("[ckey] warned [warned_ckey], resulting in a [AUTOBANTIME] minute autoban.")
		if(C)
			message_admins("[key_name_admin(src)] has warned [key_name_admin(C)] resulting in a [AUTOBANTIME] minute ban.")
			C << "<font color='red'><BIG><B>Вы получили автобан из-за предупреждени&#255; администратора [ckey].</B></BIG><br>Это временный бан, он снимется через [AUTOBANTIME] минут."
			del(C)
		else
			message_admins("[key_name_admin(src)] has warned [warned_ckey] resulting in a [AUTOBANTIME] minute ban.")
		AddBan(warned_ckey, D.last_id, "Автобан в результате множественных предупреждении", ckey, 1, AUTOBANTIME)
		SSblackbox.inc("ban_warn",1)
	else
		if(C)
			C << "<font color='red'><BIG>Вам выдано предупреждение</BIG><br>Дальшейние предупреждени&#255; могут привести к автобану</font>"
			message_admins("[key_name_admin(src)] has warned [key_name_admin(C)]. They have [MAX_WARNS-D.warns] strikes remaining.")
		else
			message_admins("[key_name_admin(src)] has warned [warned_ckey] (DC). They have [MAX_WARNS-D.warns] strikes remaining.")

	SSblackbox.add_details("admin_verb","WARN") //If you are copy-pasting this, ensure the 2nd parameter is unique to the new proc!

#undef MAX_WARNS
#undef AUTOBANTIME