/datum/mind/proc/remove_all_antag_light() //For the Lazy amongst us.
	safe_unrolled = 1
	special_role_old = special_role
	special_role = null
	remove_traitor_light()
	remove_nukeop_light()
	remove_wizard_light()
	remove_rev_light()
	remove_gang_light()
	current << "<span class='userdanger'>Вы более не спецроль! Ваша спецроль вернетс&#255;, когда вам снова вколют имплант противодействи&#255; ло&#255;льности</span>"

/datum/mind/proc/readd_antag_light()
	special_role = special_role_old
	safe_unrolled = 0
	add_traitor_light()
	add_nukeop_light()
	add_wizard_light()
	add_headrev_light()
	if(special_role)
		current << "<span class='notice'>Вы получили свою спецроль обратно.</span>"

/datum/mind/proc/remove_rev_light()
	if(src in ticker.mode.revolutionaries)
		ticker.mode.revolutionaries -= src
		ticker.mode.update_rev_icons_removed(src)
	if(src in ticker.mode.head_revolutionaries)
		ticker.mode.head_revolutionaries -= src
		ticker.mode.update_rev_icons_removed(src)
	current.verbs -= /mob/living/carbon/human/proc/RevConvert

/datum/mind/proc/remove_wizard_light()
	if(src in ticker.mode.wizards)
		ticker.mode.wizards -= src
		current.spellremove(current)

/datum/mind/proc/remove_nukeop_light()
	if(src in ticker.mode.syndicates)
		ticker.mode.syndicates -= src
		ticker.mode.update_synd_icons_removed(src)

/datum/mind/proc/remove_traitor_light()
	if(src in ticker.mode.traitors)
		ticker.mode.traitors -= src

/datum/mind/proc/remove_gang_light()
		ticker.mode.remove_gangster(src,0,1)

/datum/mind/proc/add_headrev_light()
	if(special_role == "Head Revolutionary")
		ticker.mode.head_revolutionaries += src
		ticker.mode.update_rev_icons_added(src)
		current.verbs += /mob/living/carbon/human/proc/RevConvert


/datum/mind/proc/add_wizard_light()
	if(special_role == "Wizard")
		ticker.mode.wizards += src


/datum/mind/proc/add_nukeop_light()
	if(special_role == "Syndicate")
		ticker.mode.syndicates += src
		ticker.mode.update_synd_icons_added(src)


/datum/mind/proc/add_traitor_light()
	if(special_role == "Traitor")
		ticker.mode.traitors += src