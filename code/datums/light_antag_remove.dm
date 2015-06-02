/datum/mind/proc/remove_all_antag_light() //For the Lazy amongst us.
	remove_traitor_light()
	remove_nukeop_light()
	remove_wizard_light()
	remove_rev_light()
	remove_gang()

/datum/mind/proc/remove_rev_light()
	if(src in ticker.mode.revolutionaries)
		ticker.mode.revolutionaries -= src
		ticker.mode.update_rev_icons_removed(src)
	if(src in ticker.mode.head_revolutionaries)
		ticker.mode.head_revolutionaries -= src
		ticker.mode.update_rev_icons_removed(src)
	current.verbs -= /mob/living/carbon/human/proc/RevConvert
	special_role = null
	remove_objectives()

/datum/mind/proc/remove_wizard_light()
	if(src in ticker.mode.wizards)
		ticker.mode.wizards -= src
		current.spellremove(current)
	special_role = null
	remove_objectives()

/datum/mind/proc/remove_nukeop_light()
	if(src in ticker.mode.syndicates)
		ticker.mode.syndicates -= src
		ticker.mode.update_synd_icons_removed(src)
	special_role = null
	remove_objectives()

/datum/mind/proc/remove_traitor_light()
	if(src in ticker.mode.traitors)
		ticker.mode.traitors -= src
	special_role = null
	remove_objectives()