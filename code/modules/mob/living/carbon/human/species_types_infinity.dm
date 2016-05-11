/datum/species/tajaran
	// Tajaran are a humanoid race possesing cat-like features.
	name = "Tajaran"
	id = "tajaran"
	say_mod = "мурлычит"
	default_color = "00FF00"
	roundstart = 0
	specflags = list(EYECOLOR,LIPS)
	mutant_bodyparts = list("tail_tajaran", "ears_tajaran", "tajaran_hair")
	default_features = list("mcolor" = "CDC5BF", "ears_tajaran" = "Default", "tail_tajaran" = "Default", "tajaran_hair" = "Straight")
	attack_verb = "slash"
	attack_sound = 'sound/weapons/slash.ogg'
	miss_sound = 'sound/weapons/slashmiss.ogg'
	meat = /obj/item/weapon/reagent_containers/food/snacks/meat/slab/human/mutant/lizard
	alt_icon = 'icons/mob/infinity_human.dmi'

/datum/species/tajaran/qualifies_for_rank(rank, list/features)
	if(rank in command_positions)
		return 0
	if(rank in security_positions)
		return 0
	return 1