proc/IsBanPrisoned(key)
	if (!key)
		return 0

	if(ckey(key))
		if(!config.ban_legacy_system)
			var/ckeytext = ckey(key)
			var/banprison

			if(!establish_db_connection())
				world.log << "Ban database connection failure. Player [ckeytext] not checked (ban prison)"
				diary << "Ban database connection failure. Player [ckeytext] not checked (ban prison)"
				return

			var/DBQuery/query = dbcon.NewQuery("SELECT ban_prison FROM [format_table_name("ban")] WHERE (ckey = '[ckeytext]') AND (bantype = 'PERMABAN'  OR (bantype = 'TEMPBAN' AND expiration_time > Now())) AND isnull(unbanned)")

			query.Execute()

			while(query.NextRow())
				banprison = query.item[1]
				if(banprison)
					return 1
				else
					return 0
	else
		return 0