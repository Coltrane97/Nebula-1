/datum/mil_branch/fleet
	name = "Spacefleet"
	name_short = "SF"
	email_domain = "spacefleet.gov"
	rank_types = list(/datum/mil_rank/crewman,
					/datum/mil_rank/officer,
					/datum/mil_rank/senior_officer,
					/datum/mil_rank/commander)

	spawn_rank_types = list(/datum/mil_rank/crewman,
					/datum/mil_rank/officer,
					/datum/mil_rank/senior_officer,
					/datum/mil_rank/commander)

/datum/mil_rank/crewman
	name = "Crewman"
	name_short = "CRW"
	sort_order = 1

/datum/mil_rank/officer
	name = "Officer"
	name_short = "OFF"
	sort_order = 2
	accessory = list(/obj/item/clothing/accessory/fleet_rank)

/datum/mil_rank/senior_officer
	name = "Senior Officer"
	name_short = "SOFF"
	sort_order = 3
	accessory = list(/obj/item/clothing/accessory/fleet_rank/senior)

/datum/mil_rank/commander
	name = "Commander"
	name_short = "COMM"
	sort_order = 4
	accessory = list(/obj/item/clothing/accessory/fleet_rank/comm)

/datum/map/tradeship
	branch_types = list(/datum/mil_branch/fleet)
	spawn_branch_types = list(/datum/mil_branch/fleet)
	flags = MAP_HAS_BRANCH | MAP_HAS_RANK