/obj/item/device/microphone
	name = "microphone"
	icon = 'icons/obj/infinity_dexofan.dmi'
	icon_state = "mic"
	var/max_font = 8
	var/font_amp = 4
	var/on = 1

	examine(mob/user)
		..()
		user << "It's currently [src.on ? "on" : "off"]."

	attack_self(mob/user as mob)
		src.on = !(src.on)
		user << "You switch [src] [src.on ? "on" : "off"]."
		if (src.on && prob(5))
			if (locate(/obj/structure/loudspeaker) in range(2, user))
				for (var/obj/structure/loudspeaker/S in range(7, user))
					S.visible_message("<span style=\"color:red\">[S] lets out a horrible [pick("shriek", "squeal", "noise", "squawk", "screech", "whine", "squeak")]!</span>")
					playsound(S.loc, 'sound/items/mic_feedback.ogg', 30, 1)

	Hear(message, atom/movable/speaker/M, message_langs, raw_message, radio_freq, spans)
		if (!src.on)
			return
		var/turf/T = get_turf(src)
		if (M in range(1, T))
			src.talk_into(M, message, null, real_name)

	talk_into(mob/M as mob, messages, param)
		if (!src.on)
			return
		var/speakers = 0
		var/turf/T = get_turf(src)
		for (var/obj/structure/loudspeaker/S in range(7, T))
			speakers ++
		if (!speakers)
			return
		speakers += font_amp // 2 ain't huge so let's give ourselves a little boost
		var/stuff = messages
		var/list/mobs_messaged = list()
		for (var/obj/structure/loudspeaker/S in range(7, T))
			for (var/mob/H in hearers(S, null))
				if (H in mobs_messaged)
					continue
				H.say("<font size=[min(src.max_font, max(0, speakers - round(get_dist(H, S) / 2), 1))]><b>[M.name]</b> [stuff]</font>")
				mobs_messaged += H
		if (prob(10) && locate(/obj/structure/loudspeaker) in range(2, T))
			for (var/obj/structure/loudspeaker/S in range(7, T))
				S.visible_message("<span style=\"color:red\">[S] lets out a horrible [pick("shriek", "squeal", "noise", "squawk", "screech", "whine", "squeak")]!</span>")
				playsound(S.loc, 'sound/items/mic_feedback.ogg', 30, 1)

/obj/structure/mic_stand
	name = "microphone stand"
	icon = 'icons/obj/infinity_dexofan.dmi'
	icon_state = "micstand"
	layer = OBJ_LAYER
	var/obj/item/device/microphone/myMic = null

	New()
		spawn(1)
			if (!myMic)
				myMic = new(src)
		return ..()

	attack_hand(mob/user as mob)
		if (!myMic)
			return ..()
		user.put_in_hands(myMic)
		myMic = null
		src.update_icon()
		return ..()

	attackby(obj/item/W as obj, mob/user as mob)
		if (istype(W, /obj/item/device/microphone))
			if (myMic)
				user << "<span class='warning'>There's already a microphone on [src]!</span>"
				return
			user << "<span class='notice'>You place the [W] on [src].</span>"
			myMic = W
			user.drop_item(W)
			W.loc = src
			src.update_icon()
		else
			return ..()

	Hear(message, atom/movable/speaker, message_langs, raw_message, radio_freq, spans)
		if (!myMic || !myMic.on)
			return
		var/turf/T = get_turf(src)
		if (M in range(1, T))
			myMic.talk_into(M, msg)

	update_icon()
		if (myMic)
			src.icon_state = "micstand"
		else
			src.icon_state = "micstand-empty"

/obj/structure/loudspeaker
	name = "loudspeaker"
	icon = 'icons/obj/infinity_dexofan.dmi'
	icon_state = "loudspeaker"
	anchored = 1
	density = 1