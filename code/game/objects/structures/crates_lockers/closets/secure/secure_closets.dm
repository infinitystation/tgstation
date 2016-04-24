/obj/structure/closet/secure_closet
	name = "secure locker"
	desc = "It's an immobile card-locked storage unit."
	locked = 1
	icon_state = "secure"
	var/code1[10]
	var/code2[10]
	var/codelen
	var/validating = 0
	wall_mounted = 0 //never solid (You can always pass over it)
	health = 200
	secure = 1

/obj/structure/closet/secure_closet/New()
	..()
	codelen = rand(7,10)
	for(var/i=1; i<=codelen; i++)
		code1[i] = rand(0,9)
		code2[i] = rand(0,9)
	health = 200
	secure = 1

/obj/structure/closet/secure_closet/attackby(obj/item/weapon/W, mob/user, params)
	if(istype(W, /obj/item/device/multitool/multimeter))
		if(!opened)
			var/obj/item/device/multitool/multimeter/O = W
			if(O.mode!=1)
				user << "Переключите мультиметр"
				return
			else
				src.interact(usr)
		else
			..(W, user)
	else
		..(W, user)


/obj/structure/closet/secure_closet/interact(mob/user)
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
	if(!ishuman(usr))	return
	var/mob/living/carbon/human/user = usr
	var/obj/item/device/multitool/multimeter/W = user.get_active_hand()
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