/datum/reagent/consumable/ethanol/champagne
	name = "Champagne"
	id = "champagne"
	description = "Elite champagne for elite people."
	color = "#DCD17A" // rgb: 0, 100, 200
	boozepwr = 50

/datum/reagent/consumable/ethanol/rassol
	name = "Rassol"
	id = "rassol"
	description = "Elite champagne for elite people."
	color = "#24AE24" // rgb: 0, 100, 200
	boozepwr = 0

/datum/reagent/consumable/ethanol/rassol/on_mob_life(mob/living/M)
	M.dizziness = 0
	M.drowsyness = 0
	M.slurring = 0
	M.confused = 0
	M.reagents.remove_all_type(/datum/reagent/consumable/ethanol, 3*REM, 0, 1)
	M.adjustToxLoss(-0.2*REM, 0)
	if(ishuman(M))
		var/mob/living/carbon/human/H = M
		H.drunkenness = max(H.drunkenness - 10, 0)
	..()
	. = 1