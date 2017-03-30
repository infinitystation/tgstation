/*/Rails, yes, just because nobody coded that thing
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
	requires_power = 1
	has_gravity = 1
	blob_allowed = 0 //Should go without saying, no blobs should take over centcom as a win condition.

/area/monorail_max/toilet
	name = "Monorail Toilet"
	icon_state = "toilet"
//	requires_power = 0

/area/monorail_max/lobby_station
	name = "Monorail Station 'La Nitoki'"
	icon_state = "green"
	requires_power = 0

/area/monorail_max/lobby
	name = "Monorail Lobby"
	icon_state = "entry"

/area/monorail_max/captain
	name = "Monorail Captain"
	icon_state = "captain"

/area/monorail_max/bridge
	name = "Monorail Bridge"
	icon_state = "bridge"

/area/monorail_max/grass
	name = "Monorail Grass"
	icon_state = "green"

/area/monorail_max/cafeteria
	name = "Monorail Cafeteria"
	icon_state = "cafeteria"

/area/monorail_max/security
	name = "Monorail Security"
	icon_state = "security"

/area/monorail_max/medbay
	name = "Monorail Medbay"
	icon_state = "medbay3"

/area/monorail_max/dormitory
	name = "Monorail Dormitory"
	icon_state = "Sleep"

/area/monorail_max/coridor
	name = "Monorail Coridor"
	icon_state = "red"
	requires_power = 0
*/