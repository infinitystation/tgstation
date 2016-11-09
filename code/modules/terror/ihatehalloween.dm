//UNDER

/obj/item/clothing/under/halloween
	name = "Fake"
	desc = "Fake hallowen's dress."
	icon_state = "black_tango"
	item_state = "wcoat"
	item_color = "black_tango"
	armor = list(melee = 0, bullet = 0, laser = 0,energy = 0, bomb = 0, bio = 0, rad = 0)

/obj/item/clothing/under/halloween/prisoner
	name = "prison jumpsuit"
	desc = "It's standardised Nanotrasen prisoner-wear. Its suit sensors are stuck in the \"Fully On\" position. IT'S A FAKE!"
	icon_state = "prisoner"
	item_state = "o_suit"
	item_color = "prisoner"

/obj/item/clothing/under/halloween/syndicate
	name = "tacticool turtleneck"
	desc = "Just looking at it makes you want to buy an SKS, go into the woods, and -operate-. IT'S A FAKE!"
	icon_state = "tactifool"
	item_state = "bl_suit"
	item_color = "tactifool"
	alt_covers_chest = 1

/obj/item/clothing/under/halloween/camo
	name = "camouflage fatigues"
	desc = "A green military camouflage uniform. IT'S A FAKE!"
	icon_state = "camogreen"
	item_state = "g_suit"
	item_color = "camogreen"
	alt_covers_chest = 1

/obj/item/clothing/under/halloween/jester
	name = "jester suit"
	desc = "A jolly dress, well suited to entertain your master, nuncle. IT'S A FAKE!"
	icon_state = "jester"
	item_color = "jester"
	can_adjust = 0


/obj/item/clothing/under/halloween/soviet
	name = "soviet uniform"
	desc = "For the Motherland! IT'S A FAKE!"
	icon_state = "soviet"
	item_state = "soviet"
	item_color = "soviet"
	can_adjust = 0

//SHOES

/obj/item/clothing/shoes/halloween
	name = "Fake"
	desc = "Just a fake pair of black shoes."
	icon_state = "black"
	item_color = "black"
	armor = list(melee = 0, bullet = 0, laser = 0, energy = 0, bomb = 0, bio = 0, rad = 0, fire = 0, acid = 0)

/obj/item/clothing/shoes/halloween/clockwork
	name = "clockwork treads"
	desc = "Industrial boots made of brass. They're very heavy. IT'S A FAKE!"
	icon = 'icons/obj/clothing/clockwork_garb.dmi'
	icon_state = "clockwork_treads"

/obj/item/clothing/shoes/halloween/combat
	name = "combat boots"
	desc = "High speed, low drag combat boots. IT'S A FAKE!"
	icon_state = "jackboots"
	item_state = "jackboots"

/obj/item/clothing/shoes/halloween/cult
	name = "nar-sian invoker boots"
	desc = "A pair of boots worn by the followers of Nar-Sie. IT'S A FAKE!"
	icon_state = "cult"
	item_state = "cult"
	item_color = "cult"

/obj/item/clothing/shoes/halloween/cult_alt
	name = "cultist boots"
	desc = "A pair of boots worn by the followers of Nar-Sie. IT'S A FAKE!"
	icon_state = "cultalt"
	item_state = "cult"
	item_color = "cult"

/obj/item/clothing/shoes/halloween/space_ninja
	name = "ninja shoes"
	desc = "A pair of running shoes. Excellent for running and even better for smashing skulls. IT'S A FAKE!"
	icon_state = "s-ninja"
	item_state = "secshoes"

//HATS

	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE|HIDEHAIR|HIDEFACIALHAIR

/obj/item/clothing/head/halloween
	name = "bowler-hat"
	desc = "Gentleman, elite aboard! IT'S A FAKE!"
	icon_state = "bowler"
	item_state = "bowler"
	armor = list(melee = 0, bullet = 0, laser = 0, energy = 0, bomb = 0, bio = 0, rad = 0, fire = 0, acid = 0)

/obj/item/clothing/head/halloween/red_wizard
	name = "red wizard hat"
	desc = "Strange-looking red hat-wear that most certainly belongs to a real magic user. IT'S A FAKE!"
	icon_state = "redwizard"

/obj/item/clothing/head/halloween/yellow
	name = "yellow wizard hat"
	desc = "Strange-looking yellow hat-wear that most certainly belongs to a powerful magic user. IT'S A FAKE!"
	icon_state = "yellowwizard"

/obj/item/clothing/head/halloween/marisa
	name = "witch hat"
	desc = "Strange-looking hat-wear. Makes you want to cast fireballs. IT'S A FAKE!"
	icon_state = "marisa"

/obj/item/clothing/head/halloween/black
	name = "black wizard hat"
	desc = "Strange-looking black hat-wear that most certainly belongs to a real skeleton. Spooky. IT'S A FAKE!"
	icon_state = "blackwizard"

/obj/item/clothing/head/halloween/clockwork
	name = "clockwork helmet"
	desc = "A heavy helmet made of brass. IT'S A FAKE!"
	icon = 'icons/obj/clothing/clockwork_garb.dmi'
	icon_state = "clockwork_helmet"
	flags_inv = HIDEEARS

/obj/item/clothing/head/halloween/syndicate
	name = "red space helmet"
	desc = "Top secret spess helmet."
	icon_state = "syndicate"
	item_state = "syndicate"
	desc = "Has a tag: Totally not property of an enemy corporation, honest. IT'S A FAKE!"
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE|HIDEHAIR|HIDEFACIALHAIR

/obj/item/clothing/head/halloween/xenos
	name = "xenos helmet"
	icon_state = "xenos"
	item_state = "xenos_helm"
	desc = "A helmet made out of chitinous alien hide. IT'S A FAKE!"
	flags_cover = HEADCOVERSEYES
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE|HIDEHAIR|HIDEFACIALHAIR

/obj/item/clothing/head/halloween/culthood
	name = "ancient cultist hood"
	icon_state = "culthood"
	item_state = "culthood"
	desc = "A torn, dust-caked hood. Strange letters line the inside. IT'S A FAKE!"
	flags_inv = HIDEFACE|HIDEHAIR|HIDEEARS

/obj/item/clothing/head/halloween/culthood_alt
	name = "cultist hood"
	desc = "An armored hood worn by the followers of Nar-Sie. IT'S A FAKE!"
	icon_state = "cult_hoodalt"
	item_state = "cult_hoodalt"
	flags_inv = HIDEFACE|HIDEHAIR|HIDEEARS

/obj/item/clothing/head/halloween/space_ninja
	desc = "What may appear to be a simple black garment is in fact a highly sophisticated nano-weave helmet. Standard issue ninja gear. IT'S A FAKE!"
	name = "ninja hood"
	icon_state = "s-ninja"
	item_state = "s-ninja_mask"
	flags_inv = HIDEEARS|HIDEHAIR|HIDEFACIALHAIR

/obj/item/clothing/head/halloween/magus
	name = "magus helm"
	icon_state = "magus"
	item_state = "magus"
	desc = "A helm worn by the followers of Nar-Sie. IT'S A FAKE!"
	flags_inv = HIDEFACE|HIDEHAIR|HIDEFACIALHAIR|HIDEEARS|HIDEEYES
	flags_cover = HEADCOVERSEYES | HEADCOVERSMOUTH

/obj/item/clothing/head/halloween/skulltop
	name = "skulltop"
	desc = "A skulltop, best device for surfing in internet. IT'S A FAKE!"
	worn_icon = 'icons/mob/infinity_work.dmi'
	icon = 'icons/obj/clothing/infinity_work.dmi'
	icon_state = "skulltop"
	item_state = "skulltop"
	flags_inv = HIDEHAIR|HIDEEARS|HIDEEYES
	flags_cover = HEADCOVERSEYES

/obj/item/clothing/head/halloween/pirate
	name = "pirate hat"
	desc = "Yarr. IT'S A FAKE!"
	icon_state = "pirate"
	item_state = "pirate"

/obj/item/clothing/head/halloween/pirate_captain
	name = "pirate captain hat"
	desc = "Yarr. IT'S A FAKE!"
	icon_state = "hgpiratecap"
	item_state = "hgpiratecap"

/obj/item/clothing/head/halloween/jester
	name = "jester hat"
	desc = "A hat with bells, to add some merryness to the suit. IT'S A FAKE!"
	icon_state = "jester_hat"

/obj/item/clothing/head/halloween/pumpkinhead
	name = "carved pumpkin"
	desc = "A jack o' lantern! Believed to ward off evil spirits. IT'S A FAKE!"
	icon_state = "hardhat0_pumpkin"
	item_state = "hardhat0_pumpkin"
	item_color = "pumpkin"
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE|HIDEHAIR|HIDEFACIALHAIR
	flags_cover = HEADCOVERSEYES

/obj/item/clothing/head/halloween/ushanka
	name = "ushanka"
	desc = "Perfect for winter in Siberia, da? IT'S A FAKE!"
	icon_state = "ushankadown"
	item_state = "ushankadown"
	flags_inv = HIDEEARS|HIDEHAIR

/obj/item/clothing/head/halloween/papersack
	name = "paper sack hat"
	desc = "A paper sack with crude holes cut out for eyes. Useful for hiding one's identity or ugliness. IT'S A FAKE!"
	icon_state = "papersack"
	flags_inv = HIDEHAIR|HIDEFACE|HIDEEARS|HIDEEYES|HIDEFACIALHAIR

/obj/item/clothing/head/halloween/lizard
	name = "lizardskin cloche hat"
	desc = "How many lizards died to make this hat? Not enough. IT'S A FAKE!"
	icon_state = "lizard"

//SUIT

/obj/item/clothing/suit/halloween
	name = "gamer shirt"
	desc = "A baggy shirt with vintage game character Phanic the Weasel. Why would anyone wear this? IT'S A FAKE!"
	icon_state = "nerdshirt"
	item_state = "nerdshirt"
	armor = list(melee = 0, bullet = 0, laser = 0, energy = 0, bomb = 0, bio = 0, rad = 0, fire = 0, acid = 0)

/obj/item/clothing/suit/hooded/halloween
	name = "winter coat"
	desc = "A heavy jacket made from 'synthetic' animal furs.IT'S A FAKE!"
	icon_state = "coatwinter"
	hooded = 1

/obj/item/clothing/head/hooded/halloween
	name = "winter hood"
	desc = "A hood attached to a heavy winter jacket.  IT'S A FAKE!"
	icon_state = "winterhood"
	body_parts_covered = HEAD
	flags = NODROP
	flags_inv = HIDEHAIR|HIDEEARS

/obj/item/clothing/suit/hooded/halloween/bloated_human
	name = "bloated human suit"
	desc = "A horribly bloated suit made from human skins. IT'S A FAKE!"
	icon_state = "lingspacesuit"
	item_state = "labcoat"
	body_parts_covered = CHEST|GROIN|LEGS|ARMS|HANDS
	flags_inv = HIDEGLOVES|HIDESHOES|HIDEJUMPSUIT
	actions_types = list(/datum/action/item_action/toggle_human_head)
	hoodtype = /obj/item/clothing/head/halloween/human_head

/obj/item/clothing/head/halloween/human_head
	name = "bloated human head"
	desc = "A horribly bloated and mismatched human head. IT'S A FAKE!"
	icon_state = "lingspacehelmet"
	flags = NODROP
	flags_cover = HEADCOVERSEYES
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE|HIDEHAIR|HIDEFACIALHAIR

/obj/item/clothing/suit/halloween/black
	name = "black wizard robe"
	desc = "An unnerving black gem-lined robe that reeks of death and decay. IT'S A FAKE!"
	icon_state = "blackwizard"
	item_state = "blackwizrobe"
	body_parts_covered = CHEST|GROIN|LEGS|ARMS
	flags_inv = HIDEJUMPSUIT

/obj/item/clothing/suit/halloween/magusblue
	name = "Blue Magus robe"
	desc = "A set of armored robes that seem to radiate a dark power. IT'S A FAKE!"
	icon_state = "magusblue"
	item_state = "magusblue"
	flags_inv = HIDEJUMPSUIT

/obj/item/clothing/suit/halloween/magusred
	name = "Red Magus robe"
	desc = "A set of armored robes that seem to radiate a dark power. IT'S A FAKE!"
	icon_state = "magusred"
	item_state = "magusred"
	body_parts_covered = CHEST|GROIN|LEGS|ARMS
	flags_inv = HIDEJUMPSUIT

/obj/item/clothing/suit/halloween/marisa
	name = "witch robe"
	desc = "Magic is all about the spell power, ZE! IT'S A FAKE!"
	icon_state = "marisa"
	item_state = "marisarobe"
	body_parts_covered = CHEST|GROIN|LEGS|ARMS
	flags_inv = HIDEJUMPSUIT

/obj/item/clothing/suit/halloween/red
	name = "red wizard robe"
	desc = "A magnificent red gem-lined robe that seems to radiate power. IT'S A FAKE!"
	icon_state = "redwizard"
	item_state = "redwizrobe"
	body_parts_covered = CHEST|GROIN|LEGS|ARMS
	flags_inv = HIDEJUMPSUIT

/obj/item/clothing/suit/halloween/yellow
	name = "yellow wizard robe"
	desc = "A magnificant yellow gem-lined robe that seems to radiate power. IT'S A FAKE!"
	icon_state = "yellowwizard"
	item_state = "yellowwizrobe"
	body_parts_covered = CHEST|GROIN|LEGS|ARMS
	flags_inv = HIDEJUMPSUIT

/obj/item/clothing/suit/halloween/clockwork
	name = "clockwork cuirass"
	desc = "A bulky cuirass made of brass. IT'S A FAKE!"
	icon = 'icons/obj/clothing/clockwork_garb.dmi'
	icon_state = "clockwork_cuirass"
	icon_state = "clockwork_cuirass"
	body_parts_covered = CHEST|GROIN|LEGS
	w_class = 3

/obj/item/clothing/suit/halloween/syndicate
	name = "red space suit"
	icon_state = "syndicate"
	item_state = "space_suit_syndicate"
	desc = "Has a tag on it: Totally not property of of a hostile corporation, honest! IT'S A FAKE!"
	w_class = 3
	body_parts_covered = CHEST|GROIN|LEGS|ARMS|HANDS
	flags_inv = HIDEGLOVES|HIDESHOES|HIDEJUMPSUIT

/obj/item/clothing/suit/halloween/xenos
	name = "xenos suit"
	desc = "A suit made out of chitinous alien hide. IT'S A FAKE!"
	icon_state = "xenos"
	item_state = "xenos_helm"
	body_parts_covered = CHEST|GROIN|LEGS|ARMS|HANDS
	flags_inv = HIDEGLOVES|HIDESHOES|HIDEJUMPSUIT

/obj/item/clothing/suit/halloween/cultrobes
	name = "ancient cultist robes"
	desc = "A ragged, dusty set of robes. Strange letters line the inside. IT'S A FAKE!"
	icon_state = "cultrobes"
	item_state = "cultrobes"
	body_parts_covered = CHEST|GROIN|LEGS|ARMS
	flags_inv = HIDEJUMPSUIT

/obj/item/clothing/head/halloween/culthood_alt
	name = "cultist hood"
	desc = "An armored hood worn by the followers of Nar-Sie. IT'S A FAKE!"
	icon_state = "cult_hoodalt"
	item_state = "cult_hoodalt"
	flags_inv = HIDEEARS|HIDEHAIR

/obj/item/clothing/suit/halloween/space_ninja
	name = "ninja suit"
	desc = "A unique, vaccum-proof suit of nano-enhanced armor designed specifically for Spider Clan assassins. IT'S A FAKE!"
	icon_state = "s-ninja"
	item_state = "s-ninja_suit"
	body_parts_covered = CHEST|GROIN|LEGS|ARMS|HANDS
	flags_inv = HIDEGLOVES|HIDESHOES|HIDEJUMPSUIT

/obj/item/clothing/suit/hooded/halloween/cult
	name = "nar-sien hardened armor"
	icon_state = "cult_armor"
	item_state = "cult_armor"
	desc = "A heavily-armored exosuit worn by warriors of the Nar-Sien cult. It can withstand hard vacuum.IT'S A FAKE!"
	w_class = 3
	hoodtype = /obj/item/clothing/head/hooded/halloween/cult
	body_parts_covered = CHEST|GROIN|LEGS|ARMS|HANDS
	flags_inv = HIDEGLOVES|HIDESHOES|HIDEJUMPSUIT

/obj/item/clothing/head/hooded/halloween/cult
	name = "nar-sien hardened helmet"
	desc = "A heavily-armored helmet worn by warriors of the Nar-Sien cult. It can withstand hard vacuum.IT'S A FAKE!"
	icon_state = "cult_helmet"
	item_state = "cult_helmet"
	flags = NODROP
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE|HIDEHAIR|HIDEFACIALHAIR

//Hallowen's vending machines//

///obj/machinery/vending/halloween
//	name = "Spooky Under-Vender!"
//	desc = "Праздничный набор одежды плохих парней, что наши уважаемые оперативники Нанотрайзен содрали с тел поверженных врагов."
//	product_slogans = "Кредиты или жизнь!;Переходи на тёмную сторону!;Бууу!;Не верьте описанию - у нас самаЯ настоЯщаЯ одежда! Почти;Они убили Джонни!;Забирай, не зевай!;Грахаха!;А вы знаете, что этот призрак настоЯщий?;Terror's corporate не одобрЯет наш автомат!"
//	product_ads = "Это последнее, что ты возьмешь в эту ночь...;А эту шмотку мы откопали на кладбище.;Будет сидеть как на мертвеце, когда это увидет охрана!;Это защитит твои мозги...;Прошлый владелец любил эту вещь - даже умер в ней!;Помни - антагонисты где-то рЯдом!;А ведь когда-то, мы продавали сигареты!;...И вы выиграли ещё одну бесполезную шмотку!;Наши шапки отгонЯют оборотней!;"
//	vend_delay = 20
//	icon = 'icons/obj/infinity_object.dmi'
//	icon_state = "halloween"
//	icon_deny = "halloween"
//	products = list(/obj/item/clothing/under/halloween/prisoner = 13,
//					/obj/item/clothing/under/halloween/syndicate = 5,
//					/obj/item/clothing/under/halloween/camo = 6,
//					/obj/item/clothing/under/halloween/jester = 3,
//					/obj/item/clothing/under/halloween/soviet = 12)
//	refill_canister = /obj/item/weapon/vending_refill/cigarette
//
///obj/machinery/vending/halloween/shoes
//	name = "Spooky Shoes-Vender!"
//	products = list(/obj/item/clothing/shoes/halloween/clockwork = 5,
//					/obj/item/clothing/shoes/halloween/combat = 5,
//					/obj/item/clothing/shoes/halloween/cult = 5,
//					/obj/item/clothing/shoes/halloween/cult_alt = 4,
//					/obj/item/clothing/shoes/halloween/space_ninja = 6)
//
///obj/machinery/vending/halloween/hats
//	name = "Spooky Hat-Vender!"
//	products = list(/obj/item/clothing/head/halloween/red_wizard = 4,
//					/obj/item/clothing/head/halloween/yellow = 4,
//					/obj/item/clothing/head/halloween/marisa = 3,
//					/obj/item/clothing/head/halloween/black = 4,
//					/obj/item/clothing/head/halloween/magus = 7,
//					/obj/item/clothing/head/halloween/clockwork = 5,
//					/obj/item/clothing/head/halloween/syndicate = 5,
//					/obj/item/clothing/head/halloween/xenos = 12,
//					/obj/item/clothing/head/halloween/culthood = 5,
//					/obj/item/clothing/head/halloween/culthood_alt = 4,
//					/obj/item/clothing/head/halloween/space_ninja = 6,
//					/obj/item/clothing/head/halloween/skulltop = 4,
//					/obj/item/clothing/head/halloween/pirate = 17,
//					/obj/item/clothing/head/halloween/pirate_captain = 3,
//					/obj/item/clothing/head/halloween/jester = 3,
//					/obj/item/clothing/head/halloween/pumpkinhead = 10,
//					/obj/item/clothing/head/halloween/ushanka = 12,
//					/obj/item/clothing/head/halloween/papersack = 10,
//					/obj/item/clothing/head/halloween/lizard = 3)
//
///obj/machinery/vending/halloween/suit
//	name = "Spooky Suit-Vender!"
//	products = list(/obj/item/clothing/suit/hooded/halloween/bloated_human = 4,
//					/obj/item/clothing/suit/halloween/black = 4,
//					/obj/item/clothing/suit/halloween/marisa = 3,
//					/obj/item/clothing/suit/halloween/red = 4,
//					/obj/item/clothing/suit/halloween/yellow = 4,
//					/obj/item/clothing/suit/halloween/magusblue = 5,
//					/obj/item/clothing/suit/halloween/magusred = 5,
//					/obj/item/clothing/suit/halloween/clockwork = 5,
//					/obj/item/clothing/suit/halloween/syndicate = 5,
//					/obj/item/clothing/suit/halloween/xenos = 12,
//					/obj/item/clothing/suit/halloween/cultrobes = 5,
//					/obj/item/clothing/suit/halloween/space_ninja = 6,
//					/obj/item/clothing/suit/hooded/halloween/cult = 5)