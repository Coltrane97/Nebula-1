/datum/species/utility_frame
	siemens_coefficient = 0
	brute_mod = 0.0001 //They're robots
	burn_mod = 0.0001
	strength = STR_VHIGH
	mob_size = MOB_SIZE_LARGE
	bump_flag = HEAVY
	passive_temp_gain = -5
	body_temperature = 273

	stun_mod = 0
	paralysis_mod = 0
	weaken_mod = 0
	flash_mod = 0

	total_health = 400

	speech_sounds = list('sound/machines/twobeep.ogg')
	speech_chance = 80

/obj/screen/bodytemp/Click(var/location, var/control, var/params)
	..()
	if(!ishuman(usr)) return
	var/mob/living/carbon/human/H
	if(usr.bodytemp == src)
		H = usr
	if(istype(H) && H.species.name == "Utility Frame" && H.stat == CONSCIOUS)
		to_chat(usr,SPAN_INFO("Sensors report of chassis temperature: [round(H.bodytemperature,1)]K"))

/obj/item/organ/internal/cell
	servo_cost = 0.1

/obj/item/organ/internal/posibrain/proc/asimify()
	if(!brainmob) return
	var/newlaws = new/datum/ai_laws/asimov
	unshackle()
	shackle(newlaws)

/obj/item/organ/internal/posibrain/Initialize()
	. = ..()
	asimify()