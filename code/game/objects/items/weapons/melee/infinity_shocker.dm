/obj/item/weapon/melee/baton/shocker
	name = "shocker"
	desc = "Nanotrasen warns: Do not use a small-capacitive battery!"
	icon = 'icons/obj/infinity_weapons.dmi'
	icon_state = "shocker"
	item_state = "shocker"
	lefthand_file = 'icons/mob/inhands/infinity_obj_left.dmi'
	righthand_file = 'icons/mob/inhands/infinity_obj_right.dmi'
	force = 0
	throwforce = 0
	stunforce = 6
	hitcost = 1250
	w_class = 2
	attack_verb = list("shocked")
	slot_flags = SLOT_BELT

/obj/item/weapon/melee/baton/shocker/loaded/New()
	..()
	bcell = new(src)
	update_icon()
	return

obj/item/weapon/melee/baton/shocker/baton_stun(mob/living/L, mob/user)
	if(ishuman(L))
		var/mob/living/carbon/human/H = L
		if(H.check_shields(0, "[user]'s [name]", src, MELEE_ATTACK))
			playsound(L, 'sound/weapons/Genhit.ogg', 50, 1)
			return 0
	if(isrobot(loc))
		var/mob/living/silicon/robot/R = loc
		if(!R || !R.cell || !R.cell.use(hitcost))
			return 0
	else
		if(!deductcharge(hitcost))
			return 0

	user.lastattacked = L
	L.lastattacker = user

	L.Stun(stunforce)
	L.Weaken(stunforce)
	L.apply_effect(STUTTER, stunforce)

	L.visible_message("<span class='danger'>[user] has shocked [L] with [src]!</span>", \
							"<span class='userdanger'>[user] has shocked you with [src]!</span>")
	playsound(loc, 'sound/weapons/shocker_attack.ogg', 50, 1, -1)

	if(ishuman(L))
		var/mob/living/carbon/human/H = L
		H.forcesay(hit_appends)

	add_logs(user, L, "shocked")
	return 1

