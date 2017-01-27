/mob/dead/observer/say(message)
	message = trim(copytext(sanitize(message), 1, MAX_MESSAGE_LEN))

	if (!message)
		return

	log_say("Ghost - [src.name]/[src.key] : [message]")

	. = src.say_dead(message)

/mob/dead/observer/Hear(message, atom/movable/speaker, message_langs, raw_message, radio_freq, list/spans)
	if(radio_freq)
		var/atom/movable/virtualspeaker/V = speaker

		if(isAI(V.source))
			var/mob/living/silicon/ai/S = V.source
			speaker = S.eyeobj
		else
			speaker = V.source
	if(client)
		if(CHAT_GHOSTEARS && speaker in view(src))
			message = "<b>(N)</b> [message]"
	var/link = FOLLOW_LINK(src, speaker)
	src << "[link] [message]"

