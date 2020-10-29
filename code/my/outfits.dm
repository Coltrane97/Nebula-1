/decl/hierarchy/outfit/job/fleet
	name = "Fleet Uniform"

	uniform = /obj/item/clothing/under/fleet
	shoes = /obj/item/clothing/shoes/jackboots

	id_type = /obj/item/card/id/network/fleet

	r_pocket = /obj/item/radio/fleet
	l_pocket = /obj/item/modular_computer/pda/fleet

	l_ear = null
	r_ear = null

	pda_type = null

/obj/item/modular_computer/pda/fleet
	name = "fleet PDA"
	desc = "A standard-issue personal data assistant given to all spacefleet crew."
	color = "#292942"

/obj/item/card/id/network/fleet
	name = "fleet identifier"
	icon = 'icons/my/id_new.dmi'
	color = "#292942"
	detail_color = "#ffffff"

/obj/item/storage/box/ids
	startswith = list(/obj/item/card/id/network/fleet = 7)

/obj/item/radio/fleet
	name = "fleet radio"
	color = "#373760"

/obj/item/storage/belt/security/full/New()
	..()
	new /obj/item/handcuffs(src)
	new /obj/item/handcuffs(src)
	new /obj/item/handcuffs(src)
	new /obj/item/baton/loaded(src)
	new /obj/item/flash(src)
	new /obj/item/crowbar(src)
	update_icon()

/decl/hierarchy/outfit/job/fleet/eng
	name = "Engineering Fleet Uniform"
	uniform = /obj/item/clothing/under/fleet/eng
	belt = /obj/item/storage/belt/utility/fullbl

/decl/hierarchy/outfit/job/fleet/med
	name = "Medical Fleet Uniform"
	uniform = /obj/item/clothing/under/fleet/medsci
	belt = /obj/item/scanner/health

/decl/hierarchy/outfit/job/fleet/sci
	name = "Science Fleet Uniform"
	uniform = /obj/item/clothing/under/fleet/medsci
	belt = /obj/item/scanner/reagent/adv

/decl/hierarchy/outfit/job/fleet/sec
	name = "Security Fleet Uniform"
	uniform = /obj/item/clothing/under/fleet/sec
	belt = /obj/item/storage/belt/security/full

	add_access = list(access_security,access_brig,access_armory)

/decl/hierarchy/outfit/job/fleet/com
	name = "Command Fleet Uniform"
	uniform = /obj/item/clothing/under/fleet/com
	belt = /obj/item/clipboard