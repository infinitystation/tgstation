/client/proc/IsBanPrisoned(key, address, computer_id)
	if (!key)
		return 0

	var/ckeytext = ckey(key)

	if(!dbcon.Connect())
		log_world("Ban database connection failure. Key [ckeytext] not checked")
		diary << "Ban database connection failure. Key [ckeytext] not checked"
		return


	var/ipquery = ""
	var/cidquery = ""
	if(address)
		ipquery = " OR ip = INET_ATON('[address]') "

	if(computer_id)
		cidquery = " OR computerid = '[computer_id]' "

	var/DBQuery/query_ban_check = dbcon.NewQuery("SELECT ckey, a_ckey, reason, expiration_time, duration, bantime FROM [format_table_name("ban")] WHERE (ckey = '[ckeytext]' [ipquery] [cidquery]) AND (bantype = 'SOFT_PERMABAN'  OR (bantype = 'SOFT_TEMPBAN' AND expiration_time > Now())) AND isnull(unbanned)")

	if(!query_ban_check.Execute())
		return

	while(query_ban_check.NextRow())
		var/pckey = query_ban_check.item[1]
		var/ackey = query_ban_check.item[2]
		var/reason = query_ban_check.item[3]
		var/expiration = query_ban_check.item[4]
		var/duration = query_ban_check.item[5]
		var/bantime = query_ban_check.item[6]
		var/expires

		if(text2num(duration) > 0)
			expires = "Это бан на [duration] минут, и он сниметс&#255; в [expiration] по серверному времени (МСК-2)."
		else
			expires = " The is a permanent ban."

		src.banprisoned_reason = "Вы, или кто-то другой, кто использовал(а) ваш компьютер или соединение ([pckey]) были забанены бан-тюрьмой по причине: [reason]. Этот бан выдал(а) администратор [ackey], в [bantime]. [expires]\n"
		return 1
	return 0

/mob/dead/new_player/proc/new_player_panel_prisoner()
	var/output = "<center><p><a href='byond://?src=\ref[src];show_preferences=1'>Setup Character</A></p>"

	if(!SSticker || SSticker.current_state <= GAME_STATE_PREGAME)
		output += "<p>ДОБРО ПОЖАЛОВАТЬ</p>"
		output += "<p>ЗЭК В ЗАКОНЕ</p>"
	else
		output += "<p>ДОБРО ПОЖАЛОВАТЬ</p>"
		output += "<p>ЗЭК В ЗАКОНЕ</p>"
		output += "<p><a href='byond://?src=\ref[src];spawn_prisoner=1'>Join as Prisoner</A></p>"

	output += "</center>"

	//src << browse(output,"window=playersetup;size=210x240;can_close=0")
	var/datum/browser/popup = new(src, "playersetup", "<div align='center'>New Player Options</div>", 220, 265)
	popup.set_window_options("can_close=0")
	popup.set_content(output)
	popup.open(0)
	return

/mob/dead/new_player/proc/Spawn_Prisoner()
	var/mob/living/carbon/human/character = create_character(TRUE)	//creates the human and transfers vars and mind

	character.loc = pick(ban_prison)

	setup_and_greet_prisoner(character)
	character.equipOutfit(/datum/outfit/prisoner)
	qdel(src)

/client/verb/request_unmute_adminhelp()
	set name = "Отправить просьбу на размут в АХ"
	set category = "Admin"
	adminmutetimerid = addtimer(src, CALLBACK(.proc/giverequestadminhelpverb), 3000, TIMER_UNIQUE) //5 minute cooldown of request admin helps
	src.verbs -= /client/verb/request_unmute_adminhelp
	message_admins("[key_name(src, 1)] просит снЯть мут. Чтобы снЯть мут, нажмите <A href='?_src_=holder;unmuteadminhelprequest=[src.mob.ckey];'>сюда</a>")
	for(var/client/X in admins)
		if(X.prefs.toggles & SOUND_ADMINHELP)
			X << 'sound/effects/adminhelp.ogg'
	src << "Вы отправили просьбу о размуте админам"

/client/var/adminmutetimerid = 0

/client/proc/giverequestadminhelpverb()
	src.verbs |= /client/verb/request_unmute_adminhelp
	adminmutetimerid = 0

/datum/outfit/prisoner
	name = "Standard Gear"

	uniform = /obj/item/clothing/under/rank/prisoner
	shoes = /obj/item/clothing/shoes/sneakers/orange/legcuffs

/mob/dead/new_player/proc/setup_and_greet_prisoner(mob/living/carbon/human/character)
	character.client.prefs.be_special = list()
	character.client.prefs.toggles &= ~(MIDROUND_ANTAG)
	character.client.prefs.chat_toggles = TOGGLES_PRISONER_CHAT
	character.client.prefs.save_preferences()
	character << character.client.banprisoned_reason
	text = {"Здравствуйте, вы являетесь заключенным в тюрьме строгого режима.
Вы попали сюда по причине, которая была описана выше при входе в игру.
	"}
	character << sanitize_a0(text)
	message_admins("<span class='notice'>[key_name_admin(character.key)](<A HREF='?_src_=holder;adminmoreinfo=\ref[character]'>?</A>)(<A HREF='?_src_=holder;adminplayerobservefollow=\ref[character]'>FLW</A>) в игре как заключенный.</span>")