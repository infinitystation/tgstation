/datum/species/lizard
	// Reptilian humanoids with scaled skin and tails.
	name = "Lizardperson"
	id = "lizard"
	say_mod = "шипит"
	default_color = "00FF00"
	species_traits = list(MUTCOLORS,EYECOLOR,LIPS)
	mutant_bodyparts = list("tail_lizard", "snout", "spines", "horns", "frills", "body_markings", "legs")
	mutant_organs = list(/obj/item/organ/tongue/lizard)
	default_features = list("mcolor" = "0F0", "tail" = "Smooth", "snout" = "Round", "horns" = "None", "frills" = "None", "spines" = "None", "body_markings" = "None", "legs" = "Normal Legs")
	attack_verb = "slash"
	attack_sound = 'sound/weapons/slash.ogg'
	miss_sound = 'sound/weapons/slashmiss.ogg'
	meat = /obj/item/weapon/reagent_containers/food/snacks/meat/slab/human/mutant/lizard
	skinned_type = /obj/item/stack/sheet/animalhide/lizard
	exotic_bloodtype = "L"

/datum/species/lizard/random_name(gender,unique,lastname)
	if(unique)
		return random_unique_lizard_name(gender)

	var/randname = lizard_name(gender)

	if(lastname)
		randname += " [lastname]"

	return randname

//I wag in death
/datum/species/lizard/spec_death(gibbed, mob/living/carbon/human/H)
	if(H)
		H.endTailWag()

/*
 Lizard subspecies: ASHWALKERS
*/
/datum/species/lizard/ashwalker
	name = "Ash Walker"
	default_features = list("mcolor" = "0F0", "tail" = "Smooth", "snout" = "Round", "horns" = "None", "frills" = "None", "spines" = "None", "body_markings" = "None", "legs" = "Digitigrade Legs")
	id = "ashlizard"
	mutant_organs = list(/obj/item/organ/tongue/lizard)
	mutanteyes = /obj/item/organ/eyes/night_vision
	limbs_id = "lizard"
	species_traits = list(MUTCOLORS,EYECOLOR,LIPS,NOBREATH,NOGUNS,DIGITIGRADE)

/datum/species/lizard/ashwalker/on_species_gain(mob/living/carbon/human/C, datum/species/old_species)
	C.languages_spoken = ASHWALKER
	C.languages_understood = ASHWALKER
	C.handcrafting.categories = list(CAT_PRIMAL)

/datum/species/lizard/ashwalker/on_species_loss(mob/living/carbon/human/C)
	C.languages_spoken = initial(C.languages_spoken)
	C.languages_understood = initial(C.languages_understood)
	C.handcrafting.categories = list(CAT_WEAPON,
				CAT_AMMO,
				CAT_ROBOT,
				CAT_MISC,
				CAT_PRIMAL,
				CAT_BREAD,
				CAT_BURGER,
				CAT_CAKE,
				CAT_EGG,
				CAT_MEAT,
				CAT_MISCFOOD,
				CAT_PASTRY,
				CAT_PIE,
				CAT_PIZZA,
				CAT_SALAD,
				CAT_SANDWICH,
				CAT_SOUP,
				CAT_SPAGHETTI)