/datum/mind/proc/remove_all_antag_light() //For the Lazy amongst us.
	safe_unrolled = 1
	special_role_old = special_role
	special_role = null
	if(remove_traitor() || remove_nukeop() || remove_wizard() || remove_rev())
		current << "<span class='userdanger'>Вы более не спецроль! Не спрашивайте администрацию, это IC ситуаци&#255;</span>"
		return 1
	else
		return 0

// TODO@inf-dev: переработать под антаг-датумы ~bear1ake
/datum/mind/proc/readd_antag_light()
	current << "Невозможно сейчас. Попросите администраторов."
	/*if(special_role_old)
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
		return 0*/

/mob/living/carbon/human/proc/RevConvert()
	set name = "Rev-Convert"
	set category = "IC"
	var/list/Possible = list()
	for (var/mob/living/carbon/human/P in view(src.loc))
		if(!stat && P.client && P.mind && !P.mind.special_role)
			Possible += P
	if(!Possible.len)
		src << "<span class='warning'>There doesn't appear to be anyone available for you to convert here.</span>"
		return
	var/mob/living/M = input("Select a person to convert", "Viva la revolution!", null) as mob in Possible
	var/datum/antagonist/rev/head/converter = mind.has_antag_datum(/datum/antagonist/rev)
	if(!converter)
		converter = mind.has_antag_datum(/datum/antagonist/rev/head)	//try again
	if(converter)
		if(M.mind.has_antag_datum(/datum/antagonist/rev) || M.mind.has_antag_datum(/datum/antagonist/rev/head))
			src << "<span class='warning'><b>[M] is already be a revolutionary!</b></span>"
		else if(isloyal(M))
			src << "<span class='warning'><b>[M] is implanted with a loyalty implant - Remove it first!</b></span>"
		else
			if(world.time < M.mind.rev_cooldown)
				src << "<span class='notice'>Wait five seconds before reconversion attempt.</span>"
				return
			src << "<span class='warning'>Attempting to convert [M]...</span>"
			log_admin("[src]([src.ckey]) attempted to convert [M].")
			message_admins("<span class='warning'>[src]([src.ckey]) attempted to convert [M].</span>")
			var/choice = alert(M,"Asked by [src]: Do you want to join the revolution?","Align Thyself with the Revolution!","No!","Yes!")
			if(choice == "Yes!")
				converter.add_revolutionary(M.mind)
				M << "<span class='notice'>You join the revolution!</span>"
				src << "<span class='notice'><b>[M] joins the revolution!</b></span>"
			else if(choice == "No!")
				M << "<span class='notice'>You reject this traitorous cause!</span>"
				src << "<span class='notice'><b>[M] does not support the revolution!</b></span>"
			M.mind.rev_cooldown = world.time+50
	return M && istype(M) && M.mind && M.mind.has_antag_datum(/datum/antagonist/rev/head)