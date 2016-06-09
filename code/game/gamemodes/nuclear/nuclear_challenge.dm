#define CHALLENGE_TELECRYSTALS 280
#define CHALLENGE_TIME_LIMIT 3000
#define CHALLENGE_MIN_PLAYERS 25
#define CHALLENGE_SHUTTLE_DELAY 15000 // 25 minutes, so the ops have at least 5 minutes before the shuttle is callable.

/obj/item/device/nuclear_challenge
	name = "Declaration of War (Challenge Mode)"
	icon_state = "gangtool-red"
	item_state = "walkietalkie"
	desc = "ƒанное устройство используется с целью 'объявления войны' экипажу, на станцию которого выдвинется штурмовая группа. ѕосле объявления, вылет вашего шаттла будет задержан на 20 минут.  \
			“акой наглый шаг привлечет внимание мощных благотворителей в рамках синдиката, который будет поставлять вашей команде огромное количеством бонусных телекристалов (280).  \
			ƒанная возможность должна быть использована до истечения пяти минут после вашего появления на базе - в противном случае, ваши спонсоры в лице сторонних корпораций потеряют интерес.  \
			ќбъявлять войну экипажу рекомендуется “ќЋ№ ќ в том случае, если вы имеете сплоченный и профессиональный в плане боевого опыта отряд."
	var/declaring_war = 0

/obj/item/device/nuclear_challenge/attack_self(mob/living/user)
	if(declaring_war)
		return
	if(player_list.len < CHALLENGE_MIN_PLAYERS)
		user << "¬ражеский экипаж слишком мал, чтобы объявлять им войну.."
		return
	if(user.z != ZLEVEL_CENTCOM)
		user << "¬ы должны быть на вашей базе, чтобы использовать это."
		return

	if(world.time > CHALLENGE_TIME_LIMIT)
		user << "—лишком поздно для объявления войны. ¬аши спонсоры потеряли интерес. ¬ам придется проводить операцию с тем, что вы имеете на руках."
	if(!check_allowed(user))
		return

	declaring_war = 1
	var/are_you_sure = alert(user, "ѕроконсультируйтесь со своей командой перед объявлением войны станции [station_name()]. ¬ы действительно желаете предупредить врага перед вашей атакой? ", "ќбъявить войну?", "ƒа", "Ќет")
	declaring_war = 0
	if(are_you_sure == "Ќет")
		user << "¬ самом деле - элемент неожиданности не так уж и плох.."
		return
	if(!check_allowed(user))
		return

	declaring_war = 1
	var/war_declaration = "[user.real_name] объявил о своих преднамереньях уничтожить станцию [station_name()] с помощью ядерного устройства и дал экипажу возможность остановить его штурмовой отряд - экипаж, подготовьте оборону."
	priority_announce(war_declaration, title = "ядерная угроза!", sound = 'sound/effects/nuclear_alert.ogg')
	user << "¬ы привлекли внимание влиятельных личностей синдиката. Ѕонусный набор телекристаллов был предоставлен вашему отряду. Ѕольшая награда ждет вас, если вы закончите миссию."

	for(var/V in syndicate_shuttle_boards)
		var/obj/item/weapon/circuitboard/computer/syndicate_shuttle/board = V
		board.challenge = TRUE

	var/obj/item/device/radio/uplink/nuclear/U = new(get_turf(user))
	U.hidden_uplink.owner = "[user.key]"
	U.hidden_uplink.telecrystals = CHALLENGE_TELECRYSTALS
	U.hidden_uplink.gamemode = /datum/game_mode/nuclear
	config.shuttle_refuel_delay = max(config.shuttle_refuel_delay, CHALLENGE_SHUTTLE_DELAY)
	qdel(src)

/obj/item/device/nuclear_challenge/proc/check_allowed(mob/living/user)
	if(declaring_war)
		return 0
	if(player_list.len < CHALLENGE_MIN_PLAYERS)
		user << "The enemy crew is too small to be worth declaring war on."
		return 0
	if(user.z != ZLEVEL_CENTCOM)
		user << "You have to be at your base to use this."
		return 0
	if(world.time > CHALLENGE_TIME_LIMIT)
		user << "It's too late to declare hostilities. Your benefactors are already busy with other schemes. You'll have to make  do with what you have on hand."
		return 0
	for(var/V in syndicate_shuttle_boards)
		var/obj/item/weapon/circuitboard/computer/syndicate_shuttle/board = V
		if(board.moved)
			user << "The shuttle has already been moved! You have forfeit the right to declare war."
			return 0
	return 1

#undef CHALLENGE_TELECRYSTALS
#undef CHALLENGE_MIN_PLAYERS
#undef CHALLENGE_SHUTTLE_DELAY
