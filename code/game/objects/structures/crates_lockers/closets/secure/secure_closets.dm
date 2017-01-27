/obj/structure/closet/secure_closet
	name = "secure locker"
	desc = "It's a card-locked storage unit."
	locked = 1
	icon_state = "secure"
	var/code1[10]
	var/code2[10]
	var/codelen
	var/validating = 0
	wall_mounted = 0 //never solid (You can always pass over it)
	obj_integrity = 250
	max_integrity = 250
	armor = list(melee = 30, bullet = 50, laser = 50, energy = 100, bomb = 0, bio = 0, rad = 0, fire = 80, acid = 80)
	secure = 1

/obj/structure/closet/secure_closet/New()
	..()
	codelen = rand(7,10)
	for(var/i=1; i<=codelen; i++)
		code1[i] = rand(0,9)
		code2[i] = rand(0,9)

/obj/structure/closet/secure_closet/interact(mob/user)
	var/obj/item/device/multitool/multimeter/W = user.get_active_held_item()
	if(opened)
		return
	if(!istype(W))
		return
	if(!W.mode)
		user << "Переключите мультиметр"
		return
	src.add_fingerprint(user)
	var/dat = ""
	dat += "<a href='?src=\ref[src];check=1'>Проверить замок</a><br>"
	for(var/i=1; i<=codelen; i++)
		dat += "<a href='?src=\ref[src];inc=[i]'>+</a>"
	dat += "<br>"
	for(var/i=1; i<=codelen; i++)
		dat += "[code2[i]]"
	dat += "<br>"
	for(var/i=1; i<=codelen; i++)
		dat += "<a href='?src=\ref[src];dec=[i]'>-</a>"
	user.set_machine(src)
	var/datum/browser/popup = new(user, "closet", "[name]")
	popup.set_content(dat)
	popup.open(1)

/obj/structure/closet/secure_closet/Topic(href, href_list)
	if(!ishuman(usr))
		return
	var/mob/living/carbon/human/user = usr
	var/obj/item/device/multitool/multimeter/W = user.get_active_held_item()
	var/validate = 0
	user.set_machine(src)

	if(href_list["check"])
		if(W.mode != 1)
			usr << "<span class='notice'>Переключите мультиметр</span>"
		else
			if(validating)
				return
			else
				validating = 1
				usr << "<span class='notice'>ПроверЯем замок</span>"
				for(var/i=1; i<=codelen; i++)
					if(do_after(user, 10, target = src))
						if(code2[i]==code1[i])
							validate++
							usr << "<span class='notice'>Ключ подходит</span>"
							playsound(W.loc, 'sound/machines/mbeep.ogg', 50, 1)
						else
							usr << "<span class='notice'>Ключ не подходит</span>"
				validating = 0
				if(validate==codelen)
					src.locked = !src.locked
					add_fingerprint(user)
					visible_message("<span class='warning'>[user] has hacked [src]!</span>")
					update_icon()


	if(href_list["inc"])
		if(W.mode != 1)
			usr << "<span class='notice'>Переключите мультиметр</span>"
		else
			var/inc = text2num(href_list["inc"])
			code2[inc]++
			if(code2[inc] > 9)
				code2[inc] = 0
			interact(user)

	if(href_list["dec"])
		if(W.mode != 1)
			usr << "<span class='notice'>Переключите мультиметр</span>"
		else
			var/inc = text2num(href_list["dec"])
			code2[inc]--
			if(code2[inc]<0)
				code2[inc] = 9
			interact(user)

/obj/structure/closet/secure_closet/attackby(obj/item/weapon/W, mob/user, params)
	if(user in src)
		return
	if(locked && !opened)
		if(istype(W, /obj/item/device/multitool/multimeter))
			interact(user)
		return ..()
	else
		..()

/obj/structure/closet/secure_closet/run_obj_armor(damage_amount, damage_type, damage_flag = 0, attack_dir)
	if(damage_flag == "melee" && damage_amount < 20)
		return 0
	. = ..()
