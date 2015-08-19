//for vent setting
var/setted = 0
var/work_direction = 1
var/id_tag = null
var/freq = 1439

//vent interaction
if ((istype(W, /obj/item/device/multitool)) && (pipe_type == PIPE_UVENT))
	if(setted)
		setted = 0
		user << "<span class='danger'>You cancelled settings</span>"
		return ..()
	else
		interact(user)
		return ..()

//vent init
var/obj/machinery/atmospherics/components/unary/vent_pump/V = new( src.loc )
if(setted)
	if(id_tag)
		V.id_tag = id_tag
	V.frequency = freq
	V.set_frequency(freq)
	V.internal_pressure_bound = 0
	V.external_pressure_bound = 0
	V.pump_direction = work_direction
	V.construction(dir, pipe_dir, pipe_type, color)