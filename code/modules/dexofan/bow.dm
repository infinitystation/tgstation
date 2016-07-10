/obj/item/weapon/gun/projectile/bow
	name = "bow"
	icon = 'icons/obj/torf.dmi'
	icon_state = "bow"
	item_state = "bow"
	w_class = 3
	throw_speed = 3
	throw_range = 7
	force = 4
	materials = list(MAT_METAL=2000)
	origin_tech = "combat=2"
	fire_sound = 'sound/items/syringeproj.ogg'
	var/list/arrows = list()
	var/max_arrows = 1
	var/armed = 0
	lefthand_file = 'icons/mob/inhands/infinity_obj_left.dmi'
	righthand_file = 'icons/mob/inhands/infinity_obj_right.dmi'

/obj/item/weapon/gun/projectile/bow/New()
	..()
	chambered = new /obj/item/ammo_casing/caseless/arrow(src)

/obj/item/weapon/gun/projectile/bow/update_icon()
	if(armed)
		icon_state = "bow_arrow"
		item_state = "bow_arrow"
	else
		icon_state = "bow"
		item_state = "bow"

/obj/item/weapon/gun/projectile/bow/newshot()
	if(!arrows.len) return

	var/obj/item/ammo_casing/caseless/arrow/S = arrows[1]

	if(!S) return

	chambered.BB = new S.projectile_type (src)
	chambered.BB.name = S.name
	arrows.Remove(S)
	qdel(S)
	armed = 0
	update_icon()
	return

/obj/item/weapon/gun/projectile/bow/process_chamber()
	return

/obj/item/weapon/gun/projectile/bow/afterattack(atom/target, mob/living/user, flag, params)
	newshot()
	..()


/obj/item/weapon/gun/projectile/bow/examine(mob/user)
	..()
	user << "Can hold [max_arrows] arrow\s. Has [arrows.len] arrows\s remaining."

/obj/item/weapon/gun/projectile/bow/attack_self(mob/living/user)
	if(!arrows.len)
		user << "<span class='warning'>[src] without arrows!</span>"
		return 0

	var/obj/item/ammo_casing/caseless/arrow/S = arrows[arrows.len]

	if(!S) return 0
	S.loc = user.loc

	arrows.Remove(S)
	user << "<span class='notice'>You unload [S] from \the [src].</span>"

	return 1

/obj/item/weapon/gun/projectile/bow/attackby(obj/item/A, mob/user, params, show_msg = 1)
	if(istype(A, /obj/item/ammo_casing/caseless/arrow))
		if(arrows.len < max_arrows)
			if(!user.unEquip(A))
				return
			user << "<span class='notice'>You pulled the bowstring.</span>"
			arrows.Add(A)
			A.loc = src
			armed = 1
			update_icon()
			return 1
		else
			usr << "<span class='warning'>[src] cannot hold more arrows!</span>"
	return 0