/datum/mind/proc/remove_all_antag_light() //For the Lazy amongst us.
	safe_unrolled = 1
	special_role_old = special_role
	special_role = null
	if(remove_traitor_light() || remove_nukeop_light() || remove_wizard_light() || remove_rev_light() || remove_gang())
		current << "<span class='userdanger'>Вы более не спецроль! Не спрашивайте администрацию, это IC ситуаци&#255;</span>"
		return 1
	else
		return 0

/datum/mind/proc/readd_antag_light()
	if(special_role_old)
		special_role = special_role_old
		safe_unrolled = 0
		add_traitor_light()
		add_nukeop_light()
		add_wizard_light()
		add_headrev_light()
	if(special_role)
		current << "<span class='notice'>Вы получили свою спецроль обратно.</span>"
		return 1
	else
		return 0

/datum/mind/proc/remove_rev_light()
	if(src in SSticker.mode.revolutionaries)
		SSticker.mode.revolutionaries -= src
		SSticker.mode.update_rev_icons_removed(src)
	else if(src in SSticker.mode.head_revolutionaries)
		SSticker.mode.head_revolutionaries -= src
		SSticker.mode.update_rev_icons_removed(src)
		current.verbs -= /mob/living/carbon/human/proc/RevConvert
		return 1
	else
		return 0

/datum/mind/proc/remove_wizard_light()
	if(src in SSticker.mode.wizards)
		SSticker.mode.wizards -= src
		current.spellremove(current)
		return 1
	else
		return 0

/datum/mind/proc/remove_nukeop_light()
	if(src in SSticker.mode.syndicates)
		SSticker.mode.syndicates -= src
		SSticker.mode.update_synd_icons_removed(src)
		return 1
	else
		return 0

/datum/mind/proc/remove_traitor_light()
	if(src in SSticker.mode.traitors)
		SSticker.mode.traitors -= src
		return 1
	else
		return 0

/datum/mind/proc/add_headrev_light()
	if(special_role == "Head Revolutionary")
		SSticker.mode.head_revolutionaries += src
		SSticker.mode.update_rev_icons_added(src)
		current.verbs += /mob/living/carbon/human/proc/RevConvert
		return 1
	else
		return 0


/datum/mind/proc/add_wizard_light()
	if(special_role == "Wizard")
		SSticker.mode.wizards += src
		return 1
	else
		return 0


/datum/mind/proc/add_nukeop_light()
	if(special_role == "Syndicate")
		SSticker.mode.syndicates += src
		SSticker.mode.update_synd_icons_added(src)
		return 1
	else
		return 0


/datum/mind/proc/add_traitor_light()
	if(special_role == "Traitor")
		SSticker.mode.traitors += src
		return 1
	else
		return 0