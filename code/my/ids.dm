/decl/hierarchy/outfit
	var/list/add_access

/datum/computer_file/report/crew_record/load_from_mob(var/mob/living/carbon/human/H)
	. = ..()
	spawn(10 SECONDS) grantgen(H)

/datum/computer_file/report/crew_record/proc/grantgen(var/mob/living/carbon/human/H)
	var/datum/computer_network/network = get_local_network_at(get_turf(H))
	if(!network || !H.mind) return

	var/datum/job/J = H.mind.assigned_job
	var/list/all_grants = network.get_all_files_of_type(/datum/computer_file/data/grant_record)
	var/list/job_access = J.get_access()

	var/alt_title = H.mind.role_alt_title
	var/decl/hierarchy/outfit/O = J.get_outfit(H, alt_title)

	for(var/A in O.add_access)
		if(A in job_access)
			continue
		job_access += A

	for(var/datum/computer_file/data/grant_record/GR in all_grants)
		if(GR.stored_data in job_access) add_grant(GR)

	var/obj/item/card/id/network/C = locate() in H
	if(C)
		C.refresh_access_record(network)
		to_chat(H,SPAN_NOTICE("Your [C.name] beeps softly, notifying you about successful access sync."))
		return C

/obj/item/card/id/network/refresh_access_record(var/datum/computer_network/network)
	if(!network || !ishuman(loc)) return FALSE
	var/mob/living/carbon/human/H = loc
	for(var/datum/extension/network_device/mainframe/mainframe in network.get_mainframes_by_role(MF_ROLE_CREW_RECORDS))
		for(var/datum/computer_file/report/crew_record/record in mainframe.get_all_files())
			if(record.get_dna() != H.dna.unique_enzymes) continue //DNA sync, hiiiiiiiiii-tech
			access_record = record
			access = list()
			for(var/datum/computer_file/data/grant_record/GR in record.get_valid_grants())
				access += uppertext(GR.stored_data)
			return TRUE