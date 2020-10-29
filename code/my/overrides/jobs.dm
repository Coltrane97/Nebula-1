//Skillz.

#define SKILL_LOW 20
#define SKILL_MED 24
#define SKILL_HIGH 28

/datum/job/New()
	..()
	max_skill = list(
		SKILL_LITERACY = SKILL_MAX,
		SKILL_FINANCE = SKILL_MAX,
		SKILL_EVA = SKILL_MAX,
		SKILL_MECH = SKILL_MAX,
		SKILL_PILOT = SKILL_MAX,
		SKILL_HAULING = SKILL_MAX,
		SKILL_COMPUTER = SKILL_MAX,
		SKILL_BOTANY = SKILL_MAX,
		SKILL_COOKING = SKILL_MAX,
		SKILL_COMBAT = SKILL_MAX,
		SKILL_WEAPONS = SKILL_MAX,
		SKILL_FORENSICS = SKILL_MAX,
		SKILL_CONSTRUCTION = SKILL_MAX,
		SKILL_ELECTRICAL = SKILL_MAX,
		SKILL_ATMOS = SKILL_MAX,
		SKILL_ENGINES = SKILL_MAX,
		SKILL_DEVICES = SKILL_MAX,
		SKILL_SCIENCE = SKILL_MAX,
		SKILL_MEDICAL = SKILL_MAX,
		SKILL_ANATOMY = SKILL_MAX,
		SKILL_CHEMISTRY = SKILL_MAX
	)
	supervisors = "the chain of command"

/*	minimal_access = list()
	access = list()*/

 ///////////////
//LOWRANK CREW//
///////////////

//Crewman//

/datum/job/assistant/New()
	..()
	title = "Crewman"
	outfit_type = /decl/hierarchy/outfit/job/fleet
	alt_titles = list(
		"Culinary Technician",
		"Sanitary Technician",
		"Cargo Technician",
		"Security Technician" = /decl/hierarchy/outfit/job/fleet/sec)
	skill_points = SKILL_LOW
	total_positions = 6
	spawn_positions = 6

/datum/job/assistant
	allowed_branches = list(/datum/mil_branch/fleet)
	allowed_ranks = list(/datum/mil_rank/crewman,/datum/mil_rank/officer)

//ET//

/datum/job/tradeship_engineer/New()
	..()
	title = "Engineering Technician"
	outfit_type = /decl/hierarchy/outfit/job/fleet/eng
	alt_titles = list(
		"Reactor Technician",
		"EVA Technician",
		"Maintenance Technician",
		"Robot Technician")
	skill_points = SKILL_MED
	total_positions = 4
	spawn_positions = 3

/datum/job/tradeship_engineer
	allowed_branches = list(/datum/mil_branch/fleet)
	allowed_ranks = list(/datum/mil_rank/crewman,/datum/mil_rank/officer)

//MT//

/datum/job/tradeship_doctor/New()
	..()
	title = "Medical Technician"
	outfit_type = /decl/hierarchy/outfit/job/fleet/med
	alt_titles = list(
		"Chemical Technician",
		"Advanced Surgery Technician")
	skill_points = SKILL_MED
	total_positions = 4
	spawn_positions = 3

/datum/job/tradeship_doctor
	allowed_branches = list(/datum/mil_branch/fleet)
	allowed_ranks = list(/datum/mil_rank/crewman,/datum/mil_rank/officer)

//ST//

/datum/job/tradeship_researcher/New()
	..()
	title = "Science Technician"
	outfit_type = /decl/hierarchy/outfit/job/fleet/sci
	alt_titles = list(
		"Xenobotany Technician",
		"Research Technician")
	skill_points = SKILL_MED
	total_positions = 4
	spawn_positions = 3

/datum/job/tradeship_researcher
	allowed_branches = list(/datum/mil_branch/fleet)
	allowed_ranks = list(/datum/mil_rank/crewman,/datum/mil_rank/officer)

 //////////////
//SENIOR CREW//
//////////////

//SMT

/datum/job/tradeship_doctor/head/New()
	..()
	title = "Senior Medical Technician"
	alt_titles = null
	skill_points = SKILL_HIGH
	total_positions = 1
	spawn_positions = 1

/datum/job/tradeship_doctor/head
	allowed_branches = list(/datum/mil_branch/fleet)
	allowed_ranks = list(/datum/mil_rank/senior_officer)

//SET

/datum/job/tradeship_engineer/head/New()
	..()
	title = "Senior Engineering Technician"
	alt_titles = null
	skill_points = SKILL_HIGH
	total_positions = 1
	spawn_positions = 1

/datum/job/tradeship_engineer/head
	allowed_branches = list(/datum/mil_branch/fleet)
	allowed_ranks = list(/datum/mil_rank/senior_officer)

//SST

/datum/job/tradeship_researcher/head/New()
	..()
	title = "Senior Science Technician"
	alt_titles = null
	skill_points = SKILL_HIGH
	total_positions = 1
	spawn_positions = 1

/datum/job/tradeship_researcher/head
	allowed_branches = list(/datum/mil_branch/fleet)
	allowed_ranks = list(/datum/mil_rank/senior_officer)

//FO

/datum/job/tradeship_first_mate/New()
	..()
	title = "First Officer"
	outfit_type = /decl/hierarchy/outfit/job/fleet/com
	skill_points = SKILL_HIGH

/datum/job/tradeship_first_mate
	allowed_branches = list(/datum/mil_branch/fleet)
	allowed_ranks = list(/datum/mil_rank/senior_officer)

//CAPTAIN//

/datum/job/tradeship_captain/New()
	..()
	title = "Captain"
	outfit_type = /decl/hierarchy/outfit/job/fleet/com
	skill_points = SKILL_HIGH

	supervisors = "spacefleet orders and regulations, your own conscience"

/datum/job/tradeship_captain
	allowed_branches = list(/datum/mil_branch/fleet)
	allowed_ranks = list(/datum/mil_rank/commander)