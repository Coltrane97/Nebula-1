/obj/screen/click_catcher/Click(location, control, params)
	var/mob/living/carbon/human/H = usr
	if(!istype(usr) || !skill_check(SKILL_MINDCAST,SKILL_ADEPT))
		return ..()
	var/list/modifiers = params2list(params)
	if(modifiers["middle"])