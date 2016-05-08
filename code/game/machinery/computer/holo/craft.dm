/obj/item/weapon/circuitboard/computer/holo/power
	name = "Power Monitoring Holoconsole"
	build_path = /obj/machinery/computer/holo/monitor
	origin_tech = "programming=3"

/obj/structure/frame/computer/holoframe/attackby(obj/item/P, mob/user, params)
	add_fingerprint(user)
	switch(state)
		if(0)
			if(istype(P, /obj/item/weapon/wrench))
				playsound(src.loc, 'sound/items/Ratchet.ogg', 50, 1)
				user << "<span class='notice'>You start wrenching the frame into place...</span>"
				if(do_after(user, 20/P.toolspeed, target = src))
					user << "<span class='notice'>You wrench the frame into place.</span>"
					anchored = 1
					state = 1
			if(istype(P, /obj/item/weapon/weldingtool))
				var/obj/item/weapon/weldingtool/WT = P
				if(!WT.remove_fuel(0, user))
					if(!WT.isOn())
						user << "<span class='warning'>The welding tool must be on to complete this task!</span>"
					return
				playsound(src.loc, 'sound/items/Welder.ogg', 50, 1)
				user << "<span class='notice'>You start deconstructing the frame...</span>"
				if(do_after(user, 20/P.toolspeed, target = src))
					if(!src || !WT.isOn()) return
					user << "<span class='notice'>You deconstruct the frame.</span>"
					var/obj/item/stack/sheet/metal/M = new (loc, 5)
					M.add_fingerprint(user)
					qdel(src)
		if(1)
			if(istype(P, /obj/item/weapon/wrench))
				playsound(src.loc, 'sound/items/Ratchet.ogg', 50, 1)
				user << "<span class='notice'>You start to unfasten the frame...</span>"
				if(do_after(user, 20/P.toolspeed, target = src))
					user << "<span class='notice'>You unfasten the frame.</span>"
					anchored = 0
					state = 0
			if(istype(P, /obj/item/weapon/circuitboard/computer) && !circuit)
				if(!user.drop_item())
					return
				playsound(src.loc, 'sound/items/Deconstruct.ogg', 50, 1)
				user << "<span class='notice'>You place the circuit board inside the frame.</span>"
				icon_state = "holo_1"
				circuit = P
				circuit.add_fingerprint(user)
				P.loc = null
			if(istype(P, /obj/item/weapon/screwdriver) && circuit)
				playsound(src.loc, 'sound/items/Screwdriver.ogg', 50, 1)
				user << "<span class='notice'>You screw the circuit board into place.</span>"
				state = 2
				icon_state = "holo_2"
			if(istype(P, /obj/item/weapon/crowbar) && circuit)
				playsound(src.loc, 'sound/items/Crowbar.ogg', 50, 1)
				user << "<span class='notice'>You remove the circuit board.</span>"
				state = 1
				icon_state = "holo_0"
				circuit.loc = src.loc
				circuit.add_fingerprint(user)
				circuit = null
		if(2)
			if(istype(P, /obj/item/weapon/screwdriver) && circuit)
				playsound(src.loc, 'sound/items/Screwdriver.ogg', 50, 1)
				user << "<span class='notice'>You unfasten the circuit board.</span>"
				state = 1
				icon_state = "holo_1"
			if(istype(P, /obj/item/stack/cable_coil))
				var/obj/item/stack/cable_coil/C = P
				if(C.get_amount() >= 5)
					playsound(src.loc, 'sound/items/Deconstruct.ogg', 50, 1)
					user << "<span class='notice'>You start adding cables to the frame...</span>"
					if(do_after(user, 20/P.toolspeed, target = src))
						if(C.get_amount() >= 5 && state == 2)
							C.use(5)
							user << "<span class='notice'>You add cables to the frame.</span>"
							state = 3
							icon_state = "holo_3"
				else
					user << "<span class='warning'>You need five lengths of cable to wire the frame!</span>"
		if(3)
			if(istype(P, /obj/item/weapon/wirecutters))
				playsound(src.loc, 'sound/items/Wirecutter.ogg', 50, 1)
				user << "<span class='notice'>You remove the cables.</span>"
				state = 2
				icon_state = "holo_2"
				var/obj/item/stack/cable_coil/A = new (loc)
				A.amount = 5
				A.add_fingerprint(user)

			if(istype(P, /obj/item/stack/sheet/glass))
				var/obj/item/stack/sheet/glass/G = P
				if(G.get_amount() < 2)
					user << "<span class='warning'>You need two glass sheets to continue construction!</span>"
					return
				else
					playsound(src.loc, 'sound/items/Deconstruct.ogg', 50, 1)
					user << "<span class='notice'>You start to put in the objective...</span>"
					if(do_after(user, 20, target = src))
						if(G.get_amount() >= 2 && state == 3)
							G.use(2)
							user << "<span class='notice'>You put in the objective.</span>"
							state = 4
							src.icon_state = "holo_4"
		if(4)
			if(istype(P, /obj/item/weapon/crowbar))
				playsound(src.loc, 'sound/items/Crowbar.ogg', 50, 1)
				user << "<span class='notice'>You remove the objective.</span>"
				state = 3
				icon_state = "holo_3"
				var/obj/item/stack/sheet/glass/G = new (loc, 2)
				G.add_fingerprint(user)
			if(istype(P, /obj/item/weapon/screwdriver))
				playsound(src.loc, 'sound/items/Screwdriver.ogg', 50, 1)
				user << "<span class='notice'>You connect the hololens.</span>"
				var/obj/B = new src.circuit.build_path (src.loc, circuit)
				transfer_fingerprints_to(B)
				qdel(src)