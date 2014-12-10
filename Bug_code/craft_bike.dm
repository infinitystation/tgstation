/obj/structure/craft_bike
	density = 1
	opacity = 0

	icon =
	icon_state =



	var/datum/construction/construct


/obj/structure/craft_bike/New()
	..()
	bound_width = 64
	bound_height = 64

	construct = new /datum/construction/reversible2/pod(src)

	dir = EAST

/obj/structure/craft_bike/attackby(obj/item/W as obj, mob/user as mob)
	if(!construct || !construct.action(W, user))
		..()
	return

/obj/structure/craft_bike/attack_hand()
	return



/////////////////////////////////
// CONSTRUCTION STEPS
/////////////////////////////////
/datum/construction/reversible2/segway
	result = /obj/craft_bike
	base_icon="csegway"
	steps = list(
				// 1. Initial state
				list(
					"desc" = "An empty pod frame.",
					state_next = list(
						"key"      = /obj/item/weapon/cable_coil,
						"vis_msg"  = "{USER} wires the {HOLDER}.",
						"self_msg" = "You wire the {HOLDER}."
					)
				),
				// 2. Crudely Wired
				list(
					"desc" = "A crudely-wired pod frame.",
					state_prev = list(
						"key"      = /obj/item/weapon/wirecutters,
						"vis_msg"  = "{USER} cuts out the {HOLDER}'s wiring.",
						"self_msg" = "You remove the {HOLDER}'s wiring."
					),
					state_next = list(
						"key"      = /obj/item/weapon/screwdriver,
						"vis_msg"  = "{USER} adjusts the wiring.",
						"self_msg" = "You adjust the {HOLDER}'s wiring."
					)
				),
				// 3. Cleanly wired
				list(
					"desc" = "A wired pod frame.",
					state_prev = list(
						"key"      = /obj/item/weapon/screwdriver,
						"vis_msg"  = "{USER} unclips {HOLDER}'s wiring harnesses.",
						"self_msg" = "You unclip {HOLDER}'s wiring harnesses."
					),
					state_next = list(
						"key"      = /obj/item/weapon/circuitboard/mecha/pod,
						"vis_msg"  = "{USER} inserts the mainboard into the {HOLDER}.",
						"self_msg" = "You insert the mainboard into the {HOLDER}.",
						"delete"   = 1
					)
				),
				// 4. Circuit added
				list(
					"desc" = "A wired pod frame with a loose mainboard.",
					state_prev = list(
						"key"      = /obj/item/weapon/crowbar,
						"vis_msg"  = "{USER} pries out the mainboard.",
						"self_msg" = "You pry out the mainboard.",

						"spawn"    = /obj/item/weapon/circuitboard/mecha/pod,
						"amount"   = 1
					),
					state_next = list(
						"key"      = /obj/item/weapon/screwdriver,
						"vis_msg"  = "{USER} secures the mainboard.",
						"self_msg" = "You secure the mainboard."
					)
				),
				// 5. Circuit secured
				list(
					"desc" = "A wired pod frame with a secured mainboard.",
					state_prev = list(
						"key"      = /obj/item/weapon/screwdriver,
						"vis_msg"  = "{USER} unsecures the mainboard.",
						"self_msg" = "You unscrew the mainboard from the {HOLDER}."
					),
					state_next = list(
						"key"      = /obj/item/pod_parts/core,
						"vis_msg"  = "{USER} inserts the core into the {HOLDER}.",
						"self_msg" = "You carefully insert the core into the {HOLDER}.",
						"delete"   = 1
					)
				),
				// 6. Core inserted
				list(
					"desc" = "A naked space pod with a loose core.",
					state_prev = list(
						"key"      = /obj/item/weapon/crowbar,
						"vis_msg"  = "{USER} delicately removes the core from the {HOLDER} with a crowbar.",
						"self_msg" = "You delicately remove the core from the {HOLDER} with a crowbar.",

						"spawn"    = /obj/item/pod_parts/core,
						"amount"   = 1
					),
					state_next = list(
						"key"      = /obj/item/weapon/wrench,
						"vis_msg"  = "{USER} secures the core's bolts.",
						"self_msg" = "You secure the core's bolts."
					)
				),
				// 7. Core secured
				list(
					"desc" = "A naked space pod with an exposed core. How lewd.",
					state_prev = list(
						"key"      = /obj/item/weapon/wrench,
						"vis_msg"  = "{USER} unsecures the {HOLDER}'s core.",
						"self_msg" = "You unsecure the {HOLDER}'s core."
					),
					state_next = list(
						"key"      = /obj/item/stack/sheet/metal,
						"amount"   = 5,
						"vis_msg"  = "{USER} frabricates a pressure bulkhead for the {HOLDER}.",
						"self_msg" = "You frabricate a pressure bulkhead for the {HOLDER}."
					)
				),
				// 8. Bulkhead added
				list(
					"desc" = "A space pod with loose bulkhead panelling exposed.",
					state_prev = list(
						"key"      = /obj/item/weapon/crowbar,
						"vis_msg"  = "{USER} pops the {HOLDER}'s bulkhead panelling loose.",
						"self_msg" = "You pop the {HOLDER}'s bulkhead panelling loose.",

						"spawn"    = /obj/item/stack/sheet/metal,
						"amount"   = 5,
					),
					state_next = list(
						"key"      = /obj/item/weapon/wrench,
						"vis_msg"  = "{USER} secures the {HOLDER}'s bulkhead panelling.",
						"self_msg" = "You secure the {HOLDER}'s bulkhead panelling."
					)
				),
				// 9. Bulkhead secured with bolts
				list(
					"desc" = "A space pod with unwelded bulkhead panelling exposed.",
					state_prev = list(
						"key"      = /obj/item/weapon/wrench,
						"vis_msg"  = "{USER} unbolts the {HOLDER}'s bulkhead panelling.",
						"self_msg" = "You unbolt the {HOLDER}'s bulkhead panelling."
					),
					state_next = list(
						"key"      = /obj/item/weapon/weldingtool,
						"vis_msg"  = "{USER} seals the {HOLDER}'s bulkhead panelling with a weld.",
						"self_msg" = "You seal the {HOLDER}'s bulkhead panelling with a weld."
					)
				),
				// 10. Welded bulkhead
				list(
					"desc" = "A space pod with sealed bulkhead panelling exposed.",
					state_prev = list(
						"key"      = /obj/item/weapon/weldingtool,
						"vis_msg"  = "{USER} cuts the {HOLDER}'s bulkhead panelling loose.",
						"self_msg" = "You cut the {HOLDER}'s bulkhead panelling loose."
					),
					state_next = list(
						"key"      = /obj/item/stack/sheet/plasteel,
						"amount"   = 5,
						"vis_msg"  = "{USER} installs the {HOLDER}'s plasteel armor.",
						"self_msg" = "You install the {HOLDER}'s plasteel armor."
					)
				),
				// 11. Loose armor
				list(
					"desc" = "A space pod with unsecured armor.",
					state_prev = list(
						"key"      = /obj/item/weapon/crowbar,
						"vis_msg"  = "{USER} pries off {HOLDER}'s armor.",
						"self_msg" = "You pry off {HOLDER}'s armor."
					),
					state_next = list(
						"key"      = /obj/item/weapon/wrench,
						"vis_msg"  = "{USER} bolts down the {HOLDER}'s armor.",
						"self_msg" = "You bolt down the {HOLDER}'s armor."
					)
				),
				// 12. Bolted-down armor
				list(
					"desc" = "A space pod with unsecured armor.",
					state_prev = list(
						"key"      = /obj/item/weapon/wrench,
						"vis_msg"  = "{USER} unsecures the {HOLDER}'s armor.",
						"self_msg" = "You unsecure the {HOLDER}'s armor."
					),
					state_next = list(
						"key"      = /obj/item/weapon/weldingtool,
						"vis_msg"  = "{USER} welds the {HOLDER}'s armor.",
						"self_msg" = "You weld the {HOLDER}'s armor."
					)
				)
				// EOF
			)

	spawn_result(mob/user as mob)
		..()
		return