/obj/machinery/ticketmachine
	name = "\improper Ticket Machine"
	desc = "A Ticket Machine."
	icon = 'code/Monorail_Maks750rus/ticket.dmi'
	icon_state = "pdapainter"
	density = 1
	anchored = 1
	var/obj/item/weapon/card/id/storedpda = null
	var/list/colorlist = list()


/obj/machinery/ticketmachine/update_icon()
	overlays.Cut()

	if(storedpda)
		overlays += "[initial(icon_state)]-closed"

	if(powered())
		icon_state = initial(icon_state)
	else
		icon_state = "[initial(icon_state)]-off"

	return

/obj/machinery/ticketmachine/New()
	..()

	for(var/P in typesof(/obj/item/weapon/card/id/monorail))
		var/obj/item/weapon/card/id/monorail/D = new P


		D.name = D.icon_state

		src.colorlist += D


/obj/machinery/ticketmachine/attackby(obj/item/O, mob/user, params)
	if(istype(O, /obj/item/weapon/card/id))
		if(storedpda)
			user << "<span class='warning'>There is already a Card inside!</span>"
			return
		else
			var/obj/item/weapon/card/id/P = user.get_active_held_item()
			if(istype(P))
				if(!user.drop_item())
					return
				storedpda = P
				P.loc = src
				P.add_fingerprint(user)
				update_icon()


/obj/machinery/ticketmachine/attack_hand(mob/user)
	..()

	src.add_fingerprint(user)

	if(storedpda)
		var/obj/item/weapon/card/id/P
		P = input(user, "Select your color!", "Ticket Machine") as null|anything in colorlist
		if(!P)
			return
		if(!storedpda)//is the pda still there?
			return

		storedpda.icon_state = P.icon_state
		storedpda.icon = icon
		storedpda.lefthand_file = "null"
		storedpda.righthand_file = "null"
		storedpda.desc = P.desc
		ejectpda()

	else
		user << "<span class='notice'>The [src] is empty.</span>"


/obj/machinery/ticketmachine/verb/ejectpda()
	set name = "Eject Card"
	set category = "Object"
	set src in oview(1)

	if(usr.stat || usr.restrained() || !usr.canmove)
		return

	if(storedpda)
		storedpda.loc = get_turf(src.loc)
		storedpda = null
		update_icon()
	else
		usr << "<span class='notice'>The [src] is empty.</span>"


/obj/machinery/ticketmachine/power_change()
	..()
	update_icon()