/*Список где внесены изменения:
	1) code/modules/mob/living/carbon/human/human.dm
		/mob/living/carbon/human/New() (Генерация, сделал коммент "erp")
		/mob/living/carbon/human/Topic (Меню erp)
	2) code/modules/mob/living/carbon/human/examine.dm
		Внёс размер члена в описание (пометил комментом "erp")
	3) Файл Erp.dm
	4) Папка с файлами (sound/erp)
	5) code/modules/mob/living/carbon/human/life.dm
		/mob/living/carbon/human/Life() (Пометил "erp)
*/
mob/living/carbon/human/proc/sexerp(var/mob/living/carbon/human/P = usr, var/mob/living/carbon/human/M = usr.affectedsex, var/sexvibor) //P = M - партнёр ; H = P - игрок
//Поцелуй
	if(get_dist(M.loc,usr.loc)>1)
		usr << "\red Слишком далеко."
		return
	if(sexvibor == "mouthkiss")
		switch(rand(1,4))
			if(1)
				visible_message("<b>[usr]</b> <font color=#FF1493>целует</font> <b>[M]</b><font color=#FF1493>.</font>")
			if(2)
				visible_message("<b>[usr]</b> <font color=#FF1493>со страстью целует</font> <b>[M]</b><font color=#FF1493>.</font>")
			if(3)
				visible_message("<b>[usr]</b> <font color=#FF1493>впиваетс&#255; в губы</font> <b>[M]</b><font color=#FF1493>.</font>")
			if(4)
				visible_message("<b>[usr]</b> <font color=#FF1493>осыпает уста</font> <b>[M]</b> <font color=#FF1493>поцелу&#255;ми.</font>")
		return

	if(get_dist(M.loc,usr.loc)>0)
		usr << "\red Слишком далеко."
		return
	switch(sexvibor)
//Рот
		if("mouthpenis")
			if(P.gender=="male")
				switch(rand(1,5))
					if(1)
						visible_message("<b>[usr]</b> <font color=#FF1493>прижимает голову</font> <b>[M]</b> <font color=#FF1493>к паху.</font>")
						if(prob(50))
							spawn(5)
							visible_message("<b>[M]</b> <font color=#aa7243>тыкнувшись [M.gender=="male"?"носом":"носиком"] в [pick("пах","заросли")]</font> <b>[usr]</b> <font color=#aa7243>плотно обхватывает его [M.gender=="male"?"губами":"губками"].</font>")
					if(2 || 3 || 4)
						visible_message("<b>[usr]</b> <font color=#FF1493>трахает</font> <b>[M]</b> <font color=#FF1493>в рот.</font>")
						if(prob(50))
							spawn(5)
							visible_message("<b>[M]</b> <font color=#aa7243>зажмурив [M.gender=="male"?"глаза":"глазки"] принимает в себ&#255; орган партнёра.</font>")
					if(5)
						visible_message("<b>[usr]</b> <font color=#FF1493>кладёт руки на голову</font> <b>[M]</b> <font color=#FF1493>и прижимает её к паху.</font>")
						if(prob(50))
							spawn(5)
							visible_message("<b>[M]</b> <font color=#aa7243>загладывает член</font> <b>[M]</b> <font color=#aa7243>полностью.</font>")
				if (M.lust < 6)
					M.lust += 6
				if (prob(5) && P.stat != DEAD)
					P.lust += 5
				if (P.stat != DEAD && P.stat != UNCONSCIOUS)
					P.lust += 5
					if (P.lust >= P.resistenza)
						P.cum(P, M, "mouth")
				playsound(loc, "sound/erp/bj[rand(1, 11)].ogg", 50, 1, -1)
				M.do_fucking_animation(P)
				if (prob(P.potenzia))
					M.oxyloss += 3
					M.visible_message("<B>[M]</B> [pick("<font color=#FF1493>давитс&#255; инструментом</font> <B>[P]</B>", "<font color=#FF1493>задыхаетс&#255;</font>", "<font color=#FF1493>корчитс&#255; в рвотном позыве</font>")].")
					if (istype(P.loc, /obj/structure/closet))
						P.visible_message("<B>[M]</B> [pick("<font color=#FF1493>давитс&#255; инструментом</font> <B>[P]</B>", "<font color=#FF1493>задыхаетс&#255;</font>", "<font color=#FF1493>корчитс&#255; в рвотном позыве</font>")].")
			else
				switch(rand(1,4))
					if(1)
						visible_message("<b>[usr]</b> <font color=#FF1493>прижимает голову</font> <b>[M]</b> <font color=#FF1493>к киске.</font>")
						if(prob(40))
							spawn(5)
							visible_message("<b>[M]</b> <font color=#aa7243>[pick("отлизывает","целует половые губы","водит &#255;зыком в влагалище", "отлизывает", "отлизывает")]</font> <b>[usr]</b><font color=#aa7243>.</font>")
					if(2 || 3 || 4)
						visible_message("<b>[usr]</b> <font color=#FF1493>сложив руки на затылке у</font> <b>[M]</b> <font color=#FF1493>прижимает [M.gender=="male"?"его":"её"] к киске.</font>")
						if(prob(40))
							spawn(5)
							visible_message("<b>[M]</b> <font color=#aa7243>[pick("отлизывает","целует половые губы","водит &#255;зыком в влагалище", "отлизывает", "отлизывает")]</font> <b>[usr]</b><font color=#aa7243>.</font>")
				if (P.lastfucked != M || P.lfhole != sexvibor)
					P.lastfucked = M
					P.lfhole = sexvibor
				if (prob(5) && M.stat != DEAD)
					M.lust += 5
				if (M.stat != DEAD && M.stat != UNCONSCIOUS)
					M.lust += 5
					if (M.lust >= M.resistenza)
						M.cum(M, P)
					else
						M.moan()
				playsound(loc, "sound/erp/champ[rand(1, 2)].ogg", 50, 1, -1)
				P.do_fucking_animation(M)
//Грудь
		if("chestmouth")
			if(M.gender == "male")
				switch(rand(1,3))
					if(1)
						visible_message("<b>[usr]</b> <font color=#FF1493>водит &#255;зыком по груди</font> <b>[M]</b><font color=#FF1493>.</font>")
					if(2)
						visible_message("<b>[usr]</b> <font color=#FF1493>осыпает грудь</font> <b>[M]</b><font color=#FF1493> поцелу&#255;.</font>")
					if(3)
						visible_message("<b>[usr]</b> <font color=#FF1493>посасывает сосочки у</font> <b>[M]</b><font color=#FF1493>.</font>")
			if(M.gender == "female")
				switch(rand(1,3))
					if(1)
						visible_message("<b>[usr]</b> <font color=#FF1493>проводит &#255;зыком по груди</font> <b>[M]</b><font color=#FF1493>.</font>")
					if(2)
						visible_message("<b>[usr]</b> <font color=#FF1493>[pick("","словно младенец ")]посасывает соски</font> <b>[M]</b><font color=#FF1493>.</font>")
					if(3)
						visible_message("<b>[usr]</b> <font color=#FF1493>целует груди</font> <b>[M]</b><font color=#FF1493>.</font>")
		if("chesthands")
			if(P.gender=="male")
				switch(rand(1,4))
					if(1)
						visible_message("<b>[usr]</b> <font color=#FF1493>ласкает груди девушки руками.</font>")
					if(2)
						visible_message("<b>[usr]</b> <font color=#FF1493>выкручивает соски</font> <b>[M]'a</b><font color=#FF1493>.</font>")
					if(3 || 4)
						visible_message("<b>[usr]</b> <font color=#FF1493>лапает тело</font> <b>[M]</b><font color=#FF1493>.</font>")
			else
				switch(rand(1,3))
					if(1)
						visible_message("<b>[usr]</b> <font color=#FF1493>ласкает груди</font> <b>[M]</b><font color=#FF1493>.</font>")
					if(2 || 3)
						visible_message("<b>[usr]</b> <font color=#FF1493>лапает тело</font> <b>[M]</b><font color=#FF1493>.</font>")
		if("chestpenis")
			if(P.gender=="male")
				switch(rand(1,3))
					if(1)
						visible_message("<b>[usr]</b> <font color=#FF1493>тыркаетс&#255; пенисом о грудь</font> <b>[M]</b><font color=#FF1493>.</font>")
					if(2)
						visible_message("<b>[usr]</b> <font color=#FF1493>трахает груди партнёрши.</font>")
					if(3)
						visible_message("<b>[usr]</b> <font color=#FF1493>двигает членом вперёд-назад меж грудей</font> <b>[M]</b><font color=#FF1493>.</font>")
				if (M.lust < 3)
					M.lust += 3
				if (prob(5) && P.stat != DEAD)
					P.lust += 4
				if (P.stat != DEAD && P.stat != UNCONSCIOUS)
					P.lust += 4
					if (P.lust >= P.resistenza)
						P.cum(P, M, "chest")
				P.do_fucking_animation(M)
			else
				src << "<span class='warning'>Не для девушек.</span>"
				return
//Пах
		if("groinmouth")
			if(M.gender=="male")
				switch(rand(1,8))
					if(1)
						visible_message("<b>[usr]</b> <font color=#FF1493>кладёт член партнёра себе в рот.</font>")
					if(2)
						visible_message("<b>[usr]</b> <font color=#FF1493>целует член</font> <b>[M]</b> <font color=#FF1493>и заглатывает его.</font>")
					if(3)
						visible_message("<b>[usr]</b> <font color=#FF1493>плотным кольцом губ обсасывает орган партнёра.</font>")
					if(4)
						visible_message("<b>[usr]</b> <font color=#FF1493>проводит &#255;зыком по органу</font> <b>[M]</b><font color=#FF1493>.</font>")
					if(5)
						visible_message("<b>[usr]</b> <font color=#FF1493>делает глубокий минет.</font>")
					if(6)
						visible_message("<b>[usr]</b> <font color=#FF1493>причмокива&#255; сосёт член</font> <b>[M]'а</b><font color=#FF1493>.</font>")
					if(7 || 8)
						visible_message("<b>[usr]</b> <font color=#FF1493>отсасывает</font> <b>[M]'у</b><font color=#FF1493>.</font>")
				if (P.lust < 6)
					P.lust += 6
				if (prob(5) && M.stat != DEAD)
					M.lust += 7
				if (M.stat != DEAD && M.stat != UNCONSCIOUS)
					M.lust += 7
					if (M.lust >= M.resistenza)
						M.cum(M, P, "mouth")
				playsound(loc, "sound/erp/bj[rand(1, 11)].ogg", 50, 1, -1)
				P.do_fucking_animation(M)
				if (prob(M.potenzia))
					P.oxyloss += 3
					P.visible_message("<B>[P]</B> [pick("<font color=#FF1493>давитс&#255; инструментом</font> <B>[M]</B>", "<font color=#FF1493>задыхаетс&#255;</font>", "<font color=#FF1493>корчитс&#255; в рвотном позыве</font>")].")
					if (istype(M.loc, /obj/structure/closet))
						M.visible_message("<B>[P]</B> [pick("<font color=#FF1493>давитс&#255; инструментом</font> <B>[M]</B>", "<font color=#FF1493>задыхаетс&#255;</font>", "<font color=#FF1493>корчитс&#255; в рвотном позыве</font>")].")
			else
				switch(rand(1,6))
					if(1)
						visible_message("<b>[usr]</b> <font color=#FF1493>покрывает поцелу&#255;ми лоно любви</font> <b>[M]</b><font color=#FF1493>.</font>")
					if(2)
						visible_message("<b>[usr]</b> <font color=#FF1493>целует половые губы партнёрши.</font>")
					if(3 || 4 || 5)
						visible_message("<b>[usr]</b> <font color=#FF1493>отлизывает</font> <b>[M]</b><font color=#FF1493>.</font>")
					if(6)
						visible_message("<b>[usr]</b> <font color=#FF1493>вводит пальцы внутрь</font> <b>[M]</b><font color=#FF1493>, целуy&#255; клитор.</font>")
				if (P.lastfucked != M || P.lfhole != sexvibor)
					P.lastfucked = M
					P.lfhole = sexvibor
				if (prob(5) && M.stat != DEAD)
					M.lust += 7
				if (M.stat != DEAD && M.stat != UNCONSCIOUS)
					M.lust += 7
					if (M.lust >= M.resistenza)
						M.cum(M, P)
					else
						M.moan()
				playsound(loc, "sound/erp/champ[rand(1, 2)].ogg", 70, 1, -1)
				P.do_fucking_animation(M)
		if("groinhands")
			if(M.gender=="male")
				switch(rand(1,4))
					if(1 || 2 || 3)
						visible_message("<b>[usr]</b> <font color=#FF1493>надрачивает член</font> <b>[M]'а</b><font color=#FF1493>.</font>")
					if(4)
						visible_message("<b>[usr]</b> <font color=#FF1493>обхватывает член</font> <b>[M]'а</b> <font color=#FF1493>ладон&#255;ми двига&#255; ими вперёд-назад.</font>")
				if (P.lust < 3)
					P.lust += 3
				if (prob(5) && M.stat != DEAD)
					M.lust += 7
				if (M.stat != DEAD && M.stat != UNCONSCIOUS)
					M.lust += 7
					if (M.lust >= M.resistenza)
						M.cum(M, P, "mouth")
				P.do_fucking_animation(M)
			else
				switch(rand(1,2))
					if(1)
						visible_message("<b>[usr]</b> <font color=#FF1493>двигает пальцами в дырочке у</font> <b>[M]</b><font color=#FF1493>.</font>")
					if(2)
						visible_message("<b>[usr]</b> <font color=#FF1493>проникает пальцами внутрь</font> <b>[M]</b><font color=#FF1493>.</font>")
				if (P.lastfucked != M || P.lfhole != sexvibor)
					P.lastfucked = M
					P.lfhole = sexvibor
				if (prob(5) && M.stat != DEAD)
					M.lust += 8
				if (M.stat != DEAD && M.stat != UNCONSCIOUS)
					M.lust += 8
					if (M.lust >= M.resistenza)
						M.cum(M, P)
					else
						M.moan()
				playsound(loc, "sound/erp/champ_fingering.ogg", 50, 1, -1)
				P.do_fucking_animation(M)
		if("groinpenis")
			if(M.gender=="male")
				switch(rand(1,2))
					if(1)
						visible_message("<b>[usr]</b> <font color=#FF1493>насаживаетс&#255; на орган партнёра.</font>")
					if(2)
						visible_message("<b>[usr]</b> <font color=#FF1493>трахает себ&#255; органом</font> <b>[M]</b><font color=#FF1493>.</font>")
				if (P.lastfucked != M || P.lfhole != sexvibor)
					P.lastfucked = M
					P.lfhole = sexvibor
				if (prob(5) && M.stat != DEAD)
					M.lust += P.potenzia * 2
				if (istype(M.loc, /obj/structure/closet))
					playsound(M.loc.loc, 'sound/effects/clang.ogg', 50, 0, 0)
				P.lust += M.potenzia
				if (M.potenzia > 20)
					P.staminaloss += M.potenzia * 0.25
				if (P.lust >= P.resistenza)
					P.cum(P, M)
				else
					P.moan()
				if (M.stat != DEAD && M.stat != UNCONSCIOUS)
					M.lust += P.potenzia
					if (M.lust >= M.resistenza)
						M.cum(M, P, "vagina")
					else
						M.moan()
				P.do_fucking_animation(M)
				playsound(loc, "sound/erp/bang[rand(1, 3)].ogg", 70, 1, -1)
			else
				switch(rand(1,5))
					if(1)
						visible_message("<b>[usr]</b> <font color=#FF1493>трахает</font> <b>[M]</b> <font color=#FF1493>.</font>")
					if(2)
						visible_message("<b>[usr]</b> <font color=#FF1493>сжима&#255; бёдра</font> <b>[M]</b> <font color=#FF1493>трахает её.</font>")
					if(3)
						visible_message("<b>[usr]</b> <font color=#FF1493>двигаетс&#255; внутри</font> <b>[M]</b> <font color=#FF1493>.</font>")
					if(4)
						visible_message("<b>[usr]</b> <font color=#FF1493>резкими движени&#255;ми вгон&#255;ет член в</font> <b>[M]</b><font color=#FF1493>.</font>")
					if(5)
						visible_message("<b>[usr]</b> <font color=#FF1493>прижима&#255;сь к</font> <b>[M]</b> <font color=#FF1493>вгон&#255;ет в неё член.</font>")
				if (P.lastfucked != M || P.lfhole != sexvibor)
					P.lastfucked = M
					P.lfhole = sexvibor
				if (prob(5) && M.stat != DEAD)
					M.lust += P.potenzia * 2
				if (istype(M.loc, /obj/structure/closet))
					playsound(M.loc.loc, 'sound/effects/clang.ogg', 50, 0, 0)
				P.lust += 10
				if (P.lust >= P.resistenza)
					P.cum(P, M, "vagina")
				if (M.stat != DEAD && M.stat != UNCONSCIOUS)
					M.lust += P.potenzia * 0.5
					if (P.potenzia > 20)
						M.staminaloss += P.potenzia * 0.25
					if (M.lust >= M.resistenza)
						M.cum(M, P)
					else
						M.moan()
				P.do_fucking_animation(P)
				playsound(loc, "sound/erp/bang[rand(1, 3)].ogg", 70, 1, -1)
//Попа
		if("assmouth")
			switch(rand(1,3))
				if(1)
					visible_message("<b>[usr]</b> <font color=#FF1493>лижет [pick("очко","анальное кольцо","жопу")]</font> <b>[M]</b><font color=#FF1493>.</font>")
				if(2)
					visible_message("<b>[usr]</b> <font color=#FF1493>водит &#255;зыком по [pick("очку","анальному кольцу","попке","жопе")]</font> <b>[M]</b><font color=#FF1493>.</font>")
				if(3)
					visible_message("<b>[usr]</b> <font color=#FF1493>двигает &#255;зыком в [pick("очке","анальном кольце","жопе")]</font> <b>[M]</b><font color=#FF1493>.</font>")
		if("asshands")
			switch(rand(1,3))
				if(1)
					visible_message("<b>[usr]</b> <font color=#FF1493>вводит свои пальцы в [pick("очко","анальное кольцо","жопу")]</font> <b>[M]</b><font color=#FF1493>.</font>")
				if(2)
					visible_message("<b>[usr]</b> <font color=#FF1493>проникает пальцами в [pick("очко","анальное кольцо","жопу")]</font> <b>[M]</b><font color=#FF1493>.</font>")
				if(2)
					visible_message("<b>[usr]</b> <font color=#FF1493>нежно двигает пальцами в [pick("анальном кольце","жопе")]</font> <b>[M]</b><font color=#FF1493>.</font>")
			if (P.lastfucked != M || P.lfhole != sexvibor)
				P.lastfucked = M
				P.lfhole = sexvibor
			if (prob(5) && M.stat != DEAD)
				M.lust += 8
			if (M.stat != DEAD && M.stat != UNCONSCIOUS)
				M.lust += 8
				if (M.lust >= M.resistenza)
					M.cum(M, P)
				else
					M.moan()
			playsound(loc, "sound/erp/champ_fingering.ogg", 50, 1, -1)
			P.do_fucking_animation(M)
		if("asspenis")
			if (P.gender=="male")
				switch(rand(1,5))
					if(1)
						visible_message("<b>[usr]</b> <font color=#FF1493>трахает</font> <b>[M]</b> <font color=#FF1493>в [pick("задницу","жопу","попку","анальное кольцо")].</font>")
					if(2)
						visible_message("<b>[usr]</b> <font color=#FF1493>с силой трахает</font> <b>[M]</b> <font color=#FF1493>в [pick("задницу","жопу","попку","анальное кольцо")].</font>")
					if(3)
						visible_message("<b>[usr]</b> <font color=#FF1493>глубоко всаживает свой член в [pick("задницу","жопу","попку","анальное кольцо")]</font> <b>[M]</b><font color=#FF1493>.</font>")
					if(4)
						visible_message("<b>[usr]</b> <font color=#FF1493>по самые &#255;йца засаживает член в [pick("задницу","жопу","попку","анальное кольцо")]</font> <b>[M]</b><font color=#FF1493>.</font>")
					if(5)
						visible_message("<b>[usr]</b> <font color=#FF1493>сжима&#255; [pick("попку","жопу","бёдра","бёдра")]</font> <b>[M]</b> <font color=#FF1493>[pick("грубо трахает", "трахает")] [M.gender=="male"?"его":"её"] в [pick("задницу","жопу","попку","анальное кольцо")].</font>")
				if (P.lastfucked != M || P.lfhole != sexvibor)
					P.lastfucked = M
					P.lfhole = sexvibor
				if (prob(5) && M.stat != DEAD)
					M.lust += P.potenzia * 2
				if (istype(M.loc, /obj/structure/closet))
					playsound(M.loc.loc, 'sound/effects/clang.ogg', 50, 0, 0)
				P.lust += 10
				if (P.lust >= P.resistenza)
					P.cum(P, M, "anus")
				if (M.stat != DEAD && M.stat != UNCONSCIOUS)
					M.lust += P.potenzia * 0.5
					if (P.potenzia > 20)
						M.staminaloss += P.potenzia * 0.25
					if (M.lust >= M.resistenza)
						M.cum(M, P)
					else
						M.moan()
				P.do_fucking_animation(P)
				playsound(loc, "sound/erp/bang[rand(1, 3)].ogg", 70, 1, -1)
			else
				src << "<span class='warning'>Не для девушек.</span>"
				return

/mob/living/carbon/human/MouseDrop_T(mob/M as mob, mob/user as mob)
	if(M==src && src!=usr)		return
	if(!Adjacent(src))			return
	if(M!=usr)					return
	usr.affectedsex = src
	make_sex(machine)

/mob/proc/make_sex()
	usr.set_machine(src)
	return

	//erp defines
/mob/living/carbon/human
	var/potenzia = 10
	var/resistenza = 200
	var/lust = 0
	var/lastmoan
	var/erpcooldown = 0
	var/multiorgasms = 0
	var/lfhole
	var/mob/living/carbon/human/lastfucked
/mob
	var/affectedsex = null
	//

mob/living/carbon/human/proc/handle_lust()
	lust -= 4
	if (lust <= 0)
		lust = 0
		lastfucked = null
		lfhole = ""
		multiorgasms = 0
	if (lust == 0)
		erpcooldown -= 1
	if (erpcooldown < 0)
		erpcooldown = 0

mob/living/carbon/human/proc/moan()
	var/mob/living/carbon/human/H = src
	if (prob(H.lust / H.resistenza * 65))
		var/message = pick("постанывает", "стонет от удовольстви&#255;", "закатывает глаза", "закусывает губу")
		H.visible_message("<B>[H]</B> [message].")
		var/g = H.gender == FEMALE ? "f" : "m"
		var/moan = rand(1, 7)
		if (moan == lastmoan)
			moan--
		if(!istype(loc, /obj/structure/closet))
			playsound(loc, "sound/erp/moan_[g][moan].ogg", 70, 1, 0)
		else if (g == "f")
			playsound(loc, "sound/erp/under_moan_f[rand(1, 4)].ogg", 70, 1, 0)
		lastmoan = moan
		if (istype(H.head, /obj/item/clothing/head/kitty)  || istype(H.head, /obj/item/clothing/head/collectable/kitty))
			playsound(loc, "sound/erp/purr_f[rand(1, 3)].ogg", 70, 1, 0)

/mob/living/carbon/proc/do_fucking_animation(mob/living/carbon/human/P) //anim
	var/pixel_x_diff = 0
	var/pixel_y_diff = 0
	var/final_pixel_y = initial(pixel_y)

	var/direction = get_dir(src, P)
	if(direction & NORTH)
		pixel_y_diff = 8
	else if(direction & SOUTH)
		pixel_y_diff = -8

	if(direction & EAST)
		pixel_x_diff = 8
	else if(direction & WEST)
		pixel_x_diff = -8

	if(pixel_x_diff == 0 && pixel_y_diff == 0)
		pixel_x_diff = rand(-3,3)
		pixel_y_diff = rand(-3,3)
		animate(src, pixel_x = pixel_x + pixel_x_diff, pixel_y = pixel_y + pixel_y_diff, time = 2)
		animate(pixel_x = initial(pixel_x), pixel_y = initial(pixel_y), time = 2)
		return
	animate(src, pixel_x = pixel_x + pixel_x_diff, pixel_y = pixel_y + pixel_y_diff, time = 2)
	animate(pixel_x = initial(pixel_x), pixel_y = final_pixel_y, time = 2)

mob/living/carbon/human/proc/cum(mob/living/carbon/human/H, mob/living/carbon/human/P, var/hole = "floor") // cum
	var/message = "кончает на пол!"
	var/turf/T
	if (H.gender == MALE)
		if (P)
			T = get_turf(P)
		else
			T = get_turf(H)

		if (H.multiorgasms < H.potenzia)
			var/obj/effect/decal/cleanable/cum/C = new(T)
			C.blood_DNA = list()

		if (hole == "mouth" || H.zone_selected == "mouth")
			message = pick("кончает [P] в рот.", "целитс&#255; в лицо [P], стрел&#255;ет тугой струёй малафьи, но промахиваетс&#255;.", "разбрызгивает сем&#255; на лицо [P].", "кончает на пол.")

		else if (hole == "vagina")
			message = pick("кончает в [P]", "резко выт&#255;гивает член из [P], а затем спускает на пол.", "проникает в [P] последний раз, затем содрагаетс&#255;. Сперма медленно вытекает из щели [P].")

		else if (hole == "anus")
			message = pick("кончает [P] в зад.", "выдергивает член из [P], а затем обильно кончает на [P.gender == MALE ? "его" : "её"] попку.", "выт&#255;гивает член из задницы [P] и сразу же спускает на пол.")

		else if (hole == "floor")
			message = "кончает на пол!"

		else if (hole == "chest")
			message = "кончает на грудь [P]!"

		playsound(loc, "sound/erp/final_m[rand(1, 5)].ogg", 70, 1, 0)

		H.visible_message("<B>[H] [message]</B>")
		if (istype(P.loc, /obj/structure/closet))
			P.visible_message("<B>[H] [message]</B>")
		H.lust = 5
		H.resistenza += 50

	else
		message = pick("извиваетс&#255; в приступе оргазма", "прикрывает глаза и мелко дрожит", "содрагаетс&#255;, а затем резко расслабл&#255;етс&#255;", "замирает, закатив глаза")
		H.visible_message("<B>[H] [message].</B>")
		if (istype(P.loc, /obj/structure/closet))
			P.visible_message("<B>[H] [message].</B>")
		playsound(loc, "sound/erp/final_f[rand(1, 3)].ogg", 90, 1, 0)
		var/delta = pick(20, 30, 40, 50)
		src.lust -= delta

	H.druggy = 60
	H.multiorgasms += 1
	H.erpcooldown = rand(200, 450)
	if (H.multiorgasms > H.potenzia / 3)
		if (H.staminaloss < P.potenzia * 4)
			H.staminaloss += H.potenzia
		if (H.staminaloss > 100)
			H.druggy = 300
			H.erpcooldown = 600

/mob/living/carbon/human/proc/checksuituniform(suit_only = 0, uniform_only = 0) //proverka odezdi
	if( (!suit_only && wear_suit && (wear_suit.flags_inv & HIDEJUMPSUIT)) || (!uniform_only && w_uniform) )
		return 1

/mob/living/carbon/human/proc/checksuituniformtwo(mob/T, mob/user)
	if(!iscarbon(T))
		return 0
	var/mob/living/carbon/human/C = T
	var/covered = ""
	if(C.checksuituniform(suit_only = 1))
		covered = "униформу"
	else if(C.checksuituniform(uniform_only = 1))
		covered = "броню или риг"
	if(covered)
		var/who = (isnull(user) || T == user) ? "Вы должны" : "Партнёр должен"
		user << "<span class='warning'>[who] сн&#255;ть [covered]!</span>"
		return 0
	return 1

/mob/living/carbon/human/proc/is_nude()
	return (!wear_suit && !w_uniform) ? 1 : 0

/mob/living/carbon/human/proc/checkheadmask(mob/T, mob/user)
	if(!iscarbon(T))
		return 0
	var/mob/living/carbon/C = T
	var/covered = ""
	if(C.is_mouth_covered(head_only = 1))
		covered = "шлем"
	else if(C.is_mouth_covered(mask_only = 1))
		covered = "маску"
	if(covered)
		var/who = (isnull(user) || T == user) ? "Вы должны" : "Партнёр должен"
		user << "<span class='warning'>[who] сн&#255;ть [covered]!</span>"
		return 0
	return 1

/mob/living/carbon/human/make_sex()
	usr.set_machine(src)
	var/dat = {"<style type="text/css">
	body{
	background-color: #222222;
	}
	A {
	text-decoration: none;
	font-size: 12pt;
	color: #0066cc;
	}
	A:visited {
	color: #0066cc;
	}
	A:hover {
	text-decoration: underline;
	color: #821213;
	}
	</style>
	<B><FONT color=#be6209 size=4>Секас c [name]</FONT></B>
	<HR>
	<font color=#be6209 size=3>Рот</font><BR>
	[in_range(usr.affectedsex,usr)? \
	"<font color=#be6209>-</font> <A href='?src=\ref[src];sex=mouthkiss'>Поцелуй</A><BR> \
	 <A href='?src=\ref[src];sex=mouthpenis'>Пенис</A><BR>":"Слишком далеко"]

	<font color=#be6209 size=3>Грудь</font><BR>
	[in_range(usr.affectedsex,usr)? \
	"<font color=#be6209>-</font> <A href='?src=\ref[src];sex=chestmouth'>Рот</A><BR> \
	 <A href='?src=\ref[src];sex=chesthands'>Руки</A><BR> \
	 <A href='?src=\ref[src];sex=chestpenis'>Пенис</A><BR>":"Слишком далеко"]

	<font color=#be6209 size=3>Пах</font><BR>
	[in_range(usr.affectedsex,usr)? \
	"<font color=#be6209>-</font> <A href='?src=\ref[src];sex=groinmouth'>Рот</A><BR> \
	 <A href='?src=\ref[src];sex=groinhands'>Руки</A><BR> \
	 <A href='?src=\ref[src];sex=groinpenis'>Пенис</A><BR>":"Слишком далеко"]
	<font color=#be6209 size=3>Попка</font><BR>
	[in_range(usr.affectedsex,usr)? \
	"<font color=#be6209>-</font> <A href='?src=\ref[src];sex=assmouth'>Рот</A><BR> \
	 <A href='?src=\ref[src];sex=asshands'>Руки</A><BR> \
	 <A href='?src=\ref[src];sex=asspenis'>Пенис</A><BR>":"Слишком далеко"]
	"}
	usr << browse(dat, text("window=mob[name];size=340x480"))
	onclose(usr, "mob[name]")
	return


/obj/effect/decal/cleanable/cum //semya
	name = "cum"
	desc = "Wow, that is something thick and white..."
	density = 0
	layer = 2
	icon = 'sound/erp/icons/cum.dmi'
	blood_DNA = list()
	anchored = 1
	random_icon_states = list("cum1", "cum3", "cum4", "cum5", "cum6", "cum7", "cum8", "cum9", "cum10", "cum11", "cum12")
                          ///////////ERP End/////////////