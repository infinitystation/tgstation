//This only assumes that the mob has a body and face with at least one mouth.
//Things like airguitar can be done without arms, and the flap thing makes so little sense it's a keeper.
//Intended to be called by a higher up emote proc if the requested emote isn't in the custom emotes.

/mob/living/emote(var/act, var/m_type=1, var/message = null)
	var/param = null

	if (findtext(act, "-", 1, null))
		var/t1 = findtext(act, "-", 1, null)
		param = copytext(act, t1 + 1, length(act) + 1)
		act = copytext(act, 1, t1)

	if(findtext(act,"s",-1) && !findtext(act,"_",-2))//Removes ending s's unless they are prefixed with a '_'
		act = copytext(act,1,length(act))

	switch(act)//Hello, how would you like to order? Alphabetically!
		if ("aflap")
			if (!src.restrained())
				message = "<B>[src]</B> АГРЕССИВНО хлопает крыль&#255;ми!"
				m_type = 2

		if ("blush")
			message = "<B>[src]</B> краснеет."
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
			if(gender == FEMALE)
				message = "<B>[src]</B> отрыгнула."
			else
				message = "<B>[src]</B> отрыгнул."
			playsound(loc, 'sound/emotions/burp.ogg', 25, 1, 1)
			m_type = 2

		if ("choke")
			if(gender == FEMALE)
				message = "<B>[src]</B> подавилась!"
			else
				message = "<B>[src]</B> подавилс&#255;!"
			playsound(loc, 'sound/emotions/choke.ogg', 25, 1, 1)
			m_type = 2

		if ("chuckle")
			message = "<B>[src]</B> Усмехаетс&#255;."
			playsound(loc, 'sound/emotions/giggle.ogg', 25, 1, 1)
			m_type = 2

		if ("collapse")
			Paralyse(2)
			if(gender == FEMALE)
				message = "<B>[src]</B> рухнула!"
			else
				message = "<B>[src]</B> рухнул!"
			m_type = 2

		if ("cough")
			message = "<B>[src]</B> кашл&#255;ет!"
			playsound(loc, 'sound/emotions/cough.ogg', 25, 1, 1)
			m_type = 2

		if ("dance")
			if (!src.restrained())
				message = "<B>[src]</B> танцует."
				m_type = 1

		if ("deathgasp")
			message = "<B>[src]</B> замирает, конечности расслабл&#255;ютс&#255;, глаза станов&#255;тс&#255; мёртвыми и безжизненными..."
			playsound(loc, 'sound/effects/deathgasp.ogg', 25, 1, 1)
			m_type = 1

		if ("drool")
			message = "<B>[src]</B> несёт чепуху."
			playsound(loc, 'sound/emotions/drool.ogg', 25, 1, 1)
			m_type = 1

		if ("faint")
			message = "<B>[src]</B> тер&#255;ет сознание."
			if(src.sleeping)
				return //Can't faint while asleep
			src.sleeping += 10 //Short-short nap
			m_type = 1

		if ("flap")
			if (!src.restrained())
				message = "<B>[src]</B> хлопает крыль&#255;ми."
				m_type = 2

		if ("flip")
			if (!src.restrained())
				message = "<B>[src]</B> does a flip!"
				src.SpinAnimation(5,1)
				m_type = 2

		if ("frown")
			message = "<B>[src]</B> хмуритс&#255;."
			m_type = 1

		if ("gasp")
			message = "<B>[src]</B> Задыхаетс&#255;!"
			playsound(loc, 'sound/effects/gasp.ogg', 50, 1, 1)
			m_type = 2

		if ("giggle")
			message = "<B>[src]</B> хихикает."
			playsound(loc, 'sound/emotions/giggle.ogg', 25, 1, 1)
			m_type = 2

		if ("glare")
			var/M = null
			if (param)
				for (var/mob/A in view(1, src))
					if (param == A.name)
						M = A
						break
			if (!M)
				param = null
			if (param)
				message = "<B>[src]</B> свирепо смотрит на [param]."
			else
				message = "<B>[src]</B> свирепо смотрит."

		if ("grin")
			message = "<B>[src]</B> усмехаетс&#255;, показыва&#255; зубы."
			playsound(loc, 'sound/emotions/grin.ogg', 25, 1, 1)
			m_type = 1

		if ("jump")
			message = "<B>[src]</B> прыгает!"
			m_type = 1

		if ("laugh")
			message = "<B>[src]</B> смеётс&#255;."
			playsound(loc, 'sound/emotions/laugh.ogg', 25, 1, 1)
			m_type = 2

		if ("look")
			var/M = null
			if (param)
				for (var/mob/A in view(1, src))
					if (param == A.name)
						M = A
						break
			if (!M)
				param = null
			if (param)
				message = "<B>[src]</B> смотрит на [param]."
			else
				message = "<B>[src]</B> смотрит."
			m_type = 1

		if ("me")
			if (src.client)
				if(client.prefs.muted & MUTE_IC)
					src << "You cannot send IC messages (muted)."
					return
				if (src.client.handle_spam_prevention(message,MUTE_IC))
					return
			if (stat)
				return
			if(!(message))
				return
			else
				message = "<B>[src]</B> [message]"

		if ("nod")
			if(gender == FEMALE)
				message = "<B>[src]</B> кивнула."
			else
				message = "<B>[src]</B> кивнул."
			m_type = 1

		if ("point")
			if (!src.restrained())
				var/atom/M = null
				if (param)
					for (var/atom/A as mob|obj|turf in view())
						if (param == A.name)
							M = A
							break
				if (!M)
					message = "<B>[src]</B> указывает."
				else
					pointed(M)
			m_type = 1

		if ("scream")
			message = "<B>[src]</B> душераздирающе кричит!"
			playsound(loc, 'sound/emotions/scream.ogg', 20, 1, 1)
			m_type = 2

		if ("shake")
			message = "<B>[src]</B> тр&#255;сёт головой."
			m_type = 1

		if ("shit")
			//we need to shit? no
			if(need_to_shit < 70)
				src << "Нечем испражн&#255;тс&#255;"
				return

			//we need to shit?
			if((need_to_shit > 70) && (need_to_shit < need_to_shit_max))
				for(var/obj/structure/toilet/T in view(0, src))	//checking toilets
					if(T.shit>0 || T.w_items>0)
						Shit(src)
						return
					else
						need_to_shit = 0
						T.open = 1
						T.shit++
						T.update_icon()
						src << "Вы справили нужду, не забудьте смыть за собой. Object -> Wash Off."
						return
				src << "Лучше найти ближайший туалет"
				return
			if(gender == FEMALE)
				message = "<B>[src]</B> [pick("испражн&#255;етс&#255;.", "высрала кучу говна.", "наложила кучу.", "накакала на пол.", "дрестанула говном на пол.")]"
			else
				message = "<B>[src]</B> [pick("испражн&#255;етс&#255;.", "высрал кучу говна.", "наложил кучу.", "накакал на пол.", "дрестанул говном на пол.")]"
			Shit(src)
			m_type = 1

		if ("sigh")
			message = "<B>[src]</B> вздыхает."
			playsound(loc, 'sound/emotions/sigh.ogg', 20, 1, 1)
			m_type = 2

		if ("sit")
			message = "<B>[src]</B> садитс&#255;."
			m_type = 1

		if ("smile")
			message = "<B>[src]</B> улыбаетс&#255;."
			m_type = 1

		if ("sneeze")
			message = "<B>[src]</B> чихает."
			playsound(loc, 'sound/emotions/sneeze.ogg', 20, 1, 1)
			m_type = 2

		if ("sniff")
			message = "<B>[src]</B> сопит."
			m_type = 2

		if ("snore")
			message = "<B>[src]</B> храпит."
			playsound(loc, 'sound/effects/snore.ogg', 25, 1, 1)
			m_type = 2

		if ("stare")
			var/M = null
			if (param)
				for (var/mob/A in view(1, src))
					if (param == A.name)
						M = A
						break
			if (!M)
				param = null
			if (param)
				message = "<B>[src]</B> п&#255;литс&#255; на [param]."
			else
				message = "<B>[src]</B> п&#255;литс&#255;."

		if ("sulk")
			message = "<B>[src]</B> обиженно дуетс&#255;."
			m_type = 1

		if ("sway")
			message = "<B>[src]</B> раскачиваетс&#255; до головокружени&#255;."
			m_type = 1

		if ("tremble")
			message = "<B>[src]</B> трепещет в страхе!"
			m_type = 1

		if ("twitch")
			message = "<B>[src]</B> сильно дёргаетс&#255;."
			m_type = 1

		if ("twitch_s")
			message = "<B>[src]</B> дёргаетс&#255;."
			m_type = 1

		if ("vomit")
			message = "<B>[src]</B> блюёт на пол!"
			var/mob/living/M = src
			if (M.nutrition < 70)
				src << "Нечем блевать"
			M.nutrition = 0
			M.adjustToxLoss(-10)
			var/turf/T = get_turf(M)
			T.add_vomit_floor(M)
			playsound(M, 'sound/effects/splat.ogg', 50, 1)
			m_type = 1

		if ("wave")
			message = "<B>[src]</B> машет."
			m_type = 1

		if ("whimper")
			message = "<B>[src]</B> хныкает."
			m_type = 2

		if ("yawn")
			message = "<B>[src]</B> зевает."
			m_type = 2

		if ("help")
			src << "Help for emotes. You can use these emotes with say \"*emote\":\n\naflap, blush, bow-(none)/mob, burp, choke, chuckle, clap, collapse, cough, dance, deathgasp, drool, flap, frown, gasp, giggle, glare-(none)/mob, grin, jump, laugh, look, me, nod, point-atom, scream, shake, sigh, sit, smile, sneeze, sniff, snore, stare-(none)/mob, sulk, sway, tremble, twitch, twitch_s, wave, whimper, yawn"

		else
			src << "<span class='notice'>Unusable emote '[act]'. Say *help for a list.</span>"





	if (message)
		log_emote("[name]/[key] : [message]")

 //Hearing gasp and such every five seconds is not good emotes were not global for a reason.
 // Maybe some people are okay with that.

		for(var/mob/M in dead_mob_list)
			if(!M.client || istype(M, /mob/new_player))
				continue //skip monkeys, leavers and new players
			var/T = get_turf(src)
			if(M.stat == DEAD && M.client && (M.client.prefs.chat_toggles & CHAT_GHOSTSIGHT) && !(M in viewers(T,null)))
				M.show_message(message)


		if (m_type & 1)
			visible_message(message)
		else if (m_type & 2)
			audible_message(message)

/mob/living/proc/Shit(var/mob/living/M)
	if(M.stat != DEAD)
		M.need_to_shit = 0
		M.AdjustStunned(3)
		var/turf/pos = get_turf(M)
		pos.add_shit_floor(M)
		playsound(pos, 'sound/emotions/shit.ogg', 50, 1)
	else
		src << "Вы мертвы и не способны больше испражн&#255;тьс&#255;."
		return 0

/mob/living/carbon/human/verb/set_flavor()
	set name = "Set Flavour Text"
	set desc = "Sets an extended description of your character's features."
	set category = "IC"

	update_flavor_text()

