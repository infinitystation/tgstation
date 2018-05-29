/***************************************************************
**						Design Datums						  **
**	All the data for building stuff.						  **
***************************************************************/
/*
For the materials datum, it assumes you need reagents unless specified otherwise. To designate a material that isn't a reagent,
you use one of the material IDs below. These are NOT ids in the usual sense (they aren't defined in the object or part of a datum),
they are simply references used as part of a "has materials?" type proc. They all start with a $ to denote that they aren't reagents.
The currently supporting non-reagent materials. All material amounts are set as the define MINERAL_MATERIAL_AMOUNT, which defaults to 2000
- MAT_METAL (/obj/item/stack/metal).
- MAT_GLASS (/obj/item/stack/glass).
- MAT_PLASMA (/obj/item/stack/plasma).
- MAT_SILVER (/obj/item/stack/silver).
- MAT_GOLD (/obj/item/stack/gold).
- MAT_URANIUM (/obj/item/stack/uranium).
- MAT_DIAMOND (/obj/item/stack/diamond).
- MAT_BANANIUM (/obj/item/stack/bananium).
(Insert new ones here)

Don't add new keyword/IDs if they are made from an existing one (such as rods which are made from metal). Only add raw materials.

Design Guidelines
- When adding new designs, check rdreadme.dm to see what kind of things have already been made and where new stuff is needed.
- A single sheet of anything is 2000 units of material. Materials besides metal/glass require help from other jobs (mining for
other types of metals and chemistry for reagents).
- Add the AUTOLATHE tag to
*/

//DESIGNS ARE GLOBAL. DO NOT CREATE OR DESTROY THEM AT RUNTIME OUTSIDE OF INIT, JUST REFERENCE THEM TO WHATEVER YOU'RE DOING! //why are you yelling?

/datum/design						//Datum for object designs, used in construction
	var/name = "Name"					//Name of the created object.
	var/desc = "Desc"					//Description of the created object.
	var/id = DESIGN_ID_IGNORE						//ID of the created object for easy refernece. Alphanumeric, lower-case, no symbols
	var/build_type = null				//Flag as to what kind machine the design is built in. See defines.
	var/list/materials = list()			//List of materials. Format: "id" = amount.
	var/construction_time				//Amount of time required for building the object
	var/build_path = null				//The file path of the object that gets created
	var/list/make_reagents = list()			//Reagents produced. Format: "id" = amount. Currently only supported by the biogenerator.
	var/list/category = null 			//Primarily used for Mech Fabricators, but can be used for anything
	var/locked = 0
	var/access = null
	var/list/reagents_list = list()			//List of reagents. Format: "id" = amount.
	var/maxstack = 1
	var/lathe_time_factor = 1			//How many times faster than normal is this to build on the protolathe
	var/dangerous_construction = FALSE	//notify and log for admin investigations if this is printed.
	var/departmental_flags = ALL			//bitflags for deplathes.
	var/list/datum/techweb_node/unlocked_by = list()
	var/icon_cache

/datum/design/Destroy()
	CRASH("DESIGN DATUMS SHOULD NOT EVER BE DESTROYED AS THEY ARE ONLY MEANT TO BE IN A GLOBAL LIST AND REFERENCED FOR US.")
	return ..()

/datum/design/proc/icon_html(client/user)
	var/datum/asset/spritesheet/sheet = get_asset_datum(/datum/asset/spritesheet/research_designs)
	sheet.send(user)
	return sheet.icon_tag(id)

////////////////////////////////////////
//Disks for transporting design datums//
////////////////////////////////////////

/obj/item/disk/design_disk
	name = "Component Design Disk"
	desc = "A disk for storing device design data for construction in lathes."
	icon_state = "datadisk1"
	materials = list(MAT_METAL=300, MAT_GLASS=100)
	var/list/blueprints = list()
	var/max_blueprints = 1

/obj/item/disk/design_disk/Initialize()
	. = ..()
	pixel_x = rand(-5, 5)
	pixel_y = rand(-5, 5)
	for(var/i in 1 to max_blueprints)
		blueprints += null

/obj/item/disk/design_disk/adv
	name = "Advanced Component Design Disk"
	desc = "A disk for storing device design data for construction in lathes. This one has extra storage space."
	materials = list(MAT_METAL=300, MAT_GLASS=100, MAT_SILVER = 50)
	max_blueprints = 5
////////////Space Suits Designs//////////
/////////////////////////////////////////
//////Space Suits coded by Vert1881//////

/datum/design/adv_hardsuit
	name = "Space working hardsuit"
	desc = "Специальный костюм дл&#255; работы вне атмосферы, имеет защитный слой от радиации и выдвигаемый шлем. Вы можете отключить его от шлема с помошью откручивани&#255; специальных креплений на выдвинутом шлеме"
	id = "adv_hardsuit"
	build_type = PROTOLATHE
	materials = list("$metal" = 10000, "$silver" = 4000, "$gold" = 4000)
	build_path = /obj/item/clothing/suit/space/hardsuit/space_adv
	category = list("Equipment")
	locked = 1
	access = list(ACCESS_EVA)

/datum/design/adv_hardsuit/combat
	name = "Military space hardsuit"
	desc = "Специальный костюм разработанный дл&#255; армии. Имеет укрепленные слои защиты и выдвигаемый шлем. Вы можете отключить его от шлема с помошью откручивани&#255; специальных креплений на выдвинутом шлеме"
	id = "adv_hardsuit_combat"
	build_type = PROTOLATHE
	materials = list("$metal" = 10000, "$silver" = 4000, "$gold" = 4000, "$plasma" = 4000)
	build_path = /obj/item/clothing/suit/space/hardsuit/space_adv/military
	category = list("Equipment")
	locked = 1
	access = list(ACCESS_ARMORY)

/datum/design/adv_rcd
	name = "Advanced RCD"
	desc = "Advacned RCD. Can build reinforced walls"
	id = "adv_rcd"
	build_type = PROTOLATHE
	materials = list("$metal" = 20000, "$silver" = 2500, "$gold" = 2500, "$plasma" = 2500, "$glass" = 2500)
	build_path = /obj/item/construction/rcd/advanced
	category = list("Equipment")
	locked = 1
	access = list(ACCESS_CE)

/datum/design/multimeter
	name = "Multimeter"
	desc = "Используетс&#255; дл&#255; измерени&#255; потреблени&#255; электроэнергии оборудовани&#255; и прозвонки проводов. Рекомендуетс&#255; докторами"
	id = "multimeter"
	build_type = PROTOLATHE
	materials = list("$metal" = 1000, "$glass" = 1000, "$silver" = 500)
	build_path = /obj/item/multitool/multimeter
	category = list("Equipment")

/////////////////////////////////////////
////////////Suits Designs////////////////
/////////////////////////////////////////

/datum/design/chameleon
	name = "Strange black jumpsuit"
	desc = "It's a plain jumpsuit. It has a small dial on the wrist."
	id = "chameleon"
	build_type = PROTOLATHE
	materials = list(MAT_METAL = 4000, MAT_SILVER = 1000)
	build_path = /obj/item/clothing/under/chameleon
	category = list("Equipment")
	locked = 1
	access = list(ACCESS_EVA)

/////////////////////////////////////////
////////////Tools//////////////
/////////////////////////////////////////
