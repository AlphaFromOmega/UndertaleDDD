

cornerOffset = new Vector2(room_width/2.5, -room_height/2);
targetPosition = 32;
x = -(cornerOffset.x + targetPosition);
y = room_height - 32;


cornerPosition = new Vector2();
cornerPosition.x = x + cornerOffset.x;
cornerPosition.y = y + cornerOffset.y;

cornerOffset2 = new Vector2(room_width/6, -room_height/2);
cornerPosition2 = new Vector2();
cornerPosition2.x = x + cornerOffset2.x;
cornerPosition2.y = y + cornerOffset2.y;

menuAlpha = 1;
menuExit = false;
menuOptions = ["Easy", "Normal", "Hard", "Lunatic", "Last\n   Word", "Exit"]
menuDescription =	[
						"(Eh? Easy-Modo?)\nA difficulty for those who dislike stress whilst playing.\n\nThe fun in difficulty is somewhat present but yawn-inducing at best.\n\nRecommended for the casual players.",
						"A difficulty that is considered, well, normal.\nIt's also the default difficulty for this current series.\n\nDifficulty will be more potent but not rage inducing.\n\nRecommended for bullet-hell players.",
						"A difficulty that is not for the light-hearted.\n\nExpect a lot of trial and error.\nBad times are guarenteed.\n\nRecommended for masochists.",
						"A difficulty that laughs at your face as you die over and over again.\nNot player friendly.\n\nRecommended for lunatics.",
						"A difficulty option where all bosses have only a single attack to offer, but it's one of the harder, confounding attacks in their arsenal. The main aim is usually survive without being hit till time runs out.\n\nAnything goes.\n\nDoes not progress current route."
					]
menuSelected = 0;