//Airwalking

/mob/living/carbon/human/can_fall(var/anchor_bypass = FALSE, var/turf/location_override = loc)
	if(stat || incapacitated() || restrained() || !skill_check(SKILL_MINDCAST,SKILL_ADEPT))
		return ..()
	return FALSE