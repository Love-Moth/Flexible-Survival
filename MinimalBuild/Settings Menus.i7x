Version 3 of Settings Menus by MinimalBuild begins here.
[Version 3.3 - Inventory columns option added]
[- Originally Authored By: Stripes -]

Section 1 - Trixie's Setting and Cheat Menu

Trixiecheating is an action applying to nothing.
weakwilled is a truth state that varies.

understand "Trixiecheat" as Trixiecheating.
understand "iwannacheat" as Trixiecheating.
understand "i wanna cheat" as Trixiecheating.

check Trixiecheating:
	if Trixie is not visible, say "Only Trixie can help you with that." instead;

carry out Trixiecheating:
	let Unerring Hunter be "Unerring Hunter";
	let Automatic Survival be "Automatic Survival";
	let Open World be "Open World";
	let Lil Better be "Lil Better";
	let Remove Carry Limits be "Remove Carry Limits";
	say "     Now, this stuff here is outright cheating, but if you really want to do it, I can help you out with that. It doesn't come for free though. You'll take a knock to your score, though I'll give half that back if you turn the cheat off later.";
	let Trixieexit be 0;
	while Trixieexit is 0:
		say "[bold type]Unerring Hunter[roman type] will let you automatically succeed while hunting as long as your target exists in the area. You'll also be able to call up lists of all local enemies and active situations. [bold type]Automatic Survival[roman type] removes your need for food and water. [bold type]Open World[roman type] grants you access to all nav points which aren't private (locked by event or NPC). [bold type]Lil Better[roman type] gives +1 to all stats. [bold type]Booster Feats[roman type] gives you one additional basic and fun feats. [bold type]Play On[roman type] removes the time limit to the game. [bold type]Weak-Willed[roman type] makes you prone to spontaneously surrendering during combat. [bold type]Remove Carry Limits[roman type] allows you to carry as many things as you want. You can also set your [bold type]humanity[roman type] or [bold type]libido[roman type] to any number from 0 to 100.";
		say "[bold type]Cheats:[roman type][line break]";
		say "[link](1) Unerring Hunter[as]1[end link] - [if Unerring Hunter is listed in feats of Player]Active[else]Inactive[end if][line break]";
		say "[link](2) Automatic Survival[as]2[end link] - [if Automatic Survival is listed in feats of Player]Active[else]Inactive[end if][line break]";
		say "[if Open World is listed in feats of Player](3) Open World cannot be deactivated[else][link](3) Open World[as]3[end link] - Inactive (Cannot be deactivated)[end if][line break]";
		say "[link](4) Lil Better[as]4[end link] - [if Lil Better is listed in feats of Player]Active[else]Inactive[end if][line break]";
		say "[if boosterfeats > 0](5) Booster Feats cannot be deactivated[else][link](5) Booster Feats[as]5[end link] - Inactive (Cannot be deactivated)[end if][line break]";
		say "[link](6) Play On[as]6[end link] - [if playon is 0]Inactive[else]Active[end if] (Score halved to reactivate)[line break]";
		say "[link](7) Weak-Willed[as]7[end link] - [if weakwilled is true]Active[else]Inactive[end if] (Bonus if activated)[line break]";
		say "[link](8) Set Humanity[as]8[end link] - Current Humanity: [bold type][humanity of Player][roman type][line break]";
		say "[link](9) Set Libido[as]9[end link] - Current Libido: [bold type][Libido of Player][roman type][line break]";
		say "[link](10) Insomniac[as]10[end link] - [if Terminatorsleep is false][bold type]Off[roman type] - You must sleep occasionally[else if Terminatorsleep is true][bold type]On[roman type] - You do not require sleep[else]Error[end if][line break]";
		say "[link](11) Remove Carry Limits[as]11[end link] -[if Remove Carry Limits is listed in Traits of Player]Active[else]Inactive[end if][line break]";
		LineBreak;
		say "[bold type]Game settings:[roman type][line break]";
		say "[link](12) Set anal play content level[as]12[end link] - Currently: [bold type][if anallevel is 1]Less Anal[else if anallevel is 2]Standard[else]More Anal[end if][roman type][line break]";
		say "[link](13) Set watersports (WS) content level[as]13[end link] - Currently: [bold type][if WSlevel is 1]No WS[else if WSlevel is 2]Standard[else]Full WS[end if][roman type][line break]";
		say "[link](15) Set egg-pregnancy (ovi) content level[as]15[end link] - Currently: [bold type][if ovipreglevel is 1]No Ovi[else if ovipreglevel is 2]Standard[else]Always Ovi[end if][roman type][line break]";
		[say "[link](16) Adjust flags[as]16[end link] - View/change warding settings[line break]";]
		say "[link](0) Abort[as]0[end link][line break]";
		while 1 is 1:
			say "Choice? (0-15)> [run paragraph on]";
			get a number;
			if calcnumber >= 0 and calcnumber <= 15:
				break;
			else:
				say "Invalid choice. Pick from 0 to 15.";
		if calcnumber is:
			-- 1:
				if "Unerring Hunter" is listed in feats of Player:
					remove "Unerring Hunter" from feats of Player;
					increase score by 250;
					say "Your 'Unerring Hunter' cheating ability has been removed.";
				else:
					add "Unerring Hunter" to feats of Player;
					decrease score by 500;
					say "You have gained the 'Unerring Hunter' cheat, but are penalized 500 points.";
					say "You now have access to the 'huntinglist' listing (appearing as [bracket]Enemies[close bracket])."; [See MinimalBuild/Hunting.i7x]
					say "You now have access to the 'situationlist' listing (appearing as [bracket]Situations[close bracket])."; [See MinimalBuild/Hunting.i7x]
			-- 2:
				if "Automatic Survival" is listed in feats of Player:
					remove "Automatic Survival" from feats of Player;
					say "Your 'Automatic Survival' cheating ability has been removed.";
					increase score by 300;
				else:
					add "Automatic Survival" to feats of Player;
					decrease score by 600;
					say "You have gained the 'Automatic Survival' cheat, but are penalized 600 points.";
			-- 3:
				if "Open World" is listed in feats of Player:
					say "This ability cannot be removed once gained.";
				else:
					add "Open World" to feats of Player;
					decrease score by 400;
					say "You have gained the 'Open World' cheat, but are penalized 400 points.";
					repeat with Q running through fasttravel not private rooms:
						now Q is known;
					now Approaching the Capitol Building is known;
					now Plant Overview is known;
					now College Campus is known;
			-- 4:
				if "Lil Better" is listed in feats of Player:
					remove "Lil Better" from feats of Player;
					say "Your 'Lil Better' cheating ability has been removed.";
					increase score by 200;
					StatChange "Strength" by -1;
					StatChange "Dexterity" by -1;
					StatChange "Stamina" by -1;
					StatChange "Intelligence" by -1;
					StatChange "Charisma" by -1;
					StatChange "Perception" by -1;
				else:
					add "Lil Better" to feats of Player;
					decrease score by 400;
					say "You have gained the 'Lil Better' cheat, but are penalized 400 points.";
					StatChange "Strength" by 1;
					StatChange "Dexterity" by 1;
					StatChange "Stamina" by 1;
					StatChange "Intelligence" by 1;
					StatChange "Charisma" by 1;
					StatChange "Perception" by 1;
			-- 5:
				if boosterfeats > 0:
					say "This ability cannot be removed once gained.";
				else:
					add "Booster Feats" to feats of Player;
					now boosterfeats is 1;
					say "You have gained the 'Booster Feats' cheat, but are penalized 400 points. Pick your feats:";
					featget;
					funfeatget;
					decrease score by 400;
			-- 6:
				if playon is 1:
					now playon is 0;
					say "Play On has been deactivated[if score > 0] and your score halved[end if]. The end is nigh.";
					if turns <= targetturns + 8:
						now targetturns is turns - 8;
						say "You have been granted one final day.";
					if score > 0, now score is score / 2;
				else:
					now playon is 1;
					say "Play On has been activated. You are now in extended play mode. The rescue will never come.";
			-- 7:
				if weakwilled is true:
					now weakwilled is false;
					decrease score by 250;
					say "Your 'Weak-Willed' flaw has been removed, and you are penalized 250 points.";
				else:
					now weakwilled is true;
					increase score by 250;
					say "You have gained the 'Weak-Willed' flaw, but are rewarded 250 points.";
					say "You now will find yourself increasingly tempted to spontaneously submit during fights as your libido increases.";
			-- 8:
				say "Set your humanity (1-100) or 0 to abort> [run paragraph on]";
				get a number;
				if calcnumber > 0 and calcnumber <= 100:
					now humanity of Player is calcnumber;
					say "Humanity adjusted. Score penalized by 50.";
					decrease score by 50;
				else:
					say "Invalid choice - returning to menu.";
			-- 9:
				say "Set your libido (1-100) or 0 to abort> [run paragraph on]";
				get a number;
				if calcnumber > 0 and calcnumber <= 100:
					now Libido of Player is calcnumber;
					say "Libido adjusted. Score penalized by 50.";
					decrease score by 50;
				else:
					say "Invalid choice - returning to menu.";
			-- 10:
				if Terminatorsleep is false:
					if "Well Rested" is listed in feats of Player: [They have slept recently, reduce/remove feat.]
						FeatLoss "Well Rested";
						say "     Due to activating [bold type]Insomniac[roman type] You have lost the 'Well Rested' Feat, and all stats have decreased by 2 as a result.";
						StatChange "Strength" by -2 silently;
						StatChange "Dexterity" by -2 silently;
						StatChange "Stamina" by -2 silently;
						StatChange "Charisma" by -2 silently;
						StatChange "Intelligence" by -2 silently;
						StatChange "Perception" by -2 silently;
					if TerminatorSleepActivated is false:
						now TerminatorSleepActivated is True;
						decrease score by 100;
					now Terminatorsleep is true;
					say "You no longer require sleep.";
					LineBreak;
				else if Terminatorsleep is true:
					now Terminatorsleep is false;
					say "You will now need to rest every now and then.";
					LineBreak;
				else:
					say "Error";
			-- 11:
				if "Remove Carry Limits" is not listed in traits of Player:
					add "Remove Carry Limits" to Traits of Player;
					say "You can no longer be overburdened.";
				else:
					TraitLoss "Remove Carry Limits" for Player;
					say "You can now be overburdened.";
			-- 12:
				try analadjusting;
			-- 13:
				try WSadjusting;
			-- 15:
				try Oviadjusting;
			[
			-- 16:
				new ban menu;
			]
			-- 0:
				say "Exiting menu.";
				now Trixieexit is 1;
		wait for any key;
		clear the screen and hyperlink list;

Chapter 1 - AnalLevel Adjustment

analadjusting is an action applying to nothing.

understand "adjust anal" as analadjusting.
understand "adjustanal" as analadjusting.
understand "anal adjust" as analadjusting.
understand "analadjust" as analadjusting.

carry out analadjusting:
	say "[special-style-2]NOTICE[roman type]: This mechanic is a newer addition than most of the content in the game, and so is not in effect everywhere. While some older content has been adjusted to include checks/adjustments based on it, it is more frequent on newer content.";
	say "     This option will allow you to adjust your desired level for anal play in the game. This choice will [bold type]not[roman type] affect all scenes nor will it eliminate/guarantee anal play in many cases. It will simply be a means of telling specific scenes to provide alternate versions or add/remove portions of involving anal sex and anal play if they have been set to detect it. In some cases it will adjust the frequency with which anal scenes will occur for a given encounter. As a note, [bold type]paid requests[roman type] to make these adjustments to a given character or creature not currently using them can be taken on through the [bold type]Writer for Hire[roman type] project, though some restrictions may apply in certain cases.";
	say "     With that said, choosing:[line break]";
	say "- [link](1) Less Anal[as]1[end link] will indicate that you're looking to see less anal sex in your game. In some cases, it may alternate to another possible sex scene (such as oral), a non-sexual scene or simply have you driven off. This change may be automatic or be induced randomly. Keep in mind that many NPCs and creatures have sexual preferences of their own and so you could still encounter M/M and anal sex even if this preference is chosen.";
	say "- [link](2) Normal[as]2[end link] will indicate that you'd like the game's standard level of anal sex. Some scenes with males/herms may result in anal sex, though other forms of anal play will be rare.";
	say "- [link](3) More Anal[as]3[end link] will indicate that you're open to view anal sex more frequently. Some scenes may also use this as an indicator to insert additions for other forms of anal play (fingering, rimming, prostate stimulation, etc...) if they exist for the base scene. You may even encounter the rare instance of anal sex with a female occurring. Again as stated above, many NPCs and creatures have their own sexual preferences to consider, so the degree of change (if any) that may occur will vary.";
	say "- [link](0) Exit[as]0[end link]: Leave this menu. You are currently set as [bold type][if anallevel is 1]Less Anal[else if anallevel is 2]Normal[else]More Anal[end if][roman type].";
	now calcnumber is -1;
	while calcnumber < 0 or calcnumber > 3:
		say "Choice? (0-3)>[run paragraph on]";
		get a number;
	if calcnumber is 1:
		say "You are now set to receive Less Anal.";
		now anallevel is 1;
		if "More Anal" is listed in feats of Player, remove "More Anal" from feats of Player;
		if "Less Anal" is not listed in feats of Player, add "Less Anal" to feats of Player;
	else if calcnumber is 2:
		say "You are now set to receive the standard amount of anal sex.";
		now anallevel is 2;
		if "More Anal" is listed in feats of Player, remove "More Anal" from feats of Player;
		if "Less Anal" is listed in feats of Player, remove "Less Anal" from feats of Player;
	else if calcnumber is 3:
		say "You are now set to receive More Anal.";
		now anallevel is 3;
		if "Less Anal" is listed in feats of Player, remove "Less Anal" from feats of Player;
		if "More Anal" is not listed in feats of Player, add "More Anal" to feats of Player;
	else:
		say "Exiting menu.";
		LineBreak;

Chapter 2 - WSLevel Adjustment

WSadjusting is an action applying to nothing.

understand "adjust WS" as WSadjusting.
understand "adjustWS" as WSadjusting.
understand "WS adjust" as WSadjusting.
understand "WSadjust" as WSadjusting.

carry out WSadjusting:
	say "[special-style-2]NOTICE[roman type]: This mechanic has just been implemented and will have little to no effect during most of game play. While there is currently little WS content in the game, this mechanic will eventually be tied into them to allow players to adjust its inclusion to their comfort level. Expect to see it come into use gradually and predominantly in newer content.";
	say "     This option will allow you to adjust your desired level for watersports (piss play) in the game. On the whole, such scenes are currently uncommon in the game, but having access to this toggle will allow creators to make its appearance function based on your current setting for it. This choice will simply be a means of telling specific scenes to provide alternate versions or add/remove portions involving WS content if they have been set to detect it. In some cases, it will adjust the frequency with which WS scenes will occur for a given encounter. While most content in the game will not involve WS play, [bold type]paid requests[roman type] can be taken to add these adjustments to a given creature/NPC using the [bold type]Writer for Hire[roman type] project, though some restrictions may apply in certain cases.";
	say "     With that said, choosing:[line break]";
	say "- [link](1) No WS[as]1[end link] will indicate that you're looking to not see any WS in your game. This will either skip that portion of the content or pick one of the other available scenes. Keep in mind that there may be a few scenes where you are asked if you want to be involved in WS and those prompts (and their associated scenes) may still be active, but you can pick the non-activation option for them at that time. Should you have this setting active and get a WS scene in the game, do prompt us via the forums or blog so we might check on the issue as well - we are still implementing this mechanic.";
	say "- [link](2) Standard[as]2[end link] will indicate that you're okay with a low level of WS content, should it happen to come up. Only some creatures/NPCs are active about including WS in their actions, so having this setting will keep their use of it infrequent.";
	say "- [link](3) Full WS[as]3[end link] will indicate that you're open to view WS more often. Some WS content may only be accessible via this setting, while in other cases it will raise the frequency of WS being shown. Similarly, more detail might be thrown into a scene at this level. Again, the amount of WS content presently in the game is rare, but setting yourself to this level will get the most out of it.";
	say "- [link](0) Exit[as]0[end link]: Leave this menu. You are currently set as [bold type][if wslevel is 1]No WS[else if wslevel is 2]Standard (Low WS)[else]Full WS[end if][roman type].";
	now calcnumber is -1;
	while calcnumber < 0 or calcnumber > 3:
		say "Choice? (0-3)>[run paragraph on]";
		get a number;
	if calcnumber is 1:
		say "You are now set to receive No WS.";
		now WSlevel is 1;
	else if calcnumber is 2:
		say "You are now set to receive the Standard (low) amount of WS content.";
		now WSlevel is 2;
	else if calcnumber is 3:
		say "You are now set to receive Full WS.";
		now WSlevel is 3;
	else:
		say "Exiting menu.";
		LineBreak;

Chapter 4 - OviPregLevel Adjustment

oviadjusting is an action applying to nothing.

understand "adjust ovi" as oviadjusting.
understand "adjustovi" as oviadjusting.
understand "ovi adjust" as oviadjusting.
understand "oviadjust" as oviadjusting.
understand "ovi menu" as oviadjusting.
understand "ovimenu" as oviadjusting.

carry out oviadjusting:
	say "[special-style-2]NOTICE[roman type]: This mechanic has just been implemented and will take a little time while scenes and creature and NPCs are changed over to impregnate the player with eggs as their default.";
	say "     This option will allow you to adjust whether some of the creatures out there are able to impregnate your player with eggs instead of live young. If you don't desire to have your player lay eggs, here's the place to adjust that. Please keep in mind that this applies only to female births, as male birth will be via eggs regardless of this setting.";
	say "     With that said, choosing:[line break]";
	say "- [link](1) No Ovi[as]1[end link] will indicate that you're looking to not have your player possibly bearing eggs. All female pregnancies will be live young and MPreg to FPreg swaps will be treated as live births as well.";
	say "- [link](2) Standard[as]2[end link] will indicate that you're okay with being impregnated with eggs, if that's the creature's normal result.";
	say "- [if ovipregalways is true][link](3) Always Ovi[as]3[end link] will indicate that you want all births to be eggs, regardless of their sire's normal result[else](3) Always Ovi is not yet accessible to your character. You'll need to find a way in the game to change yourself to always bear eggs before being able to choose this option[end if].";
	say "- [link](0) Exit[as]0[end link]: Leave this menu. You are currently set as [bold type][if ovipreglevel is 1]No Ovi[else if ovipreglevel is 2]Standard (Some Ovi)[else]Always Ovi[end if][roman type].";
	now calcnumber is -1;
	while calcnumber < 0 or calcnumber > 3:
		say "Choice? (0-3)>[run paragraph on]";
		get a number;
	if calcnumber is 1:
		say "You are now set to not bear eggs.";
		now ovipreglevel is 1;
	else if calcnumber is 2:
		say "You are now set to bear eggs only when specifically prompted.";
		now ovipreglevel is 2;
	else if calcnumber is 3:
		if ovipregalways is true:
			say "You are now set to bear eggs always.";
			now ovipreglevel is 3;
		else:
			say "You are not able to choose this option without alteration to your character's pregnancy abilities.";
	else:
		say "Exiting menu.";
		LineBreak;

Chapter 5 - Ban/Ward Flag Adjustment

Flagadjusting is an action applying to nothing.

understand "adjust flags" as Flagadjusting.
understand "adjustflags" as Flagadjusting.
understand "flagsadjust" as Flagadjusting.
understand "flags adjust" as Flagadjusting.
understand "adjust flag" as Flagadjusting.
understand "adjustflag" as Flagadjusting.
understand "flagadjust" as Flagadjusting.
understand "flag adjust" as Flagadjusting.

carry out Flagadjusting:
	say "     This menu will allow you to adjust whether certain categories of content will be warded or not now that the game has started. Warded content will not appear unless it is specifically hunted for or is called upon by events or quests. If a creature has multiple gender forms, which gender will appear may be adjusted based on the warded flags. Now that the game has started, you cannot change whether something is banned outright.";
	let flagexit be 0;
	while flagexit is 0:
		let x be 0;
		repeat with Q running through flags:
			if Q is warded:
				increase x by 1;
				say "- [link]([x]) [Q][as][x][end link]: [special-style-1]WARDED[roman type][line break]";
			else if Q is banned:
				say "- [Q]: [special-style-2]BANNED[roman type][line break]";
			else:
				increase x by 1;
				say "- [link]([x]) [Q][as][x][end link]: [bold type]ACTIVE[roman type][line break]";
		say "- [link](0) Exit menu[as]0[end link][line break]";
		now calcnumber is -1;
		while calcnumber < 0 or calcnumber > x:
			say "Choice? (0-[x])>[run paragraph on]";
			get a number;
		if calcnumber is 0:
			now flagexit is 1;
		else:
			let y be 0;
			repeat with Q running through not banned flags:
				increase y by 1;
				if y is calcnumber:
					if Q is warded:
						now Q is not warded;
					else if Q is banned:
						say "Error occurred, choice [printed name of Q] is banned.";
					else:
						now Q is warded;

Part 2 - Single Setting Commands

Chapter 1 - HyperLink Adjustment

HyperlinksActivated is an action applying to nothing.
understand "Hyper On" as HyperlinksActivated.

carry out HyperlinksActivated:
	now hypernull is 0;

HyperlinksDeactivated is an action applying to nothing.
understand "Hyper Off" as HyperlinksDeactivated.

carry out HyperlinksDeactivated:
	now hypernull is 1;

Chapter 2 - WaitHate Adjustment

WaitHateFunction is an action applying to nothing.
WaitHateCommand is an action applying to nothing.
understand "waits off" as WaitHateCommand.
understand "i hate to wait" as WaitHateCommand. [old command, keep for time being, eventually remove?]

carry out WaitHateCommand:
	WaitHateFunction;

To WaitHateFunction:
	now waiterhater is 1; [yes, you do hate to wait]
	say "The text rarely waits for you to press a key...[line break]... before continuing.";

WaitLoveFunction is an action applying to nothing.
WaitLoveCommand is an action applying to nothing.
understand "waits on" as WaitLoveCommand.
understand "i love to wait" as WaitLoveCommand. [old command, keep for time being, eventually remove?]

carry out WaitLoveCommand:
	WaitLoveFunction;

To WaitLoveFunction:
	now waiterhater is 0; [returns waiting to normal]
	say "Delays waiting for a key stroke to occur.";

Chapter 3 - WaitHate Adjustment

ClearLessFunction is an action applying to nothing.
ClearLessCommand is an action applying to nothing.
understand "clears off" as ClearLessCommand.
understand "the clears are gone" as ClearLessCommand. [old command, keep for time being, eventually remove?]

carry out ClearLessCommand:
	ClearLessFunction;

To ClearLessFunction:
	now clearnomore is 1; [turns off clears]
	say "The screen clears less often.";

ClearMoreFunction is an action applying to nothing.
ClearMoreCommand is an action applying to nothing.
understand "clears on" as ClearMoreCommand.
understand "the clears are back" as ClearMoreCommand. [old command, keep for time being, eventually remove?]

carry out ClearMoreCommand:
	ClearMoreFunction;

To ClearMoreFunction:
	now clearnomore is 0; [returns clearing to normal]
	say "Screen clearing occurs frequently.";

Settings Menus ends here.
