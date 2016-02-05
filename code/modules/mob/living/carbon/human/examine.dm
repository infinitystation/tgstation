/mob/living/carbon/human/examine(mob/user)

	var/list/obscured = check_obscured_slots()
	var/skipface = (wear_mask && (wear_mask.flags_inv & HIDEFACE)) || (head && (head.flags_inv & HIDEFACE))

	// crappy hacks because you can't do \his[src] etc. I'm sorry this proc is so unreadable, blame the text macros :<
	var/t_He = "Оно" //capitalised for use at the start of each line.
	var/t_his = "их"
	var/t_him = "им"
	var/t_has = "имеет"

	var/e_1 = ""
	var/e_2 = ""
	var/e_3 = ""
	var/e_4 = ""

	var/msg = "<span class='info'>*---------*\nЭто "

	if( (slot_w_uniform in obscured) && skipface ) //big suits/masks/helmets make it hard to tell their gender
		t_He = "Это"
		t_his = "их"
		t_him = "ним"
		t_has = "имеет"
	else
		switch(gender)
			if(MALE)
				t_He = "Он"
				t_his = "его"
				t_him = "ему"
				e_1 = ""
				e_2 = "ый"
				e_3 = "ий"
				e_4 = "ым"
			if(FEMALE)
				t_He = "Она"
				t_his = "её"
				t_him = "ей"
				e_1 = "а"
				e_2 = "а&#255"
				e_3 = "а&#255"
				e_4 = "ой"

	msg += "<EM>[src.name]</EM>!\n"

	//uniform
	if(w_uniform && !(slot_w_uniform in obscured))
		//Ties
		var/tie_msg
		if(istype(w_uniform,/obj/item/clothing/under))
			var/obj/item/clothing/under/U = w_uniform
			if(U.hastie)
				tie_msg += " с \icon[U.hastie] [U.hastie]"

		if(w_uniform.blood_DNA)
			msg += "<span class='warning'>[t_He] носит \icon[w_uniform] [w_uniform.gender==PLURAL?"some":"a"] окровавленую [w_uniform.name][tie_msg]!</span>\n"
		else
			msg += "[t_He] носит \icon[w_uniform] \ [w_uniform][tie_msg].\n"

	//head
	if(head)
		if(head.blood_DNA)
			msg += "<span class='warning'>[t_He] носит \icon[head] [head.gender==PLURAL?"some":"a"] окровавленую [head.name] на голове!</span>\n"
		else
			msg += "[t_He] носит \icon[head] [head]\n"

	//suit/armor
	if(wear_suit)
		if(wear_suit.blood_DNA)
			msg += "<span class='warning'>[t_He] носит \icon[wear_suit] [wear_suit.gender==PLURAL?"some":"a"] окрававленное [wear_suit.name]!</span>\n"
		else
			msg += "[t_He] носит \icon[wear_suit] [wear_suit].\n"

		//suit/armor storage
		if(s_store)
			if(s_store.blood_DNA)
				msg += "<span class='warning'>[t_He] носит \icon[s_store] [s_store.gender==PLURAL?"some":"a"] окровавленый [s_store.name] на [wear_suit.name]!</span>\n"
			else
				msg += "[t_He] носит \icon[s_store] [s_store] на [wear_suit.name].\n"

	//back
	if(back)
		if(back.blood_DNA)
			msg += "<span class='warning'>[t_He] носит \icon[back] [back.gender==PLURAL?"some":"a"] окровавленый [back] на спине.</span>\n"
		else
			msg += "[t_He] носит \icon[back] [back] на спине.\n"

	//left hand
	if(l_hand && !(l_hand.flags&ABSTRACT))
		if(l_hand.blood_DNA)
			msg += "<span class='warning'>[t_He] держит \icon[l_hand] [l_hand.gender==PLURAL?"some":"a"] окровавленый [l_hand.name] в левой руке!</span>\n"
		else
			msg += "[t_He] держит \icon[l_hand] [l_hand] в левой руке.\n"

	//правой руке
	if(r_hand && !(r_hand.flags&ABSTRACT))
		if(r_hand.blood_DNA)
			msg += "<span class='warning'>[t_He] держит \icon[r_hand] [r_hand.gender==PLURAL?"some":"a"] окровавленый [r_hand.name] в правой руке!</span>\n"
		else
			msg += "[t_He] держит \icon[r_hand] [r_hand] в правой руке.\n"

	//gloves
	if(gloves && !(slot_gloves in obscured))
		if(gloves.blood_DNA)
			msg += "<span class='warning'>[t_He] носит\icon[gloves] [gloves.gender==PLURAL?"some":"a"] окровавленые [gloves.name]</span>\n"
		else
			msg += "[t_He] носит \icon[gloves] [gloves] \n"
	else if(blood_DNA)
		msg += "<span class='warning'>[t_him] руки в крови </span>\n"

	//handcuffed?

	//handcuffed?
	if(handcuffed)
		if(istype(handcuffed, /obj/item/weapon/restraints/handcuffs/cable))
			msg += "<span class='warning'>[t_He] \icon[handcuffed] св&#255;зан с помощью кабел&#255;</span>\n"
		else
			msg += "<span class='warning'>[t_He] \icon[handcuffed] в наручниках!</span>\n"

	//belt
	if(belt)
		if(belt.blood_DNA)
			msg += "<span class='warning'>[t_He] носит \icon[belt] [belt.gender==PLURAL?"some":"a"] окровавленый [belt.name]</span>\n"
		else
			msg += "[t_He] носит \icon[belt] \ [belt]\n"

	//shoes
	if(shoes && !(slot_shoes in obscured))
		if(shoes.blood_DNA)
			msg += "<span class='warning'>[t_He] носит \icon[shoes] [shoes.gender==PLURAL?"some":"a"] окровавленые [shoes.name]</span>\n"
		else
			msg += "[t_He] носит \icon[shoes] \ [shoes]\n"

	//mask
	if(wear_mask && !(slot_wear_mask in obscured))
		if(wear_mask.blood_DNA)
			msg += "<span class='warning'>[t_He] носит\icon[wear_mask] [wear_mask.gender==PLURAL?"some":"a"] окровавленую [wear_mask.name] </span>\n"
		else
			msg += "[t_He] носит\icon[wear_mask] [wear_mask]\n"

	//eyes
	if(glasses && !(slot_glasses in obscured))
		if(glasses.blood_DNA)
			msg += "<span class='warning'>[t_He] носит\icon[glasses] [glasses.gender==PLURAL?"some":"a"] окровавленые [glasses]</span>\n"
		else
			msg += "[t_He] носит \icon[glasses] [glasses]\n"

	//ears
	if(ears && !(slot_ears in obscured))
		msg += "[t_He] носит на ухе  \icon[ears] [ears] \n"

	//ID
	if(wear_id)
		/*var/id
		if(istype(wear_id, /obj/item/device/pda))
			var/obj/item/device/pda/pda = wear_id
			id = pda.owner
		else if(istype(wear_id, /obj/item/weapon/card/id)) //just in case something other than a PDA/ID card somehow gets in the ID slot :[
			var/obj/item/weapon/card/id/idcard = wear_id
			id = idcard.registered_name
		if(id && (id != real_name) && (get_dist(src, user) <= 1) && prob(10))
			msg += "<span class='warning'>[t_He] [t_is] wearing \icon[wear_id] \a [wear_id] yet something doesn't seem right...</span>\n"
		else*/
		msg += "[t_He] носит  \icon[wear_id] \ [wear_id].\n"
	//Jitters


	switch(jitteriness)
		if(300 to INFINITY)
			msg += "<span class='warning'><B>[t_He] очень сильно дрожит!</B></span>\n"
		if(200 to 300)
			msg += "<span class='warning'>[t_He] сильно дрожит.</span>\n"
		if(100 to 200)
			msg += "<span class='warning'>[t_He] чуть-чуть подёргивает.</span>\n"



	if(gender_ambiguous) //someone fucked up a gender reassignment surgery
		if (gender == MALE)
			msg += "[t_He] женственен по отношению к н[t_him].\n"
		else
			msg += "[t_He] мужественна по отношению к н[t_him].\n"

	var/appears_dead = 0
	if(stat == DEAD || (status_flags & FAKEDEATH))
		appears_dead = 1
		if(getorgan(/obj/item/organ/internal/brain))//Only perform these checks if there is no brain
			if(suiciding)
				msg += "<span class='warning'>[t_He], кажетс&#255;, совершила самоубийство. Спасение бесполезно.</span>\n"
			msg += "<span class='deadsay'>[t_He] поникш[e_3] и бессознательн[e_2]; [t_He] не имеет признаков жизни"
			if(!key)
				var/foundghost = 0
				if(mind)
					for(var/mob/dead/observer/G in player_list)
						if(G.mind == mind)
							foundghost = 1
							if (G.can_reenter_corpse == 0)
								foundghost = 0
							break
				if(!foundghost)
					msg += " и [t_his] её душа отбыла"
			msg += "...</span>\n"
		else//Brain is gone, doesn't matter if they are AFK or present
			msg += "<span class='deadsay'>Кажетс&#255, [t_his] мозг пропал...</span>\n"

	var/temp = getBruteLoss() //no need to calculate each of these twice

	msg += "<span class='warning'>"

	if(temp)
		if(temp < 30)
			msg += "[t_He] [t_has] незначительные повреждени&#255;.\n"
		else
			msg += "<B>[t_He] [t_has] сильные повреждени&#255;!</B>\n"

	temp = getFireLoss()
	if(temp)
		if(temp < 30)
			msg += "[t_He] [t_has] незначительные ожоги.\n"
		else
			msg += "<B>[t_He] [t_has] сильные ожоги!</B>\n"

	temp = getCloneLoss()
	if(temp)
		if(temp < 30)
			msg += "[t_He] [t_has] незначительные клеточные повреждени&#255;.\n"
		else
			msg += "<B>[t_He] [t_has] сильные клеточные повреждени&#255;.</B>\n"


	for(var/obj/item/organ/limb/L in organs)
		for(var/obj/item/I in L.embedded_objects)
			msg += "<B>[t_He] [t_has] \icon[I] [I], застр&#255;вшую в [t_his] [L.getDisplayName()]!</B>\n"


	if(fire_stacks > 0)
		msg += "[t_He] в чем-то огнеопасном.\n"
	if(fire_stacks < 0)
		msg += "[t_He] выгл&#255;дит немного смоченн[e_4].\n"


	if(nutrition < NUTRITION_LEVEL_STARVING - 50)
		msg += "[t_He] сильно недоедает!\n"
	else if(nutrition >= NUTRITION_LEVEL_FAT)
		if(user.nutrition < NUTRITION_LEVEL_STARVING - 50)
			msg += "[t_He] пухл[e_2] и вкусно выгл&#255;ит - Как толста&#255; маленька&#255; свинка, вкусна&#255; свинка.\n"
		else
			msg += "[t_He] немного полноват[e_1].\n"

	if(pale)
		msg += "[t_He] бледноват[e_1].\n"

	if(bleedsuppress)
		msg += "[t_He] перев&#255;зан[e_1] чем-то.\n"
	if(blood_max)
		if(reagents.has_reagent("heparin"))
			msg += "<b>[t_He] обильно кровоточит!</b>\n"
		else
			msg += "<B>[t_He] кровоточит!</B>\n"

	if(reagents.has_reagent("teslium"))
		msg += "[t_He] испускает нежное голубое свечение!\n"

	msg += "</span>"

	if(!appears_dead)
		if(stat == UNCONSCIOUS)
			msg += "[t_He] не реагирует на все, что окружает [t_his] и, видимо, уснул[e_1].\n"
		else if(getBrainLoss() >= 60)
			msg += "[t_He] [t_has] глупое выражение на [t_his] лице.\n"

		if(getorgan(/obj/item/organ/internal/brain))
			if(istype(src,/mob/living/carbon/human/interactive))
				msg += "<span class='deadsay'>[t_He], видимо, болеет автоматизмом, [t_his] глаза потускнели и [t_his] рот слегка разинут.</span>\n"
			else if(!key)
				msg += "<span class='deadsay'>[t_He] страдает кататонией. Стрессы жизни в глубоком космосе доканали [t_him]. Спасение вр&#255;д ли поможет.</span>\n"
			else if(!client)
				msg += "[t_He] [t_has] в апатии...\n"

		if(digitalcamo)
			msg += "[t_He] двигает [t_him] телом грубым и неестественным образом.\n"

	if(!skipface && is_thrall(src) && in_range(user,src))
		msg += "[t_him] особенности, кажетс&#255;, неестественно и жестко искажены.\n"

	switch(age)
		if(15 to 19)
			msg += "[t_He] выгл&#255;дит на 15-19 лет. \n"
		if(20 to 29)
			msg += "[t_He] выгл&#255;дит на 20-29 лет. \n"
		if(30 to 40)
			msg += "[t_He] выгл&#255;дит на 30-40 лет. \n"
		if(41 to 50)
			msg += "[t_He] выгл&#255;дит на 41-50 лет. \n"
		if(51 to 65)
			msg += "[t_He] выгл&#255;дит на 51-65 лет. \n"
		if(66 to 80)
			msg += "[t_He] выгл&#255;дит на 66-80 лет. \n"
		if(81 to INFINITY)
			msg += "Это пожилой человек, возраст которого вы не можете определить. \n"

	if(istype(user, /mob/living/carbon/human))
		var/mob/living/carbon/human/H = user
		var/obj/item/organ/internal/cyberimp/eyes/hud/CIH = H.getorgan(/obj/item/organ/internal/cyberimp/eyes/hud)
		if(istype(H.glasses, /obj/item/clothing/glasses/hud) || CIH)
			var/perpname = get_face_name(get_id_name(""))
			if(perpname)
				var/datum/data/record/R = find_record("name", perpname, data_core.general)
				if(R)
					msg += "<span class='deptradio'>Rank:</span> [R.fields["rank"]]<br>"
					msg += "<a href='?src=\ref[src];hud=1;photo_front=1'>\[Front photo\]</a> "
					msg += "<a href='?src=\ref[src];hud=1;photo_side=1'>\[Side photo\]</a><br>"
				if(istype(H.glasses, /obj/item/clothing/glasses/hud/health) || istype(CIH,/obj/item/organ/internal/cyberimp/eyes/hud/medical))
					var/implant_detect
					for(var/obj/item/organ/internal/cyberimp/CI in internal_organs)
						if(CI.status == ORGAN_ROBOTIC)
							implant_detect += "[name] is modified with a [CI.name].<br>"
					if(implant_detect)
						msg += "Detected cybernetic modifications:<br>"
						msg += implant_detect
					if(R)
						var/health = R.fields["p_stat"]
						msg += "<a href='?src=\ref[src];hud=m;p_stat=1'>\[[health]\]</a>"
						health = R.fields["m_stat"]
						msg += "<a href='?src=\ref[src];hud=m;m_stat=1'>\[[health]\]</a><br>"
					R = find_record("name", perpname, data_core.medical)
					if(R)
						msg += "<a href='?src=\ref[src];hud=m;evaluation=1'>\[Medical evaluation\]</a><br>"


				if(istype(H.glasses, /obj/item/clothing/glasses/hud/security) || istype(CIH,/obj/item/organ/internal/cyberimp/eyes/hud/security))
					if(!user.stat && user != src)
					//|| !user.canmove || user.restrained()) Fluff: Sechuds have eye-tracking technology and sets 'arrest' to people that the wearer looks and blinks at.
						var/criminal = "None"

						R = find_record("name", perpname, data_core.security)
						if(R)
							criminal = R.fields["criminal"]

						msg += "<span class='deptradio'>Criminal status:</span> <a href='?src=\ref[src];hud=s;status=1'>\[[criminal]\]</a>\n"
						msg += "<span class='deptradio'>Security record:</span> <a href='?src=\ref[src];hud=s;view=1'>\[View\]</a> "
						msg += "<a href='?src=\ref[src];hud=s;add_crime=1'>\[Add crime\]</a> "
						msg += "<a href='?src=\ref[src];hud=s;view_comment=1'>\[View comment log\]</a> "
						msg += "<a href='?src=\ref[src];hud=s;add_comment=1'>\[Add comment\]</a>\n"




	if(print_flavor_text()) msg += "[print_flavor_text()]\n"

	msg += "*---------*</span>"

	user << msg
