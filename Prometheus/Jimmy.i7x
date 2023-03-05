Version 1 of Jimmy by Prometheus begins here.
[Originally by Stripes]
[Version 1.1 - Dialogue tweaked for Police Station survivors, still needs survivor info section]
[Version 1.2 - Talk Menu Added - Prometheus]
[Version 1.3 - Stat Block Added - Prometheus]

"Adds corgi NPC named Jimmy to the Flexible Survival game."

[ HP of Jimmy             ]
[ 0 - task not started    ]
[ 1 - task started        ]
[ 2 - Jimmy ran off       ]
[ 3 - Jimmy rescued       ]
[ 4 - spoke to Jimmy      ]
[ 5 - had anal sex        ]

[ hunger of Jimmy - Whether at library or not  ]
[ 0 - Jimmy at Police Station                  ]
[ 1 - Jimmy at Library                         ]
[ 2 - Jimmy at Sanctuary                       ]

a postimport rule: [bugfixing rules for players that import savegames]
	if (HP of Alexandra > 0 and HP of Alexandra < 50) and Jimmy is not in Sanctuary Hotel Lobby: [Bad Alexandra]
		move Jimmy to Sanctuary Hotel Lobby;
		now HP of Jimmy is 3;
		now hunger of Jimmy is 2;

Section 1 - Event

[Situation opened by Good Alexandra]
Table of GameEventIDs (continued)
Object	Name
Automaton Activity	"Automaton Activity"

Automaton Activity is a situation.
ResolveFunction of Automaton Activity is "[ResolveEvent Automaton Activity]". The level of Automaton Activity is 6. It is inactive.
Sarea of Automaton Activity is "Capitol".

to say ResolveEvent Automaton Activity:
	if HP of Jimmy is 0:
		say "ERROR-Jimmy-0E: Premature event activation.";
		now Automaton Activity is resolved;
	else if HP of Jimmy is 1:
		say "     Remembering Alexandra's request to check up on the automatons, you follow some tracks through the ash-filled streets. They end up leading you to a half-destroyed building with a few of the metallic people around it. As you watch, they dig through the rubble, eventually breaking into the building and pulling out a short, male corgi. The little guy struggles against them, swearing and snapping at them as he cries for help, but is no match for their robotic strength. A female automaton starts groping him with obvious intent. Knowing you certainly can't go back to Alexandra and tell her you didn't try to help him, you [if weapon object of Player is journal]raise your fists[else]ready your weapon[end if] and charge at them. Noticing your approach, one of them turns mechanically towards you, trying to catch you as well.";
		challenge "Automaton";
		if fightoutcome >= 10 and fightoutcome <= 19:			[player won]
			say "     Having dealt with the automaton, you rush towards the others. Grabbing the robotic woman by the shoulders, you pull her off the corgi's cock and shove her aside. He seems somewhat dazed, his eyes having become amber lights. Giving him a shake, he blinks a few times and his eyes return to normal as he comes to his senses. You smile and tell him you're here to help before shoving back another of the automatons. He nods and gets onto all fours, running as quickly as he can on his short, stumpy limbs. 'Come on then, let's get out of here.' After another swing to break away from the advancing automatons, you run after him. When you catch up to the little guy, he's at a crossroads, looking around the devastated streets for a place to go. Telling him you know someplace he'll be safe, you lead him out of the ash-covered ruins around the capitol building and to the police station.";
			say "     Once you're sure you won't be pursued, you slow to a walk and listen to him tell his tale. 'My name's Jimmy,' the corgi says as his short legs stride quickly to keep pace with you, 'and I've been stuck in that building since this craziness started. There was some food for a while, but eventually that ran out and I had to start eating from a bag of dog food. Tasty stuff, let me tell you,' he adds cheerfully. 'But, as you can probably guess, eating it caused me to change into a corgi. Well, at least I'm super-cute now,' he says with a canine grin, running his paws over his short, canine body.";
			say "     'When I heard the rubble being moved, I thought I was being rescued and called out for help. Little did I know those sex robots were the ones digging me out. Thanks so much for pulling me out of that mess,' he says, giving you a quick little hug with his stubby arms. Perhaps he's always been a positive fellow or he's just happy at finally having gotten out of the collapsed building, but his infection might also have changed his personality. Even if that's the case, there are certainly much worse mental changes out there, so he should be fine as the police station's first rescue.";
			say "     Your trip back to the police station is long, but uneventful. And Alexandra's certainly quite pleased with your success as well. She's already gotten a few bunks set up it what was once the locker room. Jimmy hops up onto one of the bunks and starts bouncing up and down on it, delighted to have a bed again. You and Alexandra can't help but grin, finding him adorably cute.";
			now HP of Jimmy is 3;
			if HP of Alexandra < 57, now HP of Alexandra is 57;
			now Automaton Activity is resolved;
			now Resolution of Automaton Activity is 1; [won]
			move Jimmy to Police Lockerroom;
			move player to Police Station Twelve;
		else if fightoutcome >= 20 and fightoutcome <= 29:	[player lost]
			say "     During the automaton's sexual assault, you did manage to spot the corgi guy manage to squirm free. He then dropped to all fours and ran off as quickly as his stubby little legs could carry him. His small size helped him to weave between the automatons and make his escape. After your assailant steps away, you rush off after him before another of the robotic people can grab you, but you've lost track of him for now. You hope you can find the little guy before something else does.";
			now HP of Jimmy is 2;
			now Resolution of Automaton Activity is 2; [lost]
		else:
			say "     As you make your escape from the automaton attacking you, you spot the corgi guy managing to squirm free. He drops to all fours and runs off as quickly as his stubby little legs can carry him. While his small size helps him weave between the automatons and make his escape, he heads off in a direction separate from yours. By the time you're able to circle around, you've lost track of him for now. You hope you can find the little guy before something else does.";
			now HP of Jimmy is 2;
			now Resolution of Automaton Activity is 3; [fled]
	else if HP of Jimmy is 2:
		say "     Heading back to the area where you encountered the automatons digging out the corgi survivor, you begin searching around in the hopes of locating him.";
		let bonus be ( Perception of Player minus 10 ) divided by 2;
		increase bonus by lust of Jimmy;
		let dice be a random number from 1 to 20;
		say "You roll 1d20([dice])+[bonus] -- [dice plus bonus] vs 14: ";
		if (dice + bonus) >= 14:
			say "Luck favors you as you're able to spot a few small pawprints heading into an alleyway. Heading in slowly, you find the small corgi huddled behind a dumpster on a pile of cardboard boxes. He's startled at first, eyes flashing with an amber glow for a moment, but his eyes return to normal when he recognizes you as the one who tried to save him earlier. 'Pull up some cardboard and have a seat. It's not much, but beggars can't be choosers, friend,' he says cheerfully. Telling him that you know someplace that'll be much safer and more comfortable than an alley, he hops onto feet and smiles happily. 'Come on then, let's get out of here.' With that, you lead him out of the ash-covered ruins around the capitol building and to the police station.";
			say "     As you take the make the long trek back, you listen to him tell his tale. 'My name's Jimmy,' the corgi says as his short legs stride quickly to keep pace with you, 'and I was stuck in that building since this craziness started. There was some food for a while, but eventually that ran out and I had to start eating from a bag of dog food. Tasty stuff, let me tell you,' he adds cheerfully. 'But, as you can probably guess, eating it caused me to change into a corgi. Well, at least I'm super-cute now,' he says with a canine grin, running his paws over his short, canine body.";
			say "     'When I heard the rubble being moved, I thought I was being rescued and called out for help. Little did I know those sex robots were the ones digging me out. Thanks so much for pulling me out of that mess,' he says, giving you a quick little hug with his stubby arms. Perhaps he's always been a positive fellow or he's just happy at finally having gotten out of the collapsed building, but his infection might also have changed his personality. Even if that's the case, there are certainly much worse mental changes out there, so he should be fine as the police station's first rescue.";
			say "     Your trip back to the police station is long, but uneventful. And Alexandra's certainly quite pleased with your success as well. She's already gotten a few bunks set up it what was once the locker room. Jimmy hops up onto one of the bunks and starts bouncing up and down on it, delighted to have a bed again. You and Alexandra can't help but grin, finding him adorably cute.";
			now lust of Jimmy is 0;
			now HP of Jimmy is 3;
			if HP of Alexandra < 57, now HP of Alexandra is 57;
			now Automaton Activity is resolved;
			now Resolution of Automaton Activity is 4; [found and rescued Jimmy]
			move Jimmy to Police Lockerroom;
			move player to Police Station Twelve;
	else:
		say "***ERROR-Jimmy-[HP of Jimmy]E: Result exceeds event parameters.";
		now Automaton Activity is resolved;


Section 2 - Jimmy the Corgi

Table of GameCharacterIDs (continued)
object	name
Jimmy	"Jimmy"

Jimmy is a person.
ScaleValue of Jimmy is 2. [small-human sized]
Body Weight of Jimmy is 4. [scale of 1-9 for body weight, grouped into low weight (1-3), mid weight (4-6) and high weight (7-9)]
Body Definition of Jimmy is 3. [scale of 1-9 for body definition, grouped into low muscle (1-3), mid muscle (4-6), high muscle (7-9)]
[Body Adjective is generated out of the body weight and body definition and can be used in scenes - one word descriptive adjective depending on weight and definition groups: low weight group: skinny/slender/lithe; mid weight group: average/fit/muscled; high weight group: pudgy/husky/jacked]
Androginity of Jimmy is 2. [Gender Adjective is generated out of androginity 1-9: hypermasculine/masculine/somewhat effeminate/effeminate/androgynous/feminine butch/tomboyish/feminine/hyperfeminine]
Mouth Length of Jimmy is 6. [inches deep for face fucking; maximum possible will be double this number (when deep throating)]
Mouth Circumference of Jimmy is 3. [mouth circumference 1-5, "tiny, small, normal, wide, gaping"]
Tongue Length of Jimmy is 6. [length in inches]
Breast Size of Jimmy is 0. [cup size as number, counting Flat Pecs = 0, A = 1, B = 2, ...]
Nipple Count of Jimmy is 2. [count of nipples]
Asshole Depth of Jimmy is 8. [inches deep for anal fucking]
Asshole Tightness of Jimmy is 2. [asshole tightness 1-5, "extremely tight, tight, receptive, open, gaping"]
Cock Count of Jimmy is 1. [number of cocks]
Cock Girth of Jimmy is 3. [thickness 1-5, thin/slender/average/thick/monstrous]
Cock Length of Jimmy is 6. [6 Inches]
Ball Count of Jimmy is 2. [allowed numbers: 1 (uniball), 2 or 4]
Ball Size of Jimmy is 2. [size of balls 1-7: "acorn-sized", "dove egg-sized", "chicken egg-sized" "goose-egg sized", "ostrich-egg sized", "basketball-sized", "beachball-sized"] [Increase by 1 for Alpha, decrease by 1 for Omega]
Cunt Count of Jimmy is 0. [number of cunts]
Cunt Depth of Jimmy is 0. [penetratable length in inches; some minor stretching allowed, or more with Twisted Capacity]
Cunt Tightness of Jimmy is 0. [size 1-5, generates adjectives of extremely tight/tight/receptive/open/gaping]
Clit Size of Jimmy is 0. [size 1-5, very small/small/average/large/very large]
[Basic Interaction states as of game start]
PlayerMet of Jimmy is false.
PlayerRomanced of Jimmy is false.
PlayerFriended of Jimmy is false.
PlayerControlled of Jimmy is false.
PlayerFucked of Jimmy is false.
OralVirgin of Jimmy is true.
Virgin of Jimmy is true.
AnalVirgin of Jimmy is true.
PenileVirgin of Jimmy is false.
SexuallyExperienced of Jimmy is true.
TwistedCapacity of Jimmy is false. [Twisted Characters can take any penetration, no matter the size]
Sterile of Jimmy is true. [steriles can't knock people up]
MainInfection of Jimmy is "".
Description of Jimmy is "[jimmydesc]".
Conversation of Jimmy is { "Yay!" }.
The icon of Jimmy is Figure of Jimmy_icon.

the scent of the Jimmy is "Jimmy smells pleasantly of dog.".

to say jimmydesc:
	if HP of Jimmy < 3:
		say "ERROR-Jimmy-[HP of Jimmy]L: You should not be able to see me.";
	else if hunger of Jimmy is 2:
		say "     Jimmy, having been transformed into a corgi, is quite short. He stands roughly three-and-a-half feet tall, mostly due to his very short legs. He is furry coat is a golden brown across most of his body, though white at his muzzle and chest. His arms, also short, end in paw-like hands covered in clean, white fur. He wears a plain black waistcoat, looking adorably cute in it. Despite, or perhaps because of his transformation, he seems perpetually happy. He works cheerfully around the station to clean up the mess here.";
	else:
		say "     Jimmy, having been transformed into a corgi, is quite short. He stands roughly three-and-a-half feet tall, mostly due to his very short legs. He is furry coat is a golden brown across most of his body, though white at his muzzle and chest. His arms, also short, end in paw-like hands covered in clean, white fur. He wears one of the police dog vests he's found and cleaned up, looking adorably cute in it. Despite, or perhaps because of his transformation, he seems perpetually happy. He works cheerfully around the station to clean up the mess here.";

Instead of conversing the Jimmy:
	if HP of Jimmy < 3:
		say "ERROR-Jimmy-[HP of Jimmy]T: You should not be able to talk to me.";
	else if HP of Jimmy is 3:
		if hunger of Jimmy is 2: [At Sanctuary]
			say "     'Hello. I don't think we've met before. I'm Jimmy. I'm sort of a refugee here now after my previous home stopped being safe. There was some food for a while, but eventually that ran out and I had to start eating from a bag of dog food. Tasty stuff, let me tell you,' he adds cheerfully. 'But, as you can probably guess, eating it caused me to change into a corgi. Well, at least I'm super-cute now,' he says with a canine grin, running his paws over his short, canine body. 'Some robots tried to turn me into one of them, but a huge black wolf saved me and brought me here. This place is so much better than where I was stuck before, even though there's a lot of sticky messes to clean up. Still, once I get it all cleaned up, it'll be fun to make a few sticky messes of my own,' he laughs with a wink at you. 'Oh, do you like my new outfit,' he asks, doing a wobbly spin to show off the waistcoat he found. It is the kind worn by hotel staff and looks absolutely adorable on him. It makes you want to scoop him up and hug him tight.'";
		else:
			say "     'Thanks again for helping me get here. This place is so much better than where I was stuck before, even though there's a lot of sticky messes to clean up. Still, once I get it all cleaned up, it'll be fun to make a few sticky messes of my own,' he laughs with a wink at you. 'Oh, do you like my new outfit,' he asks, doing a wobbly spin to show off the police dog vest he found. It is the kind worn by the dogs of the K-9 unit and looks absolutely adorable on him. It makes you want to scoop him up and hug him tight.";
		now HP of Jimmy is 4;
	else if HP of Alexandra >= 63 and sgtimer - turns >= 8 and sgtimer is not 255:
		say "     Speaking with Jimmy, he informs you that one of the survivors from the bingo hall had left a note for any of the missing scouts who might return, telling them where the rest of you had gone. 'Since they'd be left there alone without directions or help to get here, I'd like you to go back there and check it out one last time. Besides, some of those scattered by the wolves may have escaped there.' Agreeing that it's worth a shot, you promise him you'll return to check on the [bold type]survivor group[roman type]'s bingo hall one last time.";
		now sgtimer is 255;
		now Survivor Group is unresolved;
[	else if PoliceStationTwelvePopulation > 0:
		say "***";]
	else if hunger of Jimmy > 0:
		say "[JimmyTalkMenu]";
	else:
		say "     [one of]'It's nice to be able to sleep in a proper bed again. Sleeping on the floor's not so bad when you're a dog, but being on the bed's much better. And you can have a lot more fun in bed, too,' he adds with a cute chuckle.[or]'Do keep a look out for some doggy treats while you're out there. I've grown a taste for them,' he says, licking his chops.[or][if PoliceStationTwelvePopulation is 0]'There's always more stuff to do around here, but that just means we'll be able to have more friends.'[else]'There's even more to do around here now that we've got people in our shelter. It feels great to be helping them out though, so I don't mind. Besides, they give me plenty of scritches and hugs and... well, you know,' he says with a tail wag and a lick of his muzzle.[end if][or]'It's nice here and all, but I'm looking forward to the rescue Alexandra keeps talking about.'[or]'Thanks for helping [if PoliceStationTwelvePopulation > 0]all of [end if]us. Keep up the search for others.'[or]'I don't mind being this short now. It makes me the perfect height for oral sex,' he says with a grin and a wink.[or][if HP of Alexandra >= 65]'I don't like having that- that- robot bitch here,' he growls[else if HP of Alexandra >= 63]'The newcomers are getting settled in nicely. They've even voted to make me their representative,' he says happily[else]'Clean up's been going well,' he says cheerfully, tail wagging even as he lugs a bucket of grimy mop water with both hands[end if].[at random]";
[***]

to say JimmyTalkMenu:
	say "     There's a few topics you might be able to discuss with Jimmy. Is there anything in particular on your mind or do you just want to chat?";
	now sextablerun is 0;
	blank out the whole of table of fucking options;
	[]
	choose a blank row in table of fucking options;
	now title entry is "About Him";
	now sortorder entry is 1;
	now description entry is "Ask the corgi about himself";
	[]
	choose a blank row in table of fucking options;
	now title entry is "Boop";
	now sortorder entry is 2;
	now description entry is "Boop Jimmy on the nose";
	[]
	sort the table of fucking options in sortorder order;
	repeat with y running from 1 to number of filled rows in table of fucking options:
		choose row y from the table of fucking options;
		say "[link][y] - [title entry][as][y][end link][line break]";
	say "[link]0 - Nevermind[as]0[end link][line break]";
	while sextablerun is 0:
		say "Pick the corresponding number> [run paragraph on]";
		get a number;
		if calcnumber > 0 and calcnumber <= the number of filled rows in table of fucking options:
			now current menu selection is calcnumber;
			choose row calcnumber in table of fucking options;
			say "[title entry]: [description entry]?";
			if Player consents:
				let nam be title entry;
				now sextablerun is 1;
				if (nam is "About Him"):
					say "[JimmyTalk1]";
				if (nam is "Boop"):
					say "[JimmyTalk2]";
				wait for any key;
		else if calcnumber is 0:
			now sextablerun is 1;
			say "     You stand up, indicating an end to the conversation. Jimmy looks momentarily disappointed, but his naturally cheerful disposition ensures that this doesn't last long.";
			wait for any key;
		else:
			say "Invalid Option. Pick between 1 and [the number of filled rows in the table of fucking options] or 0 to exit.";
	clear the screen and hyperlink list;

to say JimmyTalk1:
	say "     'So you want to know about little old me, do you? What's the story behind the cute bundle of cuddles before you? I've lived in the city since the day I was born. Apart from a few vacations and school trips, I haven't ever left, and despite the current crisis, I still don't plan on it. This is my city and I'll not give it up just because a few people have gone overboard on the debauchery!' Though he had meant it humorously, he looks adorably determined, his stubby arms folded in front of him, though his manically wagging tail rather ruins any chances of looking tough. 'As far as I can remember, I've always been a cheerful sort of person and if my apartment had survived I could have shown you all my school pictures with me genuinely smiling while so many of the others had to force theirs. Despite my cheerfulness, I didn't have many friends at school. I wasn't smart enough for the nerds nor athletic enough for the jocks. I couldn't draw well enough to associated with the artistically inclined either.'";
	say "     'So I just sort of drifted through, no one really wanting to be my friend, but not really being bullied either. A few people would take pity on me and let me sit with them from time to time at lunch, but I didn't fit in so I was usually left to be taken in by another group every few weeks. I'm making it sound much worse than it was and you don't need to feel sorry for me. That was then, and now I have ";
	if hunger of Jimmy is 1:
		say "you[if hunger of Paula > 0], Paula,[end if] and Alexandra. ";
	else:
		say "Paula and the other people here. ";
	say "I was good at English classes, especially the oratory presentations, so when I had graduated high school, I did a dual degree in English and Political Science. It was only when I had received the bit of paper at the end that I realized that I didn't know what I wanted to do next. My parents had moved house to the other side of the country, meaning I couldn't live at home while I decided, so I asked my sister for a loan and bought an apartment. I do hope she's alright. She was meant to be leaving for a business trip just after people started changing, so I don't even know whether she is in the city or not.' Jimmy has a moment of silent to take a breath and contemplate this thought. 'She's probably fine, but could I have a moment? I'm not feeling my usual pep. We can talk again later if that's alright.'";

to say JimmyTalk2: [Boop]
	say "     Jimmy watches with eager anticipation as your finger gets closer and closer to his nose until, unable to help himself, he jumps into it, booping himself on your finger. 'That was so intense, let me tell you,' he declares, his tail wagging maniacally behind him. 'The build up... I assume that this is what drugs are like.' You warn him that perhaps he should be careful not to say such things around [if hunger of Jimmy is 1]Alexandra. 'I said that I assumed. I'm not going to admit that I've been running a drug lab in the bunker,' he [else]strangers. 'I said that I assumed. I'm not going to admit that I've been running a drug lab when the Den Mother has been so kind as to take me in,' he [end if]replies with a wink";

[to say JimmyTalk3:
	say "     Everyone else in my family is a bit more impressive than me. Apart from my parents and me, I have two brothers and a sister. My dad was editor for some scientific journal that I can't remember the name of and didn't often have time to spend with the rest of us so I can't say I was particularly close. Mum did consultancy for security companies ";]

Section 3 - Sex with Jimmy

the fuckscene of Jimmy is "[sexwithJimmy]".

to say sexwithJimmy:
	if HP of Jimmy < 3:
		say "ERROR-Jimmy-[HP of Jimmy]F: You shouldn't be able to find me.";
	else if HP of Jimmy is 3:
		say "     You should probably try talking to him some more first.";
	else if lastfuck of Jimmy - turns < 6:
		say "     You'd played around with the cute corgi recently. Maybe you should give him a bit more of a break before getting back to it.";
	else if Player is neuter:
		say "     There's not much point in playing with him given your lack of genitals.";
	else:
		if HP of Jimmy >= 5 and player is male and a random chance of anallevel in 7 succeeds:
			say "[Jimmysex02]";
		else:
			say "[Jimmysex01]";
		now lastfuck of Jimmy is turns;

to say Jimmysex01:		[oral]
	if Player is herm:
		say "     Jimmy smiles happily at the prospect of having fun with you. The small corgi fellow nuzzles between your legs, his cute muzzle homing in on your groin. Taking your cock[smn] in hand, he starts licking and lapping across your stiffening meat, eagerly lapping up your precum. After giving your penis[esmn] a thorough tongue-bath, he nuzzles down to your cunt[sfn] to give your juicy folds the same treatment. The corgi's questing tongue delves into your hot tunnel, causing shivers of delight to ripple along your inner walls.";
		say "     He is very thorough in his licking, moving his attention back and forth between your cock[smn] and puss[yfn]. As your climax approaches, he slides his muzzle down over [if Cock Count of Player > 1]one of your [cock size desc of Player] cocks[else]your [cock size desc of Player] cock[end if], sucking hungrily on it. While blowing you, his little paws rub over you, one kneading your thigh and the other slipping a few digits into your [cunt size desc of Player] cunt. You cum a few moments later, shooting your [Cum Load Size of Player] load into the cute little guy[if Ball Size of Player > 6]. Your enormous load causes the small corgi's belly to bulge out so much his little legs can no longer reach the ground. He releases a wet, giggling moan as he flails his limbs in the air[one of][or], accidentally rolling onto his back[or], accidentally rolling onto his side[or], accidentally rolling onto his face[as decreasingly likely outcomes][else if Ball Size of Player > 5]. Your huge load causes the small corgi's belly to visibly bloat, leaving his little legs barely able to reach the ground. He releases a wet, giggling moan at this[end if]. Jimmy grins and licks his chops. 'Mmm... good stuff.'";
	else if Player is male:
		say "     Jimmy smiles happily at the prospect of having fun with you. The small corgi fellow nuzzles between your legs, his cute muzzle homing in on your groin. Taking your cock[smn] in hand, he starts licking and lapping across your stiffening meat, eagerly lapping up your precum. While giving your penis[esmn] a thorough tongue-bath, he rubs his paws over [if Cock Count of Player > 1]your other cocks and [else if Cock Count of Player is 2]your other cock and [end if]your [Ball Size Adjective of Player] [Balls]. The canine tongue slathers across your cockflesh, running along the shaft and swirling over your glans.";
		say "     He is very thorough in his licking, moving his attention between your dick[smn] and your scrotum. As your climax approaches, he slides his muzzle down over [if Cock Count of Player > 1]one of your [cock size desc of Player] cocks[else]your [cock size desc of Player] cock[end if], sucking hungrily on it. While blowing you, his little paws rub over you, one kneading your thigh and the other caressing your balls, eager for their contents. You cum a few moments later, shooting your [Cum Load Size of Player] load into the cute little guy[if Ball Size of Player > 6]. Your enormous load causes the small corgi's belly to bulge out so much his little legs can no longer reach the ground. He releases a wet, giggling moan as he flails his limbs in the air[one of][or], accidentally rolling onto his back[or], accidentally rolling onto his side[or], accidentally rolling onto his face[as decreasingly likely outcomes][else if Ball Size of Player > 5]. Your huge load causes the small corgi's belly to visibly bloat, leaving his little legs barely able to reach the ground. He releases a wet, giggling moan at this[end if]. Jimmy grins and licks his chops. 'Mmm... good stuff.'";
	else:
		say "     Jimmy smiles happily at the prospect of having fun with you. The small corgi fellow nuzzles between your legs, his cute muzzle homing in on your groin. Nosing at your puss[yfn], he takes in your scent before sliding his tongue slowly across your juicy folds. He lavishes attention upon your cunt[sfn], [if Cunt Count of Player > 1]swapping between them[else], working his playful tongue in such delightful ways[end if] in his quest to please you. After giving your sensitive folds a thorough tongue-bath, the corgi's hard-working tongue delves into your hot tunnel[sfn], causing shivers to delight to ripple along your inner walls.";
		say "     He is very thorough in his licking, moving his attention back and forth between your [if Cunt Count of Player > 1][cunt size desc of Player] cunts to lap across their folds, clit and inner walls[else]the juicy fold, throbbing clit and quivering inner walls of your [cunt size desc of Player] cunt[end if]. While eating you out, his little paws rub over you, one kneading your thigh and the other brushing across your pussy lips. As your climax approaches, he buries his muzzle between your legs, diving his tongue as deep as he can and squirming it around inside you. You cum a few moments later, your hot juices soaking the little guy's muzzle, drenching his furry face. When your orgasm slakes off, Jimmy withdraws that delightful tongue of his and licks his chops with a happy grin. 'Mmm... good stuff.'";


to say Jimmysex02:
	if HP of Jimmy is 4:	[not had anal yet]
		say "***will not be accessible until later - first time via regular sex.";
	else:
		say "     Jimmy's tail wags excitedly at the prospect of having some more fun with you. Bending over, the little guy wiggles his ass in the air. 'How about you fill me up again?' he asks as he shows that tempting, crinkled hole of his. It's already pre-lubed, the corgi clearly having hoped for another chance to ride your cock. With such a tantalizing offer, you find it hard to refuse the cute little guy. Wrapping your arms around him, you sit him in your lap and onto your throbbing erection. After sharing a kiss with him, tongues darting across one another, you ease him down slowly, letting your [Cock of Player] cock pop into his tight tailhole[if Cock Length of Player > 15]. Given the size of your [cock size desc of Player] manhood, you have to take it very slow and aren't able to fully bury yourself into him, but that doesn't stop the two of you from enjoying it immensely[else if Cock Length of Player > 7]. Given the size of your [cock size desc of Player] manhood, you have to start carefully, but soon you're able to fully bury yourself into his fuzzy rear, much to your immense mutual enjoyment[else]. Your [cock size desc of Player] manhood slides fairly easily into his prepped hole and soon you're buried fully in his fuzzy bottom, much to your immense mutual enjoyment[end if].";
	say "     Partly opening up his [if hunger of Jimmy is 1]K9 unit vest[else]waist coat[end if], you slip a hand into it, rubbing his fuzzy chest. You bounce the cute fellow easily up and down on your cock. He pants and moans in delight as you fuck his cute ass. His own canine cock throbs, releasing spurts of precum onto the ground between your feet with every push against his prostate. The little guy's anus is wonderfully tight[if HP of Jimmy >= 5] even with his earlier preparation[end if], squeezing it hard each time you push into him[one of], and soon you can't help but bounce him even faster in your lap[or]. Taking a hold of his canine cock with your free hand, you stroke his pulsing rod[or], and soon you're pulling him down even harder with every thrust you make[in random order]. This proves too much for the little guy, his knot swelling up and soon she's spurting dog cum across the floor in long streaks as he cries out in ecstasy. Feeling him clamp down around your shaft, you push deep into him one last time and unleash your [Cum Load Size of Player] load into the happy doggy.";
	say "     Easing him off your shaft and setting him back down, he has to clutch your leg for support as he's still weak at the knees. '[if HP of Jimmy is 4]Oh wow! I mean... I'd never... that was awesome. I wish I knew how great that felt; I'd have been doing that for years had I known[else][one of]That just keeps getting better and better[or]Oh, how I ache, but it's such a good ache[or]Mmmm... I feel so warm and full[at random][end if].' Cuddling the cute guy, you help him wipe up the mess you two've made with some rags. After sharing another kiss, he flops out on his cot, rubbing his [if Ball Size of Player > 5]bulging [else if Ball Size of Player >= 4]rounded [else]tummy with a happy smile on his doggy muzzle.";
	if HP of Jimmy is 4, now HP of Jimmy is 5;


Section 4 - Interactions with other Library Residents

instead of going to Communal Shower while hunger of Jimmy is 1 and HP of Sturm is 1 and "JimmyShowerBlowjobAccepted" is not listed in traits of Sturm and "JimmyShowerBlowjobRefused" is not listed in traits of Sturm and Player is not CoA and a random chance of 1 in 3 succeeds:
	say "     Entering the communal showers, you immediately hear the sound of splashing water and grumbling. 'I don't know why Mom expects us to wash with hot water. Nothing wrong with cold.' Peering around the corner of the dividing wall, you spy Sturm grudgingly standing beneath the spray of warm water, rubbing it through his fur and looking grouchy and bedraggled. Not wanting to embarrass him, you turn to sneak away again but come face to face[if scalevalue of player is 1], or rather face to crotch[else if scalevalue of player is 3], or rather chest to face[else if scalevalue of player is 4], or rather tummy to face[else if scalevalue of player is 5], or rather crotch to face[end if] with Jimmy, the corgi putting a finger to his lips to urge you to remain quiet. Gesturing with his head towards the sounds of yours and Blanche's son washing himself, he mouthes the words, 'May I?' suggesting that he has something in mind for the wolf and it doesn't take much imagination to guess what, especially with how much sex has become accepted in the city.";
	say "     [bold type]Do you give Jimmy permission to make Sturm's shower more enjoyable?[roman type][line break]";
	say "     [link](1)[as]1[end link] - Yes. Jimmy does so enjoy brightening other people's days.";
	say "     [link](2)[as]2[end link] - Not yet. Tell Jimmy to hold off for now. Perhaps another time.";
	say "     [link](3)[as]3[end link] - No. You would prefer that Jimmy kept his cute paws off Sturm.";
	now calcnumber is 0;
	while calcnumber < 1 or calcnumber > 3:
		say "Choice? (1-3)>[run paragraph on]";
		get a number;
		if calcnumber is 1 or calcnumber is 2 or calcnumber is 3:
			break;
		else:
			say "Invalid choice. Type [link]1[end link], [link]2[end link], or [link]3[end link].";
	if calcnumber is 1: [Continue]
		LineBreak;
		say "     After some deliberation, you nod but whisper that he should make sure not to embarrass Sturm. Giving you a thumbs up, Jimmy quietly slides his police vest over his head and leaves it on the bench before sneaking into the showers and creeping up behind Sturm. 'Has anyone told you that you work out,' the corgi says in a chipper tone, startling the much larger wolf with his sudden appearance. 'I mean, you look the sort to inspire sculptors and I'm sure that at least some effort must have gone into those muscles. Mind telling me your secret? As you can see, I'm a shrimp who is approaching the line between cuddly and podgy.' Your son stands there speechless while the corgi flatters him, unsure how best to respond. Eventually, Sturm finally manages to form a sentence. ";
		if "Jimmy - Funny Corgi" is listed in traits of Sturm:
			say "'You're the corgi that we met when we arrived. Jimmy, wasn't it?' The stumpy canine flashes him a grin. 'Nice to know that I made an impression. Now, I know that I offered a hug or a handjob, but you look a little glum so I'm willing to up the dosage of cheer to some tongue fun. Are you up for that?' the peppy dog asks, already eying the wolf's plump sheath.";
		else: [Sturm didn't meet Jimmy on arrival]
			say "'I'm sure that I've seen you around, but I don't know who you are to be honest.' The stumpy canine exaggerates a laugh before flashing a grin. 'I guess that gives me a chance to make a good first impression. I'm Jimmy and I make it my mission to keep everyone in top spirits. With that in mind, you look a little glum. Would a blowjob from a pint-sized pooch cheer you up?' the peppy dog asks, already eying the wolf's plump sheath.";
		say "     Sturm looks momentarily indecisive before his lust gets the better of him. 'It really isn't that serious, but I'll take you up on that offer anyway. You're cute, and some attention sounds nice. Though I am a little suspicious that Bianca has something to do with this,' the wolf responds, his mood noticeably improved. Considering the size-difference between them, all it takes is a step forward for your son's balls to be resting on the corgi's upturned snout. 'Wait a minute. These aren't my glasses!' Jimmy cries, standing on tip toes and carefully balancing the wolf's scrotum over his eyes and making the larger male snort in amusement. 'I'm sure that you have some good reason to be showering, and it has given me this chance to get to know you, but it does diminish your natural scent that I find so appealing,' the corgi teases. 'You've got something to say about everything, don't you? Maeve would adore you. But for now let's put your mouth to better use.' Sturm growls, the tip of his cock beginning to slide from his sheath in anticipation.";
		WaitLineBreak;
		say "     Water splashing over him, Jimmy angles Sturm's penis towards his mouth with one paw while the other massages behind his balls, his wrist inadvertently stirring the orbs around as he moves. Looking up so that their eyes meet, the corgi envelops the weighty shaft in his mouth, or at least the first half, his height causing difficulties for the canine. Wordlessly, Sturm bends his knees a little and begins to thrust down into Jimmy's mouth, subtly making it easier for the smaller male while still preserving the feeling of intimacy that has developed. 'I'll warn you now, I doubt that I'll last long. I had a little time to myself before you arrived, if you know what I mean,' Sturm warns him, wiggling his eyebrows to emphasize his point. ";
		if "BlowjobVirginFalse" is listed in traits of Sturm:
			say "Also, this is my first time with someone else, so this is a little special to me. '";
		say " Jimmy gives a thumbs up in comprehension and redoubles his effort in swallowing the wolf's cock, an effort that is both appreciated and effective if your son's facial expression and grunts are anything to go by.";
		say "     By now, Sturm is gripping the sides of the corgi's head, trying to maximize his pleasure before his inevitable climax. Fortunately, Jimmy seems to be accustomed to being used in such a manner, moaning delightedly while his fingers continue to play over the wolf's groin. Sensing that Sturm will soon orgasm, you watch as Jimmy slides a finger further beneath the white wolf before curling it into his anus, causing him to make an especially deep thrust in surprise. Not getting a chance to acclimatize to the invading digit, your son is catapulted into an intense climax by the ministrations of the smaller male, though somehow maintaining a sliver of control to avoid knotting his mouth, breathy gasps accompanying each burst of semen down the corgi's throat, the wolf's buttocks clenching with each spasm. Somehow, he manages to avoid collapsing on top of Jimmy, though you can see the amount of effort that it takes to steady his shaky legs, especially in the lull between inseminations.";
		WaitLineBreak;
		say "     As the waves of ecstasy diminish, Sturm allows himself to slither down the wall, his cock slipping from Jimmy's mouth, until he is sitting on the floor, streams of water cascading over both wolf and corgi. Jimmy seats himself beside him, his own penis untended and rigid. Perhaps feeling guilty that he hasn't reciprocated the corgi's attention, your son tiredly reaches a hand for it but the canine gently nudges it away. 'Not this time, buddy. Take the time to recover and properly enjoy the moment. I'll take care of this myself later,' Jimmy explains, patting the wolf on the knee. 'Thank you. That was... wow. ";
		if "BlowjobVirginFalse" is listed in traits of Sturm:
			say "You definitely made my first blowjob something to remember,' ";
		else:
			say "That was very different to my past experiences,' ";
		say " Sturm gasps. 'All part of the morale-boosting services I provide. I enjoyed it too. There's something about you that makes me think that we'll be seeing more of each other,' the corgi chuckles. 'Well, of course. At some point I'll have to return the favor, one way or another,' your son replies before leaning over and kissing the top of his new friend's head.";
		say "     Deciding to let them recover in peace, you turn around to leave and are startled to find Bianca standing against the opposite wall with her fingers playing across her vulva and breasts. Having momentarily been lost in her own pleasure, she looks at you with wide-eyes as she realizes that she's been caught. Swiftly recovering, she holds a finger up to her lips before creeping away. As you leave a few seconds later, you take some comfort that you weren't the only one with voyeuristic tendencies who enjoyed the male-bonding in the showers.";
		if "BlowjobVirginFalse" is not listed in Traits of Sturm:
			TraitGain "BlowjobVirginFalse" for Sturm;
			TraitGain "Jimmy - First Blowjob" for Sturm;
		TraitGain "JimmyShowerBlowjobAccepted" for Sturm;
	else if calcnumber is 2:
		LineBreak;
		say "     After some deliberation, you shake your head, whispering that you think that that would only embarrass Sturm even more. Conceding your point, Jimmy nods before leaving again, with you following soon after him, leaving the wolf to shower in peace.";
	else if calcnumber is 3:
		say "     Jimmy's face falls as you immediately shake your head. You quietly tell him that as long as he's staying here, that you would prefer if he refrained from anything sexual with Sturm, though you don't have a problem if the two of them become friends. Disappointedly nodding his acceptance, the corgi shuffles away, with you following soon after him, leaving the wolf to shower in peace.";
		TraitGain "JimmyShowerBlowjobRefused" for Sturm;
	move Player to Bunker;


[Shower scene with Alexandra:
	say "     ";
	say "     ";

Shower scene with Paula:
	say "     ";
	say "     ";]


Jimmy ends here.
