//This only assumes that the mob has a body and face with at least one mouth.
//Things like airguitar can be done without arms, and the flap thing makes so little sense it's a keeper.
//Intended to be called by a higher up emote proc if the requested emote isn't in the custom emotes.



/mob/living/emote(act, m_type=1, message = null)
	if(stat)
		return

	var/param = null

	if (findtext(act, "-", 1, null)) //Removes dashes for npcs "EMOTE-PLAYERNAME" or something like that, I ain't no AI coder. It's not for players. -Sum99
		var/t1 = findtext(act, "-", 1, null)
		param = copytext(act, t1 + 1, length(act) + 1)
		act = copytext(act, 1, t1)

	act = lowertext(act)
	switch(act)//Hello, how would you like to order? Alphabetically!
		if ("aflap")
			if (!src.restrained())
				message = "<B>[src]</B> АГРЕССИВНО хлопает крыль&#255;ми!"
				m_type = 2

		if ("blush","blushes")
			message = "<B>[src]</B> краснеет."
			m_type = 1

		if ("bow","bows")
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

		if ("burp","burps")
			if(gender == FEMALE)
				message = "<B>[src]</B> отрыгнула."
			else
				message = "<B>[src]</B> отрыгнул."
			playsound(loc, 'sound/emotions/burp.ogg', 25, 1, 1)
			m_type = 2

		if ("choke","chokes")
			if(gender == FEMALE)
				message = "<B>[src]</B> подавилась!"
			else
				message = "<B>[src]</B> подавилс&#255;!"
			playsound(loc, 'sound/emotions/choke.ogg', 25, 1, 1)
			m_type = 2

		if ("cross","crosses")
			message = "<B>[src]</B> crosses their arms."
			m_type = 2

		if ("chuckle","chuckles")
			message = "<B>[src]</B> Усмехаетс&#255;."
			playsound(loc, 'sound/emotions/giggle.ogg', 25, 1, 1)
			m_type = 2

		if ("collapse","collapses")
			Paralyse(2)
			if(gender == FEMALE)
				message = "<B>[src]</B> рухнула!"
			else
				message = "<B>[src]</B> рухнул!"
			m_type = 2

		if ("cough","coughs")
			message = "<B>[src]</B> кашл&#255;ет!"
			playsound(loc, 'sound/emotions/cough.ogg', 25, 1, 1)
			m_type = 2

		if ("dance","dances")
			if (!src.restrained())
				message = "<B>[src]</B> танцует."
				m_type = 1

		if ("deathgasp","deathgasps")
			message = "<B>[src]</B> замирает, конечности расслабл&#255;ютс&#255;, глаза станов&#255;тс&#255; мёртвыми и безжизненными..."
			playsound(loc, 'sound/effects/deathgasp.ogg', 25, 1, 1)
			m_type = 1

		if ("drool","drools")
			message = "<B>[src]</B> несёт чепуху."
			playsound(loc, 'sound/emotions/drool.ogg', 25, 1, 1)
			m_type = 1

		if ("faint","faints")
			message = "<B>[src]</B> тер&#255;ет сознание."
			if(sleeping)
				return //Can't faint while asleep
			SetSleeping(10) //Short-short nap
			m_type = 1

		if ("flap","flaps")
			if (!src.restrained())
				message = "<B>[src]</B> хлопает крыль&#255;ми."
				m_type = 2

		if ("flip","flips")
			if (!restrained() || !resting || !sleeping)
				src.SpinAnimation(7,1)
				m_type = 2

		if ("frown","frowns")
			message = "<B>[src]</B> хмуритс&#255;."
			m_type = 1

		if ("gag","gags")
			message = "<B>[src]</B> gags!"
			m_type = 2

		if ("gasp","gasps")
			message = "<B>[src]</B> Задыхаетс&#255;!"
			playsound(loc, 'sound/effects/gasp.ogg', 50, 1, 1)
			m_type = 2

		if ("giggle","giggles")
			message = "<B>[src]</B> хихикает."
			playsound(loc, 'sound/emotions/giggle.ogg', 25, 1, 1)
			m_type = 2

		if ("glare","glares")
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

		if ("grin","grins")
			message = "<B>[src]</B> усмехаетс&#255;, показыва&#255; зубы."
			playsound(loc, 'sound/emotions/grin.ogg', 25, 1, 1)
			m_type = 1

		if ("groan","groans")
			message = "<B>[src]</B> groans!"
			m_type = 1


		if ("grimace","grimaces")
			message = "<B>[src]</B> grimaces."
			m_type = 1

		if ("jump","jumps")
			message = "<B>[src]</B> прыгает!"
			m_type = 1

		if ("kiss","kisses") //S-so forward uwa~
			var/M = null
			if (param)
				for (var/mob/A in view(1, src))
					if (param == A.name)
						M = A
						break
			if (!M)
				param = null
			if (param)
				message = "<B>[src]</B> blows a kiss to [param]." //I was gonna make this <B>[src]</B> kisses [param] but then I imagined dealing with an ahelp about someone spamming it and following certain players around and I had a miniature stroke.
			else
				message = "<B>[src]</B> blows a kiss."

		if ("laugh","laughs")
			message = "<B>[src]</B> смеётс&#255;."
			playsound(loc, 'sound/emotions/laugh.ogg', 25, 1, 1)
			m_type = 2

		if ("look","looks")
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
			if(jobban_isbanned(src, "emote"))
				src << "You cannot send custom emotes (banned)"
				return
			if (src.client)
				if(client.prefs.muted & MUTE_IC)
					src << "You cannot send IC messages (muted)."
					return
				if (src.client.handle_spam_prevention(message,MUTE_IC))
					return
			if(!(message))
				return
			else
				message = "<B>[src]</B> [message]"

		if ("nod","nods")
			if(gender == FEMALE)
				message = "<B>[src]</B> кивнула."
			else
				message = "<B>[src]</B> кивнул."
			m_type = 1

		if ("point","points")
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
		if ("pout","pouts")
			message = "<B>[src]</B> pouts."
			m_type = 2

		if ("scream","screams")
			message = "<B>[src]</B> душераздирающе кричит!"
			playsound(loc, 'sound/emotions/scream.ogg', 20, 1, 1)
			m_type = 2

		if ("scowl","scowls")
			message = "<B>[src]</B> scowls."
		if ("shake","shakes")
			message = "<B>[src]</B> тр&#255;сёт головой."
			m_type = 1

		if ("shit", "shits")
			//we need to shit? no
			if(need_to_shit < 70)
				src << "Нечем испражн&#255;тс&#255;"
				return

			//we need to shit?
			if((need_to_shit > 100) && (need_to_shit < SHIT_LEVEL_MAX))
				for(var/obj/structure/toilet/T in view(0, src))	//checking toilets
					if(T.shit>0 || T.w_items>0)
						Shit(src)
						return
					else
						need_to_shit -= max(0, rand(0, 200))
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

		if ("sigh","sighs")
			message = "<B>[src]</B> вздыхает."
			playsound(loc, 'sound/emotions/sigh.ogg', 20, 1, 1)
			m_type = 2

		if ("sit","sits")
			message = "<B>[src]</B> садитс&#255;."
			m_type = 1

		if ("smile","smiles")
			message = "<B>[src]</B> улыбаетс&#255;."
			m_type = 1

		if ("sneeze","sneezes")
			message = "<B>[src]</B> чихает."
			playsound(loc, 'sound/emotions/sneeze.ogg', 20, 1, 1)
			m_type = 2

		if ("smug","smugs")
			message = "<B>[src]</B> grins smugly."
			m_type = 2

		if ("sniff","sniffs")
			message = "<B>[src]</B> сопит."
			m_type = 2

		if ("snore","snores")
			message = "<B>[src]</B> храпит."
			playsound(loc, 'sound/effects/snore.ogg', 25, 1, 1)
			m_type = 2

		if ("stare","stares")
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

		if ("stretch","stretches")
			message = "<B>[src]</B> stretches their arms."
			m_type = 2

		if ("sulk","sulks")
			message = "<B>[src]</B> обиженно дуетс&#255;."
			m_type = 1

		if ("surrender","surrenders")
			message = "<B>[src]</B> puts their hands on their head and falls to the ground, they surrender!"
			if(sleeping)
				return //Can't surrender while asleep.
			Weaken(20) //So you can't resist.
			m_type = 1

		if ("faint","faints")
			message = "<B>[src]</B> faints."
			if(sleeping)
				return //Can't faint while asleep
			SetSleeping(10) //Short-short nap
			m_type = 1


		if ("sway","sways")
			message = "<B>[src]</B> раскачиваетс&#255; до головокружени&#255;."
			m_type = 1

		if ("tremble","trembles")
			message = "<B>[src]</B> трепещет в страхе!"
			m_type = 1

		if ("twitch","twitches")
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

		if ("wave","waves")
			message = "<B>[src]</B> машет."
			m_type = 1

		if ("whimper","whimpers")
			message = "<B>[src]</B> хныкает."
			m_type = 2

		if ("wsmile","wsmiles")
			message = "<B>[src]</B> smiles weakly."
			m_type = 2

		if ("yawn","yawns")
			message = "<B>[src]</B> зевает."
			m_type = 2

		if ("help")
			src << "Help for emotes. You can use these emotes with say \"*emote\":\n\naflap, blush, bow-(none)/mob, burp, choke, chuckle, clap, collapse, cough, cross, dance, deathgasp, drool, flap, frown, gasp, giggle, glare-(none)/mob, grin, grimace, groan, jump, kiss, laugh, look, me, nod, point-atom, scream, shake, sigh, sit, smile, sneeze, sniff, snore, stare-(none)/mob, stretch, sulk, surrender, sway, tremble, twitch, twitch_s, wave, whimper, wsmile, yawn"

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
		M.need_to_shit = max(0,M.need_to_shit - rand(0, 300))
		M.AdjustStunned(3)
		var/turf/pos = get_turf(M)
		pos.add_shit_floor(M)
		playsound(pos, 'sound/emotions/shit.ogg', 50, 1)
	else
		src << "Вы мертвы и не способны больше испражн&#255;тьс&#255;."
		return 0

/mob/living/carbon/human/verb/set_flavor()
	set name = "Set Flavor Text"
	set desc = "Sets an extended description of your character's features."
	set category = "IC"

	if(appearance_isbanned(usr))
		return

	update_flavor_text()
