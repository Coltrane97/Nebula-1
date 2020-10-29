/obj/item/dermal_regen
	name = "dermal regenerator"
	desc = "Advanced device capable of regenerating skin tissue, as well as bleedstopping and disinfecting."

	icon = MY_OBJ
	icon_state = "dermal"

	w_class = ITEM_SIZE_SMALL
	obj_flags = OBJ_FLAG_CONDUCTIBLE
	slot_flags = SLOT_LOWER_BODY
	item_flags = ITEM_FLAG_NO_BLUDGEON

	material = /decl/material/solid/metal/steel
	matter = list(/decl/material/solid/metal/steel = MATTER_AMOUNT_REINFORCEMENT)
	origin_tech = "{'magnets':2,'biotech':2}"

	var/power = 2
	var/delay = 5 SECONDS

/obj/item/dermal_regen/attack(var/mob/living/carbon/M, var/mob/user)

	if(user.a_intent != I_HELP) return ..()

	if(icon_state == "dermal-work")
		to_chat(user, SPAN_WARNING("You are already treating someone!"))
		return

	if(!ishuman(M))
		to_chat(user, SPAN_WARNING("\The [src] cannot be used on [M]!"))
		return

	if(!ishuman(user))
		to_chat(user, SPAN_WARNING("You don't have the dexterity to do this!"))
		return

	var/mob/living/carbon/human/H = M
	var/obj/item/organ/external/affecting = H.get_organ(user.zone_sel.selecting)

	if(!affecting)
		to_chat(user, SPAN_WARNING("\The [M] is missing that body part!"))
		return

	if(BP_IS_PROSTHETIC(affecting) || BP_IS_CRYSTAL(affecting))
		to_chat(user, SPAN_WARNING("\The [src] cannot be applied to this type of limb."))
		return

	var/user_skill = user.get_skill_value(SKILL_MEDICAL)

	var/delay_scale = delay/(user_skill/2)
	user.visible_message(SPAN_NOTICE("[user] begins waving with [src] around [H]'s [affecting]."), SPAN_NOTICE("You start waving the [src] around [H]'s [affecting]."))

	icon_state = "dermal-work"

	if(do_mob(user, M, delay_scale))

		if(user_skill == SKILL_NONE && !prob(80))
			to_chat(user, SPAN_WARNING("You fumble with [src], failing heal procedure."))
			playsound(src, 'sound/machines/synth_no.ogg', 25)
			icon_state = initial(icon_state)
			return

		affecting.bandage()

		if(user_skill >= SKILL_BASIC)
			affecting.salve()

		if(user_skill >= SKILL_ADEPT)
			affecting.disinfect()

		affecting.heal_damage(user_skill * power, user_skill * power)
		affecting.update_damages()

		H.update_bandages(1)
		H.updatehealth()
		H.UpdateDamageIcon()

		to_chat(user, SPAN_NOTICE("You successfuly apply the [src] on [H]'s [affecting]."))
		playsound(src, 'sound/machines/synth_yes.ogg', 25)
	else
		to_chat(user, SPAN_WARNING("You should remain still while healing [H]!"))
		playsound(src, 'sound/machines/synth_no.ogg', 25)

	icon_state = initial(icon_state)

/obj/item/storage/firstaid/fleet
	name = "fleet first-aid kit"
	desc = "Contains advanced medical treatments. Be sure to salute after treatment!"

	icon_state = "purplefirstaid"
	item_state = "firstaid-advanced"

	startswith = list(
		/obj/item/scanner/health,
		/obj/item/dermal_regen,
		/obj/item/chems/hypospray/vial,
		/obj/item/chems/glass/bottle/stabilizer,
		/obj/item/chems/glass/bottle/antitoxin,
		/obj/item/storage/pill_bottle/assorted,
		/obj/item/stack/medical/splint
		)
