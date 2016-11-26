/obj/item/weapon/implant/mindshield
	name = "loyalty implant"
	desc = "God bless Nanotrasen!"
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


/obj/item/weapon/implant/mindshield/implant(mob/living/carbon/target, mob/user, silent = 0)
	if(..())
		if((target.mind in (ticker.mode.changelings | ticker.mode.abductors | ticker.mode.cult)) || target.isntloyal())
			if(!silent)
				target.visible_message("<span class='warning'>[target] seems to resist the implant!</span>", "<span class='warning'>You feel the corporate tendrils of Nanotrasen try to invade your mind!</span>")
			removed(target, 1)
			qdel(src)
			return -1
		if(target.mind)
			target.mind.remove_all_antag_light()
		if(!silent)
			target << "<span class='notice'>You feel a surge of loyalty towards Nanotrasen.</span>"
		return 1
	return 0

/obj/item/weapon/implant/mindshield/removed(mob/target, silent = 0, special = 0)
	if(..())
		if(target.stat != DEAD && !silent)
			target << "<span class='boldnotice'>You feel a sense of liberation as Nanotrasen's grip on your mind fades away.</span>"
		return 1
	return 0

/obj/item/weapon/implanter/mindshield
	name = "implanter (loyalty)"

/obj/item/weapon/implanter/mindshield/New()
	imp = new /obj/item/weapon/implant/mindshield(src)
	..()
	update_icon()


/obj/item/weapon/implantcase/mindshield
	name = "implant case - 'Loyalty'"
	desc = "A glass case containing a loyalty implant."

/obj/item/weapon/implantcase/mindshield/New()
	imp = new /obj/item/weapon/implant/mindshield(src)
	..()
