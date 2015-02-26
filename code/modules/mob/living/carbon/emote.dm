//This only assumes that the mob has a body and face with at least one eye, and one mouth.
//Things like airguitar can be done without arms, and the flap thing makes so little sense it's a keeper.
//Intended to be called by a higher up emote proc if the requested emote isn't in the custom emotes.

/mob/living/carbon/emote(var/act,var/m_type=1,var/message = null)
	var/param = null

	if (findtext(act, "-", 1, null))
		var/t1 = findtext(act, "-", 1, null)
		param = copytext(act, t1 + 1, length(act) + 1)
		act = copytext(act, 1, t1)

	if(findtext(act,"s",-1) && !findtext(act,"_",-2))//Removes ending s's unless they are prefixed with a '_'
		act = copytext(act,1,length(act))

	var/muzzled = is_muzzled()
	//var/m_type = 1

	switch(act)//Even carbon organisms want it alphabetically ordered..
		if ("aflap")
			if (!src.restrained())
				message = "<B>[src]</B> ј√–≈——»¬Ќќ хлопает крыльями!"
				m_type = 2

		if ("airguitar")
			if (!src.restrained())
				message = "<B>[src]</B> делает вид, что играет в воздухе на воображаемой гитаре."
				m_type = 1

		if ("blink")
			message = "<B>[src]</B> blinks."
			m_type = 1

		if ("blink_r")
			message = "<B>[src]</B> blinks rapidly."
			m_type = 1

		if ("blush")
			message = "<B>[src]</B> blushes."
			m_type = 1

		if ("bow")
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
					if(gender == FEMALE)
						message = "<B>[src]</B> поклонилась [param]."
					else
						message = "<B>[src]</B> поклонилс&#255; [param]."

				else
					if(gender == FEMALE)
						message = "<B>[src]</B> поклонилась."
					else
						message = "<B>[src]</B> поклонилс&#255;."
			m_type = 1

		if ("burp")
			if (!muzzled)
				..(act)

		if ("choke")
			if (!muzzled)
				..(act)
			else
				message = "<B>[src]</B> издаЄт сильный шум."
				m_type = 2

		if ("chuckle")
			if (!muzzled)
				..(act)
			else
				message = "<B>[src]</B> издаЄт шум."
				m_type = 2

		if ("clap")
			if (!src.restrained())
				message = "<B>[src]</B> хлопает."
				m_type = 2

		if ("cough")
			if (!muzzled)
				..(act)
			else
				message = "<B>[src]</B> издаЄт громкий шум."
				m_type = 2

		if ("deathgasp")
			message = "<B>[src]</B> замирает, конечности расслабляются, глаза становятся мЄртвыми и безжизненными..."
			m_type = 1

		if ("flap")
			if (!src.restrained())
				message = "<B>[src]</B> хлопает крыль&#255;ми."
				m_type = 2

		if ("gasp")
			if (!muzzled)
				..(act)
			else
				message = "<B>[src]</B> издаЄт слабый шум."
				m_type = 2

		if ("giggle")
			if (!muzzled)
				..(act)
			else
				message = "<B>[src]</B> издаЄт шум."
				m_type = 2

		if ("laugh")
			if (!muzzled)
				..(act)
			else
				message = "<B>[src]</B> издаЄт шум."

		if ("nod")
			message = "<B>[src]</B> кивает."
			m_type = 1

		if ("scream")
			if (!muzzled)
				..(act)
			else
				message = "<B>[src]</B> издаЄт очень громкий шум."
				m_type = 2

		if ("shake")
			message = "<B>[src]</B> тр&#255;сЄт головой."
			m_type = 1

		if ("sneeze")
			if (!muzzled)
				..(act)
			else
				message = "<B>[src]</B> издаЄт странный звук."
				m_type = 2

		if ("sigh")
			if (!muzzled)
				..(act)
			else
				message = "<B>[src]</B> вздыхает."
				m_type = 2

		if ("sniff")
			message = "<B>[src]</B> принюхиваетс&#255;."
			m_type = 2

		if ("snore")
			if (!muzzled)
				..(act)
			else
				message = "<B>[src]</B> издаЄт шум."
				m_type = 2

		if ("whimper")
			if (!muzzled)
				..(act)
			else
				message = "<B>[src]</B> издаЄт слабый звук."
				m_type = 2

		if ("wink")
			message = "<B>[src]</B> подмигивает."
			m_type = 1

		if ("yawn")
			if (!muzzled)
				..(act)

		if ("help")
			src << "Help for emotes. You can use these emotes with say \"*emote\":\n\naflap, airguitar, blink, blink_r, blush, bow-(none)/mob, burp, choke, chuckle, clap, collapse, cough, dance, deathgasp, drool, flap, frown, gasp, giggle, glare-(none)/mob, grin, jump, laugh, look, me, nod, point-atom, scream, shake, sigh, sit, smile, sneeze, sniff, snore, stare-(none)/mob, sulk, sway, tremble, twitch, twitch_s, wave, whimper, wink, yawn"

		else
			..(act)





	if (message)
		log_emote("[name]/[key] : [message]")

 //Hearing gasp and such every five seconds is not good emotes were not global for a reason.
 // Maybe some people are okay with that.

		for(var/mob/M in dead_mob_list)
			if(!M.client || istype(M, /mob/new_player))
				continue //skip monkeys, leavers and new players
			if(M.stat == DEAD && M.client && (M.client.prefs.toggles & CHAT_GHOSTSIGHT) && !(M in viewers(src,null)))
				M.show_message(message)


		if (m_type & 1)
			visible_message(message)
		else if (m_type & 2)
			audible_message(message)
