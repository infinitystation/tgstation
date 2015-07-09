var/vent_crawling = 0

/mob/living/carbon/proc/handle_ventcrawl()

	if(!stat)
		if(!lying && !stunned && !paralysis)

			var/obj/machinery/atmospherics/vent_found

			for(var/obj/machinery/atmospherics/p in get_step(src,dir))
				if(!istype(p,/obj/machinery/atmospherics/pipe) && !istype(p,/obj/machinery/atmospherics/binary)) continue
				var/list/nodes = list()
				for(var/d in cardinal) if(p.initialize_directions&d) nodes["[d]"]=null
				if(hasvar(p,"node1"))
					nodes["[get_dir(p,p:node1)]"]=p:node1
				if(hasvar(p,"node2"))
					nodes["[get_dir(p,p:node2)]"]=p:node2
				if(hasvar(p,"node3"))
					nodes["[get_dir(p,p:node3)]"]=p:node3
				if(hasvar(p,"node4"))
					nodes["[get_dir(p,p:node4)]"]=p:node4
				var/direct = turn(dir, 180)
				if(nodes.Find("[direct]"))
					if(!nodes["[direct]"])
						vent_found = p
						break
			if(!vent_found)
				for(var/obj/machinery/atmospherics/unary/vent_pump/v in range(1,src))
					if(!v.welded)
						vent_found = v
					else
						src << "\red That vent is welded."

			if(vent_found)
				if(contents.len)
					for(var/obj/item/carried_item in contents)//If the monkey got on objects.
						if( !istype(carried_item, /obj/item/weapon/implant) && !istype(carried_item, /obj/item/clothing/mask/facehugger) )//If it's not an implant or a facehugger
							src << "\red You can't be carrying items or have items equipped when vent crawling!"
							return
				for(var/mob/O in viewers(src, null))
					O.show_message(text("<B>[src] scrambles into the ventillation ducts!</B>"), 1)

				src.client.start_seeing_pipes()
				loc = get_turf(vent_found)
				invisibility = INVISIBILITY_LEVEL_ONE
				vent_crawling = 1
				density = 0
				vent_loc = vent_found
				update_icons()
			else
				src << "You must be standing on or beside an air vent to enter it."

		else
			src << "You can't vent crawl while you're stunned!"

	else
		src << "You must be conscious to do this!"
	return