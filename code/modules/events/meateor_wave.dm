/datum/round_event_control/meteor_wave/meaty
	name = "Meteor Wave: Meaty"
	typepath = /datum/round_event/meteor_wave/meaty
	weight = 0
	max_occurrences = 0

/datum/round_event/meteor_wave/meaty
	wave_name = "meaty"

/datum/round_event/meteor_wave/meaty/announce()
	priority_announce("ћ€сные куски обнаружены пр€мо по курсу станции.", "ќх чЄрт, хватай ведро.",'sound/AI/meteors.ogg')
