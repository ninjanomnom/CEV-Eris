/datum/antagonist/revolutionary
	id = ROLE_REVOLUTIONARY
	role_text = "Revolutionary"
	role_text_plural = "Revolutionaries"
	bantype = "revolutionary"
	welcome_text = "Down with the capitalists! Down with the Bourgeoise!"
	faction_type = /datum/faction/revolutionary
	restricted_jobs = list("AI", "Cyborg","Captain", "First Officer", "Ironhammer Commander", "Technomancer Exultant", "Moebius Expedition Overseer", "Moebius Biolab Officer")
	protected_jobs = list("Ironhammer Operative", "Ironhammer Gunnery Sergeant", "Ironhammer Inspector", "Ironhammer Medical Specialist")

/datum/faction/revolutionary
	id = FACTION_REVOLUTIONARY
	name = "Revolution"
	description = "Viva la revolution!"
	welcome_text = "Help the cause overturn the ruling class. Do not harm your fellow freedom fighters."
	faction_invisible = TRUE
	hud_indicator = "rev"

	antag = "Revolutionary"
	antag_plural = "Revolutionaries"

/datum/faction/revolutionary/create_objectives()
	if(!..())
		return
	for(var/mob/living/carbon/human/player in mob_list)
		if(!player.mind || player.stat==DEAD || !(player.mind.assigned_role in command_positions) || player in members)
			continue
		var/datum/objective/faction/rev/O = new /datum/objective/faction/rev (src, FALSE)
		O.target = player.mind
		O.update_explanation()
		set_objectives(list(O))

