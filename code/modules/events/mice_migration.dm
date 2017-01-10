/datum/round_event_control/mice_migration
	name = "Mice Migration"
	typepath = /datum/round_event/mice_migration
	weight = 10

/datum/round_event/mice_migration
	announceWhen = 0
	var/minimum_mice = 5
	var/maximum_mice = 15

/datum/round_event/mice_migration/announce()
	var/cause = pick("космической зимы", "сокращения бюджета", "Рагнарока",
		"плохой погоды", "\[СЕКРЕТНО\]", "изменения климата",
		"плохой удачи")
	var/plural = pick("несколько", "стая", "парочка", "рой",
		"часть", "не больше [maximum_mice]")
	var/name = pick("грызунов", "мышей", "пищащих существ",
		"млекопитающих, которые жрут провода, ", "\[СЕКРЕТНО\]", "паразитов, жрущих энергию, ")
	var/movement = pick("мигрировали", "лезут", "бегут", "нагрянули")
	var/location = pick("в технические тоннели", "в зоны обслуживания",
		"\[СЕКРЕТНО\]", "в места с вкусными проводами")

	priority_announce("Из-за [cause], [plural] [name] [movement] [location].", "Замечена крупная миграция!",
		'sound/effects/mousesqueek.ogg', 100, 1)

/datum/round_event/mice_migration/start()
	SSsqueak.trigger_migration(rand(minimum_mice, maximum_mice))
