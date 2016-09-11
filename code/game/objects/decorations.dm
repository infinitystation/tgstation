/obj/structure/poolwater
	name = "water"
	density = 0
	anchored = 1
	icon = 'icons/turf/floors/infinity_works.dmi'
	icon_state = "poolwater"
	layer = ABOVE_MOB_LAYER
	mouse_opacity = 0

/obj/structure/poolwater/sea
	name = "sea water"
	density = 0
	anchored = 1
	icon = 'icons/obj/infinity_decals.dmi'
	icon_state = "sheetblue4"
	layer = ABOVE_MOB_LAYER
	mouse_opacity = 0

/obj/structure/poolwater/sea/one
	icon_state = "sheetblue1"

/obj/structure/poolwater/sea/two
	icon_state = "sheetblue2"

/obj/structure/poolwater/sea/three
	icon_state = "sheetblue3"

/obj/structure/pool
	name = "pool"
	density = 1
	anchored = 1
	icon = 'icons/obj/infinity_object.dmi'
	icon_state = "pool"
/obj/structure/pool/ladder
	name = "ladder"
	density = 0
	anchored = 1
	icon = 'icons/obj/infinity_object.dmi'
	icon_state = "ladder"
/obj/structure/shrub
	name = "shrub"
	icon = 'icons/obj/infinity_object.dmi'
	icon_state = "shrub"
	anchored = 1
	density = 0
	layer = ABOVE_MOB_LAYER
/obj/structure/stone
	name = "Stone"
	desc = "Its a stone."
	icon = 'icons/obj/infinity_object.dmi'
	icon_state = "stone"
	anchored = 1
	density=1
/obj/structure/tree1
	name = "Tree"
	desc = "It's a tree."
	icon = 'icons/effects/infinity_96x96.dmi' // changed from worlds.dmi
	icon_state = "tree" // changed from 0.0
	anchored = 1
	layer = LARGE_MOB_LAYER
	pixel_x = -20
	density = 1
	opacity = 0 // this causes some of the super ugly lighting issues too
