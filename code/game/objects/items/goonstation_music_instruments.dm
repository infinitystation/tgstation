//Harmonica, whistle and vuvuzella ported from goonstation 2016
/obj/item/harmonica
	name = "harmonica"
	desc = "A cheap pocket instrument, good for helping time to pass."
	icon = 'icons/obj/infinity_object.dmi'
	icon_state = "harmonica"
	item_state = "r_shoes"
	lefthand_file = 'icons/mob/inhands/infinity_obj_left.dmi'
	righthand_file = 'icons/mob/inhands/infinity_obj_right.dmi'
	throwforce = 3
	w_class = 1.0
	throw_speed = 3
	throw_range = 15
	var/spam_flag = 0
	var/list/sounds_harmonica = list('sound/items/harmonica1.ogg', 'sound/items/harmonica2.ogg', 'sound/items/harmonica3.ogg')

/obj/item/harmonica/attack_self(mob/user as mob)
	if(spam_flag == 0)
		spam_flag = 1
		user.visible_message("<B>[user]</B> plays a [pick("delightful", "chilling", "upbeat")] tune with \his harmonica!")
		playsound(src.loc, pick(src.sounds_harmonica), 50, 1)
		src.add_fingerprint(user)
		spawn(20)
			spam_flag = 0
	return

/obj/item/whistle
	name = "whistle"
	desc = "A whistle. Good for getting attention."
	icon = 'icons/obj/infinity_object.dmi'
	icon_state = "whistle"
	item_state = "r_shoes"
	throwforce = 3
	w_class = 1.0
	throw_speed = 3
	throw_range = 15
	var/spam_flag = 0
	var/sound_whistle = list('sound/items/whistle.ogg')

/obj/item/whistle/attack_self(mob/user as mob)
	if(spam_flag == 0)
		spam_flag = 1
		user.visible_message("<span style=\"color:red\"><B>[user]</B> свистит в свисток!</span>")
		playsound(src.loc, src.sound_whistle, 35, 1)
		src.add_fingerprint(user)
		spawn(20)
			spam_flag = 0
	return

/obj/item/whistle/suicide_act(mob/user)
	user.visible_message("<span style=\"color:red\"><b>[user] проглатывает [src.name]. [user.p_they()] начинает задыхатьс&#255;, заставл&#255;&#255; свисток внутри себя визжать!</b></span>")
	//fuck it that'll do
	var/whistlesound = 'sound/items/whistle.ogg' //so we can still use it when the whistle is deleted
	playsound(user.loc, whistlesound, 35, 1)
	spawn(20)
		if(prob(50))
			playsound(user.loc, whistlesound, 35, 1)
	spawn(40)
		if(prob(50))
			playsound(user.loc, whistlesound, 35, 1)
	spawn(60)
		if(prob(50))
			playsound(user.loc, whistlesound, 35, 1)
	spawn(80)
		if(prob(50))
			playsound(user.loc, whistlesound, 35, 1)
	spawn(100)
		if(prob(50))
			playsound(user.loc, whistlesound, 35, 1)
		if(user)
			user.suiciding = 0
	qdel(src)
	return (BRUTELOSS)

/obj/item/saxophone
	name = "saxophone"
	desc = "NEVER GONNA DANCE AGAIN, GUILTY FEET HAVE GOT NO RHYTHM"
	icon = 'icons/obj/infinity_object.dmi'
	icon_state = "sax" // temp
	item_state = "sax"
	lefthand_file = 'icons/mob/inhands/infinity_obj_left.dmi'
	righthand_file = 'icons/mob/inhands/infinity_obj_right.dmi'
	w_class = 3
	force = 1
	throwforce = 5
	var/spam_flag = 0
	var/list/sounds_sax = list('sound/items/sax.ogg', 'sound/items/sax2.ogg','sound/items/sax3.ogg','sound/items/sax4.ogg','sound/items/sax5.ogg')

/obj/item/saxophone/attack_self(mob/user as mob)
	if(spam_flag == 0)
		spam_flag = 1
		user.visible_message("<B>[user]</B> lays down a [pick("sexy", "sensuous", "libidinous","spicy","flirtatious","salacious","sizzling","carnal","hedonistic")] riff on \his saxophone!")
		playsound(get_turf(src), pick(src.sounds_sax), 50, 1)
		src.add_fingerprint(user)
		spawn(100)
			spam_flag = 0
	return


/obj/item/bagpipe
	name = "bagpipe"
	desc = "Almost as much of a windbag as the Captain."
	icon = 'icons/obj/infinity_object.dmi'
	icon_state = "bagpipe" // temp
	item_state = "bagpipe"
	lefthand_file = 'icons/mob/inhands/infinity_obj_left.dmi'
	righthand_file = 'icons/mob/inhands/infinity_obj_right.dmi'
	w_class = 3
	force = 1
	throwforce = 5
	var/spam_flag = 0
	var/list/sounds_bagpipe = list('sound/items/bagpipe.ogg', 'sound/items/bagpipe2.ogg','sound/items/bagpipe3.ogg')

/obj/item/bagpipe/attack_self(mob/user as mob)
	if(spam_flag == 0)
		spam_flag = 1
		user.visible_message("<B>[user]</B> plays a [pick("patriotic", "rowdy", "wee","grand","free","Glaswegian","sizzling","carnal","hedonistic")] tune on \his bagpipe!")
		playsound(get_turf(src), pick(src.sounds_bagpipe), 50, 1)
		src.add_fingerprint(user)
		spawn(100)
			spam_flag = 0
	return