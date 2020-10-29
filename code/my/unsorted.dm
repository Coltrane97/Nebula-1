//Unsorted general overrides. I dunno dont want messing with orig files, so i placed it there

//Lore

/world/New()
	game_year = (text2num(time2text(world.realtime, "YYYY")) + 56) //2020 + 56 = 2076
	. = ..()

/*

Space: the final frontier. These are the voyages of the Tradeship Ocelot Alpha. Its.. WAIT WHAT???

OK, theres no lore for now. At least, it'll be written not here.

*/

//Material integrity buff. As i recall, currently it was possible to break STEEL WALL with a TOOLBOX.

/decl/material/solid/glass/New()
	..()
	integrity *= 30

/decl/material/solid/metal/New()
	..()
	integrity *= 40

//No-dismantle ex_act for walls, meteors are still capable to break windows and roof

/turf/simulated/wall/explosion_act(severity)
	SHOULD_CALL_PARENT(FALSE)
	if(severity == 1)
		take_damage(rand(700, 900))
	else if(severity == 2)
		if(prob(75))
			take_damage(rand(150, 250))
		else
			take_damage(rand(500, 700))
	else if(severity == 3)
		take_damage(rand(0, 250))

//Wall Colors

/turf/simulated/wall
	paint_color = COLOR_WALL_GUNMETAL

/obj/structure/wall_frame
	paint_color = COLOR_WALL_GUNMETAL

/turf/simulated/wall/r_wall/hull/Initialize()
	. = ..()
	paint_color = COLOR_HULL
	update_icon()

//I DONT LIKE THIS

/mob/DblClickOn(var/atom/A, var/params)
	return

//Gun selfcharge, its just needed there

/obj/item/gun/energy/New()
	self_recharge = 1
	recharge_time = 1
	..()

//I am engineer. I can identify wires. That's a shame if i can't.

/datum/wire_description/New()
	..()
	skill_level = SKILL_ADEPT

//Annoying delay

/obj/machinery/power/shield_generator
	spinup_delay = 0

//can_holster was null

/obj/item/clothing/accessory/storage/holster
	can_holster = list(/obj/item/gun)

//MAP OVERRIDES

/area/ship/trade/drunk_tank/New()
	name = "Brig"
	..()

/area/ship/trade/shieldbay/New()
	name = "Secure Storage"
	..()

/datum/map/tradeship/New()
	welcome_sound = 'sound/machines/signal.ogg'
	default_starting_cash_choice = /decl/starting_cash_choice

	name = "Ocelot"
	full_name = "SFV Ocelot"

	station_short = "Ocelot"
	station_name  = "SFV Ocelot"

	dock_name     = "SFS Long-Island"

	company_name  = "Spacefleet Command"
	company_short = "SF"

	boss_name     = "Spacefleet Admiral"
	boss_short    = "Admiral"

	lobby_screens = list('icons/my/lobby.png')
	..()

/obj/effect/overmap/visitable/ship/tradeship/New()
	name = "SFV Ocelot"
	vessel_mass = 2400
	..()

//solark

/client/verb/stop_all_sounds()
	set name = "Stop All Sounds"
	set desc = "Stop all sounds that are currently playing."
	set category = "OOC"

	if(!mob) return
	sound_to(mob, sound(null))

/world/New()
	department_radio_keys = list(
	  ":r" = "right ear",	".r" = "right ear",
	  ":l" = "left ear",	".l" = "left ear",
	  ":i" = "intercom",	".i" = "intercom",
	  ":h" = "department",	".h" = "department",
	  ":+" = "special",		".+" = "special", //activate radio-specific special functions
	  ":c" = "Command",		".c" = "Command",
	  ":n" = "Science",		".n" = "Science",
	  ":m" = "Medical",		".m" = "Medical",
	  ":e" = "Engineering", ".e" = "Engineering",
	  ":s" = "Security",	".s" = "Security",
	  ":w" = "whisper",		".w" = "whisper",
	  ":t" = "Mercenary",	".t" = "Mercenary",
	  ":x" = "Raider",		".x" = "Raider",
	  ":u" = "Supply",		".u" = "Supply",
	  ":v" = "Service",		".v" = "Service",
	  ":p" = "AI Private",	".p" = "AI Private",
	  ":z" = "Entertainment",".z" = "Entertainment",
	  ":y" = "Exploration",		".y" = "Exploration",

	  ":R" = "right ear",	".R" = "right ear",
	  ":L" = "left ear",	".L" = "left ear",
	  ":I" = "intercom",	".I" = "intercom",
	  ":H" = "department",	".H" = "department",
	  ":C" = "Command",		".C" = "Command",
	  ":N" = "Science",		".N" = "Science",
	  ":M" = "Medical",		".M" = "Medical",
	  ":E" = "Engineering",	".E" = "Engineering",
	  ":S" = "Security",	".S" = "Security",
	  ":W" = "whisper",		".W" = "whisper",
	  ":T" = "Mercenary",	".T" = "Mercenary",
	  ":X" = "Raider",		".X" = "Raider",
	  ":U" = "Supply",		".U" = "Supply",
	  ":V" = "Service",		".V" = "Service",
	  ":P" = "AI Private",	".P" = "AI Private",
	  ":Z" = "Entertainment",".Z" = "Entertainment",
	  ":Y" = "Exploration",		".Y" = "Exploration",

	  //localized radio keys by ~KareTa
	  ":к" = "right ear",	".к" = "right ear",
	  ":д" = "left ear",	".д" = "left ear",
	  ":ш" = "intercom",	".ш" = "intercom",
	  ":р" = "department",	".р" = "department",
	  ":с" = "Command",		".с" = "Command",
	  ":т" = "Science",		".т" = "Science",
	  ":ь" = "Medical",		".ь" = "Medical",
	  ":у" = "Engineering",	".у" = "Engineering",
	  ":ы" = "Security",	".ы" = "Security",
	  ":ц" = "whisper",		".ц" = "whisper",
	  ":е" = "Mercenary",	".е" = "Mercenary",
	  ":г" = "Supply",		".г" = "Supply",
	  ":м" = "Service",		".м" = "Service",
	  ":з" = "AI Private",	".з" = "AI Private",
	  ":я" = "Entertainment",".я" = "Entertainment",
	  ":н" = "Exploration",		".н" = "Exploration",

	  ":К" = "right ear",	".К" = "right ear",
	  ":Д" = "left ear",	".Д" = "left ear",
	  ":Ш" = "intercom",	".Ш" = "intercom",
	  ":Р" = "department",	".Р" = "department",
	  ":С" = "Command",		".С" = "Command",
	  ":Т" = "Science",		".Т" = "Science",
	  ":Ь" = "Medical",		".Ь" = "Medical",
	  ":У" = "Engineering",	".У" = "Engineering",
	  ":Ы" = "Security",	".Ы" = "Security",
	  ":Ц" = "whisper",		".Ц" = "whisper",
	  ":Е" = "Mercenary",	".Е" = "Mercenary",
	  ":Г" = "Supply",		".Г" = "Supply",
	  ":М" = "Service",		".М" = "Service",
	  ":З" = "AI Private",	".З" = "AI Private",
	  ":Я" = "Entertainment",".Я" = "Entertainment",
	  ":Н" = "Exploration",		".Н" = "Exploration")
	..()

//Cycler fix

/obj/machinery/suit_cycler/try_move_inside(var/mob/living/target, var/mob/living/user)
	if(!istype(target) || !istype(user) || !target.Adjacent(user) || !user.Adjacent(src) || user.incapacitated())
		return FALSE

	if(locked)
		to_chat(user, SPAN_WARNING("The suit cycler is locked."))
		return FALSE

	if(suit || helmet || boots)
		to_chat(user, SPAN_WARNING("There is no room inside the cycler for \the [target]."))
		return FALSE

	visible_message(SPAN_WARNING("\The [user] starts putting \the [target] into the suit cycler."))
	if(do_after(user, 20, src))
		if(!istype(target) || locked || suit || helmet || !target.Adjacent(user) || !user.Adjacent(src) || user.incapacitated())
			return FALSE
		target.forceMove(src)
		occupant = target
		add_fingerprint(user)
		update_icon()
		return TRUE
	return FALSE

/obj/machinery/suit_cycler/eject_occupant(mob/user)
	if(locked || active)
		to_chat(user, SPAN_WARNING("The cycler is locked."))
		return

	if(!occupant)
		return

	occupant.reset_view()
	occupant.dropInto(loc)
	occupant = null

	add_fingerprint(user)
	updateUsrDialog()
	update_icon()

//locblurb fix

show_location_blurb(client/C, duration)
	set waitfor = 0

	if(!C) return //fixed

	var/style = "font-family: 'Fixedsys'; -dm-text-outline: 1 black; font-size: 11px;"
	var/area/A = get_area(C.mob)
	var/text = "[stationdate2text()], [stationtime2text()]\n[station_name()], [A.name]"
	text = uppertext(text)

	var/obj/effect/overlay/T = new()
	T.maptext_height = 64
	T.maptext_width = 512
	T.layer = FLOAT_LAYER
	T.plane = HUD_PLANE
	T.appearance_flags = APPEARANCE_UI_IGNORE_ALPHA
	T.screen_loc = "LEFT+1,BOTTOM+2"

	C.screen += T
	animate(T, alpha = 255, time = 10)
	for(var/i = 1 to length(text)+1)
		T.maptext = "<span style=\"[style]\">[copytext(text,1,i)] </span>"
		sleep(1)

	addtimer(CALLBACK(GLOBAL_PROC, .proc/fade_location_blurb, C, T), duration)

/mob/living/carbon/human/handle_message_mode(message_mode, message, verb, speaking, used_radios, alt_name)
	switch(message_mode)
		if("intercom")
			if(!src.restrained())
				for(var/obj/item/radio/intercom/I in view(1))
					I.talk_into(src, message, null, verb, speaking)
					I.add_fingerprint(src)
					used_radios += I

		if("headset")
			if(l_ear && istype(l_ear,/obj/item/radio))
				var/obj/item/radio/R = l_ear
				R.talk_into(src,message,null,verb,speaking)
				used_radios += l_ear
			else if(r_ear && istype(r_ear,/obj/item/radio))
				var/obj/item/radio/R = r_ear
				R.talk_into(src,message,null,verb,speaking)
				used_radios += r_ear

			else if(l_store && istype(l_store,/obj/item/radio))
				var/obj/item/radio/R = l_store
				R.talk_into(src,message,null,verb,speaking)
				used_radios += l_store
			else if(r_store && istype(r_store,/obj/item/radio))
				var/obj/item/radio/R = r_store
				R.talk_into(src,message,null,verb,speaking)
				used_radios += r_store

		if("right ear")
			var/obj/item/radio/R
			var/has_radio = 0
			if(r_ear && istype(r_ear,/obj/item/radio))
				R = r_ear
				has_radio = 1
			var/datum/inventory_slot/inv_slot = LAZYACCESS(held_item_slots, BP_R_HAND)
			if(istype(inv_slot?.holding, /obj/item/radio))
				R = inv_slot.holding
				has_radio = 1
			if(has_radio)
				R.talk_into(src,message,null,verb,speaking)
				used_radios += R

		if("left ear")
			var/obj/item/radio/R
			var/has_radio = 0
			if(l_ear && istype(l_ear,/obj/item/radio))
				R = l_ear
				has_radio = 1
			var/datum/inventory_slot/inv_slot = LAZYACCESS(held_item_slots, BP_L_HAND)
			if(istype(inv_slot?.holding, /obj/item/radio))
				R = inv_slot.holding
				has_radio = 1
			if(has_radio)
				R.talk_into(src,message,null,verb,speaking)
				used_radios += R

		if("whisper") //It's going to get sanitized again immediately, so decode.
			whisper_say(html_decode(message), speaking, alt_name)
			return 1

		else
			if(message_mode)
				if(l_ear && istype(l_ear,/obj/item/radio))
					l_ear.talk_into(src,message, message_mode, verb, speaking)
					used_radios += l_ear
				else if(r_ear && istype(r_ear,/obj/item/radio))
					r_ear.talk_into(src,message, message_mode, verb, speaking)
					used_radios += r_ear