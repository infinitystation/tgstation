/proc/power_failure()
	priority_announce("Обнаружена аномальна&#255; активность в энергосети станции [station_name()]. В качестве превентивной меры энергопитание станции будет отключено на неопределённый период.", "Критическое падение энергии", 'sound/AI/poweroff.ogg')
	for(var/obj/machinery/power/smes/S in machines)
		if(istype(get_area(S), /area/ai_monitored/turret_protected) || S.z != ZLEVEL_STATION)
			continue
		S.charge = 0
		S.output_level = 0
		S.output_attempt = 0
		S.update_icon()
		S.power_change()

	var/list/skipped_areas = list(/area/engine/engineering, /area/ai_monitored/turret_protected/ai)

	for(var/area/A in world)
		if( !A.requires_power || A.always_unpowered )
			continue

		var/skip = 0
		for(var/area_type in skipped_areas)
			if(istype(A,area_type))
				skip = 1
				break
		if(A.contents)
			for(var/atom/AT in A.contents)
				if(AT.z != ZLEVEL_STATION) //Only check one, it's enough.
					skip = 1
				break
		if(skip) continue
		A.power_light = 0
		A.power_equip = 0
		A.power_environ = 0
		A.power_change()

	for(var/obj/machinery/power/apc/C in apcs_list)
		if(C.cell && C.z == ZLEVEL_STATION)
			var/area/A = get_area(C)

			var/skip = 0
			for(var/area_type in skipped_areas)
				if(istype(A,area_type))
					skip = 1
					break
			if(skip) continue

			C.cell.charge = 0

/proc/power_restore()

	priority_announce("Энергопитание было восстановлено на станции [station_name()]. Приносим наши извинени&#255; за неудобства.", "Энергосеть в норме", 'sound/AI/poweron.ogg')
	for(var/obj/machinery/power/apc/C in machines)
		if(C.cell && C.z == ZLEVEL_STATION)
			C.cell.charge = C.cell.maxcharge
			C.failure_timer = 0
	for(var/obj/machinery/power/smes/S in machines)
		if(S.z != ZLEVEL_STATION)
			continue
		S.charge = S.capacity
		S.output_level = S.output_level_max
		S.output_attempt = 1
		S.update_icon()
		S.power_change()
	for(var/area/A in world)
		if(!istype(A, /area/space) && !istype(A, /area/shuttle) && !istype(A,/area/arrival))
			A.power_light = 1
			A.power_equip = 1
			A.power_environ = 1
			A.power_change()

/proc/power_restore_quick()

	priority_announce("Все СМЕСы на станции [station_name()] были перезар&#255;жены. Приносим наши извинени&#255; за неудобства.", "Энергосеть в норме", 'sound/AI/poweron.ogg')
	for(var/obj/machinery/power/smes/S in machines)
		if(S.z != ZLEVEL_STATION)
			continue
		S.charge = S.capacity
		S.output_level = S.output_level_max
		S.output_attempt = 1
		S.update_icon()
		S.power_change()

