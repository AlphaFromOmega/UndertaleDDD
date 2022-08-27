function key_to_text(_key)
{
	var _text, _sel, _replace, _before, _after;
	switch (global.language)
	{
		default:
			show_debug_message("Failed to load lang key [" + global.language + "] defaulting to [en]")
		case "en": 
			_text = ds_map_find_value(global.text_data_en, _key)
			if is_undefined(_text)
			{
			    _text = "";
			}
			break;
		case "ja":
			_text = ds_map_find_value(global.text_data_ja, _key)
			if is_undefined(_text)
			{
			    _text = "";
			}
			break;
	}
	for (var i = 1; i <= (string_length(_text) - 3); i++)
	{
	    if (string_copy(_text, i, 2) == "@[" && string_char_at(_text, (i + 3)) == "]")
	    {
	        _sel = string_char_at(_text, (i + 2))
			_replace = "";
			switch (_sel)
			{
				case "C":
					_replace = global.name;
					break;
				case "G":
					_replace = string(global.gold);
					break;
				case "I":
					_replace = global.itemname[global.menucoord[1]];
					break;
				case "1":
					if (argument_count > 1)
					{
						_replace = argument[1]
					}
					break;
				case "2":
					if (argument_count > 2)
					{
						_replace = argument[2]
					}
					break;
				case "3":
					if (argument_count > 3)
					{
						_replace = argument[3]
					}
					break;
				case "4":
					if (argument_count > 4)
					{
						_replace = argument[4]
					}
					break;
				case "5":
					if (argument_count > 5)
					{
						_replace = argument[5]
					}
					break;
				case "6":
					if (argument_count > 6)
					{
						_replace = argument[6]
					}
					break;
				case "7":
					if (argument_count > 7)
					{
						_replace = argument[7]
					}
					break;
				case "8":
					if (argument_count > 8)
					{
						_replace = argument[8]
					}
					break;
				case "9":
					if (argument_count > 9)
					{
						_replace = argument[9]
					}
					break;
				default:
					_replace = "";
					break;
			}
	        _before = string_copy(_text, 1, (i - 1))
	        _after = string_copy(_text, (i + 4), string_length(_text))
	        _text = ((_before + _replace) + _after)
	        i += (string_length(_replace) - 1)
	    }
	}
	return _text;
}

function key_exists(_key)
{
	var _text;
	switch (global.language)
	{
		default:
			show_debug_message("Failed to load lang key [" + global.language + "] defaulting to [en]")
		case "en": 
			_text = ds_map_find_value(global.text_data_en, _key)
			break;
		case "ja":
			_text = ds_map_find_value(global.text_data_ja, _key)
			break;
	}
	return !is_undefined(_text);
}
/*
	Formatting
	^		1..9 Pause
	@E0..9 Emotion (Textboxes only)
	@C		Text choice
	
	@R		Red
	@G		Lime
	@W		White
	@Y		Yellow
	@X		Black
	@B		Blue
	@O		Orange
	@L		Light Blue
	@P		Purple
	@p		Pink
	
	/		Request input
	

*/

function textdata_en()
{
	global.text_data_en = ds_map_create()
	#region Menu
	global.text_data_en[? "menu_start"] = "Start";
	global.text_data_en[? "menu_difficulty"] = "Difficulty";
	global.text_data_en[? "menu_modifiers"] = "Modifiers";
	global.text_data_en[? "menu_settings"] = "Settings";
	global.text_data_en[? "menu_exit"] = "Exit";
	
	global.text_data_en[? "menu_difficulty_easy"] = "Easy";
	global.text_data_en[? "menu_difficulty_normal"] = "Normal";
	global.text_data_en[? "menu_difficulty_hard"] = "Hard";
	global.text_data_en[? "menu_difficulty_lunatic"] = "Lunatic";
	global.text_data_en[? "menu_difficulty_lastword"] = "Last\n  Word";
	
	global.text_data_en[? "menu_difficulty_easy_desc"] = "(Eh? Easy-Modo?)\nA difficulty for those who dislike stress whilst playing.\n\nThe fun in difficulty is somewhat present but yawn-inducing at best.\n\nRecommended for the casual players.";
	global.text_data_en[? "menu_difficulty_normal_desc"] = "A difficulty that is considered, well, normal.\nIt's also the default difficulty for this current series.\n\nDifficulty will be more potent but not rage inducing.\n\nRecommended for bullet-hell players."
	global.text_data_en[? "menu_difficulty_hard_desc"] = "A difficulty that is not for the light-hearted.\n\nExpect a lot of trial and error.\nBad times are guarenteed.\n\nRecommended for masochists."
	global.text_data_en[? "menu_difficulty_lunatic_desc"] = "A difficulty that laughs at your face as you die over and over again.\nNot player friendly.\n\nRecommended for lunatics."
	global.text_data_en[? "menu_difficulty_lastword_desc"] = "A difficulty option where all bosses have only a single attack to offer, but it's one of the harder, confounding attacks in their arsenal. The main aim is usually survive without being hit till time runs out.\n\nAnything goes.\n\nDoes not progress current route."
	
	global.text_data_en[? "menu_difficulty_easy_alt"] = "Undertale soul mechanics and attacks within the story.\nLess intense attacks.\nBetter and more items.";
	global.text_data_en[? "menu_difficulty_normal_alt"] = "Rotating shield for Green soul.\nRed attacks that remove max health.\nBullet hell styled attacks.\nNormal amount of items.";
	global.text_data_en[? "menu_difficulty_hard_alt"] = "Rotating shield for Green soul.\nRed attacks instant kill and more of them.\nBullet hell styled attacks with more bullets.\nLow amount of items.";
	global.text_data_en[? "menu_difficulty_lunatic_alt"] = "Rotating shield for Green soul.\nRed attacks instant kill and even more of them.\nThe screen is a bullet\nVery few items.";
	
	#endregion
	
	#region Tutorial
	global.text_data_en[? "tutorialstart_levelname"] = "???";
	global.text_data_en[? "tutorialstart_leveldescription"] = "You wake up stood against a blinding light.&Your memories have faded and you have no&clue to where you are or what to expect.&The only thing you have is your DETERMINATION.";
	global.text_data_en[? "tutorialstart_levelquote"] = "\"The first of many\"";
	
	global.text_data_en[? "tutorial_levelname"] = "Tutorial";
	global.text_data_en[? "tutorial_leveldescription"] = "The tutorial stage. Learn or refresh your&memory on the game mechanics, as well as&some mechanics that have been modified.&&The attacks in this stage consist of all&SOUL modes and attack types. It's to simply&get the player used to the mechanics of the&game. The attacks here are relatively easy&and deal pitiful damage. Dying here is an&embarrassment.";
	global.text_data_en[? "tutorial_levelquote"] = "\"The boss cannot be attacked. Furthermore, the tutorial&stage is the same regardless of the route you've picked. As&for the boss itself, all will be revealed in due time.\"";	
	
	global.text_data_en[? "tutorial_intro_spe_0"] = "Greetings, human./";
	global.text_data_en[? "tutorial_intro_spe_1"] = "You may be curious&as to what is&happening.../";
	global.text_data_en[? "tutorial_intro_spe_2"] = "Don't worry^1.&Your curiosity is&only natural./";
	global.text_data_en[? "tutorial_intro_spe_3"] = "This place is&actually your world./";
	global.text_data_en[? "tutorial_intro_spe_4"] = "It is simply&rebooting from the&space-time&distortion that hit&it./";
	global.text_data_en[? "tutorial_intro_spe_5"] = "Unfortunately, the&overworld couldn't&be repaired./";
	global.text_data_en[? "tutorial_intro_spe_6"] = "@XYour world now&solely exists upon @Revents.@X/";
	global.text_data_en[? "tutorial_intro_spe_7"] = "Events that depend&on what you do./";
	global.text_data_en[? "tutorial_intro_spe_8"] = "That is essentially&the basics of what&this place is./";
	global.text_data_en[? "tutorial_intro_spe_9"] = "Now^2.^2.^2.&There is one issue&I'd like to discuss./";
	global.text_data_en[? "tutorial_intro_spe_10"] = "Your memory^2.^2.^2./";
	global.text_data_en[? "tutorial_intro_spe_11"] = "Unfortunately&you've lost&pretty much most of&your memory./";
	global.text_data_en[? "tutorial_intro_spe_12"] = "Even your name.../";
	global.text_data_en[? "tutorial_intro_spe_13"] = "Except, of course&your motor skills^3.&...Hopefully./";
	global.text_data_en[? "tutorial_intro_spe_14"] = "Otherwise, your&basic knowledge of&the world has faded./";
	global.text_data_en[? "tutorial_intro_spe_15"] = "Which is quite&problematic.../";
	global.text_data_en[? "tutorial_intro_spe_16"] = "For now the world&ceases to proceed,&until you're there&to determine the&outcome./";
	global.text_data_en[? "tutorial_intro_spe_17"] = "But how does one&do so without&a proper grasp&of said world?/";
	global.text_data_en[? "tutorial_intro_spe_18"] = "Fear not...&That's why I'm here./";
	global.text_data_en[? "tutorial_intro_spe_19"] = "The name is Earnaro.&My job is^2.^2.^2./";
	global.text_data_en[? "tutorial_intro_spe_20"] = "To help you recover&the knowledge that you've&forgotten./";
	global.text_data_en[? "tutorial_intro_spe_21"] = "Before you proceed&once more./%";
	
	global.text_data_en[? "tutorial_battle_fla_0"] = "* It Begins.";
	global.text_data_en[? "tutorial_battle_fla_1"] = "* The light hurts your eyes.";
	global.text_data_en[? "tutorial_battle_fla_2"] = "* Smells like 0s and 1s.";
	global.text_data_en[? "tutorial_battle_fla_3"] = "* You're oddly taking this quite well.";
	global.text_data_en[? "tutorial_battle_fla_4"] = "* You're starting to get the hang of it.";
	global.text_data_en[? "tutorial_battle_fla_5"] = "* You wonder how you're standing on&  nothing.";
	global.text_data_en[? "tutorial_battle_fla_6"] = "* You feel like you know what's coming&  up next.";
	
	global.text_data_en[? "tutorial_battle_spe_0_0"] = "Let's discuss&survival.../";
	global.text_data_en[? "tutorial_battle_spe_0_1"] = "If an attack comes&your way, simply&move away from it./%";
	
	global.text_data_en[? "tutorial_battle_spe_1_0"] = "@XIf a @Llight-blue&@Xattack approaches,&stay completely&still./%";
	
	global.text_data_en[? "tutorial_battle_spe_2_0"] = "@XIf an @Oorange attack&@Xapproaches, be sure&to keep moving./%";
	
	global.text_data_en[? "tutorial_battle_spe_3_0"] = "Let's discuss SOUL&modes now.../";
	global.text_data_en[? "tutorial_battle_spe_3_1"] = "@XIf you find that&your SOUL is @Bblue,&@Xyour SOUL will be&affected by gravity./";
	global.text_data_en[? "tutorial_battle_spe_3_2"] = "@XIn this scenario,&press @R@*W@X to jump./%";
	
	
	global.text_data_en[? "tutorial_battle_spe_4_0"] = "@XIf your SOUL is&@GGreen@X, you're given&a shield to deflect&incoming attacks./";
	global.text_data_en[? "tutorial_battle_spe_4_1"] = "@XPress @R@*H.&@Xto change the angle./%";
	
	global.text_data_en[? "tutorial_battle_spe_5_0"] = "@XIf your SOUL is&@PPurple@X, you will be&confined to move&along a set of @Pstrings./";
	global.text_data_en[? "tutorial_battle_spe_5_1"] = "@XPress @R@*V&@Xto shift between strings./%";
	
	global.text_data_en[? "tutorial_battle_spe_6_0"] = "@XIf your SOUL is&@YYellow@X, you're&given the ability&to shoot bullets at&opposing attacks./";
	global.text_data_en[? "tutorial_battle_spe_6_1"] = "@XPress @R@*Z&@X to shoot./%";
	
	global.text_data_en[? "tutorial_intermissionspeech_0"] = "It appears you have&regained an&understanding to&how your world&works./";
	global.text_data_en[? "tutorial_intermissionspeech_1"] = "As such, this is&where I shall leave&things./";
	global.text_data_en[? "tutorial_intermissionspeech_2"] = "However..^3.&Times have changed./";
	global.text_data_en[? "tutorial_intermissionspeech_3"] = "Circumstances have&become more&difficult.../";
	global.text_data_en[? "tutorial_intermissionspeech_4"] = "And it's hard to&tell if you're&truly ready to step&foot out there.../";
	global.text_data_en[? "tutorial_intermissionspeech_5"] = "And fulfill the&destiny you so&desire./";
	global.text_data_en[? "tutorial_intermissionspeech_6"] = "Without your proper&guidance^1.^1.^1.&This world may be&stuck in a loop^1.^1.^1./";
	global.text_data_en[? "tutorial_intermissionspeech_7"] = "^1.^1.^1.Of you dying&and resetting^1.^1.^1./";
	global.text_data_en[? "tutorial_intermissionspeech_8"] = "As such, I shall&test your limits./";
	global.text_data_en[? "tutorial_intermissionspeech_9"] = "Survive these&attacks^1.^1.^1.&And you may proceed./";
	global.text_data_en[? "tutorial_intermissionspeech_10"] = "If not^1.^1.^1.&You'll have to stay&here until you do^1.^1.^1./%";
	
	global.text_data_en[? "tutorial_battle2_fla_0"] = "* Your final test.";
	global.text_data_en[? "tutorial_battle2_fla_1"] = "* Your sense of balance is deteriorating.";
	global.text_data_en[? "tutorial_battle2_fla_2"] = "* You wonder how long this pathway is.";
	global.text_data_en[? "tutorial_battle2_fla_3"] = "* You wonder when it will all end.";
	global.text_data_en[? "tutorial_battle2_fla_4"] = "* You wonder aimlessly...";
	global.text_data_en[? "tutorial_battle2_fla_5"] = "* You've lost sense of time.";
	global.text_data_en[? "tutorial_battle2_fla_6"] = "* You don't know what to think anymore.";
	global.text_data_en[? "tutorial_battle2_fla_7"] = "* You've reached the end.";
	
	global.text_data_en[? "tutorial_end_spe_0"] = "^1.^1.^1./";
	global.text_data_en[? "tutorial_end_spe_1"] = "It appears that&the system has^1.^1.^1.&overworked itself./";
	global.text_data_en[? "tutorial_end_spe_2"] = "Your determination&has surpassed the&system's current&capabilities./";
	global.text_data_en[? "tutorial_end_spe_3"] = "It has ended up&straining itself&excessively^1.^1.^1./";
	global.text_data_en[? "tutorial_end_spe_4"] = "Therfore, it has&shifted to recovery&mode./";
	global.text_data_en[? "tutorial_end_spe_5"] = "Thereby, inhibiting.&my will to fight./";
	global.text_data_en[? "tutorial_end_spe_6"] = "^1.^1.^1./";
	global.text_data_en[? "tutorial_end_spe_7"] = "I'm convinced now...&You are more than&capable of handling&the challenges that&lie ahead./";
	global.text_data_en[? "tutorial_end_spe_8"] = "Before you go&however...&I feel the need to&show you something./%";
	
	global.text_data_en[? "tutorial_endmenu_spe_0"] = "You've seen these&buttons, yes?/";
	global.text_data_en[? "tutorial_endmenu_spe_1"] = "These were the&'events' I was&talking about./";
	global.text_data_en[? "tutorial_endmenu_spe_2"] = "The events that you&see here, are ones&that would normally&appear./";
	global.text_data_en[? "tutorial_endmenu_spe_3"] = "Thus you can choose&which one to&activate willingly./";
	global.text_data_en[? "tutorial_endmenu_spe_4"] = "However, there's&another type of&event.../";
	global.text_data_en[? "tutorial_endmenu_spe_5"] = "Called distortion&events.../";
	global.text_data_en[? "tutorial_endmenu_spe_6"] = "They only appear&at random...&Meaning, you can't&activate it via&normal means./";
	global.text_data_en[? "tutorial_endmenu_spe_7"] = "Once one occurs,&a warning will pop&up./";
	global.text_data_en[? "tutorial_endmenu_spe_8"] = "As for the&encounter.../";
	global.text_data_en[? "tutorial_endmenu_spe_9"] = "Well.&Be prepated for the&unexpected.../%";
	
	global.text_data_en[? "tutorial_final_spe_0"] = "That is all, human./";
	global.text_data_en[? "tutorial_final_spe_1"] = "Hopefully, you are&well prepared for&the challenges&ahead./";
	global.text_data_en[? "tutorial_final_spe_2"] = "Everything is in&your hands now.../";
	global.text_data_en[? "tutorial_final_spe_3"] = "I must be off.../";
	global.text_data_en[? "tutorial_final_spe_4"] = "I'm of no use to&you now.../";
	global.text_data_en[? "tutorial_final_spe_5"] = "And with that...&Farewell.../";
	global.text_data_en[? "tutorial_final_spe_6"] = "Till we meet again./%"; // Don't know where, don't know when
	
	global.text_data_en[? "tutorial_finalblurb_0"] = "* You wake up...";
	global.text_data_en[? "tutorial_finalblurb_1"] = "* It was all a dream...";
	global.text_data_en[? "tutorial_finalblurb_2"] = "* But the place around you is unfamiliar...";
	global.text_data_en[? "tutorial_finalblurb_3"] = "* And you remain peturbed at who you even are...";
	global.text_data_en[? "tutorial_finalblurb_4"] = "* But...";
	global.text_data_en[? "tutorial_finalblurb_5"] = "* Maybe, with what little memory you have.";
	global.text_data_en[? "tutorial_finalblurb_6"] = "* You can be someone else.";
	#endregion
	#region Toriel the Overseer
	
	global.text_data_en[? "genotoriel_levelname"] = "Toriel The Overseer";
	global.text_data_en[? "genotoriel_leveldescription"] = "Paranoid of the numerous disappearances of&the monsters living in the RUINS, Toriel&urges for you to stay at her home, with you&refusing. As such, you leave her with no&choice but to use force to keep you locked&up for good.&&Toriel the Overseer emphasises on&numerous flame bullets in erratic patterns,&however they are slow. Additionally, they&deal mediocre damage for what they're worth.&Keep your cool and stay focused.";
	global.text_data_en[? "genotoriel_levelquote"] = "\"Toriel the Overseer is inspired by Egyptian&Mythology. I've always had this Egyptian&vibe whenever Heartache plays and whenever I&see her robe. As such, I gave her wings and&an \"Horus-esque\" eye as her symbol to also&represent the whole 'Overseer' title.\"";	
	
	#endregion
}