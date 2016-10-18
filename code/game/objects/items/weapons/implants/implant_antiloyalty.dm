/obj/item/weapon/implant/antiloyalty
	name = "anti-loyalty implant"
	desc = "Makes you mind more free from NT."
	origin_tech = "materials=2;biotech=4;programming=4;syndicate=2"
	activated = 0

/obj/item/weapon/implant/antiloyalty/get_data()
	var/dat = {"<b>Implant Specifications:</b><BR>
				<b>Name:</b> Anti-NTLoyalty <BR>
				<b>Life:</b> over 9000 days.<BR>
				<b>Important Notes:</b> FUCK THE NT!<BR>
				<HR>
				<b>Implant Details:</b><BR>
				<b>Function:</b> Contains a small pod of nanobots that manipulate the host's mental functions.<BR>
				<b>Special Features:</b> Will prevent and cure most forms of NANOTRASEN brainwashing.<BR>
				<b>Integrity:</b> Implant will last so long as the nanobots are inside the bloodstream."}
	return dat


/obj/item/weapon/implant/antiloyalty/implant(mob/target, mob/user, silent = 0)
	if(..())
		if(target.isloyal())
			if(!silent)
				target.visible_message("<span class='warning'>[target] seems to resist the implant!</span>", "<span class='warning'>Вы ненадолго чувствуете свободу от НТ и очень сильную боль в голове!</span>")
			imp_in = null
			qdel(src)
			return -1
		target.mind.readd_antag_light()
		if(!silent)
			target << "<span class='notice'>You feel a surge of freedom from NT.</span>"
		return 1
	return 0

/obj/item/weapon/implant/antiloyalty/removed(mob/target, silent = 0, special = 0)
	if(..())
		if(target.stat != DEAD && !silent)
			target << "<span class='boldnotice'>Вы чувствуете что-то странное св&#255;занное с НТ</span>"
		return 1
	return 0

/obj/item/weapon/implanter/antiloyalty
	name = "implanter (anti-loyalty)"

/obj/item/weapon/implanter/antiloyalty/New()
	imp = new /obj/item/weapon/implant/antiloyalty(src)
	..()
	update_icon()

/obj/item/weapon/implantcase/antiloyalty
	name = "glass case- 'Anti-NTLoyalty'"
	desc = "A case containing a \"FUCK THE NT\" implant."
	icon = 'icons/obj/items.dmi'
	icon_state = "implantcase-r"

/obj/item/weapon/implantcase/antiloyalty/New()
	imp = new /obj/item/weapon/implant/antiloyalty(src)
	..()