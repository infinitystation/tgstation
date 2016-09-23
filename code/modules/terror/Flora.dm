//All sprites by Nymary.

/obj/structure/flora/infinity
	name = "snow bush"
	icon = 'icons/obj/infinity_flora.dmi'
	icon_state = "firstbush_1"

/obj/structure/flora/infinity/New()
	if(icon_state == "firstbush_1")
		icon_state = "firstbush_[rand(1, 4)]"
	..()

/obj/structure/flora/infinity/reedbush
	name = "snow reedbush"
	icon = 'icons/obj/infinity_flora.dmi'
	icon_state = "reedbush_1"

/obj/structure/flora/infinity/leafybush
	name = "snow leafybush"
	icon = 'icons/obj/infinity_flora.dmi'
	icon_state = "leafybush_1"

/obj/structure/flora/infinity/leafybush/New()
	if(icon_state == "leafybush_1")
		icon_state = "leafybush_[rand(1, 4)]"
	..()

/obj/structure/flora/infinity/palebush
	name = "snow palebush"
	icon = 'icons/obj/infinity_flora.dmi'
	icon_state = "palebush_1"

/obj/structure/flora/infinity/palebush/New()
	if(icon_state == "palebush_1")
		icon_state = "palebush_[rand(1, 4)]"
	..()

/obj/structure/flora/infinity/stalkybush
	name = "snow stalkybush"
	icon = 'icons/obj/infinity_flora.dmi'
	icon_state = "stalkybush_1"

/obj/structure/flora/infinity/stalkybush/New()
	if(icon_state == "stalkybush_1")
		icon_state = "stalkybush_[rand(1, 4)]"
	..()