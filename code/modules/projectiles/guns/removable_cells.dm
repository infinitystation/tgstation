//чистый код, можно даже не вставлять.
/obj/item/weapon/gun/energy/verb/eject_battery(mob/living/user as mob)
	if (cell_removing)
		set name = "Eject Battery"
		set category = "Object"

		if(power_supply)
			user << "<span class='notice'>You pull the [power_supply] out of \the [src]!</span>"
			power_supply.loc = get_turf(src.loc)
			power_supply.update_icon()
			user.put_in_hands(power_supply)
			power_supply = null
			update_icon()
			return
		else
			user << "<span class='notice'>It has no cell!</span>"
	else
		user << "<span class='notice'>You cant remove cell from that gun</span>"
	return

/obj/item/weapon/gun/energy/attackby(var/obj/item/A as obj, mob/user as mob)
	if(istype(A, /obj/item/weapon/stock_parts/cell/ammo) && !power_supply)
		user.drop_item()
		power_supply = A
		power_supply.loc = src
		user << "<span class='notice'>You load a new [power_supply] into \the [src]!</span>"
		update_icon()
	else
		..()
	return

//а вот это вставить в место оригинального update icons егана, или закоментить оригинал.
/*
/obj/item/weapon/gun/energy/update_icon()
	if(power_supply)
		var/ratio = power_supply.charge / power_supply.maxcharge
		ratio = Ceiling(ratio*4) * 25
		var/obj/item/ammo_casing/energy/shot = ammo_type[select]
		if(power_supply.charge < shot.e_cost)
			ratio = 0 //so the icon changes to empty if the charge isn't zero but not enough for a shot.
		switch(modifystate)
			if (0)
				icon_state = "[initial(icon_state)][ratio]"
			if (1)
				icon_state = "[initial(icon_state)][shot.mod_name][ratio]"
			if (2)
				icon_state = "[initial(icon_state)][shot.select_name][ratio]"
		overlays.Cut()
		if(F)
			if(F.on)
				overlays += "flight-on"
			else
				overlays += "flight"
	else
		icon_state = "[initial(icon_state)]-empty"
		return
*/

/obj/item/weapon/stock_parts/cell/ammo
	name = "power cell"
	desc = "A rechargable electrochemical power cell for energy weaponry."
	icon = 'icons/obj/redu.dmi'
	icon_state = "ammo_cell"
	lefthand_file = 'icons/mob/inhands/items_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/items_righthand.dmi'
	item_state = "cell"
	origin_tech = "powerstorage=2;combat=2;materials=2;"

/obj/item/weapon/stock_parts/cell/ammo/high
	name = "high-capacity power cell"
	desc = "A high-capacity rechargable electrochemical power cell for energy weaponry."
	icon_state = "ammo_hcell"
	chargerate = 250
	maxcharge = 2500
	origin_tech = "powerstorage=4;combat=3;materials=3;"


/obj/item/weapon/stock_parts/cell/ammo/super
	name = "super power cell"
	desc = "A super rechargable electrochemical power cell for energy weaponry."
	icon_state = "ammo_scell"
	chargerate = 500
	maxcharge = 5000
	origin_tech = "powerstorage=6;combat=4;materials=4;"

/obj/item/weapon/stock_parts/cell/ammo/infinite
	name = "infinite-capacity power cell!"
	desc = "A self-rechargable electrochemical power cell for energy weaponry."
	icon_state = "ammo_icell"
	origin_tech = null
	maxcharge = 30000
	rating = 6
	chargerate = 30000
	use()
		return 1

/obj/item/weapon/stock_parts/cell/ammo/pulse //45 pulse shots
	name = "pulse rifle power cell"
	icon_state = "ammo_scell"
	maxcharge = 9000
	rating = 3
	chargerate = 1500
	origin_tech = null

/obj/item/weapon/stock_parts/cell/ammo/pulse/carbine //30 pulse shots
	name = "pulse carbine power cell"
	maxcharge = 6000

/obj/item/weapon/stock_parts/cell/ammo/pulse/pistol //15 pulse shots
	name = "pulse pistol power cell"
	maxcharge = 3000
