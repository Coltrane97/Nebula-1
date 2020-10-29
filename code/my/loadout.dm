//Weapons selection

/datum/gear/weapons
	sort_category = "Weaponry"
	category = /datum/gear/weapons

/* /datum/gear/weapons/crude
	display_name = "capacitor pistol"
	path = /obj/item/gun/energy/capacitor */

/datum/map/tradeship
	loadout_blacklist = list(/datum/gear/utility/guns)

/datum/gear/weapons/small
	display_name = "small energy pistol"
	path = /obj/item/gun/energy/gun/small
	cost = 2

/datum/gear/weapons/standard
	display_name = "energy pistol"
	path = /obj/item/gun/energy/gun
	cost = 3

/datum/gear/weapons/advanced
	display_name = "laser carbine"
	path = /obj/item/gun/energy/laser
	cost = 6

//Misc. weaponry

/datum/gear/weapons/flash
	display_name = "flash"
	path = /obj/item/flash

//Armor selection

/datum/gear/tactical/armor
	display_name = "plate carrier selection"
	path = /obj/item/clothing/suit/armor/pcarrier
	slot = slot_wear_suit_str

/datum/gear/tactical/armor/New()
	..()
	var/arms = list()
	arms["plate carrier"] = /obj/item/clothing/suit/armor/pcarrier
	arms["riot armor"] = /obj/item/clothing/suit/armor/riot
	arms["ballistic armor"] = /obj/item/clothing/suit/armor/bulletproof

	gear_tweaks += new/datum/gear_tweak/path(arms)

//Helmet

/datum/gear/tactical/helmet
	display_name = "helmet selection"
	path = /obj/item/clothing/head/helmet
	slot = slot_head_str

/datum/gear/tactical/helmet/New()
	..()
	var/helms = list()
	helms["helmet"] = /obj/item/clothing/head/helmet
	helms["riot helmet"] = /obj/item/clothing/head/helmet/riot
	helms["ballistic helmet"] = /obj/item/clothing/head/helmet/ballistic

	gear_tweaks += new/datum/gear_tweak/path(helms)

//Mask

/datum/gear/tactical/mask
	display_name = "gas mask selection"
	path = /obj/item/clothing/mask/gas
	slot = slot_wear_mask_str

/datum/gear/tactical/mask/New()
	..()
	var/masks = list()
	masks["full mask"] = /obj/item/clothing/mask/gas
	masks["half mask"] = /obj/item/clothing/mask/gas/half
	masks["tactical mask"] = /obj/item/clothing/mask/gas/syndicate

	gear_tweaks += new/datum/gear_tweak/path(masks)

//Armguards

/datum/gear/tactical/armguards
	display_name = "arm guards"
	path = /obj/item/clothing/accessory/armguards

/datum/gear/tactical/legguards
	display_name = "leg guards"
	path = /obj/item/clothing/accessory/legguards

//Plate selection

/datum/gear/tactical/armor_plate
	display_name = "armor plate selection (plate carrier)"
	path = /obj/item/clothing/accessory/armorplate

/datum/gear/tactical/armor_plate/New()
	..()
	var/plates = list()
	plates["light armor plate"] = /obj/item/clothing/accessory/armorplate
	plates["medium armor plate"] = /obj/item/clothing/accessory/armorplate/medium
	plates["heavy armor plate"] = /obj/item/clothing/accessory/armorplate/merc

	gear_tweaks += new/datum/gear_tweak/path(plates)

//Utility

/obj/item/storage/belt/utility/fullbl/New()
	..()
	new /obj/item/screwdriver(src)
	new /obj/item/wrench(src)
	new /obj/item/weldingtool(src)
	new /obj/item/crowbar(src)
	new /obj/item/wirecutters(src)
	new /obj/item/stack/cable_coil/random(src, 30)
	new /obj/item/multitool(src)
	update_icon()

/datum/gear/utility/belt
	display_name = "full toolbelt"
	path = /obj/item/storage/belt/utility/fullbl
	slot = slot_belt_str

//Holster cost

/datum/gear/tactical/holster
	cost = 1