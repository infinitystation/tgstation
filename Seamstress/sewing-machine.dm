#define AUTOLATHE_MAIN_MENU       1
#define AUTOLATHE_CATEGORY_MENU   2
#define AUTOLATHE_SEARCH_MENU     3


/obj/machinery/sewing-machine
	name = "sewing-machine"
	desc = "It produces items using metal and glass."
	icon_state = "sewing-machine"
	icon = 'Seamstress/Seamstress_objects.dmi'
	density = 1

	var/operating = 0
	var/list/L = list()
	var/list/LL = list()
	var/disabled = 0
	var/busy = 0
	var/prod_coeff
	var/datum/wires/sewing-machine/wires = null

	var/datum/design/being_built
	var/datum/research/files
	var/list/datum/design/matching_designs
	var/selected_category
	var/screen = 1

	var/datum/material_container/materials

	var/list/categories = list(
							"Ñlothing",
							"Frippery",

							)

/obj/machinery/sewing-machine/interact(mob/user)
	if(!is_operational())
		return
	else
		switch(screen)
			if(sewing-machine_MAIN_MENU)
				dat = main_win(user)
			if(sewing-machine_CATEGORY_MENU)
				dat = category_win(user,selected_category)
			if(sewing-machine_SEARCH_MENU)
				dat = search_win(user)

	var/datum/browser/popup = new(user, "sewing-machine", name, 400, 500)
	popup.set_content(dat)
	popup.open()

	return

	var/material_amount = materials.get_item_material_amount(O)
	if(!material_amount)
		user << "<span class='warning'>This object does not contain sufficient amounts of metal or glass to be accepted by the sewing-machine.</span>"
		return 1
	if(!materials.has_space(material_amount))
		user << "<span class='warning'>The sewing-machine is full. Please remove metal or glass from the sewing-machine in order to insert more.</span>"
		return 1
	if(!user.unEquip(O))
		user << "<span class='warning'>\The [O] is stuck to you and cannot be placed into the sewing-machine.</span>"
		return 1

	busy = 1
	var/inserted = materials.insert_item(O)
	if(inserted)
		if(istype(O,/obj/item/stack))
			if (O.materials[MAT_METAL])
				flick("sewing-machine_o",src)//plays metal insertion animation
			if (O.materials[MAT_GLASS])
				flick("sewing-machine_r",src)//plays glass insertion animation
			user << "<span class='notice'>You insert [inserted] sheet[inserted>1 ? "s" : ""] to the sewing-machine.</span>"
			use_power(inserted*100)
