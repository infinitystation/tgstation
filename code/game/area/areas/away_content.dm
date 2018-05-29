/*
Unused icons for new areas are "awaycontent1" ~ "awaycontent30"
*/


// Away Missions
/area/awaymission
	name = "Strange Location"
	icon_state = "away"
	has_gravity = TRUE
	ambientsounds = AWAY_MISSION

/area/awaymission/beach
	name = "Beach"
	icon_state = "away"
	dynamic_lighting = DYNAMIC_LIGHTING_ENABLED
	requires_power = FALSE
	has_gravity = TRUE
	ambientsounds = list('sound/ambience/shore.ogg', 'sound/ambience/seag1.ogg','sound/ambience/seag2.ogg','sound/ambience/seag2.ogg','sound/ambience/ambiodd.ogg','sound/ambience/ambinice.ogg')

/area/awaymission/beach/Initialize() //Let's make day/night on a beach!
	..()
	if(prob(50))
		requires_power = 1

/area/awaymission/beach/hotel
	name = "Beach Hotel"
	icon_state = "bar"
	requires_power = 1
	dynamic_lighting = DYNAMIC_LIGHTING_ENABLED

/area/awaymission/errorroom
	name = "Super Secret Room"
	dynamic_lighting = DYNAMIC_LIGHTING_DISABLED
	has_gravity = TRUE

/area/awaymission/vr
	name = "Virtual Reality"
	icon_state = "awaycontent1"