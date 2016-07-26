//Rails, yes, just because nobody coded that thing
/obj/structure/rails
	name = "the rails"
	desc = "A pair of rail"
	icon = 'icons/obj/infinity_object.dmi'
	icon_state = "rail"

//Turf
/turf/open/chasm/straight_down/lava_land_surface/monorail_swampgrass_movable
	name = "grass"
	icon = 'icons/turf/floors/infinity_works.dmi'
	icon_state = "swampgrass_movable"

/turf/open/chasm/straight_down/lava_land_surface/monorail_desertsand_movable
	name = "desert sand"
	icon = 'icons/turf/floors/infinity_works.dmi'
	icon_state = "desertsand_movable"

//Train Area
/area/monorail_max
	name = "Monorail_Max"
	icon_state = "purple"
	requires_power = 0
	has_gravity = 1
	blob_allowed = 0 //Should go without saying, no blobs should take over centcom as a win condition.

/area/monorail_max/toilet
	name = "Toilet Monorail"
	icon_state = "toilet"

/area/monorail_max/lobby
	name = "Lobby Monorail"
	icon_state = "entry"

/area/monorail_max/captain
	name = "Captain Monorail"
	icon_state = "captain"

/area/monorail_max/bridge
	name = "Bridge Monorail"
	icon_state = "bridge"

/area/monorail_max/grass
	name = "Grass Monorail"
	icon_state = "green"
	requires_power = 1

/area/monorail_max/cafeteria
	name = "Cafeteria Monorail"
	icon_state = "cafeteria"

/area/monorail_max/security
	name = "Security Monorail"
	icon_state = "security"

/area/monorail_max/medbay
	name = "Medbay Monorail"
	icon_state = "medbay3"

/area/monorail_max/dormitory
	name = "Dormitory Monorail"
	icon_state = "Sleep"

/area/monorail_max/coridor
	name = "Coridor Monorail"
	icon_state = "red"
