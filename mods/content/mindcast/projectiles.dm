//Bullet dodging, help intent prevents it.

//Experienced = being able to dodge

/mob/living/carbon/human/bullet_act(var/obj/item/projectile/P, var/def_zone)
	if(!skill_check(SKILL_MINDCAST,SKILL_EXPERT) || a_intent == I_HELP || stat || incapacitated() || restrained() || get_dist(P.starting,get_turf(src)) <= 1)
		return ..()

	if(prob(50))
		pixel_x = rand(4,16)
	else
		pixel_y = rand(4,16)
	animate(src,pixel_x = 0, pixel_y = 0, time = 5, easing = ELASTIC_EASING)
	playsound(src,'sound/magic/repulse.ogg',80)
	return PROJECTILE_FORCE_MISS