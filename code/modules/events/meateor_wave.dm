/datum/round_event_control/meteor_wave/meaty
	name = "Meteor Wave: Meaty"
	typepath = /datum/round_event/meteor_wave/meaty
	weight = 0
	max_occurrences = 0

/datum/round_event/meteor_wave/meaty
	wave_name = "meaty"

/datum/round_event/meteor_wave/meaty/announce()
	priority_announce("ћясные куски обнаружены прямо по курсу станции.", "ќх чЄрт, ’ватай ¬едро.",'sound/AI/meteors.ogg')
