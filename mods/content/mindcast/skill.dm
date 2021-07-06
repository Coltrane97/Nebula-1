/decl/hierarchy/skill/general/mindcast
	ID = "mindcast"
	name = "Mindcasting"
	desc = "This skill represents your training in mindcasting, a hard technique which allows you to manipulate and form your own thoughts and dreams in a semi-physical form."
	levels = list(  "Unskilled"   = "You have zero experience, and may not heard about mindcasting at all. You may not believe in it existing neither.",
					"Basic"       = "You have been trained to properly concentrate, and can withstand stressful situations much better than an average human. Though, still, that's not enough for you to develop so-called \"magic\" abilities. You're still lightyears ahead from it.",
					"Trained"     = "You have spent a lot of time at mindcast training, and probably can call yourself at least an beginning acolyte in this matter. Through years of practice you have obtained immense experience about capabilities of your own brain, and you already can do certain percentage of it by yourself.",
					"Experienced" = "You are a properly trained mindcast knight, and bending spoons with an eye's glance is probably your daily routine. You can perform most of the \"tricks\" and you possess certain knowledge about the mysteries of this world.",
					"Master"      = "You are the human equivalent of moses multiplied by a couple of egyptian gods.")

/decl/hierarchy/skill/general/mindcast/get_cost(var/level)
	switch(level)
		if(SKILL_BASIC)
			return 4
		if(SKILL_ADEPT)
			return 8
		if(SKILL_EXPERT)
			return 12
		else
			return 12

//basic = 4 points
//adept = 12 points
//expert = 24 points
//master = 36 points

//def assist 16 + 8 = 24
//engi 20 + 8 = 28
//engi head 30 + 8 = 38