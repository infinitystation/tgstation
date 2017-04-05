/obj/item/weapon/implant/mindshield
	name = "loyalty implant"
	desc = "God bless Nanotrasen!"
	icon_state = "loyal"
	origin_tech = "materials=2;biotech=4;programming=4"
	activated = 0

/obj/item/weapon/implant/mindshield/get_data()
	var/dat = {"<b>Implant Specifications:</b><BR>
				<b>Name:</b> Nanotrasen Employee Management Implant<BR>
				<b>Life:</b> Ten years.<BR>
				<b>Important Notes:</b> Personnel injected with this device tend to be much more loyal to the company.<BR>
				<HR>
				<b>Implant Details:</b><BR>
				<b>Function:</b> Contains a small pod of nanobots that protects the host's mental functions from manipulation.<BR>
				<b>Special Features:</b> Will prevent and cure most forms of brainwashing.<BR>
				<b>Integrity:</b> Implant will last so long as the nanobots are inside the bloodstream."}
	return dat

/obj/screen/alert/loyalty_imp
	name = "loyalty implanted"
	desc = "Я чувствую ло&#1103;льность к Нанотрайзен! Слава корпорации!"
	icon = 'icons/mob/alert_infinity.dmi'
	icon_state = "loyal"

/*/obj/item/weapon/implant/mindshield/activate(cause)
	if(!cause || !imp_in)
		return 0
	if(cause == "action_button" && alert(imp_in, "Вы действительно хотите узнать, что делает этот имплант?", "Подтверждение", "Да", "Нет") != "Да")
		return 0
	imp_in << "<span class='notice'>Я чувствую ло&#255;льность к Нанотрайзен! Слава корпорации!</span>" */

/obj/item/weapon/implant/mindshield/implant(mob/living/target, mob/user, silent = 0)
	if(..())
		if((target.mind in (SSticker.mode.changelings | SSticker.mode.abductors | SSticker.mode.cult)) || target.isntloyal())
			if(!silent)
				target.visible_message("<span class='warning'>[target] сморщилс&#255;, сопротивл&#255;&#255;сь импланту!</span>", "<span class='warning'>Вы чувствуете, как Нанотрайзен пытаетс&#255; подчинить вашу волю себе! Сопротивл&#255;йтесь!</span>")
			removed(target, 1)
			qdel(src)
			return 0
		if(target.mind)
			target.mind.remove_all_antag_light()
		if(!silent)
			to_chat(target, "<span class='notice'>Вы чувствуете сильную ло&#255;льность к Нанотрайзен...</span>")
		target.throw_alert("loyalty_implanted", /obj/screen/alert/loyalty_imp)
		return 1
	return 0

/obj/item/weapon/implant/mindshield/removed(mob/target, silent = 0, special = 0)
	if(..())
		if(target.stat != DEAD && !silent)
			to_chat(target, "<span class='boldnotice'>Вы чувствуете, как ло&#255;льность к Нанотрайзен покидает вас вместе с вашей жизнью...</span>")
		target.clear_alert("loyalty_implanted")
		return 1
	return 0

/obj/item/weapon/implanter/mindshield
	name = "implanter (loyalty)"
	imp_type = /obj/item/weapon/implant/mindshield

/obj/item/weapon/implantcase/mindshield
	name = "implant case - 'Loyalty'"
	desc = "A glass case containing a loyalty implant."
	imp_type = /obj/item/weapon/implant/mindshield
