/client/proc/IsBanPrisoned(key)
	if (!key)
		return 0

	if(ckey(key))
		if(!config.ban_legacy_system)
			var/ckeytext = ckey(key)
			var/reason
			var/p_ckey

			if(!establish_db_connection())
				world.log << "Ban database connection failure. Player [ckeytext] not checked (ban prison)"
				diary << "Ban database connection failure. Player [ckeytext] not checked (ban prison)"
				return

			var/DBQuery/query = dbcon.NewQuery("SELECT ckey, reason FROM [format_table_name("ban")] WHERE (ckey = '[ckeytext]') AND (bantype = 'SOFT_PERMABAN'  OR (bantype = 'SOFT_TEMPBAN' AND expiration_time > Now())) AND isnull(unbanned)")

			query.Execute()

			while(query.NextRow())
				p_ckey = query.item[1]
				reason = query.item[2]
				if(p_ckey == ckeytext)
					src.banprisoned_reason = "Âû áûëè çàáàíåíû áàí-òşğüìîé ïî ïğè÷èíå: [reason]"
					return 1
				else
					return 0
	else
		return 0

/mob/new_player/proc/new_player_panel_prisoner()
	var/output = "<center><p><a href='byond://?src=\ref[src];show_preferences=1'>Setup Character</A></p>"

	if(!ticker || ticker.current_state <= GAME_STATE_PREGAME)
		output += "<p>ÄÎÁĞÎ ÏÎÆÀËÎÂÀÒÜ</p>"
		output += "<p>ÇİÊ Â ÇÀÊÎÍÅ</p>"
	else
		output += "<p>ÄÎÁĞÎ ÏÎÆÀËÎÂÀÒÜ</p>"
		output += "<p>ÇİÊ Â ÇÀÊÎÍÅ</p>"
		output += "<p><a href='byond://?src=\ref[src];spawn_prisoner=1'>Join as Prisoner</A></p>"

	output += "</center>"

	//src << browse(output,"window=playersetup;size=210x240;can_close=0")
	var/datum/browser/popup = new(src, "playersetup", "<div align='center'>New Player Options</div>", 220, 265)
	popup.set_window_options("can_close=0")
	popup.set_content(output)
	popup.open(0)
	return