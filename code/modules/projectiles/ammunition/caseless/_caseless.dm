/obj/item/ammo_casing/caseless
	desc = "A caseless bullet casing."
	firing_effect_type = null
	heavy_metal = FALSE

/obj/item/ammo_casing/caseless/fire_casing(atom/target, mob/living/user, params, distro, quiet, zone_override, spread)
	if (..()) //successfully firing
		moveToNullspace()
		return 1
	else
		return 0

/obj/item/ammo_casing/caseless/update_icon()
	..()
	icon_state = "[initial(icon_state)]"

/obj/item/ammo_casing/caseless/a68
	desc = "A 6.8x43mm caseless cartridge."
	caliber = "6.8"
	icon = 'icons/obj/infinity_weapons.dmi'
	icon_state = "null"
	projectile_type = /obj/item/projectile/bullet/heavybullet2

/obj/item/ammo_casing/caseless/gause_spine
	desc = "A 0.75mm spine."
	caliber = "0.75"
	icon = 'icons/obj/infinity_weapons.dmi'
	icon_state = "null"
	projectile_type = /obj/item/projectile/bullet/gause_spine