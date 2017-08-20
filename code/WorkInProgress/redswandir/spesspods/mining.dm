/obj/mecha/spacepod/mining
	name = "mining space pod"
	icon_state = "pod_industrial"
	desc = "A space pod, traditionally used for space travel. This rough looking space pod is reinforced and ready for industrial work."

/obj/mecha/spacepod/mining/Move()
	. = ..()
	if(. && (locate(/obj/item/mecha_parts/mecha_equipment/tool/hydraulic_clamp) in equipment))
		var/obj/structure/ore_box/ore_box = locate(/obj/structure/ore_box) in cargo
		if(ore_box)
			for(var/obj/item/ore/ore in get_turf(src))
				ore.Move(ore_box)

/obj/mecha/spacepod/mining/Exit(atom/movable/O)
	if(O in cargo)
		return 0
	return ..()

/obj/mecha/spacepod/mining/Topic(href, href_list)
	..()
	if(href_list["drop_from_cargo"])
		var/obj/O = locate(href_list["drop_from_cargo"])
		if(O && O in src.cargo)
			src.occupant_message("<span class='notice'>You unload [O].</span>")
			O.loc = loc
			src.cargo -= O
			src.log_message("Unloaded [O]. Cargo compartment capacity: [cargo_capacity - src.cargo.len]")
	return



/obj/mecha/spacepod/mining/get_stats_part()
	var/output = ..()
	output += "<b>Cargo Compartment Contents:</b><div style=\"margin-left: 15px;\">"
	if(src.cargo.len)
		for(var/obj/O in src.cargo)
			output += "<a href='?src=\ref[src];drop_from_cargo=\ref[O]'>Unload</a> : [O]<br>"
	else
		output += "Nothing"
	output += "</div>"
	return output