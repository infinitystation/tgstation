/datum/report
	var/info
	var/time
	var/title

/proc/send_report(datum/report/R, mob/Sender)
	if(!R)
		return
	if(!istype(R))
		return

	var/msg
	for(var/client/X in admins)
		if(X.prefs.toggles & SOUND_ADMINHELP)
			X << 'sound/effects/adminhelp.ogg'
	msg = "<span class='adminnotice'><b><font color=orange>STATION REPORT:</font>[key_name_admin(Sender)] (<A HREF='?_src_=holder;adminmoreinfo=\ref[Sender]'>?</A>) (<A HREF='?_src_=holder;adminplayeropts=\ref[Sender]'>PP</A>) (<A HREF='?_src_=vars;Vars=\ref[Sender]'>VV</A>) (<A HREF='?_src_=holder;subtlemessage=\ref[Sender]'>SM</A>) (<A HREF='?_src_=holder;adminplayerobservefollow=\ref[Sender]'>FLW</A>) (<A HREF='?_src_=holder;traitor=\ref[Sender]'>TP</A>) (<A HREF='?_src_=holder;BlueSpaceArtillery=\ref[Sender]'>BSA</A>) (<A HREF='?_src_=holder;CentcommReply=\ref[Sender]'>RPLY</A>):</b> Отчет: <A HREF='?_src_=holder;show_report=\ref[R]'>[R.title]</A></span>"
	admins << msg
	for(var/obj/machinery/computer/communications/C in machines)
		C.overrideCooldown()

/client/proc/show_reports()
	set category = "Admin"
	set name = "Show reports"

	if(!holder)
		src << "<font color='red'>Error: Freeze: Only administrators may use this command.</font>"
		return

	var/dat = "<b>Отчеты от станции за текущий раунд</b><BR>"

	for(var/i in SSticker.reports)
		var/datum/report/R = i
		var/temp_time = time2text(R.time - timezoneOffset + 432000, "hh:mm:ss")
		dat += "[temp_time] - <A HREF='?_src_=holder;show_report=\ref[R]'>[R.title]</A><BR>"

	usr << browse(dat, "window=show_reports")

	feedback_add_details("admin_verb","SRPS") //If you are copy-pasting this, ensure the 2nd parameter is unique to the new proc!

/client/proc/show_report(datum/report/R)
	if(!holder)
		return
	if(!R)
		return
	if(!istype(R))
		return

	var/datum/asset/assets = get_asset_datum(/datum/asset/simple/paper)
	assets.send(usr)

	var/dat = R.info
	usr << browse(dat, "window=show_report")
	onclose(usr, "[R.title]")

	feedback_add_details("admin_verb","SRP") //If you are copy-pasting this, ensure the 2nd parameter is unique to the new proc!
