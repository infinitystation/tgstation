// To add a rev to the list of revolutionaries, make sure it's rev (with if(SSticker.mode.name == "revolution)),
// then call SSticker.mode:add_revolutionary(_THE_PLAYERS_MIND_)
// nothing else needs to be done, as that proc will check if they are a valid target.
// Just make sure the converter is a head before you call it!
// To remove a rev (from brainwashing or w/e), call SSticker.mode:remove_revolutionary(_THE_PLAYERS_MIND_),
// this will also check they're not a head, so it can just be called freely
// If the game somtimes isn't registering a win properly, then SSticker.mode.check_win() isn't being called somewhere.


/datum/game_mode/revolution
	name = "revolution"
	config_tag = "revolution"
	antag_flag = ROLE_REV
	restricted_jobs = list("Security Officer", "Warden", "Detective", "AI", "Cyborg","Captain", "Head of Personnel", "Head of Security", "Chief Engineer", "Research Director", "Chief Medical Officer")
	required_players = 20
	required_enemies = 1
	restricted_jobs = list("Security Officer", "Warden", "Detective", "AI", "Cyborg","Captain", "Head of Personnel", "Head of Security", "Chief Engineer", "Research Director", "Chief Medical Officer", "Internal Affairs Agent")
	required_players = 10
	required_enemies = 1
	false_report_weight = 10
	restricted_jobs = list("Security Officer", "Warden", "Detective", "AI", "Cyborg","Captain", "Head of Personnel", "Head of Security", "Chief Engineer", "Research Director", "Chief Medical Officer")
	required_players = 30
	required_enemies = 2
	recommended_enemies = 3
	enemy_minimum_age = 14

	announce_span = "danger"
	announce_text = "Some crewmembers are attempting a coup!\n\
	<span class='danger'>Revolutionaries</span>: Expand your cause and overthrow the heads of staff by execution or otherwise.\n\
	<span class='notice'>Crew</span>: Prevent the revolutionaries from taking over the station."

	var/finished = 0
	var/check_counter = 0
	var/max_headrevs = 3
	var/datum/team/revolution/revolution
	var/list/datum/mind/headrev_candidates = list()
	var/end_when_heads_dead = TRUE

///////////////////////////
//Announces the game type//
///////////////////////////
/datum/game_mode/revolution/announce()
	to_chat(world, "<B>The current game mode is - Revolution!</B>")
	to_chat(world, "<B>Some crewmembers are attempting to start a revolution!<BR>\nRevolutionaries - Kill the Captain, HoP, HoS, CE, RD and CMO. Convert other crewmembers (excluding the heads of staff, and security officers) to your cause by flashing them. Protect your leaders.<BR>\nPersonnel - Protect the heads of staff. Kill the leaders of the revolution, and brainwash the other revolutionaries (by beating them in the head).</B>")


///////////////////////////////////////////////////////////////////////////////
//Gets the round setup, cancelling if there's not enough players at the start//
///////////////////////////////////////////////////////////////////////////////
/datum/game_mode/revolution/pre_setup()

	if(CONFIG_GET(flag/protect_roles_from_antagonist))
		restricted_jobs += protected_jobs

	if(CONFIG_GET(flag/protect_assistant_from_antagonist))
		restricted_jobs += "Assistant"

	for (var/i=1 to max_headrevs)
		if (antag_candidates.len==0)
			break
		var/datum/mind/lenin = antag_pick(antag_candidates)
		antag_candidates -= lenin
		headrev_candidates += lenin
		lenin.restricted_roles = restricted_jobs

	if(headrev_candidates.len < required_enemies)
		return FALSE

	return TRUE

/datum/game_mode/revolution/post_setup()
	var/list/heads = SSjob.get_living_heads()
	var/list/sec = SSjob.get_living_sec()
	var/weighted_score = min(max(round(heads.len - ((8 - sec.len) / 3)),1),max_headrevs)

	for(var/datum/mind/rev_mind in headrev_candidates)	//People with return to lobby may still be in the lobby. Let's pick someone else in that case.
		if(isnewplayer(rev_mind.current))
			headrev_candidates -= rev_mind
			var/list/newcandidates = shuffle(antag_candidates)
			if(newcandidates.len == 0)
				continue
			for(var/M in newcandidates)
				var/datum/mind/lenin = M
				antag_candidates -= lenin
				newcandidates -= lenin
				if(isnewplayer(lenin.current)) //We don't want to make the same mistake again
					continue
				else
					var/mob/Nm = lenin.current
					if(Nm.job in restricted_jobs)	//Don't make the HOS a replacement revhead
						antag_candidates += lenin	//Let's let them keep antag chance for other antags
						continue

					headrev_candidates += lenin
					break

	while(weighted_score < headrev_candidates.len) //das vi danya
		var/datum/mind/trotsky = pick(headrev_candidates)
		antag_candidates += trotsky
		headrev_candidates -= trotsky

	revolution = new()

	for(var/datum/mind/rev_mind in headrev_candidates)
		log_game("[rev_mind.key] (ckey) has been selected as a head rev")
		var/datum/antagonist/rev/head/new_head = new()
		new_head.give_flash = TRUE
		new_head.give_hud = TRUE
		new_head.remove_clumsy = TRUE
		rev_mind.add_antag_datum(new_head,revolution)

	revolution.update_objectives()
	revolution.update_heads()

	SSshuttle.registerHostileEnvironment(src)
	..()


/datum/game_mode/revolution/process()
	check_counter++
	if(check_counter >= 5)
		if(!finished)
			SSticker.mode.check_win()
		check_counter = 0
	return 0


/datum/game_mode/proc/forge_revolutionary_objectives(datum/mind/rev_mind)
	var/list/heads = get_living_heads()
	for(var/datum/mind/head_mind in heads)
		var/datum/objective/mutiny/rev_obj = new
		rev_obj.owner = rev_mind
		rev_obj.target = head_mind
		rev_obj.explanation_text = "Assassinate or exile [head_mind.name], the [head_mind.assigned_role]."
		rev_mind.objectives += rev_obj

/datum/game_mode/proc/greet_revolutionary(datum/mind/rev_mind, you_are=1)
	update_rev_icons_added(rev_mind)
	if (you_are)
		to_chat(rev_mind.current, "<span class='userdanger'>You are a member of the revolutionaries' leadership!</span>")
	rev_mind.special_role = "Head Revolutionary"
	rev_mind.announce_objectives()

/////////////////////////////////////////////////////////////////////////////////
//This are equips the rev heads with their gear, and makes the clown not clumsy//
/////////////////////////////////////////////////////////////////////////////////
/datum/game_mode/proc/equip_revolutionary(mob/living/carbon/human/mob)
	if(!istype(mob))
		return

	if (mob.mind)
		if (mob.mind.assigned_role == "Clown")
			to_chat(mob, "Your training has allowed you to overcome your clownish nature, allowing you to wield weapons without harming yourself.")
			mob.dna.remove_mutation(CLOWNMUT)


	var/obj/item/assembly/flash/T = new(mob)
	var/obj/item/toy/crayon/spraycan/R = new(mob)
	var/obj/item/clothing/glasses/hud/security/chameleon/C = new(mob)

	var/list/slots = list (
		"backpack" = slot_in_backpack,
		"left pocket" = slot_l_store,
		"right pocket" = slot_r_store
	)
	var/where = mob.equip_in_one_of_slots(T, slots)
	var/where2 = mob.equip_in_one_of_slots(C, slots)
	mob.equip_in_one_of_slots(R,slots)

	if (!where2)
		to_chat(mob, "The Syndicate were unfortunately unable to get you a chameleon security HUD.")
	else
		to_chat(mob, "The chameleon security HUD in your [where2] will help you keep track of who is mindshield-implanted, and unable to be recruited.")

	if (!where)
		to_chat(mob, "The Syndicate were unfortunately unable to get you a flash.")
	else
		to_chat(mob, "The flash in your [where] will help you to persuade the crew to join your cause.")
		return 1

/////////////////////////////////
//Gives head revs their targets//
/////////////////////////////////
/datum/game_mode/revolution/proc/mark_for_death(datum/mind/rev_mind, datum/mind/head_mind)
	var/datum/objective/mutiny/rev_obj = new
	rev_obj.owner = rev_mind
	rev_obj.target = head_mind
	rev_obj.explanation_text = "Assassinate [head_mind.name], the [head_mind.assigned_role]."
	rev_mind.objectives += rev_obj
	heads_to_kill += head_mind

////////////////////////////////////////////
//Checks if new heads have joined midround//
////////////////////////////////////////////
/datum/game_mode/revolution/proc/check_heads()
	var/list/heads = get_all_heads()
	var/list/sec = get_all_sec()
	if(heads_to_kill.len < heads.len)
		var/list/new_heads = heads - heads_to_kill
		for(var/datum/mind/head_mind in new_heads)
			for(var/datum/mind/rev_mind in head_revolutionaries)
				mark_for_death(rev_mind, head_mind)
	return 0


/datum/game_mode/proc/forge_revolutionary_objectives(datum/mind/rev_mind)
	var/list/heads = get_living_heads()
	for(var/datum/mind/head_mind in heads)
		var/datum/objective/mutiny/rev_obj = new
		rev_obj.owner = rev_mind
		rev_obj.target = head_mind
		rev_obj.explanation_text = "Assassinate or exile [head_mind.name], the [head_mind.assigned_role]."
		rev_mind.objectives += rev_obj

/datum/game_mode/proc/greet_revolutionary(datum/mind/rev_mind, you_are=1)
	update_rev_icons_added(rev_mind)
	if (you_are)
		to_chat(rev_mind.current, "<span class='userdanger'>You are a member of the revolutionaries' leadership!</span>")
	rev_mind.special_role = "Head Revolutionary"
	rev_mind.announce_objectives()

/////////////////////////////////////////////////////////////////////////////////
//This are equips the rev heads with their gear, and makes the clown not clumsy//
/////////////////////////////////////////////////////////////////////////////////
/datum/game_mode/proc/equip_revolutionary(mob/living/carbon/human/mob)
	if(!istype(mob))
		return

	if (mob.mind)
		if (mob.mind.assigned_role == "Clown")
			to_chat(mob, "Your training has allowed you to overcome your clownish nature, allowing you to wield weapons without harming yourself.")
			mob.dna.remove_mutation(CLOWNMUT)

	var/obj/item/toy/crayon/spraycan/R = new(mob)
	var/obj/item/clothing/glasses/hud/security/chameleon/C = new(mob)

	var/list/slots = list (
		"backpack" = slot_in_backpack,
		"left pocket" = slot_l_store,
		"right pocket" = slot_r_store
	)
	var/where2 = mob.equip_in_one_of_slots(C, slots)

	mob.equip_in_one_of_slots(R,slots)
	//THEY ARE ANTYLOYAL
	var/obj/item/implant/antiloyalty/AL = new/obj/item/implant/antiloyalty(mob)
	AL.implant(mob)
	mob.verbs += /mob/living/carbon/human/proc/RevConvert

	if (!where2)
		to_chat(mob, "The Syndicate were unfortunately unable to get you a chameleon security HUD.")
	else
		to_chat(mob, "The chameleon security HUD in your [where2] will help you keep track of who is loalty-implanted, and unable to be recruited.")


/////////////////////////////////
//Gives head revs their targets//
/////////////////////////////////
/datum/game_mode/revolution/proc/mark_for_death(datum/mind/rev_mind, datum/mind/head_mind)
	var/datum/objective/mutiny/rev_obj = new
	rev_obj.owner = rev_mind
	rev_obj.target = head_mind
	rev_obj.explanation_text = "Assassinate [head_mind.name], the [head_mind.assigned_role]."
	rev_mind.objectives += rev_obj
	heads_to_kill += head_mind

////////////////////////////////////////////
//Checks if new heads have joined midround//
////////////////////////////////////////////
/datum/game_mode/revolution/proc/check_heads()
	var/list/heads = get_all_heads()
	var/list/sec = get_all_sec()
	if(heads_to_kill.len < heads.len)
		var/list/new_heads = heads - heads_to_kill
		for(var/datum/mind/head_mind in new_heads)
			for(var/datum/mind/rev_mind in head_revolutionaries)
				mark_for_death(rev_mind, head_mind)
	return FALSE

	if(head_revolutionaries.len < max_headrevs && head_revolutionaries.len < round(heads.len - ((8 - sec.len) / 3)))
		latejoin_headrev()

///////////////////////////////
//Adds a new headrev midround//
///////////////////////////////
/datum/game_mode/revolution/proc/latejoin_headrev()
	if(revolutionaries) //Head Revs are not in this list
		var/list/promotable_revs = list()
		for(var/datum/mind/khrushchev in revolutionaries)
			if(khrushchev.current && !khrushchev.current.incapacitated() && !khrushchev.current.restrained() && khrushchev.current.client && khrushchev.current.stat != DEAD)
				if(ROLE_REV in khrushchev.current.client.prefs.be_special)
					promotable_revs += khrushchev
		if(promotable_revs.len)
			var/datum/mind/stalin = pick(promotable_revs)
			revolutionaries -= stalin
			head_revolutionaries += stalin
			log_game("[stalin.key] (ckey) has been promoted to a head rev")
			equip_revolutionary(stalin.current)
			forge_revolutionary_objectives(stalin)
			greet_revolutionary(stalin)

	if(head_revolutionaries.len < max_headrevs && head_revolutionaries.len < round(heads.len - ((8 - sec.len) / 3)))
		latejoin_headrev()

///////////////////////////////
//Adds a new headrev midround//
///////////////////////////////
/datum/game_mode/revolution/proc/latejoin_headrev()
	if(revolutionaries) //Head Revs are not in this list
		var/list/promotable_revs = list()
		for(var/datum/mind/khrushchev in revolutionaries)
			if(khrushchev.current && !khrushchev.current.incapacitated() && !khrushchev.current.restrained() && khrushchev.current.client && khrushchev.current.stat != DEAD)
				if(ROLE_REV in khrushchev.current.client.prefs.be_special)
					promotable_revs += khrushchev
		if(promotable_revs.len)
			var/datum/mind/stalin = pick(promotable_revs)
			revolutionaries -= stalin
			head_revolutionaries += stalin
			log_game("[stalin.key] (ckey) has been promoted to a head rev")
			stalin.current.verbs += /mob/living/carbon/human/proc/RevConvert
			equip_revolutionary(stalin.current)
			forge_revolutionary_objectives(stalin)
			greet_revolutionary(stalin)

//////////////////////////////////////
//Checks if the revs have won or not//
//////////////////////////////////////
/datum/game_mode/revolution/check_win()
	if(check_rev_victory())
		finished = 1
	else if(check_heads_victory())
		finished = 2
	return

///////////////////////////////
//Checks if the round is over//
///////////////////////////////
/datum/game_mode/revolution/check_finished()
	if(CONFIG_GET(keyed_flag_list/continuous)["revolution"])
		if(finished)
			SSshuttle.clearHostileEnvironment(src)
		return ..()
	if(finished != 0 && end_when_heads_dead)
		return TRUE
	else
		return ..()

///////////////////////////////////////////////////
//Deals with converting players to the revolution//
///////////////////////////////////////////////////
/proc/is_revolutionary(mob/M)
	return M && istype(M) && M.mind && M.mind.has_antag_datum(/datum/antagonist/rev)

/proc/is_head_revolutionary(mob/M)
	return M && istype(M) && M.mind && SSticker && SSticker.mode && M.mind in SSticker.mode.head_revolutionaries

/proc/is_revolutionary_in_general(mob/M)
	return is_revolutionary(M) || is_head_revolutionary(M)

/datum/game_mode/proc/add_revolutionary(datum/mind/rev_mind)
	if(rev_mind.assigned_role in GLOB.command_positions)
		return 0
	var/mob/living/carbon/human/H = rev_mind.current//Check to see if the potential rev is implanted
	if(H.isloyal())
		return 0
	if((rev_mind in revolutionaries) || (rev_mind in head_revolutionaries))
		return 0
	revolutionaries += rev_mind
	if(iscarbon(rev_mind.current))
		var/mob/living/carbon/carbon_mob = rev_mind.current
		carbon_mob.silent = max(carbon_mob.silent, 5)
		carbon_mob.flash_act(1, 1)
	rev_mind.current.Stun(100)
	to_chat(rev_mind.current, "<span class='danger'><FONT size = 3> You are now a revolutionary! Help your cause. Do not harm your fellow freedom fighters. You can identify your comrades by the red \"R\" icons, and your leaders by the blue \"R\" icons. Help them kill the heads to win the revolution!</FONT></span>")
	rev_mind.current.log_message("<font color='red'>Has been converted to the revolution!</font>", INDIVIDUAL_ATTACK_LOG)
	rev_mind.special_role = "Revolutionary"
	update_rev_icons_added(rev_mind)
	if(jobban_isbanned(rev_mind.current, ROLE_REV))
		INVOKE_ASYNC(src, .proc/replace_jobbaned_player, rev_mind.current, ROLE_REV, ROLE_REV)
	return 1
	return M && istype(M) && M.mind && SSticker && SSticker.mode && M.mind in SSticker.mode.head_revolutionaries

/proc/is_revolutionary_in_general(mob/M)
	return is_revolutionary(M) || is_head_revolutionary(M)

/datum/game_mode/proc/add_revolutionary(datum/mind/rev_mind)
	if(rev_mind.assigned_role in GLOB.command_positions)
		return 0
	var/mob/living/carbon/human/H = rev_mind.current//Check to see if the potential rev is implanted
	if(H.isloyal())
		return 0
	if((rev_mind in revolutionaries) || (rev_mind in head_revolutionaries))
		return 0
	revolutionaries += rev_mind
	if(iscarbon(rev_mind.current))
		var/mob/living/carbon/carbon_mob = rev_mind.current
		carbon_mob.silent = max(carbon_mob.silent, 5)
		carbon_mob.flash_act(1, 1)
	rev_mind.current.Stun(100)
	to_chat(rev_mind.current, "<span class='danger'><FONT size = 3> You are now a revolutionary! Help your cause. Do not harm your fellow freedom fighters. You can identify your comrades by the red \"R\" icons, and your leaders by the blue \"R\" icons. Help them kill the heads to win the revolution!</FONT></span>")
	rev_mind.current.log_message("<font color='red'>Has been converted to the revolution!</font>", INDIVIDUAL_ATTACK_LOG)
	rev_mind.special_role = "Revolutionary"
	update_rev_icons_added(rev_mind)
	if(jobban_isbanned(rev_mind.current, ROLE_REV))
		INVOKE_ASYNC(src, .proc/replace_jobbaned_player, rev_mind.current, ROLE_REV, ROLE_REV)
	return 1

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
	var/mob/living/carbon/human/M = input("Select a person to convert", "Viva la revolution!", null) as mob in Possible
	if(((src.mind in SSticker.mode.head_revolutionaries) || (src.mind in SSticker.mode.revolutionaries)))
		if((M.mind in SSticker.mode.head_revolutionaries) || (M.mind in SSticker.mode.revolutionaries))
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
				SSticker.mode.add_revolutionary(M.mind)
				M << "<span class='notice'>You join the revolution!</span>"
				src << "<span class='notice'><b>[M] joins the revolution!</b></span>"
			else if(choice == "No!")
				M << "<span class='notice'>You reject this traitorous cause!</span>"
				src << "<span class='notice'><b>[M] does not support the revolution!</b></span>"
			M.mind.rev_cooldown = world.time+50
	return M && istype(M) && M.mind && M.mind.has_antag_datum(/datum/antagonist/rev/head)


//////////////////////////
//Checks for rev victory//
//////////////////////////
/datum/game_mode/revolution/proc/check_rev_victory()
	for(var/datum/objective/mutiny/objective in revolution.objectives)
		if(!(objective.check_completion()))
			return FALSE
	return TRUE

/////////////////////////////
//Checks for a head victory//
/////////////////////////////
/datum/game_mode/revolution/proc/check_heads_victory()
	for(var/datum/mind/rev_mind in revolution.head_revolutionaries())
		var/turf/T = get_turf(rev_mind.current)
		if(!considered_afk(rev_mind) && considered_alive(rev_mind) && is_station_level(T.z))
			if(ishuman(rev_mind.current))
				return FALSE
	return TRUE


/datum/game_mode/revolution/set_round_result()
	..()
	if(finished == 1)
		SSticker.mode_result = "win - heads killed"
		SSticker.news_report = REVS_WIN
	else if(finished == 2)
		SSticker.mode_result = "loss - rev heads killed"
		SSticker.news_report = REVS_LOSE

//TODO What should be displayed for revs in non-rev rounds
/datum/game_mode/revolution/special_report()
	if(finished == 1)
		return "<span class='redtext big'>The heads of staff were killed or exiled! The revolutionaries win!</span>"
	else if(finished == 2)
		return "<span class='redtext big'>The heads of staff managed to stop the revolution!</span>"

/datum/game_mode/revolution/generate_report()
	return "Employee unrest has spiked in recent weeks, with several attempted mutinies on heads of staff. Some crew have been observed using flashbulb devices to blind their colleagues, \
		who then follow their orders without question and work towards dethroning departmental leaders. Watch for behavior such as this with caution. If the crew attempts a mutiny, you and \
		your heads of staff are fully authorized to execute them using lethal weaponry - they will be later cloned and interrogated at Central Command."

/datum/game_mode/revolution/extended
	name = "extended_revolution"
	config_tag = "extended_revolution"
	end_when_heads_dead = FALSE

/datum/game_mode/revolution/speedy
	name = "speedy_revolution"
	config_tag = "speedy_revolution"
	end_when_heads_dead = FALSE
	var/endtime = null
	var/fuckingdone = FALSE

/datum/game_mode/revolution/speedy/pre_setup()
	endtime = world.time + 20 MINUTES
	return ..()

/datum/game_mode/revolution/speedy/process()
	. = ..()
	if(check_counter == 0)
		if (world.time > endtime && !fuckingdone)
			fuckingdone = TRUE
			for (var/obj/machinery/nuclearbomb/N in GLOB.nuke_list)
				if (!N.timing)
					N.timer_set = 200
					N.set_safety()
					N.set_active()
