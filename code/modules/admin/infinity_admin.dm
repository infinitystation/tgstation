/datum/admins/verb/reset_vote()
	set category = "Admin"
	set name = "Reset Vote"
	set desc = "Resets Vote"

	if(!check_rights())
		return

	SSvote.reset()

	message_admins("<span class='adminnotice'>[key_name_admin(usr)] сбросил(а) голосование.</span>")
	log_admin("[key_name_admin(usr)] сбросил(а) голосование.")
	feedback_add_details("admin_verb","RSVT")

//Port From /Bay/station.
/client/proc/roll_dices()
	set category = "Fun"
	set name = "Roll Dice"
	if(!check_rights(R_FUN))
		return

	var/sum = input("Сколько раз ты будешь бросать?") as num
	var/side = input("Выбери число сторон.") as num
	if(!side)
		side = 6
	if(!sum)
		sum = 2

	var/dice = num2text(sum) + "d" + num2text(side)

	if(alert("Хочешь ли ты поведать этому миру о своём броске?",,"Да", "Нет") == "Да")
		world << "<h2 style=\"color:#A50400\">Боги бросают игральные кости!</h2>"

	var/result = roll(dice)

	if(alert("Хочешь ли ты поведать этому миру о результате броска?",,"Да", "Нет") == "Да")
		world << "<h2 style=\"color:#A50400\">Боги бросили игральную кость [dice], результат [result]</h2>"

	message_admins("[key_name_admin(src)] подкинул(а) игральную кость [dice], результат [result]", 1)