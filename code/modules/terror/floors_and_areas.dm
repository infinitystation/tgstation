///Areas///

/area/security/shower
	name = "Shower"
	icon_state = "red"

/area/mine/bravo
	name = "Post Bravo"

/area/mine/break_romm
	name = "Mine station break room"
	icon_state = "yellow"

/area/engine/break_room
	name = "Engineering Break Room"
	icon_state = "yellow"

/area/CP
	name = "Control Post"
	has_gravity = 1
	valid_territory = 0
	icon_state = "green"


/area/CP/library
	name = "Library"
	icon_state = "library"


/area/CP/arrival
	name = "Arrival area"

/area/CP/cafeteria
	name = "Cafeteria"
	icon_state = "dark"

/area/CP/CP1
	name = "Control Point One"
	icon_state = "yellow"

/area/CP/CP2
	name = "Control Point Two"
	icon_state = "yellow"

/area/CP/shuttle
	name = "CP Shuttle"
	requires_power = 0
	icon_state = "shuttle"

/area/CP/shuttle/pod
	name = "Remote Controlled pod one"

/area/CP/shuttle/pod/two
	name = "Remote Controlled pod two"

/area/shuttle/NTcruiser
	name = "Cruiser"
	blob_allowed = 0 //Should go without saying, no blobs should take over centcom as a win condition.

/area/mercenaries
	name = "Mercenariess area"
	icon_state = "red"
	requires_power = 1
	has_gravity = 1

/area/mercenaries/shuttle
	name = "Mercenariess shuttle"

/area/mercenaries/base
	name = "Mercenariess base"

/area/mercenaries/base/storage
	name = "Storage"

/area/mercenaries/base/hypersleep_room
	name = "Hypersleep room"

/area/mercenaries/base/coridor_1
	name = "Mercenariess area"

/area/mercenaries/base/meeting_room
	name = "Meeting room"

/area/mercenaries/base/coridor_3
	name = "Mercenariess area"

/area/mercenaries/base/coridor_4
	name = "Mercenariess area"



/area/mercenaries/base


///Flors///

/turf/simulated/floor/plasteel/terror
	icon = 'icons/turf/terror.dmi'

/turf/simulated/floor/plasteel/terror/red
	icon_state = "redfull_t"
/turf/simulated/floor/plasteel/terror/red/side
	icon_state = "red_t"
/turf/simulated/floor/plasteel/terror/red/corner
	icon_state = "redcorner_t"

/turf/simulated/floor/plasteel/terror/whitered
	icon_state = "whiteredfull_t"
/turf/simulated/floor/plasteel/terror/whitered/side
	icon_state = "whitered_t"
/turf/simulated/floor/plasteel/terror/whitered/corner
	icon_state = "whiteredcorner_t"

/turf/simulated/floor/plasteel/terror/darkred/
	icon_state = "darkredfull_t"
/turf/simulated/floor/plasteel/terror/darkred/side
	icon_state = "darkred_t"
/turf/simulated/floor/plasteel/terror/darkred/corner
	icon_state = "darkredcorners_t"

//Necropolis//

/turf/simulated/floor/plasteel/terror/necro
	baseturf = /turf/simulated/floor/plating/asteroid/basalt/lava_land_surface
	icon = 'icons/turf/floors.dmi'

/turf/simulated/floor/plasteel/terror/necro/freezer
	icon_state = "freezerfloor"

/turf/simulated/floor/plasteel/terror/necro/bar
	icon_state = "bar"

/turf/simulated/floor/plasteel/terror/necro/darkvault
	icon_state = "vault"

/turf/simulated/floor/plasteel/terror/necro/darkwarning
	icon_state = "warndark"
/turf/simulated/floor/plasteel/terror/necro/darkwarning/corner
	icon_state = "warndarkcorners"

/turf/simulated/floor/plasteel/terror/necro/warning
	icon_state = "warning"
/turf/simulated/floor/plasteel/terror/necro/warning/corner
	icon_state = "warningcorners"

/turf/simulated/floor/plasteel/terror/necro/black
	icon_state = "dark"
	icon = 'icons/turf/infinity.dmi'

/turf/simulated/floor/plasteel/terror/necro/darkyellow
	icon_state = "darkbrownfull"
/turf/simulated/floor/plasteel/terror/necro/darkyellow/side
	icon_state = "darkbrown"
/turf/simulated/floor/plasteel/terror/necro/darkyellow/corner
	icon_state = "darkbrowncorners"

/turf/simulated/floor/plasteel/terror/necro/brown
	icon_state = "brown"
/turf/simulated/floor/plasteel/terror/necro/brown/corner
	icon_state = "browncorner"

/turf/simulated/wall/lavaland
	baseturf = /turf/simulated/floor/plating/asteroid/basalt/lava_land_surface

/turf/simulated/wall/r_wall/lavaland
	baseturf = /turf/simulated/floor/plating/asteroid/basalt/lava_land_surface

/turf/simulated/floor/plating/lavaland
	baseturf = /turf/simulated/floor/plating/asteroid/basalt/lava_land_surface

/turf/simulated/floor/plasteel/terror/necro/blackvault
	icon_state = "vault"
	icon = 'icons/turf/infinity.dmi'
/turf/simulated/floor/plasteel/terror/necro/blackvault/corner
	icon_state = "vaultcorner"

/turf/simulated/floor/plasteel/terror/necro/carpet
	name = "Carpet"
	icon = 'icons/turf/floors/carpet.dmi'
	icon_state = "carpet"
	floor_tile = /obj/item/stack/tile/carpet

/turf/simulated/floor/plasteel/terror/necro/plating
	name = "plating"
	icon_state = "plating"

/turf/simulated/floor/plasteel/terror/necro/whiteblue
	icon_state = "whitebluefull"
/turf/simulated/floor/plasteel/terror/necro/whiteblue/side
	icon_state = "whiteblue"
/turf/simulated/floor/plasteel/terror/necro/whiteblue/corner
	icon_state = "whitebluecorner"

/turf/simulated/floor/plasteel/terror/necro/white
	icon_state = "white"


/turf/simulated/floor/plasteel/terror/necro/stairs
	icon_state = "ramptop"
	icon = 'icons/turf/terror.dmi'
/turf/simulated/floor/plasteel/terror/necro/stairs/bottom
	icon_state = "rampbottom"
/turf/simulated/floor/plasteel/terror/necro/stairs/top
	icon_state = "ramptop"

/turf/simulated/floor/plasteel/terror/necro/freezer
	icon_state = "freezerfloor"

/turf/simulated/floor/plasteel/terror/necro/wood
	icon_state = "wood"
	floor_tile = /obj/item/stack/tile/wood
	broken_states = list("wood-broken", "wood-broken2", "wood-broken3", "wood-broken4", "wood-broken5", "wood-broken6", "wood-broken7")

//City floors//

/turf/simulated/floor/plasteel/terror/city
	baseturf = "ironsand"
	icon = 'icons/turf/floors.dmi'

/turf/simulated/floor/plasteel/terror/city/darkwarning
	icon_state = "warndark"
/turf/simulated/floor/plasteel/terror/city/darkwarning/corner
	icon_state = "warndarkcorners"


/turf/simulated/floor/plasteel/black
	icon_state = "dark"
	icon = 'icons/turf/infinity.dmi'
/turf/simulated/floor/plasteel/terror/city/black/side
	icon_state = "black"
/turf/simulated/floor/plasteel/terror/city/black/corner
	icon_state = "blackcorner"
/turf/simulated/floor/plasteel/terror/city/black/caution
	icon_state = "caution"

/turf/simulated/floor/plasteel/terror/city/vault
	icon_state = "rockvault"
	floor_tile = /obj/item/stack/tile/plasteel

/turf/simulated/floor/plasteel/terror/city/grass
	name = "Grass patch"
	icon_state = "grass"
	floor_tile = /obj/item/stack/tile/grass

/turf/simulated/floor/plasteel/terror/city/carpet
	name = "Carpet"
	icon = 'icons/turf/floors/carpet.dmi'
	icon_state = "carpet"
	floor_tile = /obj/item/stack/tile/carpet

/turf/simulated/floor/plasteel/terror/city/plating
	name = "plating"
	icon_state = "plating"
	intact = 0

/turf/simulated/floor/plasteel/terror/city/stairs
	icon_state = "ramptop"
	icon = 'icons/turf/terror.dmi'
/turf/simulated/floor/plasteel/terror/city/stairs/bottom
	icon_state = "rampbottom"
/turf/simulated/floor/plasteel/terror/city/stairs/top
	icon_state = "ramptop"

/turf/simulated/floor/plasteel/terror/city/freezer
	icon_state = "freezerfloor"

/turf/simulated/floor/plasteel/terror/city/wood
	icon_state = "wood"
	floor_tile = /obj/item/stack/tile/wood
	broken_states = list("wood-broken", "wood-broken2", "wood-broken3", "wood-broken4", "wood-broken5", "wood-broken6", "wood-broken7")

/turf/simulated/floor/plasteel/terror/city/whitegreen
	icon_state = "whitegreenfull"
/turf/simulated/floor/plasteel/terror/city/whitegreen/side
	icon_state = "whitegreen"
/turf/simulated/floor/plasteel/terror/city/whitegreen/corner
	icon_state = "whitegreencorner"

/turf/simulated/floor/plasteel/terror/city/white
	icon_state = "white"
/turf/simulated/floor/plasteel/terror/city/white/side
	icon_state = "whitehall"
/turf/simulated/floor/plasteel/terror/city/white/corner
	icon_state = "whitecorner"

/turf/simulated/floor/plasteel/terror/city/whitebot
	icon_state = "whitebot"
/turf/simulated/floor/plasteel/terror/city/whitebot/delivery
	icon_state = "whitedelivery"