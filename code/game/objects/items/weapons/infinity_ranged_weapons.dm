//Переносил всё сюда Terror4000rus (на данный момент). Если что-то забыл - добавьте. Нечего раскидывать по всему билду отдельные строчки кода.

/obj/item/weapon/gun/ballistic/automatic/xmg80 //By Terror4000rus
	name = "AA-XMG80"
	desc = "A state-of-the-art, high-tech assault rifle manufactured by Aussec Armory. Comes with a 2x red dot sight. Utilizes the uncommon 6.8x43mm caseless ammunition, which is light while still allowing for superior armor-piercing capability and high velocity. Often called 'The Shredder' for its immense damage potential, which also results in this firearm being banned in NanoTrasen-controlled sectors for being 'too messy' and expensive."
	icon_state = "xmg80"
	item_state = "c20r"
	icon = 'icons/obj/infinity_weapons.dmi'
	mag_type = /obj/item/ammo_box/magazine/xmg80
	can_suppress = 0
	w_class = 3
	burst_size = 2
	fire_delay = 1.5
	force = 10
	origin_tech = "combat=4;materials=4;syndicate=1"
	fire_sound = 'sound/weapons/gunshot_g36.ogg'

/obj/item/weapon/gun/ballistic/automatic/xmg80/update_icon()
	..()
	icon_state = "[initial(icon_state)][magazine ? "" : "-e"]"

/obj/item/weapon/gun/ballistic/automatic/xmg80/process_chamber(eject_casing = 0, empty_chamber = 1)
	..()

/obj/item/weapon/gun/ballistic/automatic/gause //By Terror4000rus
	name = "Gause rifle C-14"
	desc = "Тяжёла&#255; пушка для самых плохих парней - винтовка Гауса. Разгоняюща&#255; с помощью электромагнитного пол&#255; металлические 7-ми миллимитровые бронебойные патроны, это оружие готово уничтожить всё, что не понравитс&#255; его обладателю. Пускай ты и машина для убийства, по-македонски стрел&#255;ть не выйдет."
	icon_state = "c14"
	item_state = "c14"
	icon = 'icons/obj/infinity_weapons.dmi'
	lefthand_file = 'icons/mob/inhands/infinity_obj_left.dmi'
	righthand_file = 'icons/mob/inhands/infinity_obj_right.dmi'
	origin_tech = "combat=5;materials=3"
	pin = /obj/item/device/firing_pin
	mag_type = /obj/item/ammo_box/magazine/spine
	fire_sound = 'sound/weapons/gunshot_g36.ogg'
	can_suppress = 0
	burst_size = 3
	fire_delay = 1
	weapon_weight = WEAPON_HEAVY

/obj/item/weapon/gun/ballistic/automatic/proto/mindshield //By Terror4000rus
	pin = /obj/item/device/firing_pin/implant/mindshield

/obj/item/weapon/gun/ballistic/automatic/mg88 //By Terror4000rus
	name = "MG88 'Enforcer'"
	desc = "A robust assault rifle used by United Aerospace Corporation."
	icon_state = "mg88"
	item_state = "mg88"
	icon = 'icons/obj/infinity_weapons.dmi'
	lefthand_file = 'icons/mob/inhands/infinity_obj_left.dmi'
	righthand_file = 'icons/mob/inhands/infinity_obj_right.dmi'
	origin_tech = "combat=5;materials=3"
	mag_type = /obj/item/ammo_box/magazine/a646
	pin = /obj/item/device/firing_pin
	fire_sound = 'sound/weapons/Gunshot_smg.ogg'
	can_suppress = 0
	burst_size = 2
	fire_delay = 1

/obj/item/weapon/gun/energy/alien/base //By Terror4000rus
	can_pull_pin = 0
	selfcharge = 1
	cell_type = /obj/item/weapon/stock_parts/cell/ammo/high

/obj/item/weapon/gun/energy/e_gun/nuclear/event //By Terror4000rus
	pin = /obj/item/device/firing_pin
	ammo_type = list(/obj/item/ammo_casing/energy/laser, /obj/item/ammo_casing/energy/disabler)

/obj/item/weapon/gun/energy/e_gun/ert
	cell_type = /obj/item/weapon/stock_parts/cell/ammo/high