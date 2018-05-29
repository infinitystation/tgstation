
/* EMOTE DATUMS */
/datum/emote/living
	mob_type_allowed_typecache = list(/mob/living)
	mob_type_blacklist_typecache = list(/mob/living/simple_animal/slime, /mob/living/brain)

/datum/emote/living/blush
	key = "blush"
	key_third_person = "blushes"
	message = "краснеет."
	emote_type = EMOTE_VISIBLE

/datum/emote/living/bow
	key = "bow"
	key_third_person = "bows"
	message = "bows."
	message_param = "клан&#255;етс&#255; %t."
	emote_type = EMOTE_VISIBLE
	restraint_check = TRUE

/datum/emote/living/burp
	key = "burp"
	key_third_person = "burps"
	message = "рыгает."
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/choke
	key = "choke"
	key_third_person = "chokes"
	message = "давитс&#255;!"
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/cross
	key = "cross"
	key_third_person = "crosses"
	message = "скрестил'e_1' руки у себ&#255; на груди."
	emote_type = EMOTE_VISIBLE

/datum/emote/living/chuckle
	key = "chuckle"
	key_third_person = "chuckles"
	message = "хихикает."
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/collapse
	key = "collapse"
	key_third_person = "collapses"
	message = "упал'e_1'!"
	emote_type = EMOTE_VISIBLE

/datum/emote/living/collapse/run_emote(mob/user, params)
	. = ..()
	if(. && isliving(user))
		var/mob/living/L = user
		L.Unconscious(40)

/datum/emote/living/cough
	key = "cough"
	key_third_person = "coughs"
	message = "кашл&#255;ет!"
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/cough/can_run_emote(mob/user, status_check = TRUE)
	. = ..()
	if(user.reagents.get_reagent("menthol"))
		return FALSE

/datum/emote/living/dance
	key = "dance"
	key_third_person = "dances"
	message = "танцует."
	emote_type = EMOTE_VISIBLE
	restraint_check = TRUE

/datum/emote/living/deathgasp
	key = "deathgasp"
	key_third_person = "deathgasps"
	message = "замирает, конечности расслабл&#255;ютс&#255;, глаза станов&#255;тс&#255; мЄртвыми и безжизненными..."
	message_robot = "cильно вздрагивает и через мгновение полностью останавливаетс&#255;, его глаза медленно темнеют."
	message_AI = "мигает, трещина пересекает экран, откуда свисела пара искр&#255;щихс&#255; проводов. Ёкран заси&#255;л ошибкой."
	message_alien = "визжит искажЄнным криком, затем рухнула со своих лап. «елЄна&#255; кип&#255;ща&#255; и булькающа&#255; жидкость потекла из еЄ пасти."
	message_larva = "»спускает болезненное шипени&#255;, выпуска&#255; из себ&#255; остатки воздуха, после чего перестает двигатьс&#255; и падает на пол."
	message_monkey = "lets out a faint chimper as it collapses and stops moving..."
	message_simple =  "stops moving..."
	stat_allowed = UNCONSCIOUS

/datum/emote/living/deathgasp/run_emote(mob/user, params)
	var/mob/living/simple_animal/S = user
	if(istype(S) && S.deathmessage)
		message_simple = S.deathmessage
	. = ..()
	message_simple = initial(message_simple)
	if(. && isalienadult(user))
		playsound(user.loc, 'sound/voice/hiss6.ogg', 80, 1, 1)

/datum/emote/living/drool
	key = "drool"
	key_third_person = "drools"
	message = "несет чепуху."
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/faint
	key = "faint"
	key_third_person = "faints"
	message = "падает в обморок."
	emote_type = EMOTE_VISIBLE

/datum/emote/living/faint/run_emote(mob/user, params)
	. = ..()
	if(. && isliving(user))
		var/mob/living/L = user
		L.SetSleeping(200)

/datum/emote/living/flap
	key = "flap"
	key_third_person = "flaps"
	message = "хлопает своими крыль&#255;ми."
	emote_type = EMOTE_VISIBLE
	restraint_check = TRUE
	var/wing_time = 20

/datum/emote/living/flap/run_emote(mob/user, params)
	. = ..()
	if(. && ishuman(user))
		var/mob/living/carbon/human/H = user
		var/open = FALSE
		if(H.dna.features["wings"] != "None")
			if("wingsopen" in H.dna.species.mutant_bodyparts)
				open = TRUE
				H.CloseWings()
			else
				H.OpenWings()
			addtimer(CALLBACK(H, open ? /mob/living/carbon/human.proc/OpenWings : /mob/living/carbon/human.proc/CloseWings), wing_time)

/datum/emote/living/flap/aflap
	key = "aflap"
	key_third_person = "aflaps"
	message = "в злости хлопает своими крыль&#255;ми!"
	restraint_check = TRUE
	wing_time = 10

/datum/emote/living/frown
	key = "frown"
	key_third_person = "frowns"
	message = "хмуритс&#255;."
	emote_type = EMOTE_VISIBLE

/datum/emote/living/gag
	key = "gag"
	key_third_person = "gags"
	message = "замолчал'e_1'."
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/gasp
	key = "gasp"
	key_third_person = "gasps"
	message = "задыхаетс&#255;!"
	emote_type = EMOTE_AUDIBLE
	stat_allowed = UNCONSCIOUS

/datum/emote/living/giggle
	key = "giggle"
	key_third_person = "giggles"
	message = "giggles."
	message_mime = "тихо хихиает!"
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/glare
	key = "glare"
	key_third_person = "glares"
	message = "glares."
	message_param = "пристально смотрит на %t."
	emote_type = EMOTE_VISIBLE

/datum/emote/living/grin
	key = "grin"
	key_third_person = "grins"
	message = "усмехаетс&#255;."
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/groan
	key = "groan"
	key_third_person = "groans"
	message = "стонет!"
	message_mime = "делает вид, что стонет!"
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/grimace
	key = "grimace"
	key_third_person = "grimaces"
	message = "гримасничает."
	emote_type = EMOTE_VISIBLE

/datum/emote/living/jump
	key = "jump"
	key_third_person = "jumps"
	message = "прыгает!"
	emote_type = EMOTE_VISIBLE
	restraint_check = TRUE

/datum/emote/living/kiss
	key = "kiss"
	key_third_person = "kisses"
	message = "посылает воздушный поцелуй."
	emote_type = EMOTE_VISIBLE
	message_param = "посылает воздушный поцелуй %t."

/datum/emote/living/laugh
	key = "laugh"
	key_third_person = "laughs"
	message = "смеетс&#255;."
	message_mime = "тихо смеетс&#255;."
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/laugh/can_run_emote(mob/living/user, status_check = TRUE)
	. = ..()
	if(. && iscarbon(user))
		var/mob/living/carbon/C = user
		return !C.silent

/datum/emote/living/laugh/run_emote(mob/user, params)
	. = ..()
	if(. && ishuman(user))
		var/mob/living/carbon/human/H = user
		if(H.dna.species.id == "human" && (!H.mind || !H.mind.miming))
			if(user.gender == FEMALE)
				playsound(H, 'sound/voice/human/womanlaugh.ogg', 50, 1)
			else
				playsound(H, pick('sound/voice/human/manlaugh1.ogg', 'sound/voice/human/manlaugh2.ogg'), 50, 1)

/datum/emote/living/look
	key = "look"
	key_third_person = "looks"
	message = "смотрит."
	message_param = "смотрит на %t."
	emote_type = EMOTE_VISIBLE

/datum/emote/living/nod
	key = "nod"
	key_third_person = "nods"
	message = "кивает."
	message_param = "кивнул'e_1' %t."
	emote_type = EMOTE_VISIBLE

/datum/emote/living/point
	key = "point"
	key_third_person = "points"
	message = "указывает."
	message_param = "указывает на %t."
	emote_type = EMOTE_VISIBLE
	restraint_check = TRUE

/datum/emote/living/point/run_emote(mob/user, params)
	message_param = initial(message_param) // reset
	if(ishuman(user))
		var/mob/living/carbon/human/H = user
		if(H.get_num_arms() == 0)
			if(H.get_num_legs() != 0)
				message_param = "tries to point at %t with a leg, <span class='userdanger'>falling down</span> in the process!"
				H.Knockdown(20)
			else
				message_param = "<span class='userdanger'>bumps [user.p_their()] head on the ground</span> trying to motion towards %t."
				H.adjustBrainLoss(5)
	..()

/datum/emote/living/pout
	key = "pout"
	key_third_person = "pouts"
	message = "надул'e_1' губы."
	emote_type = EMOTE_VISIBLE

/datum/emote/living/scream
	key = "scream"
	key_third_person = "screams"
	message = "кричит."
	message_mime = "делает вид, что кричит!"
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/scowl
	key = "scowl"
	key_third_person = "scowls"
	message = "хмуритс&#255;."
	emote_type = EMOTE_VISIBLE

/datum/emote/living/shake
	key = "shake"
	key_third_person = "shakes"
	message = "тр&#255;сет головой."
	emote_type = EMOTE_VISIBLE

/datum/emote/living/shiver
	key = "shiver"
	key_third_person = "shiver"
	message = "shivers."
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/sigh
	key = "sigh"
	key_third_person = "sighs"
	message = "вздыхает."
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/sit
	key = "sit"
	key_third_person = "sits"
	message = "садитс&#255;."

/datum/emote/living/smile
	key = "smile"
	key_third_person = "smiles"
	message = "улыбаетс&#255;."
	emote_type = EMOTE_VISIBLE

/datum/emote/living/sneeze
	key = "sneeze"
	key_third_person = "sneezes"
	message = "чихнул."
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/smug
	key = "smug"
	key_third_person = "smugs"
	message = "самодовольно ухмыл&#255;етс&#255;."
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/sniff
	key = "sniff"
	key_third_person = "sniffs"
	message = "сопит."
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/snore
	key = "snore"
	key_third_person = "snores"
	message = "храпит."
	message_mime = "крепко спит."
	emote_type = EMOTE_AUDIBLE
	stat_allowed = UNCONSCIOUS

/datum/emote/living/stare
	key = "stare"
	key_third_person = "stares"
	message = "уставилс&#255;."
	message_param = "уставил'e_5' на %t."
	emote_type = EMOTE_VISIBLE

/datum/emote/living/strech
	key = "stretch"
	key_third_person = "stretches"
	message = "разминает свои руки."
	emote_type = EMOTE_VISIBLE

/datum/emote/living/sulk
	key = "sulk"
	key_third_person = "sulks"
	message = "надул'e_5'."
	emote_type = EMOTE_VISIBLE

/datum/emote/living/surrender
	key = "surrender"
	key_third_person = "surrenders"
	message = "кладет руки за голову и медленно ложитс&#255; на пол!"
	emote_type = EMOTE_VISIBLE

/datum/emote/living/surrender/run_emote(mob/user, params)
	. = ..()
	if(. && isliving(user))
		var/mob/living/L = user
		L.Knockdown(200)

/datum/emote/living/sway
	key = "sway"
	key_third_person = "sways"
	message = "пошатываетс&#255;"
	emote_type = EMOTE_VISIBLE

/datum/emote/living/tremble
	key = "tremble"
	key_third_person = "trembles"
	message = "трепещет в страхе!"
	emote_type = EMOTE_VISIBLE

/datum/emote/living/twitch
	key = "twitch"
	key_third_person = "twitches"
	message = "дергаетс&#255;."
	emote_type = EMOTE_VISIBLE

/datum/emote/living/twitch_s
	key = "twitch_s"
	message = "twitches."

/datum/emote/living/wave
	key = "wave"
	key_third_person = "waves"
	message = "машет."
	emote_type = EMOTE_VISIBLE

/datum/emote/living/whimper
	key = "whimper"
	key_third_person = "whimpers"
	message = "хнычет."
	message_mime = "'t_his' лицо становитс&#255; грустным, а из слез льютс&#255; воображаемые слезы."
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/wsmile
	key = "wsmile"
	key_third_person = "wsmiles"
	message = "слабо улыбаетс&#255;."
	emote_type = EMOTE_VISIBLE

/datum/emote/living/yawn
	key = "yawn"
	key_third_person = "yawns"
	message = "зевает."
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/custom
	key = "me"
	key_third_person = "custom"
	message = null

/datum/emote/living/custom/proc/check_invalid(mob/user, input)
	. = TRUE
	if(copytext(input,1,5) == "says")
		to_chat(user, "<span class='danger'>Invalid emote.</span>")
	else if(copytext(input,1,9) == "exclaims")
		to_chat(user, "<span class='danger'>Invalid emote.</span>")
	else if(copytext(input,1,6) == "yells")
		to_chat(user, "<span class='danger'>Invalid emote.</span>")
	else if(copytext(input,1,5) == "asks")
		to_chat(user, "<span class='danger'>Invalid emote.</span>")
	else
		. = FALSE

/datum/emote/living/custom/run_emote(mob/user, params, type_override = null)
	if(jobban_isbanned(user, "emote"))
		to_chat(user, "You cannot send custom emotes (banned).")
		return FALSE
	else if(user.client && user.client.prefs.muted & MUTE_IC)
		to_chat(user, "You cannot send IC messages (muted).")
		return FALSE
	else if(!params)
		var/custom_emote = copytext(sanitize(input("Choose an emote to display.") as text|null), 1, MAX_MESSAGE_LEN)
		if(custom_emote && !check_invalid(user, custom_emote))
			var/type = input("Is this a visible or hearable emote?") as null|anything in list("Visible", "Hearable")
			switch(type)
				if("Visible")
					emote_type = EMOTE_VISIBLE
				if("Hearable")
					emote_type = EMOTE_AUDIBLE
				else
					alert("Unable to use this emote, must be either hearable or visible.")
					return
			message = custom_emote
	else
		message = params
		if(type_override)
			emote_type = type_override
	. = ..()
	message = null
	emote_type = EMOTE_VISIBLE

/datum/emote/living/custom/replace_pronoun(mob/user, message)
	return message

/datum/emote/living/help
	key = "help"

/datum/emote/living/help/run_emote(mob/user, params)
	var/list/keys = list()
	var/list/message = list("Available emotes, you can use them with say \"*emote\": ")

	var/datum/emote/E
	var/list/emote_list = E.emote_list
	for(var/e in emote_list)
		if(e in keys)
			continue
		E = emote_list[e]
		if(E.can_run_emote(user, status_check = FALSE))
			keys += E.key

	keys = sortList(keys)

	for(var/emote in keys)
		if(LAZYLEN(message) > 1)
			message += ", [emote]"
		else
			message += "[emote]"

	message += "."

	message = jointext(message, "")

	to_chat(user, message)

/datum/emote/sound/beep
	key = "beep"
	key_third_person = "beeps"
	message = "пищит."
	message_param = "пищит на %t."
	emote_type = EMOTE_AUDIBLE
	sound = 'sound/machines/twobeep.ogg'

/datum/emote/living/circle
	key = "circle"
	key_third_person = "circles"
	restraint_check = TRUE

/datum/emote/living/circle/run_emote(mob/user, params)
	. = ..()
	var/obj/item/circlegame/N = new(user)
	if(user.put_in_hands(N))
		to_chat(user, "<span class='notice'>You make a circle with your hand.</span>")
	else
		qdel(N)
		to_chat(user, "<span class='warning'>You don't have any free hands to make a circle with.</span>")

/datum/emote/living/slap
	key = "slap"
	key_third_person = "slaps"
	restraint_check = TRUE

/datum/emote/living/slap/run_emote(mob/user, params)
	. = ..()
	if(!.)
		return
	var/obj/item/slapper/N = new(user)
	if(user.put_in_hands(N))
		to_chat(user, "<span class='notice'>You ready your slapping hand.</span>")
	else
		to_chat(user, "<span class='warning'>You're incapable of slapping in your current state.</span>")
