
/obj/machinery/health_scanner
	icon = 'icons/obj/infinity_object.dmi'
	anchored = 1
	var/reagent_upgrade = 0
	var/reagent_scan = 0
	var/id = 0.0 // who are we?
	var/list/partners = list() // who do we know?
	var/partner_range = 3 // how far away should we look?
	var/find_in_range = 1

	New()
		..()
		spawn(5)
			src.find_partners(src.find_in_range)

	attackby(obj/item/W as obj, mob/user as mob)
		if (istype(W, /obj/item/device/multitool))
			var/new_id = input(user, "Please enter new ID", src.name, src.id) as null|text
			if (!new_id || new_id == src.id)
				return
			src.id = new_id
			user << "You change [src]'s ID to [new_id]."
			src.find_partners()
		else
			return ..()

	proc/find_partners(var/in_range = 0)
		return // dummy proc that the scanner and screen will define themselves

	proc/accept_partner(var/obj/machinery/health_scanner/H)
		if (!H)
			return
		if (locate(H) in src.partners)
			return
		src.partners += H

	proc/update_reagent_scan()
		if (!src.partners || !src.partners.len)
			return
		for (var/obj/machinery/health_scanner/myPartner in src.partners)
			if (src.reagent_upgrade && !myPartner.reagent_upgrade)
				myPartner.reagent_upgrade = 1
			else if (myPartner.reagent_upgrade && !src.reagent_upgrade)
				src.reagent_upgrade = 1
			if (src.reagent_scan && !myPartner.reagent_scan)
				myPartner.reagent_scan = 1
			else if (myPartner.reagent_scan && !src.reagent_scan)
				src.reagent_scan = 1

/obj/machinery/health_scanner/wall
	name = "health status screen"
	desc = "A screen that shows health information recieved from connected floor scanners."
	icon_state = "wallscan1"

	find_partners(var/in_range = 0)
		src.partners = list()
		if (in_range)
			for (var/obj/machinery/health_scanner/floor/possible_partner in orange(src.partner_range, src))
				if (locate(possible_partner) in src.partners)
					continue
				src.partners += possible_partner
				possible_partner.accept_partner(src)
		for (var/obj/machinery/health_scanner/floor/possible_partner in world)
			if (locate(possible_partner) in src.partners)
				continue
			if (possible_partner.id == src.id)
				src.partners += possible_partner
				possible_partner.accept_partner(src)

	proc/scan()
		if (!src.partners || !src.partners.len)
			return "<font color='red'>ERROR: NO CONNECTED SCANNERS</font>"
		var/data = null
		for (var/obj/machinery/health_scanner/floor/myPartner in src.partners)
			for (var/mob/M in get_turf(myPartner))
				data += "<br>[healthscan(usr, M)]"
		return data

	attack_hand(mob/user as mob)
		src.scan()

	attack_ai(mob/user as mob)
		src.scan()

/obj/machinery/health_scanner/floor
	name = "health scanner"
	desc = "An in-floor health scanner that sends its data to connected status screens."
	icon_state = "floorscan1"

	find_partners(var/in_range = 0)
		src.partners = list()
		if (in_range)
			for (var/obj/machinery/health_scanner/possible_partner in orange(src.partner_range, src))
				if (locate(possible_partner) in src.partners)
					continue
				src.partners += possible_partner
				possible_partner.accept_partner(src)
		for (var/obj/machinery/health_scanner/possible_partner in world)
			if (locate(possible_partner) in src.partners)
				continue
			if (possible_partner.id == src.id)
				src.partners += possible_partner
				possible_partner.accept_partner(src)
