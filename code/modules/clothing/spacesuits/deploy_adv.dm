
/*
*	Code by vert1881/Lilorien Vert
*	Refactored to standart /tg/
*	Vert's unused code is commented
*/
/obj/item/clothing/head/helmet/space/hardsuit/space_adv
	name = "Space working hardsuit helmet"
	desc = "—пециальный шлем для работы вне атмосферы, имеет защитный слой от радиации."
	icon = 'icons/obj/space_adv.dmi'
	worn_icon = 'icons/mob/space_adv.dmi'
	icon_state = "rig0-rd"
	item_state = "ce_helm"
	basestate = "rig"
	item_color = "rd"
	armor = list(melee = 10, bullet = 5, laser = 10, energy = 5, bomb = 10, bio = 100, rad = 80, fire = 40, acid = 60)
	slowdown = 1
	resistance_flags = FIRE_PROOF | UNACIDABLE

/obj/item/clothing/suit/space/hardsuit/space_adv
	name = "Space working hardsuit"
	desc = "—пециальный костюм для работы вне атмосферы, имеет защитный слой от радиации и выдвигаемый шлем."
	icon = 'icons/obj/space_adv.dmi'
	icon_state = "rdrig"
	item_state = "ce_hardsuit"
	worn_icon = 'icons/mob/space_adv.dmi'
	slowdown = 1
	armor = list(melee = 10, bullet = 5, laser = 10, energy = 5, bomb = 10, bio = 100, rad = 90, fire = 40, acid = 60)
	allowed = list(/obj/item/device/flashlight,/obj/item/weapon/tank,/obj/item/weapon/storage/bag/ore,/obj/item/device/t_scanner,/obj/item/weapon/pickaxe, /obj/item/weapon/rcd)
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/space_adv
	resistance_flags = FIRE_PROOF | UNACIDABLE

/obj/item/clothing/suit/space/hardsuit/space_adv/New()
	jetpack = new /obj/item/weapon/tank/jetpack/suit(src)
	..()

	//var/depl = 0
	//var/mob/living/carbon/affecting = null //The wearer
	//var/act = 0
	//action_button_name = "Toggle Helmet"
/*
/obj/item/clothing/suit/space/space_adv/attack_self(mob/user)
	if(act)
		return
	if(!depl)
		depl_act(usr)
		return
	if(depl)
		retr()
		return



//Space ninja autif. for e.g

                     //____DEPLOY_____//
/obj/item/clothing/suit/space/space_adv/proc/depl()
	set name = "Deploy Helmet"
	set category = "Suit"
	set src in usr // User visible
	depl_act(usr)


/obj/item/clothing/suit/space/space_adv/proc/depl_act(mob/living/carbon/U, X = 0) //“г не любит когда объединяют проки
	if(act)
		return
	if(istype(usr:wear_suit, /obj/item/clothing/suit/space/space_adv))
		if(!istype(usr:head, /obj/item/clothing/head))               //Head gear cheking
			var/obj/item/clothing/head/helmet/space/space_adv/n_hood //Ўлем
			usr.update_icons()

			act = 1
			affecting = U
			depl = 1
//			canremove = 0
			flags |= NODROP
			sleep 2
			if(istype(U:wear_suit, /obj/item/clothing/suit/space/space_adv/rig))
				usr.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/space/space_adv/rig(src), slot_head)//orig
			if(istype(U:wear_suit, /obj/item/clothing/suit/space/space_adv/military))
				usr.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/space/space_adv/military(src), slot_head)//military
			if(istype(U:wear_suit, /obj/item/clothing/suit/space/space_adv/swat))
				usr.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/space/space_adv/swat(src), slot_head)//swat
			if(istype(U:wear_suit, /obj/item/clothing/suit/space/space_adv))
				usr.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/space/space_adv(src), slot_head)


			n_hood = usr:head
			n_hood.flags |= NODROP
			U.update_icons()
			U.update_hud()
			U << "\red <B>HEAD GEAR DEPLOYED</B>\n"
			depl_a() //verbs
			act = 0
			return

		else


			usr << "\red <B>ERROR</B>: 100113 \black HEAD GEAR LOCATED \nABORTING..."
			return 0

	return

                      //____RETRACT_____//
/obj/item/clothing/suit/space/space_adv/proc/retr()

	set name = "Retract Helmet"
	set category = "Suit"
	set src in usr
	var/obj/item/clothing/head/helmet/space/space_adv/n_hood //Ўлем
	n_hood = usr:head
	usr.update_icons()
	if(act)
		return
	act = 1
	if(n_hood)//HEAD should be attached
		sleep 2
		n_hood.flags &= ~NODROP
		usr:client.screen -= n_hood
		usr.unEquip(n_hood)
		del(n_hood)
//		usr.contents -= n_hood
//		usr:head = null //Delete head
		usr.update_icons()
		usr.update_hud()
		usr.client.screen -= /obj/item/clothing/head/helmet/space/space_adv

//		canremove = 1
//		n_hood = usr:head
//		n_hood.canremove = 1
		depl = 0
		flags &= ~NODROP
		affecting = null
		usr << "\red <B>HEAD GEAR RETRACTED</B>\n"
		depl_a()
	else
		usr << "\red <B>ERROR</B>: 100113 \black HEAD GEAR NOT LOCATED \nABORTING..."
	depl_a()
	usr.update_icons()
	usr.update_hud()
	act = 0
	return

                     //____CHECKING_____//
/obj/item/clothing/suit/space/space_adv/proc/depl_a()
	if(depl)
		verbs -= /obj/item/clothing/suit/space/space_adv/proc/depl
		verbs += /obj/item/clothing/suit/space/space_adv/proc/retr
	else
		verbs += /obj/item/clothing/suit/space/space_adv/proc/depl
		verbs -= /obj/item/clothing/suit/space/space_adv/proc/retr
	return

/obj/item/clothing/suit/space/space_adv/New()
	..()
	verbs += /obj/item/clothing/suit/space/space_adv/proc/depl//suit initialize verb





	                  //___Unwrench___//To remove suit

/obj/item/weapon/wrench/attack(mob/living/carbon/M as mob, mob/living/carbon/user as mob)
	if(user.zone_sel.selecting == "head")
		src.add_fingerprint(user)
		if(istype(M:wear_suit, /obj/item/clothing/suit/space/space_adv))
			var/obj/item/clothing/head/helmet/space/space_adv/n_hood //Ўлем
			var/obj/item/clothing/suit/space/space_adv/n_body
			n_hood = M:head
			n_body = M:wear_suit
			if(n_hood)
				user.visible_message("\red [user] begins to unwrench [M]'s suit.", "\red You begin to unwrench the suit of [M].")
				sleep 2
//				M.unEquip(n_hood)
				n_body.flags &= ~NODROP
				n_hood.flags &= ~NODROP
				user.visible_message("\red [user] unwrench [M]'s suit.", "\red You unwrench the suit of [M].")
			else
				return ..()
	else
		return ..()

//RIG NORM (to older versions of rig's)

/obj/item/clothing/head/helmet/space/space_adv/rig
	name = "engineering hardsuit helmet (Wrench to unscrew)"
	desc = "—пециальный шлем для работы вне атмосферы, имеет защитный слой от радиации. ¬ы можете открутить его с помощью гаечного ключа"
	icon_state = "hardsuit0-engineering"
	item_state = "eng_helm"
	armor = list(melee = 10, bullet = 5, laser = 10, energy = 5, bomb = 10, bio = 100, rad = 75)
	allowed = list(/obj/item/device/flashlight)
	var/brightness_on = 4 //luminosity when on
	var/on = 0
	item_color = "engineering" //Determines used sprites: hardsuit[on]-[color] and hardsuit[on]-[color]2 (lying down sprite)
	action_button_name = "Toggle Helmet Light"

/obj/item/clothing/head/helmet/space/space_adv/rig/attack_self(mob/user)
	if(!isturf(user.loc))
		user << "You cannot turn the light on while in this [user.loc]" //To prevent some lighting anomalities.
		return
	on = !on
	icon_state = "hardsuit[on]-[item_color]"
//	item_state = "hardsuit[on]-[item_color]"
	user.update_inv_head()	//so our mob-overlays update

	if(on)	user.AddLuminosity(brightness_on)
	else	user.AddLuminosity(-brightness_on)

/obj/item/clothing/head/helmet/space/space_adv/rig/pickup(mob/user)
	if(on)
		user.AddLuminosity(brightness_on)
//		user.UpdateLuminosity()
		SetLuminosity(0)

/obj/item/clothing/head/helmet/space/space_adv/rig/dropped(mob/user)
	if(on)
		user.AddLuminosity(-brightness_on)
//		user.UpdateLuminosity()
		SetLuminosity(brightness_on)



/obj/item/clothing/suit/space/space_adv/rig
	name = "engineering hardsuit"
	desc = "—пециальный костюм для работы вне атмосферы, имеет защитный слой от радиации и выдвигаемый шлем. ¬ы можете отключить его от шлема с помошью откручивания специальных креплений на выдвинутом шлеме"
	icon_state = "hardsuit-engineering"
	item_state = "eng_hardsuit"
	slowdown = 2
	armor = list(melee = 10, bullet = 5, laser = 10, energy = 5, bomb = 10, bio = 100, rad = 75)
	allowed = list(/obj/item/device/flashlight,/obj/item/weapon/tank,/obj/item/device/t_scanner, /obj/item/weapon/rcd)	*/

	                 //____OTHER SUITS_____//	*/

///Military // Cargo color suits
/obj/item/clothing/head/helmet/space/hardsuit/space_adv/military
	name = "Military space hardsuit helmet"
	desc = "—пециальный шлем разработанный для армии. ¬ы можете открутить его с помощью гаечного ключа"
	icon_state = "rig0-military"
	item_state = "rig_helm"
	item_color = "military"
	armor = list(melee = 60, bullet = 70, laser = 60, energy = 50, bomb = 75, bio = 100, rad = 80, fire = 10, acid = 20)

/obj/item/clothing/suit/space/hardsuit/space_adv/military
	name = "Military space hardsuit"
	desc = "—пециальный костюм разработанный для армии. »меет укрепленные слои защиты и выдвигаемый шлем. ¬ы можете отключить его от шлема с помошью откручивания специальных креплений на выдвинутом шлеме"
	icon_state = "militaryrig"
	item_state = "rig_suit"
	armor = list(melee = 60, bullet = 80, laser = 60, energy = 50, bomb = 75, bio = 100, rad = 80, fire = 10, acid = 20)
	allowed = list(/obj/item/weapon/gun,/obj/item/device/flashlight,/obj/item/weapon/tank,/obj/item/weapon/melee/baton)
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/space_adv/military

//SWAT //Red suits
/obj/item/clothing/head/helmet/space/hardsuit/space_adv/swat
	name = "Swat space hardsuit helmet"
	desc = "—пециальный шлем разработанный для отряда SWAT. ¬ы можете открутить его с помощью гаечного ключа"
	icon_state = "rig0-swat"
	item_state = "sec_helm"
	item_color = "swat"
	armor = list(melee = 90, bullet = 60, laser = 60, energy = 20, bomb = 45, bio = 100, rad = 80, fire = 10, acid = 20)
	var/hud_type = DATA_HUD_SECURITY_ADVANCED // HUD

/obj/item/clothing/suit/space/hardsuit/space_adv/swat
	name = "SWAT space hardsuit"
	desc = "—пециальный костюм для отряда SWAT. имеет плотный слой боевого  елвара и выдвигаемый шлем. ¬ы можете отключить его от шлема с помошью откручивания специальных креплений на выдвинутом шлеме"
	icon_state = "swatrig"
	item_state = "sec_hardsuit"
	armor = list(melee = 80, bullet = 50, laser = 50, energy = 20, bomb = 45, bio = 100, rad = 80, fire = 10, acid = 20)
	allowed = list(/obj/item/weapon/gun,/obj/item/device/flashlight,/obj/item/weapon/tank,/obj/item/weapon/melee/baton)
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/space_adv/swat

// HUD
/obj/item/clothing/head/helmet/space/hardsuit/space_adv/swat/equipped(mob/living/carbon/human/user, slot)
	if(slot == slot_head)
		var/datum/atom_hud/H = huds[hud_type]
		H.add_hud_to(user)

/obj/item/clothing/head/helmet/space/hardsuit/space_adv/swat/dropped(mob/living/carbon/human/user)
	var/datum/atom_hud/H = huds[hud_type]
	H.remove_hud_from(user)
//END HUD

