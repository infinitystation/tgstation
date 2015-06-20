/datum/wires/bardispenser
	holder_type = /obj/machinery/chem_dispenser/bartender
	wire_count = 4

var/const/BARTENDER_WIRE_IDSCAN = 1
var/const/BARTENDER_WIRE_EXTRA_REAGENTS = 2
var/const/BARTENDER_WIRE_SHOCK = 4

/datum/wires/bardispenser/GetInteractWindow()
	var/obj/machinery/chem_dispenser/bartender/V = holder
	. += ..()
	. += "<BR>The red light is [V.seconds_electrified ? "on" : "off"].<BR>"
	. += "The orange light is [V.hidden_mode_flag ? "on" : "off"].<BR>"
	. += "A [V.id_scan ? "blue" : "cyan"] light is on.<BR>"


/datum/wires/bardispenser/UpdatePulsed(var/index)
	var/obj/machinery/chem_dispenser/bartender/V = holder
	switch(index)
		if(BARTENDER_WIRE_IDSCAN)
			V.id_scan = !V.id_scan
		if(BARTENDER_WIRE_EXTRA_REAGENTS)
			if(V.hidden_mode_flag)
				V.hidden_mode_flag = 0
				V.dispensable_reagents = sortList(V.default_reagents)
			else
				V.hidden_mode_flag = 1
				V.dispensable_reagents = sortList(V.dispensable_reagents | V.hidden_mode_reagents)
		if(BARTENDER_WIRE_SHOCK)
			V.seconds_electrified = 30

/datum/wires/bardispenser/UpdateCut(var/index, var/mended)
	var/obj/machinery/chem_dispenser/bartender/V = holder
	switch(index)
		if(BARTENDER_WIRE_IDSCAN)
			V.id_scan = 1
		if(BARTENDER_WIRE_SHOCK)
			if(mended)
				V.seconds_electrified = 0
			else
				V.seconds_electrified = -1

/datum/wires/bardispenser/SolveWireFunction(var/function)
	var/sf = ""
	switch(function)
		if(BARTENDER_WIRE_IDSCAN)
			sf = "Port A"
		if(BARTENDER_WIRE_EXTRA_REAGENTS)
			sf = "Port B"
		if(BARTENDER_WIRE_SHOCK)
			sf = "Port C"

	return sf