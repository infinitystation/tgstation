/datum/emote/slime
	mob_type_allowed_typecache = /mob/living/simple_animal/slime
	mob_type_blacklist_typecache = list()

/datum/emote/slime/bounce
	key = "bounce"
	key_third_person = "bounces"
	message = "подпрыгивает на месте."

/datum/emote/slime/jiggle
	key = "jiggle"
	key_third_person = "jiggles"
	message = "покачиваетс&#255;."

/datum/emote/slime/light
	key = "light"
	key_third_person = "lights"
	message = "на секунду загораетс&#255; &#255;рким светом, а потом потухает."

/datum/emote/slime/vibrate
	key = "vibrate"
	key_third_person = "vibrates"
	message = "вибрирует!"

/datum/emote/slime/mood
	key = "moodnone"
	var/mood = null

/datum/emote/slime/mood/run_emote(mob/user, params)
	. = ..()
	var/mob/living/simple_animal/slime/S = user
	S.mood = mood
	S.regenerate_icons()

/datum/emote/slime/mood/sneaky
	key = "moodsneaky"
	mood = "mischevous"

/datum/emote/slime/mood/smile
	key = "moodsmile"
	mood = ":3"

/datum/emote/slime/mood/cat
	key = "moodcat"
	mood = ":33"

/datum/emote/slime/mood/pout
	key = "moodpout"
	mood = "pout"

/datum/emote/slime/mood/sad
	key = "moodsad"
	mood = "sad"

/datum/emote/slime/mood/angry
	key = "moodangry"
	mood = "angry"