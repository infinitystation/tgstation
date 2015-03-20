/mob/living/carbon/human/emote(var/act,var/m_type=1,var/message = null)
	var/param = null

	if (findtext(act, "-", 1, null))
		var/t1 = findtext(act, "-", 1, null)
		param = copytext(act, t1 + 1, length(act) + 1)
		act = copytext(act, 1, t1)

	if(findtext(act,"s",-1) && !findtext(act,"_",-2))//Removes ending s's unless they are prefixed with a '_'
		act = copytext(act,1,length(act))

	var/muzzled = is_muzzled()
	//var/m_type = 1

	for (var/obj/item/weapon/implant/I in src)
		if (I.implanted)
			I.trigger(act, src)

	var/miming=0
	if(mind)
		miming=mind.miming

	if(src.stat == 2.0 && (act != "deathgasp"))
		return
	switch(act) //Please keep this alphabetically ordered when adding or changing emotes.
		if ("aflap") //Any emote on human that uses miming must be left in, oh well.
			if (!src.restrained())
				message = "<B>[src]</B> ј√–≈——»¬Ќќ хлопает крыль&#255;ми!"
				m_type = 2

		if ("choke")
			if (miming)
				if(gender == FEMALE)
					message = "<B>[src]</B> отча&#255;нно схватилась за горло и давитс&#255;!"
				else
					message = "<B>[src]</B> отча&#255;нно схватилc&#255; за горло и давитс&#255;!"
			else
				..(act)

		if ("chuckle")
			if(miming)
				message = "<B>[src]</B> делает вид, что хихикает."
			else
				..(act)

		if ("clap")
			if (!src.restrained())
				message = "<B>[src]</B> хлопает."
				m_type = 2

		if ("collapse")
			Paralyse(2)
			if(gender == FEMALE)
				message = "<B>[src]</B> рухнула!"
			else
				message = "<B>[src]</B> рухнул!"
			m_type = 2

		if ("cough")
			if (miming)
				message = "<B>[src]</B> делает вид, что кашл&#255;ет!"
			else
				if (!muzzled)
					message = "<B>[src]</B> кашл&#255;ет!"
					m_type = 2
				else
					message = "<B>[src]</B> издаЄт громкий звук."
					m_type = 2

		if ("cry")
			if (miming)
				message = "<B>[src]</B> плачет."
			else
				if (!muzzled)
					message = "<B>[src]</B> плачет."
					m_type = 2
				else
					message = "<B>[src]</B> издаЄт слабый звук. ’муритс&#255;."
					m_type = 2

		if ("custom")
			var/input = copytext(sanitize(input("Choose an emote to display.") as text|null),1,MAX_MESSAGE_LEN)
			if (!input)
				return
			if(copytext(input,1,5) == "says")
				src << "<span class='danger'>Invalid emote.</span>"
				return
			else if(copytext(input,1,9) == "exclaims")
				src << "<span class='danger'>Invalid emote.</span>"
				return
			else if(copytext(input,1,6) == "yells")
				src << "<span class='danger'>Invalid emote.</span>"
				return
			else if(copytext(input,1,5) == "asks")
				src << "<span class='danger'>Invalid emote.</span>"
				return
			else
				var/input2 = input("Is this a visible or hearable emote?") in list("Visible","Hearable")
				if (input2 == "Visible")
					m_type = 1
				else if (input2 == "Hearable")
					if(miming)
						return
					m_type = 2
				else
					alert("Unable to use this emote, must be either hearable or visible.")
					return
				message = "<B>[src]</B> [input]"

		if ("dap")
			m_type = 1
			if (!src.restrained())
				var/M = null
				if (param)
					for (var/mob/A in view(1, src))
						if (param == A.name)
							M = A
							break
				if (M)
					message = "<B>[src]</B> даЄт приветственный кулак [M]."
				else
					message = "<B>[src]</B> к сожалению, поблизости нет никого, чтобы поприветствовать друг друга касанием кулаков, поприветствовал сам себ&#255;. —тыдобище."

		if ("eyebrow")
			message = "<B>[src]</B> приподн&#255;л бровь."
			m_type = 1

		if ("flap")
			if (!src.restrained())
				message = "<B>[src]</B> хлопает крыль&#255;ми."
				m_type = 2

		if ("gasp")
			if (miming)
				message = "<B>[src]</B> выгл&#255;дит, как буд-то задыхаетс&#255;!"
			else
				..(act)

		if ("giggle")
			if (miming)
				message = "<B>[src]</B> беззвучно хихикает!"
			else
				..(act)

		if ("groan")
			if (miming)
				message = "<B>[src]</B> делает вид, что стонет!"
			else
				if (!muzzled)
					message = "<B>[src]</B> стонет!"
					m_type = 2
				else
					message = "<B>[src]</B> издаЄт громкий шум."
					m_type = 2

		if ("grumble")
			if (!muzzled)
				message = "<B>[src]</B> ворчит!"
			else
				message = "<B>[src]</B> издаЄт звук."
				m_type = 2

		if ("handshake")
			m_type = 1
			if (!src.restrained() && !src.r_hand)
				var/mob/M = null
				if (param)
					for (var/mob/A in view(1, src))
						if (param == A.name)
							M = A
							break
				if (M == src)
					M = null
				if (M)
					if (M.canmove && !M.r_hand && !M.restrained())
						message = "<B>[src]</B> пожимает руку [M]."
					else
						message = "<B>[src]</B> прот&#255;гивает руку дл&#255; рукопожати&#255; [M]."

		if ("hug")
			m_type = 1
			if (!src.restrained())
				var/M = null
				if (param)
					for (var/mob/A in view(1, src))
						if (param == A.name)
							M = A
							break
				if (M == src)
					M = null
				if (M)
					message = "<B>[src]</B> обнимает [M]."
				else
					message = "<B>[src]</B> обнимает сам себ&#255;."

		if ("me")
			if(silent)
				return
			if (src.client)
				if (client.prefs.muted & MUTE_IC)
					src << "<span class='danger'>¬ы не можете отправлять IC сообщения. (muted).</span>"
					return
				if (src.client.handle_spam_prevention(message,MUTE_IC))
					return
			if (stat)
				return
			if(!(message))
				return
			if(copytext(message,1,5) == "says")
				src << "<span class='danger'>Invalid emote.</span>"
				return
			else if(copytext(message,1,9) == "exclaims")
				src << "<span class='danger'>Invalid emote.</span>"
				return
			else if(copytext(message,1,6) == "yells")
				src << "<span class='danger'>Invalid emote.</span>"
				return
			else if(copytext(message,1,5) == "asks")
				src << "<span class='danger'>Invalid emote.</span>"
				return
			else
				message = "<B>[src]</B> [message]"

		if ("moan")
			if(miming)
				message = "<B>[src]</B> выгл&#255;дит, как буд-то стонет!"
			else
				message = "<B>[src]</B> стонет!"
				m_type = 2

		if ("mumble")
			message = "<B>[src]</B> бормочет!"
			m_type = 2

		if ("pale")
			if(gender == FEMALE)
				message = "<B>[src]</B> на секунду побледнела."
			else
				message = "<B>[src]</B> на секунду побледнел."
			m_type = 1

		if ("raise")
			if (!src.restrained())
				message = "<B>[src]</B> поднимает руку."
			m_type = 1

		if ("salute")
			if (!src.buckled)
				var/M = null
				if (param)
					for (var/mob/A in view(1, src))
						if (param == A.name)
							M = A
							break
				if (!M)
					param = null
				if (param)
					message = "<B>[src]</B> приветствует жестом [param]."
				else
					message = "<B>[src]</b> приветствует жестом."
			m_type = 1

		if ("scream")
			if (miming)
				message = "<B>[src]</B> делает вид, что душераздирающе кричит!"
			else
				..(act)

		if ("shiver")
			message = "<B>[src]</B> дрожит."
			m_type = 1

		if ("shrug")
			message = "<B>[src]</B> пожимает плечами."
			m_type = 1

		if ("sigh")
			if(miming)
				message = "<B>[src]</B> вздыхает."
			else
				..(act)

		if ("signal")
			if (!src.restrained())
				var/t1 = round(text2num(param))
				if (isnum(t1))
					if (t1 <= 5 && (!src.r_hand || !src.l_hand))
						message = "<B>[src]</B> поднимает [t1] пальцев."
					else if (t1 <= 10 && (!src.r_hand && !src.l_hand))
						message = "<B>[src]</B> поднимает [t1] пальцев."
			m_type = 1

		if ("sneeze")
			if (miming)
				message = "<B>[src]</B> чихает."
			else
				..(act)

		if ("sniff")
			message = "<B>[src]</B> нюхает."
			m_type = 2

		if ("snore")
			if (miming)
				message = "<B>[src]</B> громко спит."
			else
				..(act)

		if ("vomit")
			message = "<B>[src]</B> блюЄт на пол!"
			var/mob/living/M = src
			M.nutrition -= 20
			M.adjustToxLoss(-3)
			var/turf/T = get_turf(M)
			T.add_vomit_floor(M)
			playsound(M, 'sound/effects/splat.ogg', 50, 1)
			Stun(10)
			m_type = 1

		if ("whimper")
			if (miming)
				message = "<B>[src]</B> выгл&#255;дит обиженным."
			else
				..(act)

		if ("yawn")
			if (!muzzled)
				message = "<B>[src]</B> зевает."
				m_type = 2

		if ("help") //This can stay at the bottom.
			src << "Help for human emotes. You can use these emotes with say \"*emote\":\n\naflap, airguitar, blink, blink_r, blush, bow-(none)/mob, burp, choke, chuckle, clap, collapse, cough, cry, custom, dance, dap, deathgasp, drool, eyebrow, faint, flap, frown, gasp, giggle, glare-(none)/mob, grin, groan, grumble, handshake, hug-(none)/mob, jump, laugh, look-(none)/mob, me, moan, mumble, nod, pale, point-(atom), raise, salute, scream, shake, shiver, shrug, sigh, signal-#1-10, sit, smile, sneeze, sniff, snore, stare-(none)/mob, sulk, sway, tremble, twitch, twitch_s, wave, whimper, wink, yawn"

		else
			..(act)

	if(miming)
		m_type = 1



	if (message)
		log_emote("[name]/[key] : [message]")

 //Hearing gasp and such every five seconds is not good emotes were not global for a reason.
 // Maybe some people are okay with that.

		for(var/mob/M in dead_mob_list)
			if(!M.client || istype(M, /mob/new_player))
				continue //skip monkeys, leavers and new players
			if(M.stat == DEAD && M.client && (M.client.prefs.chat_toggles & CHAT_GHOSTSIGHT) && !(M in viewers(src,null)))
				M.show_message(message)


		if (m_type & 1)
			visible_message(message)
		else if (m_type & 2)
			audible_message(message)

