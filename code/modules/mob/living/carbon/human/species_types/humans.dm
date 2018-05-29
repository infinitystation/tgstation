/datum/species/human
	name = "Human"
	id = "human"
	default_color = "FFFFFF"
	species_traits = list(EYECOLOR,HAIR,FACEHAIR,LIPS)
	default_features = list("mcolor" = "FFF", "tail_human" = "None", "ears" = "None", "wings" = "None")
	use_skintones = 1
	skinned_type = /obj/item/stack/sheet/animalhide/human
	disliked_food = GROSS | RAW
	liked_food = JUNKFOOD | FRIED


/datum/species/human/qualifies_for_rank(rank, list/features)	// TODO@inf-dev проверьте работоспособность и измените в случае чего ~bear1ake@inf-dev
	if((!features["tail_human"] || features["tail_human"] == "None") && (!features["ears"] || features["ears"] == "None"))
		return TRUE	//Pure humans are always allowed in all roles.
	if(rank in GLOB.security_positions) //This list does not include lawyers.
		return 0
	if(rank == "Quartermaster") //QM is not contained in command_positions but we still want to bar mutants from it.
		return 0
	if(rank == "Internal Affairs Agent")//
		return 0
	if(rank == "Head of Personnel")
		return 0
	if(rank == "Captain")
		return 0
	return ..()

//Curiosity killed the cat's wagging tail.
/datum/species/human/spec_death(gibbed, mob/living/carbon/human/H)
	if(H)
		H.endTailWag()

/datum/species/human/spec_stun(mob/living/carbon/human/H,amount)
	if(H)
		H.endTailWag()
	. = ..()

/datum/species/human/space_move(mob/living/carbon/human/H)
	var/obj/item/flightpack/F = H.get_flightpack()
	if(istype(F) && (F.flight) && F.allow_thrust(0.01, src))
		return TRUE

/datum/species/human/on_species_gain(mob/living/carbon/human/H, datum/species/old_species)
	if(H.dna.features["ears"] == "Cat")
		mutantears = /obj/item/organ/ears/cat
	if(H.dna.features["tail_human"] == "Cat")
		mutanttail = /obj/item/organ/tail/cat
	..()
