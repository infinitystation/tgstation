/obj/item/ammo_casing/caseless/arrow
	name = "arrow"
	projectile_type = /obj/item/projectile/bullet/reusable/arrow
	caliber = "arrow"
	icon = 'icons/obj/torf.dmi'
	icon_state = "arrow"

/obj/item/projectile/bullet/reusable/arrow
	name = "arrow"
	icon = 'icons/obj/torf.dmi'
	icon_state = "arrow_s"
	damage = 20
	range = 10
	damage_type = BRUTE
	ammo_type = /obj/item/ammo_casing/caseless/arrow

/obj/item/projectile/bullet/reusable/arrow/on_hit(atom/target, blocked = 0, hit_zone)
	. = ..()
	if((blocked != 100) && iscarbon(target))
		var/mob/living/carbon/C = target
		C.bleed(20)
/*
/obj/item/ammo_casing/caseless/arrow_fire
	name = "fire arrow"
	projectile_type = /obj/item/projectile/bullet/reusable/arrow
	caliber = "arrow"
	icon = 'icons/obj/torf.dmi'
	icon_state = "arrow_fire"

/obj/item/projectile/bullet/reusable/arrow_fire
	name = "arrow"
	icon = 'icons/obj/torf.dmi'
	icon_state = "arrow_fire_s"
	damage = 10
	range = 10
	damage_type = BRUTE
	ammo_type = /obj/item/ammo_casing/caseless/arrow_fire
*/
