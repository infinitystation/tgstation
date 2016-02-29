/obj/machinery/vending/terranstation
	name = "\improper Terran Station"
	desc = "Стандартное снаряжение Терранского морпеха - винтовка гауса и её боезапас, ничего лишнего."
	icon_state = "cart"
	req_access_txt = "0"
	product_slogans = "Никто, кроме нас!;Беспощадно разгромим и уничтожим врага!;Случайные жертвы не избежны!;Предупредительный выстрел в голову!;ТЯжело в лазарете - легко в гробу.;Ветеранам скидки!"
	product_ads = "Трудные задачи выполняем немедленно, невозможные - чуть погодЯ.;Наши бойцы не умирают, а отпровлЯются в ад длЯ того, чтобы набить тварЯм морду ещё раз!."
	vend_reply = "Победа или смерть!;Задавим их интеллектом!;Пора убивать!"
	products = list(/obj/item/weapon/gun/projectile/automatic/gause = 10,/obj/item/ammo_box/magazine/spine = 40)
	premium = list(/obj/item/weapon/gun/projectile/automatic/shotgun/bulldog/unrestricted = 2,/obj/item/ammo_box/magazine/m12g = 4)
	contraband = list(/obj/item/weapon/gun/projectile/revolver/mateba = 1)


//Eat-I-Mat//

/obj/machinery/vending/eatimat
	name = "\improper Eat-I-Mat"
	desc = "Eat this."
	icon_state = "boozeomat"
	icon_deny = "boozeomat-deny"
	products = list(/obj/item/weapon/reagent_containers/food/snacks/beans = 10,/obj/item/weapon/reagent_containers/food/snacks/burger = 20, /obj/item/weapon/reagent_containers/food/snacks/burrito = 20, /obj/item/weapon/reagent_containers/food/snacks/meatballspaghetti = 10,/obj/item/weapon/reagent_containers/food/snacks/meat/steak = 20,/obj/item/weapon/reagent_containers/food/snacks/boiledspaghetti = 15,/obj/item/weapon/reagent_containers/food/snacks/cracker = 20)
	vend_delay = 20
	product_slogans = "I'm your new cook!"
	product_ads = "Time for dinner!"
	req_access_txt = "0"
	refill_canister = /obj/item/weapon/vending_refill/eatimat

/obj/item/weapon/vending_refill/eatimat
	machine_name = "Eat-I-Mat"
	icon_state = "refill_booze"
	charges = list(50, 0, 0)
	init_charges = list(20, 4, 0)

//Eat-I-Mat//

/obj/machinery/light/small/floor
	icon_state = "floor1"
	base_state = "floor"
	fitting = "floor"
	brightness = 5
	layer = 2
	desc = "A small floor lighting fixture."
	light_type = /obj/item/weapon/light/bulb



/obj/machinery/computer/shuttle/remote_controlled_pod
	name = "Remote Controlled Pod One"
	desc = "Used to control the White ShipRemote Controlled Pod."
	shuttleId = "whiteship"
	possible_destinations = "whiteship_away;whiteship_home;whiteship_z4"
	circuit = /obj/machinery/computer/shuttle/remote_controlled_pod

/obj/machinery/computer/shuttle/remote_controlled_pod/two
	name = "Remote Controlled Pod Two"
	shuttleId = "whiteship"
	possible_destinations = "whiteship_away;whiteship_home;whiteship_z4"
	circuit = /obj/item/weapon/circuitboard/remote_controlled_pod/two

/obj/item/weapon/circuitboard/remote_controlled_pod
	name = "circuit board (Remote Controlled Pod One)"
	build_path = /obj/machinery/computer/shuttle/remote_controlled_pod

/obj/item/weapon/circuitboard/remote_controlled_pod/two
	name = "circuit board (Remote Controlled Pod Two)"
	build_path = /obj/machinery/computer/shuttle/remote_controlled_pod/two

/obj/item/device/shadowcloak/ops
	name = "stealth ops cloaker belt"
	icon_state = "assaultbelt"
	item_state = "assault"
	slot_flags = SLOT_BELT
	attack_verb = list("whipped", "lashed", "disciplined")

/obj/item/weapon/melee/chainofcommand/whip
	name = "whip"
	desc = "Mrrr..."
	icon_state = "chain"
	origin_tech = "combat=1"
	needs_permit = 0
	force = 0
	hitsound = "sound/weapons/punch2.ogg"
	attack_verb = list("lashed", "disciplined")