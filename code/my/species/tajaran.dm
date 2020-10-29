#define SPECIES_TAJARA "Tajaran"
#define CULTURE_TAJARA "Tajaran"
#define LANGUAGE_TAJARA "Siik'maas"

/datum/species/tajaran
	name = SPECIES_TAJARA
	name_plural = "Tajaran"

	description = "A small mammalian carnivore. If you are reading this, you are probably a tajaran."
	hidden_from_codex = FALSE
	bodytype = BODYTYPE_HUMANOID
	sexybits_location = BP_GROIN

	min_age = 17
	max_age = 140

	spawn_flags = SPECIES_CAN_JOIN
	appearance_flags = HAS_HAIR_COLOR | HAS_LIPS | HAS_UNDERWEAR | HAS_SKIN_COLOR | HAS_EYE_COLOR

	icobase = 'icons/my/tajaran/body.dmi'
	deform =  'icons/my/tajaran/deformed_body.dmi'
	bandages_icon = 'icons/mob/bandage.dmi'
	preview_icon = 'icons/my/tajaran/preview.dmi'
	tail_animation = 'icons/my/tajaran/tail.dmi'
	tail = "tajtail"

	flesh_color = "#afa59e"
	base_color = "#333333"
	blood_color = "#862a51"
	organs_icon = 'icons/my/tajaran/organs.dmi'

	default_h_style = "Tajaran Ears"

	darksight_range = 7
	darksight_tint = DARKTINT_GOOD
	slowdown = -0.5
	flash_mod = 2

	unarmed_attacks = list(/decl/natural_attack/stomp, /decl/natural_attack/kick, /decl/natural_attack/punch, /decl/natural_attack/bite/sharp)
	move_trail = /obj/effect/decal/cleanable/blood/tracks/paw

	cold_level_1 = 200
	cold_level_2 = 140
	cold_level_3 = 80

	heat_level_1 = 330
	heat_level_2 = 380
	heat_level_3 = 800

	heat_discomfort_level = 294
	cold_discomfort_level = 230

	heat_discomfort_strings = list(
		"Your fur prickles in the heat.",
		"You feel uncomfortably warm.",
		"Your overheated skin itches."
		)

	available_cultural_info = list(
		TAG_CULTURE = list(
			CULTURE_TAJARA
		)
	)

	default_emotes = list(/decl/emote/human/swish,
						/decl/emote/human/wag,
						/decl/emote/human/sway,
						/decl/emote/human/qwag,
						/decl/emote/human/fastsway,
						/decl/emote/human/swag,
						/decl/emote/human/stopsway,
						/decl/emote/audible/purr,
						/decl/emote/audible/purrlong)

	//Autohiss

	autohiss_basic_map = list(
			"r" = list("rr", "rrr", "rrrr"),

			"р" = list("рр", "ррр", "рррр")
		)
	autohiss_exempt = list(LANGUAGE_TAJARA)

/datum/species/tajaran/equip_survival_gear(var/mob/living/carbon/human/H,var/extendedtank = 1)
	. = ..()
	H.equip_to_slot_or_del(new /obj/item/clothing/glasses/tajblind, slot_glasses_str)

//Purrrrrrrrrrrrrrrrr

/decl/emote/audible/purr
	key = "purr"
	emote_message_3p = "USER purrs."
	emote_sound = 'sound/voice/cat_purr.ogg'

/decl/emote/audible/purrlong
	key = "purrl"
	emote_message_3p = "USER purrs."
	emote_sound = 'sound/voice/cat_purr_long.ogg'

//Culture

/decl/cultural_info/culture/tajaran
	name = CULTURE_TAJARA
	description = "The Tajaran are a species of furred mammalian bipeds hailing from the chilly planet of Ahdomai \
	in the Zamsiin-lr system. They are a naturally superstitious species, with the new generations growing up with tales \
	of the heroic struggles of their forebears against the Overseers. This spirit has led them forward to the \
	reconstruction and advancement of their society to what they are today. Their pride for the struggles they \
	went through is heavily tied to their spiritual beliefs. Recent discoveries have jumpstarted the progression \
	of highly advanced cybernetic technology, causing a culture shock within Tajaran society."
	language = /decl/language/tajaran
	secondary_langs = list(
		/decl/language/human/common,
		/decl/language/sign
	)

//Language

/decl/language/tajaran
	name = LANGUAGE_TAJARA
	desc = "The traditionally employed tongue of Ahdomai, composed of expressive yowls and chirps. Native to the Tajaran."
	speech_verb = "purrs"
	ask_verb = "purrs"
	exclaim_verb = "howls"
	whisper_verb = "purrs softly"
	key = "2"
	flags = WHITELISTED
	shorthand = "T"
	syllables = list("mrr","rr","tajr","kir","raj","kii","mir","kra","ahk","nal","vah","khaz","jri","ran","darr",
	"mi","jri","dynh","manq","rhe","zar","rrhaz","kal","chur","eech","thaa","dra","jurl","mah","sanu","dra","ii'r",
	"ka","aasi","far","wa","baq","ara","qara","zir","sam","mak","hrar","nja","rir","khan","jun","dar","rik","kah",
	"hal","ket","jurl","mah","tul","cresh","azu","ragh","mro","mra","mrro","mrra")

/decl/language/tajaran/get_random_name(var/gender, name_count=2, syllable_count=4, syllable_divisor=2)
	var/new_name = ..(gender,1)
	if(prob(70))
		new_name += " [pick(list("Hadii","Kaytam","Nazkiin","Zhan-Khazan","Hharar","Njarir'Akhan","Faaira'Nrezi","Rhezar","Mi'dynh","Rrhazkal","Bayan","Al'Manq","Mi'jri","Chur'eech","Sanu'dra","Ii'rka"))]"
	else
		new_name += " [..(gender,1)]"
	return new_name

//#803b56 is color

/decl/language/tajaran/format_message(message, verb)
	return "[verb], <span class='message'><span style='color: #803b56'>\"[capitalize(filter_modify_message(message))]\"</span></span>"

/decl/language/tajaran/format_message_radio(message, verb)
	return "[verb], <span style='color: #803b56'>\"[capitalize(filter_modify_message(message))]\"</span>"

//Hairstyles

/datum/sprite_accessory/facial_hair/shaved/New()
	..()
	species_allowed += SPECIES_TAJARA

/datum/sprite_accessory/hair/taj
	name = "Tajaran Ears"
	icon_state = "ears_plain"
	species_allowed = list(SPECIES_TAJARA)
	icon = 'icons/my/tajaran/hair.dmi'

/datum/sprite_accessory/hair/taj/ears_clean
	name = "Tajara Clean"
	icon_state = "hair_clean"

/datum/sprite_accessory/hair/taj/ears_bangs
	name = "Tajara Bangs"
	icon_state = "hair_bangs"

/datum/sprite_accessory/hair/taj/ears_braid
	name = "Tajara Braid"
	icon_state = "hair_tbraid"

/datum/sprite_accessory/hair/taj/ears_shaggy
	name = "Tajara Shaggy"
	icon_state = "hair_shaggy"

/datum/sprite_accessory/hair/taj/ears_mohawk
	name = "Tajaran Mohawk"
	icon_state = "hair_mohawk"

/datum/sprite_accessory/hair/taj/ears_plait
	name = "Tajara Plait"
	icon_state = "hair_plait"

/datum/sprite_accessory/hair/taj/ears_straight
	name = "Tajara Straight"
	icon_state = "hair_straight"

/datum/sprite_accessory/hair/taj/ears_long
	name = "Tajara Long"
	icon_state = "hair_long"

/datum/sprite_accessory/hair/taj/ears_rattail
	name = "Tajara Rat Tail"
	icon_state = "hair_rattail"

/datum/sprite_accessory/hair/taj/ears_spiky
	name = "Tajara Spiky"
	icon_state = "hair_tajspiky"

/datum/sprite_accessory/hair/taj/ears_messy
	name = "Tajara Messy"
	icon_state = "hair_messy"

/datum/sprite_accessory/hair/taj/ears_bob
	name = "Tajara Bob"
	icon_state = "hair_tbob"

/datum/sprite_accessory/hair/taj/ears_sidebraid
	name = "Tajara Sidebraid"
	icon_state = "hair_sidebraid"

/datum/sprite_accessory/hair/taj/ears_ribbons
	name = "Tajara Ribbons"
	icon_state = "hair_ribbons"

/datum/sprite_accessory/hair/taj/ears_combedback
	name = "Tajara Combedback"
	icon_state = "hair_combedback"

/datum/sprite_accessory/hair/taj/ears_tailedbangs
	name = "Tajara Tailedbangs"
	icon_state = "hair_tailedbangs"

/datum/sprite_accessory/hair/taj/ears_longtail
	name = "Tajara Longtail"
	icon_state = "hair_longtail"

/datum/sprite_accessory/hair/taj/ears_shy
	name = "Tajara Shy"
	icon_state = "hair_shy"

/datum/sprite_accessory/hair/taj/ears_ponytail
	name = "Tajara Ponytail"
	icon_state = "hair_ponytail"

/datum/sprite_accessory/hair/taj/ears_overeye
	name = "Tajara Overeye"
	icon_state = "hair_overeye"

/datum/sprite_accessory/hair/taj/ears_tough
	name = "Tajara Tough"
	icon_state = "hair_tough"

/datum/sprite_accessory/hair/taj/ears_cuttail
	name = "Tajara Cuttail"
	icon_state = "hair_cuttail"

/datum/sprite_accessory/hair/taj/ears_dreadlocks
	name = "Tajara Dreadlocks"
	icon_state = "hair_dreadlocks"

/datum/sprite_accessory/hair/taj/ears_clean_noear
	name = "Tajara Clean (No ears)"
	icon_state = "hair_clean_s_noear"

/datum/sprite_accessory/hair/taj/ears_bangs_noear
	name = "Tajara Bangs (No ears)"
	icon_state = "hair_bangs_s_noear"

/datum/sprite_accessory/hair/taj/ears_braid_noear
	name = "Tajara Braid (No ears)"
	icon_state = "hair_tbraid_s_noear"

/datum/sprite_accessory/hair/taj/ears_shaggy_noear
	name = "Tajara Shaggy (No ears)"
	icon_state = "hair_shaggy_s_noear"

/datum/sprite_accessory/hair/taj/ears_mohawk_noear
	name = "Tajaran Mohawk (No ears)"
	icon_state = "hair_mohawk_s_noear"

/datum/sprite_accessory/hair/taj/ears_plait_noear
	name = "Tajara Plait (No ears)"
	icon_state = "hair_plait_s_noear"

/datum/sprite_accessory/hair/taj/ears_straight_noear
	name = "Tajara Straight (No ears)"
	icon_state = "hair_straight_s_noear"

/datum/sprite_accessory/hair/taj/ears_long_noear
	name = "Tajara Long (No ears)"
	icon_state = "hair_long_s_noear"

/datum/sprite_accessory/hair/taj/ears_rattail_noear
	name = "Tajara Rat Tail (No ears)"
	icon_state = "hair_rattail_s_noear"

/datum/sprite_accessory/hair/taj/ears_spiky_noear
	name = "Tajara Spiky (No ears)"
	icon_state = "hair_tajspiky_s_noear"

/datum/sprite_accessory/hair/taj/ears_messy_noear
	name = "Tajara Messy (No ears)"
	icon_state = "hair_messy_s_noear"

/datum/sprite_accessory/hair/taj/ears_bob_noear
	name = "Tajara Bob (No ears)"
	icon_state = "hair_tbob_s_noear"

/datum/sprite_accessory/hair/taj/ears_sidebraid_noear
	name = "Tajara Sidebraid (No ears)"
	icon_state = "hair_sidebraid_s_noear"

/datum/sprite_accessory/hair/taj/ears_ribbons_noear
	name = "Tajara Ribbons (No ears)"
	icon_state = "hair_ribbons_s_noear"

/datum/sprite_accessory/hair/taj/ears_combedback_noear
	name = "Tajara Combedback (No ears)"
	icon_state = "hair_combedback_s_noear"

/datum/sprite_accessory/hair/taj/ears_tailedbangs_noear
	name = "Tajara Tailedbangs (No ears)"
	icon_state = "hair_tailedbangs_s_noear"

/datum/sprite_accessory/hair/taj/ears_longtail_noear
	name = "Tajara Longtail (No ears)"
	icon_state = "hair_longtail_s_noear"

/datum/sprite_accessory/hair/taj/ears_shy_noear
	name = "Tajara Shy (No ears)"
	icon_state = "hair_shy_s_noear"

/datum/sprite_accessory/hair/taj/ears_ponytail_noear
	name = "Tajara Ponytail (No ears)"
	icon_state = "hair_ponytail_s_noear"

/datum/sprite_accessory/hair/taj/ears_overeye_noear
	name = "Tajara Overeye (No ears)"
	icon_state = "hair_overeye_s_noear"

/datum/sprite_accessory/hair/taj/ears_tough_noear
	name = "Tajara Tough (No ears)"
	icon_state = "hair_tough_s_noear"

/datum/sprite_accessory/hair/taj/ears_cuttail_noear
	name = "Tajara Cuttail (No ears)"
	icon_state = "hair_cuttail_s_noear"

/datum/sprite_accessory/hair/taj/ears_dreadlocks_noear
	name = "Tajara Dreadlocks (No ears)"
	icon_state = "hair_dreadlocks_s_noear"

//Facial hs

/datum/sprite_accessory/facial_hair/taj
	name = "Tajara Sideburns"
	icon_state = "facial_sideburns"
	species_allowed = list(SPECIES_TAJARA)
	icon = 'icons/my/tajaran/facial.dmi'

/datum/sprite_accessory/facial_hair/taj/mutton
	name = "Tajara Mutton"
	icon_state = "facial_mutton"

/datum/sprite_accessory/facial_hair/taj/pencilstache
	name = "Tajara Pencilstache"
	icon_state = "facial_pencilstache"

/datum/sprite_accessory/facial_hair/taj/moustache
	name = "Tajara Moustache"
	icon_state = "facial_moustache"

/datum/sprite_accessory/facial_hair/taj/goatee
	name = "Tajara Goatee"
	icon_state = "facial_goatee"

/datum/sprite_accessory/facial_hair/taj/smallstache
	name = "Tajara Smallsatche"
	icon_state = "facial_smallstache"

//Markings

/datum/sprite_accessory/marking/taj
	name = "Socks Coloration (Taj)"
	icon = 'icons/my/tajaran/markings.dmi'
	icon_state = "taj_pawsocks"
	species_allowed = list(SPECIES_TAJARA)
	body_parts = list(BP_L_FOOT,BP_R_FOOT,BP_L_LEG,BP_R_LEG,BP_L_ARM,BP_R_ARM,BP_L_HAND,BP_R_HAND)

/datum/sprite_accessory/marking/taj/paw_socks
	name = "Socks Coloration (Generic)"
	icon_state = "pawsocks"
	body_parts = list(BP_L_FOOT,BP_R_FOOT,BP_L_LEG,BP_R_LEG,BP_L_ARM,BP_R_ARM,BP_L_HAND,BP_R_HAND)

/datum/sprite_accessory/marking/taj/belly_hands_feet
	name = "Hands/Feet/Belly Color (Minor)"
	icon_state = "bellyhandsfeetsmall"
	body_parts = list(BP_L_FOOT,BP_R_FOOT,BP_L_LEG,BP_R_LEG,BP_L_ARM,BP_R_ARM,BP_L_HAND,BP_R_HAND,BP_GROIN,BP_CHEST)

/datum/sprite_accessory/marking/taj/hands_feet_belly_full
	name = "Hands/Feet/Belly Color (Major)"
	icon_state = "bellyhandsfeet"
	body_parts = list(BP_L_FOOT,BP_R_FOOT,BP_L_LEG,BP_R_LEG,BP_L_ARM,BP_R_ARM,BP_L_HAND,BP_R_HAND,BP_GROIN,BP_CHEST)

/datum/sprite_accessory/marking/taj/hands_feet_belly_full_female
	name = "Hands,Feet,Belly Color (Major, Female)"
	icon_state = "bellyhandsfeet_female"
	body_parts = list(BP_L_FOOT,BP_R_FOOT,BP_L_LEG,BP_R_LEG,BP_L_ARM,BP_R_ARM,BP_L_HAND,BP_R_HAND,BP_GROIN,BP_CHEST)

/datum/sprite_accessory/marking/taj/patches
	name = "Color Patches"
	icon_state = "patches"
	body_parts = list(BP_L_FOOT,BP_R_FOOT,BP_L_LEG,BP_R_LEG,BP_L_ARM,BP_R_ARM,BP_L_HAND,BP_R_HAND,BP_CHEST,BP_GROIN)

/datum/sprite_accessory/marking/taj/patchesface
	name = "Color Patches (Face)"
	icon_state = "patchesface"
	body_parts = list(BP_HEAD)

/datum/sprite_accessory/marking/taj/tiger_stripes
	name = "Tiger Stripes"
	icon_state = "tiger"
	body_parts = list(BP_L_FOOT,BP_R_FOOT,BP_L_LEG,BP_R_LEG,BP_L_ARM,BP_R_ARM,BP_CHEST,BP_GROIN)

/datum/sprite_accessory/marking/taj/tigerhead
	name = "Tiger Stripes (Head, Minor)"
	icon_state = "tigerhead"
	body_parts = list(BP_HEAD)

/datum/sprite_accessory/marking/taj/tigerface
	name = "Tiger Stripes (Head, Major)"
	icon_state = "tigerface"
	body_parts = list(BP_HEAD)

/datum/sprite_accessory/marking/taj/belly
	name = "Belly Fur (Taj)"
	icon_state = "taj_belly"
	body_parts = list(BP_CHEST)

/datum/sprite_accessory/marking/taj/bellyfull
	name = "Belly Fur Wide (Taj)"
	icon_state = "taj_bellyfull"
	body_parts = list(BP_CHEST)

/datum/sprite_accessory/marking/taj/earsout
	name = "Outer Ear (Taj)"
	icon_state = "taj_earsout"
	body_parts = list(BP_HEAD)

/datum/sprite_accessory/marking/taj/earsin
	name = "Inner Ear (Taj)"
	icon_state = "taj_earsin"
	body_parts = list(BP_HEAD)

/datum/sprite_accessory/marking/taj/nose
	name = "Nose Color (Taj)"
	icon_state = "taj_nose"
	body_parts = list(BP_HEAD)

/datum/sprite_accessory/marking/taj/crest
	name = "Chest Fur Crest (Taj)"
	icon_state = "taj_crest"
	body_parts = list(BP_CHEST)

/datum/sprite_accessory/marking/taj/muzzle
	name = "Muzzle Color (Taj)"
	icon_state = "taj_muzzle"
	body_parts = list(BP_HEAD)

/datum/sprite_accessory/marking/taj/face
	name = "Cheeks Color (Taj)"
	icon_state = "taj_face"
	body_parts = list(BP_HEAD)

/datum/sprite_accessory/marking/taj/all
	name = "All Taj Head (Taj)"
	icon_state = "taj_all"
	body_parts = list(BP_HEAD)

/datum/sprite_accessory/marking/taj/earslynx
	name = "Lynx Ear (Taj)"
	icon_state = "taj_earsout_lynx"
	body_parts = list(BP_HEAD)

/datum/sprite_accessory/marking/taj/earsearrings
	name = "Earrings (Taj)"
	icon_state = "taj_earrings"
	body_parts = list(BP_HEAD)

/datum/sprite_accessory/marking/taj/facelynx
	name = "Lynx cheeks (Taj)"
	icon_state = "taj_lynxcheeks"
	body_parts = list(BP_HEAD)

//Skin

/datum/sprite_accessory/skin/tajaran
	name = "Default tajaran skin"
	icon_state = "default"
	icon = 'icons/my/tajaran/body.dmi'
	species_allowed = list(SPECIES_TAJARA)

#define TAJ_OBJ 'icons/my/tajaran/clothing/obj.dmi'
#define TAJ_MOB 'icons/my/tajaran/clothing/onmob.dmi'

//Clothing!//

//Veils

/obj/item/clothing/glasses/tajblind
	name = "embroidered veil"
	desc = "An classic Ahdominian made veil that allows the user to see while obscuring their eyes."
	icon = TAJ_OBJ
	item_icons = list(slot_glasses_str = TAJ_MOB)
	icon_state = "tajblind"
	item_state = "tajblind"

/obj/item/clothing/glasses/hud/health/tajblind
	name = "lightweight veil"
	desc = "An classic Ahdominian made veil that allows the user to see while obscuring their eyes. This one has an installed medical HUD."
	icon = TAJ_OBJ
	item_icons = list(slot_glasses_str = TAJ_MOB)
	icon_state = "tajblind_med"
	item_state = "tajblind_med"

/obj/item/clothing/glasses/sunglasses/sechud/tajblind
	name = "sleek veil"
	desc = "An classic Ahdominian made veil that allows the user to see while obscuring their eyes. This one has an in-built security HUD."
	icon = TAJ_OBJ
	item_icons = list(slot_glasses_str = TAJ_MOB)
	icon_state = "tajblind_sec"
	item_state = "tajblind_sec"

/obj/item/clothing/glasses/meson/prescription/tajblind
	name = "industrial veil"
	desc = "An classic Ahdominian made veil that allows the user to see while obscuring their eyes. This one has installed mesons."
	icon = TAJ_OBJ
	item_icons = list(slot_glasses_str = TAJ_MOB)
	icon_state = "tajblind_meson"
	item_state = "tajblind_meson"
	off_state = "tajblind_meson"

//Visors

/obj/item/clothing/glasses/hud/health/tajvisor
	name = "lightweight visor"
	desc = "A modern Ahdominian made visor that allows the user to see while obscuring their eyes. This one has an installed medical HUD."
	icon = TAJ_OBJ
	item_icons = list(slot_glasses_str = TAJ_MOB)
	icon_state = "tajvisor_med"
	item_state = "tajvisor_med"

/obj/item/clothing/glasses/sunglasses/sechud/tajvisor
	name = "sleek visor"
	desc = "A modern Ahdominian made visor that allows the user to see while obscuring their eyes. This one has an in-built security HUD."
	icon = TAJ_OBJ
	item_icons = list(slot_glasses_str = TAJ_MOB)
	icon_state = "tajvisor_sec"
	item_state = "tajvisor_sec"

/obj/item/clothing/glasses/meson/prescription/tajvisor
	name = "industrial visor"
	desc = "A modern Ahdominian made visor that allows the user to see while obscuring their eyes. This one has installed mesons."
	icon = TAJ_OBJ
	item_icons = list(slot_glasses_str = TAJ_MOB)
	icon_state = "tajvisor_mes"
	item_state = "tajvisor_mes"
	off_state = "tajvisor_mes"

/obj/item/clothing/glasses/meson/prescription/tajvisor/hybrid
	name = "engineering visor"
	desc = "A modern Ahdominian made visor that allows the user to see while obscuring their eyes. This one has installed as the mesons, and the add-on shielding module."
	icon = TAJ_OBJ
	item_icons = list(slot_glasses_str = TAJ_MOB)
	icon_state = "tajvisor_mes"
	item_state = "tajvisor_mes"
	off_state = "tajvisor_mes"
	var/mode = 1

/obj/item/clothing/glasses/meson/prescription/tajvisor/hybrid/attack_self(mob/user)
	if(!toggleable || user.incapacitated())
		return
	switch(mode)
		if(1)
			flash_protection = FLASH_PROTECTION_MAJOR
			tint = TINT_HEAVY
			to_chat(user, "You switch \the [src] to welding protection mode.")
			mode = 2
			active = TRUE
			return
		if(2)
			flash_protection = FLASH_PROTECTION_NONE
			vision_flags = SEE_TURFS
			tint = TINT_NONE
			to_chat(user, "You switch \the [src] to meson mode.")
			mode = 3
			active = TRUE
			user.update_inv_glasses()
			return
		if(3)
			vision_flags = null
			to_chat(user, "You switch off \the [src].")
			mode = 1
			active = FALSE
			user.update_inv_glasses()
			return

/obj/item/clothing/glasses/tajvisor
	name = "visor"
	desc = "An Ahdominian made eyeguard."
	icon = TAJ_OBJ
	item_icons = list(slot_glasses_str = TAJ_MOB)

/obj/item/clothing/glasses/tajvisor/a
	icon_state = "tajvisor_a"
	item_state = "tajvisor_a"

/obj/item/clothing/glasses/tajvisor/b
	icon_state = "tajvisor_b"
	item_state = "tajvisor_b"

/obj/item/clothing/glasses/tajvisor/c
	icon_state = "tajvisor_c"
	item_state = "tajvisor_c"

/obj/item/clothing/glasses/tajvisor/d
	icon_state = "tajvisor_d"
	item_state = "tajvisor_d"

/obj/item/clothing/glasses/tajvisor/d
	icon_state = "tajvisor_d"
	item_state = "tajvisor_d"

/obj/item/clothing/glasses/tajvisor/e
	icon_state = "tajvisor_e"
	item_state = "tajvisor_e"

/obj/item/clothing/glasses/tajvisor/f
	icon_state = "tajvisor_f"
	item_state = "tajvisor_f"

/obj/item/clothing/glasses/tajvisor/g
	icon_state = "tajvisor_g"
	item_state = "tajvisor_g"

#undef TAJ_OBJ
#undef TAJ_MOB

//Loadout, veils

/datum/gear/eyes/medical/tajblind
	display_name = "(Tajara) veil, medical"
	path = /obj/item/clothing/glasses/hud/health/tajblind
	whitelisted = list(SPECIES_TAJARA)
	sort_category = "Xenowear"

/datum/gear/eyes/meson/tajblind
	display_name = "(Tajara) veil, industrial"
	path = /obj/item/clothing/glasses/meson/prescription/tajblind
	whitelisted = list(SPECIES_TAJARA)
	sort_category = "Xenowear"

/datum/gear/eyes/security/tajblind
	display_name = "(Tajara) veil, sleek"
	path = /obj/item/clothing/glasses/sunglasses/sechud/tajblind
	whitelisted = list(SPECIES_TAJARA)
	sort_category = "Xenowear"

//Visors

/datum/gear/eyes/visors
	display_name = "(Tajara) visor selection"
	path = /obj/item/clothing/glasses/tajvisor
	whitelisted = list(SPECIES_TAJARA)
	sort_category = "Xenowear"

/datum/gear/eyes/visors/New()
	..()
	var/visors = list()
	visors["visor type-A (Tajara)"] = /obj/item/clothing/glasses/tajvisor/a
	visors["visor type-B (Tajara)"] = /obj/item/clothing/glasses/tajvisor/b
	visors["visor type-C (Tajara)"] = /obj/item/clothing/glasses/tajvisor/c
	visors["visor type-D (Tajara)"] = /obj/item/clothing/glasses/tajvisor/d
	visors["visor type-E (Tajara)"] = /obj/item/clothing/glasses/tajvisor/e
	visors["visor type-F (Tajara)"] = /obj/item/clothing/glasses/tajvisor/f
	visors["visor type-G (Tajara)"] = /obj/item/clothing/glasses/tajvisor/g
	gear_tweaks += new/datum/gear_tweak/path(visors)

/datum/gear/eyes/medical/tajvisor
	display_name = "(Tajara) visor, medical"
	path = /obj/item/clothing/glasses/hud/health/tajvisor
	whitelisted = list(SPECIES_TAJARA)
	sort_category = "Xenowear"

/datum/gear/eyes/security/tajvisor
	display_name = "(Tajara) visor, security"
	path = /obj/item/clothing/glasses/sunglasses/sechud/tajvisor
	whitelisted = list(SPECIES_TAJARA)
	sort_category = "Xenowear"

/datum/gear/eyes/meson/tajvisor
	display_name = "(Tajara) visor, industrial"
	path = /obj/item/clothing/glasses/meson/prescription/tajvisor
	whitelisted = list(SPECIES_TAJARA)
	sort_category = "Xenowear"

/datum/gear/eyes/meson/tajvisor/hybr
	display_name = "(Tajara) visor, engineering"
	path = /obj/item/clothing/glasses/meson/prescription/tajvisor/hybrid
	cost = 2