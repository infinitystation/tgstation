/obj/item/clothing/mask/black_fox
	name = "black fox mask"
	desc = "Just black fox mask."
	icon_state = "dei_foxmask"
	icon = 'icons/obj/clothing/infinity_work.dmi'
	worn_icon = 'icons/mob/infinity_work.dmi'
	flags_inv = HIDEFACE
	flags_cover = MASKCOVERSMOUTH

/obj/item/clothing/mask/skull_smile
	name = "skull smile"
	desc = "Mask with a crazy smile."
	icon_state = "skull_smile"
	icon = 'icons/obj/clothing/infinity_work.dmi'
	worn_icon = 'icons/mob/infinity_work.dmi'
	flags_cover = MASKCOVERSMOUTH

/obj/item/clothing/mask/fawkes
	name = "Guy Fawkes mask"
	desc = "A mask designed to help you remember a specific date."
	icon = 'icons/obj/clothing/infinity_work.dmi'
	worn_icon = 'icons/mob/infinity_work.dmi'
	icon_state = "fawkes"
	item_state = "fawkes"
	flags_inv = HIDEFACE
	flags_cover = MASKCOVERSMOUTH
	w_class = 2

/obj/item/clothing/mask/rubbermask
	name = "Dallas mask"
	desc = "That's a some old mask with flag of acient destroyed country. Looks like a clown mask, but more creepy. It smells a bills,blood and gunpowder. Officers for some reason are afraid of it."
	icon = 'icons/obj/clothing/infinity_work.dmi'
	worn_icon = 'icons/mob/infinity_work.dmi'
	icon_state = "rubbermask"
	item_state = "rubbermask"
	flags_inv = HIDEFACE
	flags_cover = MASKCOVERSMOUTH
	w_class = 2

/obj/item/clothing/mask/gas/mercenaries
	name = "mercenaries gas mask"
	desc = "Защитна&#255; маска с ударопрочным прозрачным стеклом. Особа&#255; система фильтрации воздуха укзывает на то, что фильтрует она что-то ещё помимо токсичного газа... На обратной стороне л&#255;мки видна надпись 'Umbrella Corporation'."
	icon = 'icons/obj/clothing/infinity_work.dmi'
	worn_icon = 'icons/mob/infinity_work.dmi'
	icon_state = "gas_alt"
	flags = BLOCK_GAS_SMOKE_EFFECT | MASKINTERNALS
	flags_inv = HIDEEARS|HIDEFACIALHAIR
	armor = list(melee = 15, bullet = 10, laser = 0, energy = 0, bomb = 20, bio = 100, rad = 0, fire = 40, acid = 60)
	item_state = "gas_alt"
	gas_transfer_coefficient = 0.02
	permeability_coefficient = 0.01
	flags_cover = MASKCOVERSMOUTH
	resistance_flags = FIRE_PROOF

/obj/item/clothing/mask/gas/sechailer/swat/syndicate
	name = "syndicate mask"
	desc = "A close-fitting tactical mask that can be connected to an air supply."
	icon_state = "syndicate"
	strip_delay = 60
	aggressiveness = 1

/obj/item/clothing/mask/gas/sechailer/swat/syndicate/ui_action_click(mob/user, action)
	if(istype(action, /datum/action/item_action/halt))
		shalt()

/obj/item/clothing/mask/gas/sechailer/swat/syndicate/emag_act(mob/user as mob)
	if(safety)
		safety = FALSE
		user << "<span class='warning'>You silently fry [src]'s vocal circuit with the cryptographic sequencer."
	else
		return

/obj/item/clothing/mask/gas/sechailer/swat/syndicate/attackby(obj/item/weapon/W, mob/user, params)
	if(istype(W, /obj/item/weapon/screwdriver))
		switch(aggressiveness)
			if(1)
				user << "<span class='notice'>Вы выбрали режим насмешек.</span>"
				aggressiveness = 2
			if(2)
				user << "<span class='notice'>Вы выбрали режим призыва к сдачек.</span>"
				aggressiveness = 1

/obj/item/clothing/mask/gas/sechailer/swat/syndicate/verb/shalt()
	set category = "Object"
	set name = "HALT"
	set src in usr
	if(!isliving(usr))
		return
	if(!can_use(usr))
		return
	if(broken_hailer)
		usr << "<span class='warning'>Cистема оповещени&#255; маски перегорела.</span>"
		return

	var/phrase = 0	//selects which phrase to use
	var/phrase_text = null

	if(cooldown < world.time - 30) // A cooldown, to stop people being jerks
		recent_uses++
		if(cooldown_special < world.time - 180) //A better cooldown that burns jerks
			recent_uses = initial(recent_uses)

		switch(recent_uses)
			if(5)
				usr << "<span class='warning'>Маска нагрелась из-за частого использовани&#255;.</span>"
			if(6)
				usr << "<span class='userdanger'>Маска нагрелась до опасного уровн&#255;! Нужно прекратить использовать оповещение.</span>"
			if(7) //overload
				broken_hailer = 1
				usr << "<span class='userdanger'>Маска-говорилка окончательно сломалась из-за перегрева...</span>"
				return

		switch(aggressiveness)
			if(1)
				phrase = rand(1,8) //При выборе данного режима будут проигрываться призывы сдаться.
			if(2)
				phrase = rand(9,18) //При выборе данного режима будут проигрываться насмешки.

		if(!safety)
			phrase_text = "FUCK YOUR CUNT YOU SHIT EATING COCKSTORM AND EAT A DONG FUCKING ASS RAMMING SHIT FUCK EAT PENISES IN YOUR FUCK FACE AND SHIT OUT ABORTIONS OF FUCK AND POO AND SHIT IN YOUR ASS YOU COCK FUCK SHIT MONKEY FUCK ASS WANKER FROM THE DEPTHS OF SHIT."
		else

			switch(phrase)
				if(1)	//Призыв к сдаче
					phrase_text = "ЛИЦОМ В ПОЛ, ПОКА ЖИВОЙ!"
				if(2)
					phrase_text = "РУКИ ЗА ГОЛОВУ, ЕСЛИ ЖИЗНЬ ДОРОГА!"
				if(3)
					phrase_text = "ЛИЦОМ В ПОЛ ИЛИ Я ЗА СЕБЯ НЕ ОТВЕЧАЮ!"
				if(4)
					phrase_text = "СДАВАЙСЯ, СЛАБАК!"
				if(5)
					phrase_text = "НУ-КА НА КОЛЕНИ!"
				if(6)
					phrase_text = "НА ПОЛ, ЖИВО!!"
				if(7)
					phrase_text = "СОПРОТИВЛЕНИЕ БЕСПОЛЕЗНО!"
				if(8)
					phrase_text = "БРОСАЙ ОРУЖИЕ, МОРДОЙ В ПОЛ!"
				if(9)	//Насмешка
					phrase_text = "ДАВАЙ, УДИВИ МЕНЯ!"
				if(10)
					phrase_text = "ЕЩЁ ОДИН!"
				if(11)
					phrase_text = "ТЫ В ПОЛНОЙ ЗАДНИЦЕ, ПРИЯТЕЛЬ!"
				if(12)
					phrase_text = "ГЛАЗ НА ЖОПУ НАТЯНУ!"
				if(13)
					phrase_text = "ПОРА УМИРАТЬ, ПЁС!"
				if(14)
					phrase_text = "ДАВАЙ, ЛОХ!"
				if(15)
					phrase_text = "НЕ ПОДЫХАЙ РАНЬШЕ ВРЕМЕНИ, Я НЕ НАВЕСЕЛИЛСЯ!"
				if(16)
					phrase_text = "ИЗ ТВОЕЙ ГОЛОВЫ ВЫЙДЕТ ОТЛИЧНЫЙ НОЧНИК!"
				if(17)
					phrase_text = "ВСТРЕТЬ СВОЮ СМЕРТЬ!"
				if(18)
					phrase_text = "ПРОЩАЙСЯ С ЖИЗНЬЮ!"

		usr.audible_message("[usr]'s Compli-o-Nator: <font color='red' size='3'><b>[phrase_text]</b></font>")
		playsound(src.loc, "sound/items/megaphone.ogg", 100, 0, 4)
		cooldown = world.time
		cooldown_special = world.time
