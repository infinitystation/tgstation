/obj/item/gun/energy/verb/eject_battery()
	if (cell_removing)
		set name = "Eject Battery"
		set category = "Object"

		if(power_supply)
			usr << "<span class='notice'>You pull the [power_supply] out of \the [src]!</span>"
			power_supply.loc = get_turf(src.loc)
			power_supply.update_icon()
			usr.put_in_hands(power_supply)
			power_supply = null
			update_icon()
			return
		else
			usr << "<span class='notice'>It has no cell!</span>"
	else
		usr << "<span class='notice'>You can't remove cell from that gun</span>"
	return

/obj/item/gun/energy/attackby(var/obj/item/A as obj, mob/user as mob)
	if(istype(A, /obj/item/stock_parts/cell/ammo) && !power_supply)
		user.drop_item()
		power_supply = A
		power_supply.loc = src
		user << "<span class='notice'>You load a new [power_supply] into \the [src]!</span>"
		update_icon()
	else
		..()
	return

/obj/item/stock_parts/cell/ammo
	name = "power cell"
	desc = "A rechargable electrochemical power cell for energy weaponry."
	icon = 'icons/obj/redu.dmi'
	icon_state = "ammo_cell"
	lefthand_file = 'icons/mob/inhands/items_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/items_righthand.dmi'
	item_state = "cell"
	origin_tech = "powerstorage=2;combat=2;materials=2;"

/obj/item/stock_parts/cell/ammo/high
	name = "high-capacity power cell"
	desc = "A high-capacity rechargable electrochemical power cell for energy weaponry."
	icon_state = "ammo_hcell"
	chargerate = 250
	maxcharge = 2500
	origin_tech = "powerstorage=4;combat=3;materials=3;"


/obj/item/stock_parts/cell/ammo/super
	name = "super power cell"
	desc = "A super rechargable electrochemical power cell for energy weaponry."
	icon_state = "ammo_scell"
	chargerate = 500
	maxcharge = 5000
	origin_tech = "powerstorage=6;combat=4;materials=4;"

/obj/item/stock_parts/cell/ammo/infinite
	name = "infinite-capacity power cell!"
	desc = "A self-rechargable electrochemical power cell for energy weaponry."
	icon_state = "ammo_icell"
	origin_tech = null
	maxcharge = 30000
	rating = 6
	chargerate = 30000
	use()
		return 1

/obj/item/stock_parts/cell/ammo/pulse //200 pulse shots
	name = "pulse rifle power cell"
	icon_state = "ammo_scell"
	maxcharge = 40000
	rating = 3
	chargerate = 5000
	origin_tech = null

/obj/item/stock_parts/cell/ammo/pulse/carbine //100 pulse shots
	name = "pulse carbine power cell"
	maxcharge = 20000

/obj/item/stock_parts/cell/ammo/pulse/pistol //50 pulse shots
	name = "pulse pistol power cell"
	maxcharge = 10000
