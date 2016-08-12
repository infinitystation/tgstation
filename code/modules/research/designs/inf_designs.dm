/datum/design/plantbag_holding
	name = "Plant Bag Of Holding"
	desc = "A plant bag that can hold an infinite amount of plant matter."
	id = "plantbag_holding"
	req_tech = list("bluespace" = 4, "materials" = 3, "engineering" = 4)
	build_type = PROTOLATHE
	materials = list(MAT_GOLD = 250, MAT_URANIUM = 500) //quite cheap, for more convenience
	build_path = /obj/item/weapon/storage/bag/plants/holding
	category = list("Bluespace Designs")