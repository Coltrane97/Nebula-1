#define MY_OBJ 'icons/my/obj.dmi'
#define MY_MOB 'icons/my/onmob.dmi'

/obj/item/clothing/under/fleet
	name = "fleet uniform"
	desc = "Wear your uniform. Respect superior officers. Salute."
	icon = MY_OBJ
	icon_state = "fleet"
	item_icons = list(slot_w_uniform_str = MY_MOB)
	rolled_down = 0

/obj/item/clothing/under/fleet/update_rolldown_status()
	return //idk, it just dont detects icon in file so i muzzle it there

/obj/item/clothing/under/fleet/eng
	name = "engineering fleet uniform"
	desc = "Repair hull breaches. Respect superior officers. Salute."
	icon_state = "fleet_eng"

/obj/item/clothing/under/fleet/medsci
	name = "medsci fleet uniform"
	desc = "Heal broken lungs. Invent laserguns. Salute."
	icon_state = "fleet_medsci"

/obj/item/clothing/under/fleet/sec
	name = "security fleet uniform"
	desc = "Shoot down bad guys. Respect superior officers. Salute."
	icon_state = "fleet_sec"

/obj/item/clothing/under/fleet/com
	name = "command fleet uniform"
	desc = "Say \"make it so\". Respect superior officers. Salute."
	icon_state = "fleet_com"

//Ranks

/obj/item/clothing/accessory/fleet_rank
	name = "fleet ranks"
	desc = "Fleet rank. This denotes an Officer - it has one star."
	icon = MY_OBJ
	accessory_icons = list(slot_w_uniform_str = MY_MOB, slot_wear_suit_str = MY_MOB)

	icon_state = "rank0"

	slot = ACCESSORY_SLOT_INSIGNIA
	high_visibility = 1

/obj/item/clothing/accessory/fleet_rank/senior
	name = "senior fleet ranks"
	desc = "Fleet rank. This denotes an Senior Officer - it has two stars."
	icon_state = "rank1"

/obj/item/clothing/accessory/fleet_rank/comm
	name = "command fleet ranks"
	desc = "Fleet rank. This denotes an Commander - it has three stars."
	icon_state = "rank2"