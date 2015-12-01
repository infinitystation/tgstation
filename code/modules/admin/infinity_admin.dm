/datum/admins/proc/reset_vote()
	set category = "Admin"
	set name = "Reset Vote"
	set desc = "Resets Vote"

	if(!check_rights())
		return

	SSvote.reset()

	message_admins("<span class='adminnotice'>[key_name_admin(usr)] сбросил(а) голосование.</span>")
	log_admin("[key_name_admin(usr)] сбросил(а) голосование.")
	feedback_add_details("admin_verb","RSVT")

/*
check
check
check
*/