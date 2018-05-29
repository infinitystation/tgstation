#define CHALLENGE_TELECRYSTALS 280
#define CHALLENGE_TIME_LIMIT 3000
#define CHALLENGE_MIN_PLAYERS 25
#define CHALLENGE_SHUTTLE_DELAY 15000 // 25 minutes, so the ops have at least 5 minutes before the shuttle is callable.

GLOBAL_LIST_EMPTY(jam_on_wardec)

/obj/item/nuclear_challenge
	name = "Declaration of War (Challenge Mode)"
	icon = 'icons/obj/device.dmi'
	icon_state = "gangtool-red"
	item_state = "radio"
	lefthand_file = 'icons/mob/inhands/misc/devices_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/misc/devices_righthand.dmi'
	desc = "ƒанное устройство используется с целью 'объявления войны' экипажу, на станцию которого выдвинется штурмовая группа. ѕосле объявления, вылет вашего шаттла будет задержан на 20 минут.  \
			“акой наглый шаг привлечет внимание мощных благотворителей в рамках синдиката, который будет поставлять вашей команде огромное количеством бонусных телекристалов (280).  \
			ƒанная возможность должна быть использована до истечения пяти минут после вашего появления на базе - в противном случае, ваши спонсоры в лице сторонних корпораций потеряют интерес.  \
			ќбъявлять войну экипажу рекомендуется “ќЋ№ ќ в том случае, если вы имеете сплоченный и профессиональный в плане боевого опыта отряд."
	var/declaring_war = FALSE
	var/uplink_type = /obj/item/radio/uplink/nuclear

/obj/item/nuclear_challenge/attack_self(mob/living/user)
	if(declaring_war)
		return
	if(GLOB.player_list.len < CHALLENGE_MIN_PLAYERS)
		user << "¬ражеский экипаж слишком мал, чтобы объявлять им войну.."
		return
	if(!user.onSyndieBase())
		user << "¬ы должны быть на вашей базе, чтобы использовать это."
		return

	if(world.time > CHALLENGE_TIME_LIMIT)
		user << "—лишком поздно для объявления войны. ¬аши спонсоры потеряли интерес. ¬ам придется проводить операцию с тем, что вы имеете на руках."
	if(!check_allowed(user))
		return

	declaring_war = TRUE
	var/are_you_sure = alert(user, "Consult your team carefully before you declare war on [station_name()]]. Are you sure you want to alert the enemy crew? You have [DisplayTimeText(world.time-SSticker.round_start_time - CHALLENGE_TIME_LIMIT)] to decide", "Declare war?", "Yes", "No")
	declaring_war = FALSE

	if(!check_allowed(user))
		return

	if(are_you_sure == "No")
		to_chat(user, "¬ самом деле - элемент неожиданности не так уж и плох..")
		return

	var/war_declaration = "[user.real_name] has declared [user.p_their()] intent to utterly destroy [station_name()] with a nuclear device, and dares the crew to try and stop [user.p_them()]."

	declaring_war = TRUE
	var/custom_threat = alert(user, "Do you want to customize your declaration?", "Customize?", "Yes", "No")
	declaring_war = FALSE

	if(!check_allowed(user))
		return

	if(custom_threat == "Yes")
		declaring_war = TRUE
		war_declaration = stripped_input(user, "Insert your custom declaration", "Declaration")
		declaring_war = FALSE

	if(!check_allowed(user) || !war_declaration)
		return

	priority_announce(war_declaration, title = "Declaration of War", sound = 'sound/machines/alarm.ogg')

	to_chat(user, "You've attracted the attention of powerful forces within the syndicate. A bonus bundle of telecrystals has been granted to your team. Great things await you if you complete the mission.")

	for(var/V in GLOB.syndicate_shuttle_boards)
		var/obj/item/circuitboard/computer/syndicate_shuttle/board = V
		board.challenge = TRUE

	for(var/obj/machinery/computer/camera_advanced/shuttle_docker/D in GLOB.jam_on_wardec)
		D.jammed = TRUE

	new uplink_type(get_turf(user), user.key, CHALLENGE_TELECRYSTALS)
	CONFIG_SET(number/shuttle_refuel_delay, max(CONFIG_GET(number/shuttle_refuel_delay), CHALLENGE_SHUTTLE_DELAY))
	SSblackbox.record_feedback("amount", "nuclear_challenge_mode", 1)

	qdel(src)

/obj/item/nuclear_challenge/proc/check_allowed(mob/living/user)
	if(declaring_war)
		to_chat(user, "You are already in the process of declaring war! Make your mind up.")
		return FALSE
	if(GLOB.player_list.len < CHALLENGE_MIN_PLAYERS)
		to_chat(user, "The enemy crew is too small to be worth declaring war on.")
		return FALSE
	if(!user.onSyndieBase())
		to_chat(user, "You have to be at your base to use this.")
		return FALSE
	if(world.time-SSticker.round_start_time > CHALLENGE_TIME_LIMIT)
		to_chat(user, "It's too late to declare hostilities. Your benefactors are already busy with other schemes. You'll have to make do with what you have on hand.")
		return FALSE
	for(var/V in GLOB.syndicate_shuttle_boards)
		var/obj/item/circuitboard/computer/syndicate_shuttle/board = V
		if(board.moved)
			to_chat(user, "The shuttle has already been moved! You have forfeit the right to declare war.")
			return FALSE
	return TRUE

/obj/item/nuclear_challenge/clownops
	uplink_type = /obj/item/radio/uplink/clownop

#undef CHALLENGE_TELECRYSTALS
#undef CHALLENGE_TIME_LIMIT
#undef CHALLENGE_MIN_PLAYERS
#undef CHALLENGE_SHUTTLE_DELAY
