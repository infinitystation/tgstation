//Как зафиксить таяр: Нужно перенести конечности из папки infi_human_parts_greyscale.dmi в human_parts_greyscale.dmi (с) Terror4000rus
//Прошу прощения, что не придумал способ, как брать конечности из папки инфинити.

/datum/species/tajaran // Tajaran are a humanoid race possesing cat-like features.
	name = "Tajaran"
	id = "tajaran"
	say_mod = "мурлычит"
	default_color = "FFFFF"
	species_traits = list(EYECOLOR,MUTCOLORS) //LIPS не выставлять. Спрайт лица длиннее, чем у человека.
	mutant_organs = list(/obj/item/organ/tongue/tajaran)
	mutant_bodyparts = list("tail_tajaran", "ears_tajaran", "tajaran_hair")
	default_features = list("mcolor" = "FFF", "ears_tajaran" = "Default", "tail_tajaran" = "Default", "tajaran_hair" = "Straight")
	attack_verb = "slash"
	attack_sound = 'sound/weapons/slash.ogg'
	miss_sound = 'sound/weapons/slashmiss.ogg'
	meat = /obj/item/weapon/reagent_containers/food/snacks/meat/slab/human
	skinned_type = /obj/item/stack/sheet/animalhide/generic

/datum/species/tajaran/qualifies_for_rank(rank, list/features)
	if(rank in command_positions)
		return 0
	return 1

/obj/item/organ/tongue/tajaran
	say_mod = "мурлычит"

/obj/item/organ/tongue/tajaran/TongueSpeech(var/message)
	var/regex/tajaran_rrr = new("р+", "g")
	var/regex/tajaran_rRR = new("Р+", "g")
	var/regex/tajaran_rAr = new("r+", "g")
	var/regex/tajaran_rAR = new("R+", "g")
	if(copytext(message, 1, 2) != "*")
		var/begin = get_custom_quote(message)
		var/quote = copytext(message, 1, begin)
		message = copytext(message, begin)
		message = tajaran_rrr.Replace(message, "ррр")
		message = tajaran_rRR.Replace(message, "РРР")
		message = tajaran_rAr.Replace(message, "rrr")
		message = tajaran_rAR.Replace(message, "RRR")
		message = quote + message
	return message