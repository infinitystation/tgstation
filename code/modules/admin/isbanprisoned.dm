/client/proc/IsBanPrisoned(key, address, computer_id)
	if (!key)
		return 0

	if(ckey(key))
		if(!config.ban_legacy_system)
			var/ipquery
			var/cidquery
			if(address)
				ipquery = " OR ip = '[address]' "

			if(computer_id)
				cidquery = " OR computerid = '[computer_id]' "

			var/ckeytext = ckey(key)

			if(!establish_db_connection())
				world.log << "Ban database connection failure. Player [ckeytext] not checked (ban prison)"
				diary << "Ban database connection failure. Player [ckeytext] not checked (ban prison)"
				return

			var/DBQuery/query = dbcon.NewQuery("SELECT ckey, ip, computerid, a_ckey, reason, expiration_time, duration, bantime FROM [format_table_name("ban")] WHERE (ckey = '[ckeytext]' [ipquery] [cidquery]) AND (bantype = 'SOFT_PERMABAN'  OR (bantype = 'SOFT_TEMPBAN' AND expiration_time > Now())) AND isnull(unbanned)")

			query.Execute()

			while(query.NextRow())
				var/pckey = query.item[1]
				//var/pip = query.item[2]
				//var/pcid = query.item[3]
				var/ackey = query.item[4]
				var/reason = query.item[5]
				var/expiration = query.item[6]
				var/duration = query.item[7]
				var/bantime = query.item[8]
				var/expires

				if(text2num(duration) > 0)
					expires = "Ёто бан на [duration] минут, и он сниметс&#255; в [expiration] по серверному времени (ћ— -1)."

				src.banprisoned_reason = "¬ы, или кто-то другой, кто использовал(а) ваш компьютер или соединение ([pckey]) были забанены бан-тюрьмой по причине: [reason]. Ётот бан выдал(а) администратор [ackey], в [bantime]. [expires]\n"
				return 1
			return 0
	else
		return 0

/mob/new_player/proc/new_player_panel_prisoner()
	var/output = "<center><p><a href='byond://?src=\ref[src];show_preferences=1'>Setup Character</A></p>"

	if(!ticker || ticker.current_state <= GAME_STATE_PREGAME)
		output += "<p>ƒќЅ–ќ ѕќ∆јЋќ¬ј“№</p>"
		output += "<p>«Ё  ¬ «ј ќЌ≈</p>"
	else
		output += "<p>ƒќЅ–ќ ѕќ∆јЋќ¬ј“№</p>"
		output += "<p>«Ё  ¬ «ј ќЌ≈</p>"
		output += "<p><a href='byond://?src=\ref[src];spawn_prisoner=1'>Join as Prisoner</A></p>"

	output += "</center>"

	//src << browse(output,"window=playersetup;size=210x240;can_close=0")
	var/datum/browser/popup = new(src, "playersetup", "<div align='center'>New Player Options</div>", 220, 265)
	popup.set_window_options("can_close=0")
	popup.set_content(output)
	popup.open(0)
	return

/client/verb/request_unmute_adminhelp()
	set name = "ќтправить просьбу на размут в ј’"
	set category = "Admin"
	adminmutetimerid = addtimer(src,"giverequestadminhelpverb",3000) //5 minute cooldown of request admin helps
	src.verbs -= /client/verb/request_unmute_adminhelp
	message_admins("[key_name(src, 1)] просит снять мут. „тобы снять мут, нажмите <A href='?_src_=holder;unmuteadminhelprequest=[src.mob.ckey];'>сюда</a>")
	for(var/client/X in admins)
		if(X.prefs.toggles & SOUND_ADMINHELP)
			X << 'sound/effects/adminhelp.ogg'
	src << "¬ы отправили просьбу о размуте админам"

/client/var/adminmutetimerid = 0

/client/proc/giverequestadminhelpverb()
	src.verbs |= /client/verb/request_unmute_adminhelp
	adminmutetimerid = 0