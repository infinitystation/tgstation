////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
//////Freeze Mob/Mech Verb -- Ported from NSS Pheonix (Unbound Travels)/////////
////////////////////////////////////////////////////////////////////////////////
//////Allows admin's to right click on any mob/mech and freeze them in place.///
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
var/global/list/frozen_mob_list = list()
/client/proc/freeze(var/mob/living/M as mob in mob_list)
	set category = "Special Verbs"
	set name = "Freeze"
	if(!holder)
		src << "<font color='red'>Error: Freeze: Only administrators may use this command.</font>"
		return
	if(!istype(M))
		return
	if(!check_rights(R_ADMIN))
		return
	if(M in frozen_mob_list)
		M.admin_unFreeze(src)
	else
		M.admin_Freeze(src)

///mob freeze procs

/mob/living/var/frozen = 0 //used for preventing attacks on admin-frozen mobs
/mob/living/var/admin_prev_sleeping = 0 //used for keeping track of previous sleeping value with admin freeze

/mob/living/proc/admin_Freeze(var/client/admin)
	if(istype(admin))
		src << "<b><font color= red>You have been frozen by <a href='?priv_msg=\ref[admin]'>[admin.key]</a></b></font>"
		message_admins("[key_name_admin(admin)] froze [key_name(src)]")
		log_admin("[key_name(admin)] froze [key_name(src)]")

	var/obj/effect/overlay/adminoverlay/AO = new
	src.overlays += AO

	anchored = 1
	frozen = 1
	admin_prev_sleeping = sleeping
	SetSleeping(sleeping+20000)
	if(!(src in frozen_mob_list))
		frozen_mob_list += src

/mob/living/proc/admin_unFreeze(var/client/admin)
	if(istype(admin))
		src << "<b><font color= red>You have been unfrozen by <a href='?priv_msg=\ref[usr.client]'>[key]</a></b></font>"
		message_admins("[key_name_admin(admin)] unfroze [key_name(src)]")
		log_admin("[key_name(admin)] unfroze [key_name(src)]")

	var/obj/effect/overlay/adminoverlay/AO = new
	src.overlays -= AO
	update_icons()

	anchored = 0
	frozen = 0
	SetSleeping(admin_prev_sleeping)
	admin_prev_sleeping = null
	if(src in frozen_mob_list)
		frozen_mob_list -= src


/mob/living/simple_animal/var/admin_prev_health = null

/mob/living/simple_animal/admin_Freeze(admin)
	..(admin)
	admin_prev_health = health
	health = 0

/mob/living/simple_animal/admin_unFreeze(admin)
	..(admin)
	revive()
	overlays.Cut()

//////////////////////////Freeze Mech

/client/proc/freezemecha(obj/mecha/O)
	set category = "Special Verbs"
	set name = "Freeze Mech"
	if(!holder)
		src << "Only administrators may use this command."
		return
	var/obj/mecha/M = O
	if(!istype(M,/obj/mecha))
		src << "\red <b>This can only be used on Mechs!</b>"
		return
	else
		if(usr)
			if (usr.client)
				if(usr.client.holder)
					var/adminomaly = new/obj/effect/overlay/adminoverlay
					if(!M.frozen)
						M.frozen = 1
						M.overlays += adminomaly
						STOP_PROCESSING(SSobj, M)
						if(M.occupant)
							M.occupant << "<b><font color= red>You have been frozen by <a href='?priv_msg=\ref[usr.client]'>[key]</a></b></font>"
							message_admins("[key_name_admin(usr)] froze [key_name(M.occupant)] in a [M.name]")
							log_admin("[key_name(usr)] froze [key_name(M.occupant)] in a [M.name]")
						else
							message_admins("[key_name_admin(usr)] froze an empty [M.name]")
							log_admin("[key_name(usr)] froze an empty [M.name]")
					else if(M.frozen)
						M.frozen = 0
						M.overlays -= adminomaly
						START_PROCESSING(SSobj, M)
						if(M.occupant)
							M.occupant << "<b><font color= red>You have been unfrozen by <a href='?priv_msg=\ref[usr.client]'>[key]</a></b></font>"
							message_admins("[key_name_admin(usr)] unfroze [key_name(M.occupant)] in a [M.name]")
							log_admin("[key_name(usr)] unfroze [M.occupant.name]/[M.occupant.ckey] in a [M.name]")
						else
							message_admins("[key_name_admin(usr)] unfroze an empty [M.name]")
							log_admin("[key_name(usr)] unfroze an empty [M.name]")

/client/freezemecha/Topic(href, href_list)
	if(href_list["freezemecha"])
		freezemecha()