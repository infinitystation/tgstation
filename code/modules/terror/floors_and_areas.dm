///Areas///

/area/security/shower
	name = "Shower"
	icon_state = "red"

/area/security/gear
	name = "Gear Room"
	icon_state = "red"

/area/security/security_gear
	name = "Security Gear Room"
	icon_state = "red"

/area/security/dinner
	name = "Dinner room"
	icon_state = "red"

/area/security/west
	name = "West brig's corridor"
	icon_state = "red"

/area/security/infirmary
	name = "Infirmary"
	icon_state = "red"

/area/security/center
	name = "Central brig's corridor"
	icon_state = "red"

/area/security/east
	name = "East brig's corridor"
	icon_state = "red"

/area/security/mass_cell
	name = "Mass cell"
	icon_state = "red"

/area/mine/bravo
	name = "Post Bravo"

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

/area/shuttle/NTcruiser
	name = "Cruiser"
	blob_allowed = 0

/area/mine/lab
	name = "Field Laboratory"
	icon_state = "medresearch"
	blob_allowed = 0

/area/mine/shelter
	name = "lavaland shelter"
	icon_state = "green"
	blob_allowed = 0

/area/crew_quarters/gym
	name = "Gym"

/area/construction/brig
	name = "Prison wing"
	icon_state = "yellow"

/area/toxins/telepad
	name = "Telepad control"
	icon_state = "yellow"

/area/maintenance/xmaint
	name = "Xenolab Maintenance"
	icon_state = "green"

///Flors///

/turf/open/floor/plasteel/terror
	icon = 'icons/turf/terror.dmi'

/turf/open/floor/plasteel/terror/red
	icon_state = "redfull_t"
/turf/open/floor/plasteel/terror/red/side
	icon_state = "red_t"
/turf/open/floor/plasteel/terror/red/corner
	icon_state = "redcorner_t"

/turf/open/floor/plasteel/terror/whitered
	icon_state = "whiteredfull_t"
/turf/open/floor/plasteel/terror/whitered/side
	icon_state = "whitered_t"
/turf/open/floor/plasteel/terror/whitered/corner
	icon_state = "whiteredcorner_t"

/turf/open/floor/plasteel/terror/darkred
	icon_state = "darkredfull_t"
/turf/open/floor/plasteel/terror/darkred/side
	icon_state = "darkred_t"
/turf/open/floor/plasteel/terror/darkred/corner
	icon_state = "darkredcorners_t"

//Necropolis//

/turf/closed/mineral/random/high_chance/volcanic
	environment_type = "basalt"
	mineralChance = 25
	mineralSpawnChanceList = list(
		/turf/closed/mineral/uranium = 35, /turf/closed/mineral/diamond = 30, /turf/closed/mineral/gold = 45,
		/turf/closed/mineral/silver = 50, /turf/closed/mineral/plasma = 50, /turf/closed/mineral/bscrystal = 20)
	initial_gas_mix = "o2=14;n2=23;TEMP=300"
	turf_type = /turf/open/floor/plating/asteroid/basalt/lava_land_surface
	baseturf = /turf/open/floor/plating/asteroid/basalt/lava_land_surface

/turf/closed/mineral/random/high_chance/New()
	icon_state = "rock"
	..()

/turf/open/floor/plasteel/terror/necro
	baseturf = /turf/open/floor/plating/asteroid/basalt/lava_land_surface
	icon = 'icons/turf/floors.dmi'

/turf/open/floor/plasteel/terror/necro/freezer
	icon_state = "freezerfloor"

/turf/open/floor/plasteel/terror/necro/cult
	icon_state = "cult"
	name = "engraved floor"
/turf/open/floor/plasteel/terror/necro/cult/outdoor
	initial_gas_mix = "o2=14;n2=23;TEMP=300"

/turf/open/floor/plasteel/terror/necro/bar
	icon_state = "bar"

/turf/open/floor/plasteel/terror/necro/darkvault
	icon_state = "vault"
/turf/open/floor/plasteel/terror/necro/darkvault/outdoor
	initial_gas_mix = "o2=14;n2=23;TEMP=300"

/turf/open/floor/plasteel/terror/necro/darkwarning
	icon_state = "warndark"
/turf/open/floor/plasteel/terror/necro/darkwarning/corner
	icon_state = "warndarkcorners"

/turf/open/floor/plasteel/terror/necro/darkwarning/outdoor
	initial_gas_mix = "o2=14;n2=23;TEMP=300"
/turf/open/floor/plasteel/terror/necro/darkwarning/corner/outdoor
	initial_gas_mix = "o2=14;n2=23;TEMP=300"

/turf/open/floor/plasteel/terror/necro/warning
	icon_state = "warning"
/turf/open/floor/plasteel/terror/necro/warning/corner
	icon_state = "warningcorner"

/turf/open/floor/plasteel/terror/necro/warnwhite
	icon_state = "warnwhite"
/turf/open/floor/plasteel/terror/necro/warnwhite/corner
	icon_state = "warnwhitecorner"

/turf/open/floor/plasteel/terror/necro/whitepurple
	icon_state = "whitepurplefull"
/turf/open/floor/plasteel/terror/necro/whitepurple/side
	icon_state = "whitepurple"
/turf/open/floor/plasteel/terror/necro/whitepurple/corner
	icon_state = "whitepurplecorner"

/turf/open/floor/plasteel/terror/necro/black
	icon_state = "dark"
	icon = 'icons/turf/infinity.dmi'
/turf/open/floor/plasteel/terror/necro/black/outdoor
	initial_gas_mix = "o2=14;n2=23;TEMP=300"

/turf/open/floor/plasteel/terror/necro/darkyellow
	icon_state = "darkbrownfull"
/turf/open/floor/plasteel/terror/necro/darkyellow/side
	icon_state = "darkbrown"
/turf/open/floor/plasteel/terror/necro/darkyellow/corner
	icon_state = "darkbrowncorners"

/turf/open/floor/plasteel/terror/necro/brown
	icon_state = "brown"
/turf/open/floor/plasteel/terror/necro/brown/corner
	icon_state = "browncorner"

/turf/open/floor/plating/lavaland
	baseturf = /turf/open/floor/plating/asteroid/basalt/lava_land_surface
/turf/open/floor/plating/lavaland/outdoor
	initial_gas_mix = "o2=14;n2=23;TEMP=300"

/turf/open/floor/plasteel/terror/necro/blackvault
	icon_state = "vault"
	icon = 'icons/turf/infinity.dmi'
/turf/open/floor/plasteel/terror/necro/blackvault/corner
	icon_state = "vaultcorner"

/turf/open/floor/plasteel/terror/necro/blackvault/outdoor
	initial_gas_mix = "o2=14;n2=23;TEMP=300"
/turf/open/floor/plasteel/terror/necro/blackvault/corner/outdoor
	initial_gas_mix = "o2=14;n2=23;TEMP=300"

/turf/open/floor/carpet/necro
	baseturf = /turf/open/floor/plating/lava/smooth/lava_land_surface

/turf/open/floor/plasteel/terror/necro/whiteblue
	icon_state = "whitebluefull"
/turf/open/floor/plasteel/terror/necro/whiteblue/side
	icon_state = "whiteblue"
/turf/open/floor/plasteel/terror/necro/whiteblue/corner
	icon_state = "whitebluecorner"

/turf/open/floor/plasteel/terror/necro/white
	icon_state = "white"

/turf/open/floor/plasteel/terror/necro/stairs
	icon_state = "ramptop"
	icon = 'icons/turf/terror.dmi'
/turf/open/floor/plasteel/terror/necro/stairs/bottom
	icon_state = "rampbottom"
/turf/open/floor/plasteel/terror/necro/stairs/top
	icon_state = "ramptop"

/turf/open/floor/plasteel/terror/necro/freezer
	icon_state = "freezerfloor"

/turf/open/floor/plasteel/terror/necro/wood
	icon_state = "wood"
	floor_tile = /obj/item/stack/tile/wood
	broken_states = list("wood-broken", "wood-broken2", "wood-broken3", "wood-broken4", "wood-broken5", "wood-broken6", "wood-broken7")

/turf/open/floor/plasteel/terror/necro/yellow
	icon_state = "yellowfull"
/turf/open/floor/plasteel/terror/necro/yellow/side
	icon_state = "yellow"
/turf/open/floor/plasteel/terror/necro/yellow/corner
	icon_state = "yellowcorner"


/turf/open/floor/plasteel/terror/necro/whiteyellow
	icon_state = "whiteyellowfull"
/turf/open/floor/plasteel/terror/necro/whiteyellow/side
	icon_state = "whiteyellow"
/turf/open/floor/plasteel/terror/necro/whiteyellow/corner
	icon_state = "whiteyellowcorner"

//City floors//

/turf/open/floor/plasteel/terror/city
	baseturf = "ironsand"
	icon = 'icons/turf/floors.dmi'

/turf/open/floor/plasteel/terror/city/darkwarning
	icon_state = "warndark"
/turf/open/floor/plasteel/terror/city/darkwarning/corner
	icon_state = "warndarkcorners"


/turf/open/floor/plasteel/black
	icon_state = "dark"
	icon = 'icons/turf/infinity.dmi'
/turf/open/floor/plasteel/terror/city/black/side
	icon_state = "black"
/turf/open/floor/plasteel/terror/city/black/corner
	icon_state = "blackcorner"
/turf/open/floor/plasteel/terror/city/black/caution
	icon_state = "caution"

/turf/open/floor/plasteel/terror/city/vault
	icon_state = "rockvault"
	floor_tile = /obj/item/stack/tile/plasteel

/turf/open/floor/plasteel/terror/city/grass
	name = "Grass patch"
	icon_state = "grass"
	floor_tile = /obj/item/stack/tile/grass

/turf/open/floor/plasteel/terror/city/carpet
	name = "Carpet"
	icon = 'icons/turf/floors/carpet.dmi'
	icon_state = "carpet"
	floor_tile = /obj/item/stack/tile/carpet

/turf/open/floor/plasteel/terror/city/plating
	name = "plating"
	icon_state = "plating"
	intact = 0

/turf/open/floor/plasteel/terror/city/stairs
	icon_state = "ramptop"
	icon = 'icons/turf/terror.dmi'
/turf/open/floor/plasteel/terror/city/stairs/bottom
	icon_state = "rampbottom"
/turf/open/floor/plasteel/terror/city/stairs/top
	icon_state = "ramptop"

/turf/open/floor/plasteel/terror/city/freezer
	icon_state = "freezerfloor"

/turf/open/floor/plasteel/terror/city/wood
	icon_state = "wood"
	floor_tile = /obj/item/stack/tile/wood
	broken_states = list("wood-broken", "wood-broken2", "wood-broken3", "wood-broken4", "wood-broken5", "wood-broken6", "wood-broken7")

/turf/open/floor/plasteel/terror/city/whitegreen
	icon_state = "whitegreenfull"
/turf/open/floor/plasteel/terror/city/whitegreen/side
	icon_state = "whitegreen"
/turf/open/floor/plasteel/terror/city/whitegreen/corner
	icon_state = "whitegreencorner"

/turf/open/floor/plasteel/terror/city/white
	icon_state = "white"
/turf/open/floor/plasteel/terror/city/white/side
	icon_state = "whitehall"
/turf/open/floor/plasteel/terror/city/white/corner
	icon_state = "whitecorner"

/turf/open/floor/plasteel/terror/city/whitebot
	icon_state = "whitebot"
/turf/open/floor/plasteel/terror/city/whitebot/delivery
	icon_state = "whitedelivery"