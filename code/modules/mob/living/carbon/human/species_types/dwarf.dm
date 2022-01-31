/datum/species/dwarf //not to be confused with the genetic manlets
	name = "Dwarf"
	id = "dwarf"
	default_color = "FFFFFF"
	species_traits = list(EYECOLOR,HAIR,FACEHAIR,LIPS,NOBREATH)
	mutant_bodyparts = list("tail_human", "ears", "wings")
	default_features = list("mcolor" = "FFF", "tail_human" = "None", "ears" = "None", "wings" = "None")
	limbs_id = "human"
	use_skintones = 1
	speedmod = 1
	skinned_type = /obj/item/stack/sheet/animalhide/human
	brutemod = 0.9
	coldmod = 0.85
	punchdamagehigh = 11
	mutant_organs = list(/obj/item/organ/alcoholvessel)

/datum/species/dwarf/on_species_gain(mob/living/carbon/C, datum/species/old_species)
	..()
	var/dwarf_hair = pick("Dwarf Beard", "Very Long Beard", "Full Beard")
	var/mob/living/carbon/human/H = C
	H.resize = 0.8
	H.grant_language(/datum/language/dwarvish)
	H.facial_hair_style = dwarf_hair
	H.update_transform()
	H.update_hair()

	var/obj/item/organ/alcoholvessel/dwarf
	dwarf = H.getorganslot("dwarf_organ")
	if(!dwarf)
		dwarf = new()
		dwarf.Insert(H)


/datum/species/dwarf/on_species_loss(mob/living/carbon/C, datum/species/old_species)
	..()
	var/mob/living/carbon/human/H = C
	H.resize = 1.25
	H.update_transform()

/datum/species/dwarf/random_name(gender,unique,lastname)
	var/randname = dwarf_name()

	return randname