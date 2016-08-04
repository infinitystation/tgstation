/turf/closed/wall/darksteel
	name = "darksteel wall"
	desc = "A rusted metal wall."
	icon = 'icons/turf/walls/darksteel_wall.dmi'
	icon_state = "darksteel"
	walltype = "darksteel"
	canSmoothWith = list(/turf/closed/wall/darksteel)
	smooth = SMOOTH_TRUE

/turf/closed/indestructible/riveted/darksteel
	name = "darksteel wall"
	icon = 'icons/turf/walls/darksteel_wall.dmi'
	icon_state = "darksteel"
	canSmoothWith = list(/turf/closed/indestructible/riveted/darksteel, /turf/closed/wall/darksteel)
	smooth = SMOOTH_TRUE

/turf/closed/wall/med
	icon = 'icons/turf/walls/med_wall.dmi'
	icon_state = "med"
	canSmoothWith = list(/turf/closed/wall, /turf/closed/wall/med, /turf/closed/wall/engi, /turf/closed/wall/sec)

/turf/closed/wall/engi
	icon = 'icons/turf/walls/engi_wall.dmi'
	icon_state = "engi"
	canSmoothWith = list(/turf/closed/wall, /turf/closed/wall/med, /turf/closed/wall/engi, /turf/closed/wall/sec)

/turf/closed/wall/sec
	icon = 'icons/turf/walls/sec_wall.dmi'
	icon_state = "sec"
	canSmoothWith = list(/turf/closed/wall, /turf/closed/wall/med, /turf/closed/wall/engi, /turf/closed/wall/sec)

/turf/closed/indestructible/riveted/infinity
	icon_state = "riveted0"
	icon = 'icons/turf/walls/indestructable_smooth.dmi'

/turf/closed/indestructible/riveted/infinity/terror
	icon_state = "riveted0"
	icon = 'icons/turf/walls/indestructable_smooth_ter.dmi'
	canSmoothWith = list(/turf/closed/indestructible/riveted/infinity/terror)
	smooth = SMOOTH_TRUE

/turf/closed/wall/mineral/abductor/terror
	canSmoothWith = list(/turf/closed/wall/mineral/abductor, /obj/structure/falsewall/abductor, /obj/machinery/door/airlock/abductor, /turf/closed/wall/mineral/abductor/terror)