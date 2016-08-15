BEGIN agtomtha

//Sleeping dialogue
IF ~StateCheck(Myself,STATE_SLEEPING)~ agtom_sleep
  SAY @204 /* ~Zzzzz (bah!)...~ */
  IF ~~ EXIT
END

//Charmed dialogue (if A64's patch is installed)
IF ~StateCheck(Myself,STATE_CHARMED)~ agtom_charm
  SAY @120 /* ~Ah, my good friend <GABBER>! Feel like a draught of dwarven spirits, by any chance? Some demented halfling sold it to me at a quarter of the price he should have... idiot.~ */
  ++ @121 /* ~I appreciate the offer, but I'm in a bit of a hurry.~ */ + agtom_charm1
  ++ @122 /* ~Why not?~ */ + agtom_charm2
  ++ @123 /* ~Not right now. I've got to get going.~ */ + agtom_charm3
END

IF ~~ agtom_charm1
  SAY @124 /* ~Of course, of course... well, I don't suppose you'd like to take a look at the stock? We're running low on some pairs, but overall I think everything should be satisfactory.~ */
  ++ @125 /* ~That would be great, thank you.~ */ + agtom_charm4
  ++ @126 /* ~Not this time, Tomthal. Just passing through.~ */ + agtom_charm5
END

IF ~~ agtom_charm2
  SAY @127 /* ~Almost as good as gogondy, this is. Shame it's not more common.~ */
  = @128 /* ~I don't suppose you'd like to take a look at the stock? We're running low on some pairs, but overall I think everything should be satisfactory.~ */
  ++ @125 /* ~That would be great, thank you.~ */ + agtom_charm4
  ++ @126 /* ~Not this time, Tomthal. Just passing through.~ */ + agtom_charm5
END

IF ~~ agtom_charm3
  SAY @129 /* ~Safe travels, friend <GABBER>. (Odd... normally I hate those <RACE> folk, but this one isn't so bad.)~ */
  IF ~~ EXIT
END

IF ~~ agtom_charm4
  SAY @130 /* ~Any time.~ */
  IF ~~ DO ~StartStore("agaurora",LastTalkedToBy())~ EXIT
END

IF ~~ agtom_charm5
  SAY @131 /* ~Feel free to stop in another time, my friend. Safe travels.~ */
  IF ~~ EXIT
END

//First meeting
IF ~NumTimesTalkedTo(0) !Race(LastTalkedToBy,GNOME)~ ag_tom_0
  SAY @0 /* ~What? What is it you want?!~ */
  = @1 /* ~Oh, a customer. Tomthal Harfurthock at your service. Hmph. (Ungrateful maggot, unworthy slime... I wonder what cavity it crawled out of?)~ */
  = @2 /* ~Well?! Do you want to look at the stock, or not?~ */
  ++ @3 /* ~I'd like to take a look at your stock, yes.~ */ DO ~SetGlobal("ag_tommeet","GLOBAL",1) SetGlobalTimer("ag_tomup","GLOBAL",TWO_DAYS)~ + ag_tom_stock
  ++ @4 /* ~Ah, no thanks. Perhaps I'll come by another time.~ */ DO ~SetGlobal("ag_tommeet","GLOBAL",1) SetGlobalTimer("ag_tomup","GLOBAL",TWO_DAYS)~ + ag_tom_no
  + ~!Dead("agaurora") !Dead("agasleep") GlobalGT("ag_greeting","GLOBAL",0) Global("ag_tom_aurora","GLOBAL",0)~ + @5 /* ~Wait, isn't this Aurora's stand? Where is she?~ */ DO ~SetGlobal("ag_tom_aurora","GLOBAL",1) SetGlobal("ag_tommeet","GLOBAL",1) SetGlobalTimer("ag_tomup","GLOBAL",TWO_DAYS)~ + ag_tom_aurora
  + ~OR(2) Dead("agaurora") Dead("agasleep") Global("ag_tom_aurora","GLOBAL",0)~ + @5 /* ~Wait, isn't this Aurora's stand? Where is she?~ */ DO ~SetGlobal("ag_tom_aurora","GLOBAL",1) SetGlobal("ag_tommeet","GLOBAL",1) SetGlobalTimer("ag_tomup","GLOBAL",TWO_DAYS)~ + ag_tom_aurora_dead
  + ~Global("ag_tom_gnome","GLOBAL",0)~ + @6 /* ~Aren't you a deep gnome? What're you doing on the surface?~ */ DO ~SetGlobal("ag_tom_gnome","GLOBAL",1) SetGlobal("ag_tommeet","GLOBAL",1) SetGlobalTimer("ag_tomup","GLOBAL",TWO_DAYS)~ + ag_tom_gnome
  + ~Global("ag_tom_rudeness","GLOBAL",0)~ + @7 /* ~I don't appreciate the rudeness, gnome.~ */ DO ~SetGlobal("ag_tom_rudeness","GLOBAL",1) SetGlobal("ag_tommeet","GLOBAL",1) SetGlobalTimer("ag_tomup","GLOBAL",TWO_DAYS)~ + ag_tom_rude
END

IF ~NumTimesTalkedTo(0) Race(LastTalkedToBy,GNOME)~ ag_tom_1
  SAY @8 /* ~Tomthal Harfurthock at your service! And may I say what a pleasure it is to see another gnome in this Callarduran-forsaken city. Not often I see our kind around.~ */
  = @9 /* ~Would you like to take a look at our stock? We sell the finest boots in all of Amn! (Not that that is a surprise, of course...)~ */
  ++ @3 /* ~I'd like to take a look at your stock, yes.~ */ DO ~SetGlobal("ag_tommeet","GLOBAL",1) SetGlobalTimer("ag_tomup","GLOBAL",TWO_DAYS)~ + ag_tom1_stock
  ++ @4 /* ~Ah, no thanks. Perhaps I'll come by another time.~ */ DO ~SetGlobal("ag_tommeet","GLOBAL",1) SetGlobalTimer("ag_tomup","GLOBAL",TWO_DAYS)~ + ag_tom1_no
  + ~!Dead("agaurora") !Dead("agasleep") GlobalGT("ag_greeting","GLOBAL",0) Global("ag_tom_aurora","GLOBAL",0)~ + @5 /* ~Wait, isn't this Aurora's stand? Where is she?~ */ DO ~SetGlobal("ag_tom_aurora","GLOBAL",1) SetGlobal("ag_tommeet","GLOBAL",1) SetGlobalTimer("ag_tomup","GLOBAL",TWO_DAYS)~ + ag_tom1_aurora
  + ~OR(2) Dead("agaurora") Dead("agasleep") Global("ag_tom_aurora","GLOBAL",0)~ + @5 /* ~Wait, isn't this Aurora's stand? Where is she?~ */ DO ~SetGlobal("ag_tom_aurora","GLOBAL",1) SetGlobal("ag_tommeet","GLOBAL",1) SetGlobalTimer("ag_tomup","GLOBAL",TWO_DAYS)~ + ag_tom1_aurora_dead
  + ~Global("ag_tom_gnome","GLOBAL",0)~ + @10 /* ~A svirfneblin! What're you doing on the surface?~ */ DO ~SetGlobal("ag_tom_gnome","GLOBAL",1) SetGlobal("ag_tommeet","GLOBAL",1) SetGlobalTimer("ag_tomup","GLOBAL",TWO_DAYS)~ + ag_tom1_gnome
END

//Party has star ruby and is gnome
IF ~PartyHasItem("aggem02") Race(LastTalkedToBy,GNOME)~ ag_tom_starbuy1
SAY
@11 /* ~Is that? Can it be?~ */
++ @12 /* ~A star ruby? Wonderful, isn't it?~ */ + ag_tom_starbuy2
++ @13 /* ~The legendary star ruby.~ */  + ag_tom_starbuy2
++ @14 /* ~A star ruby. Yes. What's the fuss?~ */ + ag_tom_starbuy2
END

//Party has star ruby is not gnome
IF ~PartyHasItem("aggem02") !Race(LastTalkedToBy,GNOME)~ ag_tom_starsee
SAY
@15 /* ~Is that? Can it be? (Wait, mustn't let it know...)~ */
= @16 /* ~That is, I see you have found a rather... unusual... ruby.~ */
++ @12 /* ~A star ruby? Wonderful, isn't it?~ */ + ag_tom_starsee1
++ @17 /* ~This? It's a ruby. Kind of pretty, don't you think?~ */  + ag_tom_starsee1
++ @18 /* ~This? It is a star ruby. What's the fuss?~ */ + ag_tom_starsee1
END

//Requesting star ruby, party speaker is not gnome
IF ~GlobalGT("ag_tomruby","GLOBAL",19) Global("ag_starmention","GLOBAL",0) !Race(LastTalkedToBy,GNOME)~ ag_tom_star1
SAY
@19 /* ~Wait a moment.~ */
= @20 /* ~You seem to be resourceful (for a <RACE>, that is). And you do have an eye for gems.~ */
++ @21 /* ~And?~ */ DO ~SetGlobal("ag_starmention","GLOBAL",1)~ + ag_tom_star
++ @22 /* ~I do know a good rock when I see one.~ */ DO ~SetGlobal("ag_starmention","GLOBAL",1)~ + ag_tom_star
++ @23 /* ~Get to the point.~ */ DO ~SetGlobal("ag_starmention","GLOBAL",1)~ + ag_tom_star
END

//Requesting star ruby, party speaker is gnome
IF ~GlobalGT("ag_tomruby","GLOBAL",19) Global("ag_starmention","GLOBAL",0) Race(LastTalkedToBy,GNOME)~ ag_tom_star2
SAY
@19 /* ~Wait a moment.~ */
= @24 /* ~You seem to be resourceful gnome, and you have a good eye for rubies.~ */
++ @21 /* ~And?~ */ DO ~SetGlobal("ag_starmention","GLOBAL",1)~ + ag_tom_star3
++ @25 /* ~I know a fine gem when I see one.~ */ DO ~SetGlobal("ag_starmention","GLOBAL",1)~ + ag_tom_star3
++ @23 /* ~Get to the point.~ */ DO ~SetGlobal("ag_starmention","GLOBAL",1)~ + ag_tom_star3
END

//Regular rubies - first time, journal entry added
IF ~NumTimesTalkedToGT(0) PartyHasItem("aggem01") Global("ag_starmention","GLOBAL",0) Global("ag_tomruby","GLOBAL",0)~ ag_tom_gems
SAY
@26 /* ~Is that a ruby I see in your pack? Such rarity! I would be willing to buy it from you, if you are interested. Gems of such quality are hard to come by! My apologies, dear <SIRMAAM>, I did not realize you were such a discerning customer! If I had have known...~ */
++ @27 /* ~How much would you be willing to pay?~ */ DO ~SetGlobal("ag_tom_nice","GLOBAL",1) IncrementGlobal("ag_tomruby","GLOBAL",1) AddJournalEntry(@28,QUEST)~ + ag_tom_gems_1
++ @29 /* ~Not interested, sorry.~ */ DO ~IncrementGlobal("ag_tomruby","GLOBAL",1) AddJournalEntry(@28,QUEST)~ + ag_tom_gems_2
++ @30 /* ~So now that I have something you want, you're nice to me? Figures.~ */ DO ~IncrementGlobal("ag_tomruby","GLOBAL",1) AddJournalEntry(@28,QUEST)~ + ag_tom_gems_1
END

//Rubies, any time after the first
IF ~NumTimesTalkedToGT(0) PartyHasItem("aggem01") Global("ag_starmention","GLOBAL",0) GlobalGT("ag_tomruby","GLOBAL",0)~ ag_tom_gems
SAY
@31 /* ~I see you have a ruby in your pack. Such beauty! I would be willing to buy it from you, if you are interested. Gems of such quality are hard to come by! My apologies, dear <SIRMAAM>, I did not realize you were such a discerning customer! If I had have known...~ */
++ @27 /* ~How much would you be willing to pay?~ */ DO ~SetGlobal("ag_tom_nice","GLOBAL",1)~ + ag_tom_gems_1
++ @29 /* ~Not interested, sorry.~ */ + ag_tom_gems_2
++ @30 /* ~So now that I have something you want, you're nice to me? Figures.~ */ + ag_tom_gems_1
END

//Regular following meetings, no rubies, party has been nice
IF ~Global("ag_tom_nice","GLOBAL",1)~ ag_tom_4
  SAY @32 /* ~Ah, it is good to see you again! Would you like to take a look at our stock, or are you just passing through?~ */
  ++ @33 /* ~I'd like to take a look at your stock, thanks.~ */ + ag_tom1_stock
  ++ @34 /* ~Just passing through, I'm afraid.~ */ + ag_tom1_no
  + ~!Dead("agaurora") !Dead("agasleep") GlobalGT("ag_greeting","GLOBAL",0) Global("ag_tom_aurora","GLOBAL",0)~ + @5 /* ~Wait, isn't this Aurora's stand? Where is she?~ */ DO ~SetGlobal("ag_tom_aurora","GLOBAL",1)~ + ag_tom1_aurora
  + ~OR(2) Dead("agaurora") Dead("agasleep") Global("ag_tom_aurora","GLOBAL",0)~ + @5 /* ~Wait, isn't this Aurora's stand? Where is she?~ */ DO ~SetGlobal("ag_tom_aurora","GLOBAL",1)~ + ag_tom1_aurora_dead
  + ~Global("ag_tom_gnome","GLOBAL",0)~ + @10 /* ~A svirfneblin! What're you doing on the surface?~ */ DO ~SetGlobal("ag_tom_gnome","GLOBAL",1)~ + ag_tom1_gnome
  + ~GlobalGT("ag_starmention","GLOBAL",1) PartyHasItem("aggem01")~ + @35 /* ~Are you still interested in buying rubies?~ */ + ag_tom_gems_still
  + ~Global("ag_tomthal_upgrade","GLOBAL",0) GlobalTimerExpired("ag_tomup","GLOBAL")~ + @132 /* ~I'm curious if you can provide other products than what you've got in stock.~ */ + ag_tom_up_service
  + ~Global("ag_tomthal_upgrade","GLOBAL",1)~ + @133 /* ~I want to talk about your enchanter acquaintance.~ */ + ag_tom_up_help
  + ~Global("ag_tomthal_upgrade","GLOBAL",2) GlobalTimerExpired("ag_tom_upgrade_timer","GLOBAL")~ + @134 /* ~So, what about the enchanter?~ */ + ag_tom_up_info
  + ~Global("ag_tomthal_upgrade","GLOBAL",3)~ + @135 /* ~Do I have anything that can be used for enchanting?~ */ + ag_tom_up_check
  + ~Global("ag_tomthal_upgrade","GLOBAL",4) GlobalTimerExpired("ag_tom_upgrade_timer","GLOBAL")~ + @136 /* ~So, what about my order?~ */ + ag_tom_up_battle_give
  + ~Global("ag_tomthal_upgrade","GLOBAL",5) GlobalTimerExpired("ag_tom_upgrade_timer","GLOBAL")~ + @136 /* ~So, what about my order?~ */ + ag_tom_up_stinky_give
  + ~Global("ag_tomthal_upgrade","GLOBAL",6) GlobalTimerExpired("ag_tom_upgrade_timer","GLOBAL")~ + @136 /* ~So, what about my order?~ */ + ag_tom_up_drow_give
END

//Regular following meetings, no rubies, gnome
IF ~NumTimesTalkedToGT(0) Race(LastTalkedToBy,GNOME)~ ag_tom_3
  SAY @32 /* ~Ah, it is good to see you again! Would you like to take a look at our stock, or are you just passing through?~ */
  ++ @33 /* ~I'd like to take a look at your stock, thanks.~ */ + ag_tom1_stock
  ++ @34 /* ~Just passing through, I'm afraid.~ */ + ag_tom1_no
  + ~!Dead("agaurora") !Dead("agasleep") GlobalGT("ag_greeting","GLOBAL",0) Global("ag_tom_aurora","GLOBAL",0)~ + @5 /* ~Wait, isn't this Aurora's stand? Where is she?~ */ DO ~SetGlobal("ag_tom_aurora","GLOBAL",1)~ + ag_tom1_aurora
  + ~OR(2) Dead("agaurora") Dead("agasleep") Global("ag_tom_aurora","GLOBAL",0)~ + @5 /* ~Wait, isn't this Aurora's stand? Where is she?~ */ DO ~SetGlobal("ag_tom_aurora","GLOBAL",1)~ + ag_tom1_aurora_dead
  + ~Global("ag_tom_gnome","GLOBAL",0)~ + @10 /* ~A svirfneblin! What're you doing on the surface?~ */ DO ~SetGlobal("ag_tom_gnome","GLOBAL",1)~ + ag_tom1_gnome
  + ~GlobalGT("ag_starmention","GLOBAL",1) PartyHasItem("aggem01")~ + @35 /* ~Are you still interested in buying rubies?~ */ + ag_tom_gems_still
  + ~Global("ag_tomthal_upgrade","GLOBAL",0) GlobalTimerExpired("ag_tomup","GLOBAL")~ + @132 /* ~I'm curious if you can provide other products than what you've got in stock.~ */ + ag_tom_up_service
  + ~Global("ag_tomthal_upgrade","GLOBAL",1)~ + @133 /* ~I want to talk about your enchanter acquaintance.~ */ + ag_tom_up_help
  + ~Global("ag_tomthal_upgrade","GLOBAL",2) GlobalTimerExpired("ag_tom_upgrade_timer","GLOBAL")~ + @134 /* ~So, what about the enchanter?~ */ + ag_tom_up_info
  + ~Global("ag_tomthal_upgrade","GLOBAL",3)~ + @135 /* ~Do I have anything that can be used for enchanting?~ */ + ag_tom_up_check
  + ~Global("ag_tomthal_upgrade","GLOBAL",4) GlobalTimerExpired("ag_tom_upgrade_timer","GLOBAL")~ + @136 /* ~So, what about my order?~ */ + ag_tom_up_battle_give
  + ~Global("ag_tomthal_upgrade","GLOBAL",5) GlobalTimerExpired("ag_tom_upgrade_timer","GLOBAL")~ + @136 /* ~So, what about my order?~ */ + ag_tom_up_stinky_give
  + ~Global("ag_tomthal_upgrade","GLOBAL",6) GlobalTimerExpired("ag_tom_upgrade_timer","GLOBAL")~ + @136 /* ~So, what about my order?~ */ + ag_tom_up_drow_give
END

//Regular following meetings, no rubies, non-gnome
IF ~NumTimesTalkedToGT(0) !Race(LastTalkedToBy,GNOME)~ ag_tom_3a
  SAY @208 /* ~Oh, it's *you* again. Well? What do you want? Quickly, I haven't got all day.~ */
  ++ @33 /* ~I'd like to take a look at your stock, thanks.~ */ + ag_tom_stock
  ++ @34 /* ~Just passing through, I'm afraid.~ */ + ag_tom_no
  + ~!Dead("agaurora") !Dead("agasleep") GlobalGT("ag_greeting","GLOBAL",0) Global("ag_tom_aurora","GLOBAL",0)~ + @5 /* ~Wait, isn't this Aurora's stand? Where is she?~ */ DO ~SetGlobal("ag_tom_aurora","GLOBAL",1)~ + ag_tom_aurora
  + ~OR(2) Dead("agaurora") Dead("agasleep") Global("ag_tom_aurora","GLOBAL",0)~ + @5 /* ~Wait, isn't this Aurora's stand? Where is she?~ */ DO ~SetGlobal("ag_tom_aurora","GLOBAL",1)~ + ag_tom_aurora_dead
  + ~Global("ag_tom_gnome","GLOBAL",0)~ + @10 /* ~A svirfneblin! What're you doing on the surface?~ */ DO ~SetGlobal("ag_tom_gnome","GLOBAL",1)~ + ag_tom_gnome
  + ~GlobalGT("ag_starmention","GLOBAL",1) PartyHasItem("aggem01")~ + @35 /* ~Are you still interested in buying rubies?~ */ + ag_tom_gems_still
  + ~Global("ag_tomthal_upgrade","GLOBAL",0) GlobalTimerExpired("ag_tomup","GLOBAL")~ + @132 /* ~I'm curious if you can provide other products than what you've got in stock.~ */ + ag_tom_up_service
  + ~Global("ag_tomthal_upgrade","GLOBAL",1)~ + @133 /* ~I want to talk about your enchanter acquaintance.~ */ + ag_tom_up_help
  + ~Global("ag_tomthal_upgrade","GLOBAL",2) GlobalTimerExpired("ag_tom_upgrade_timer","GLOBAL")~ + @134 /* ~So, what about the enchanter?~ */ + ag_tom_up_info
  + ~Global("ag_tomthal_upgrade","GLOBAL",3)~ + @135 /* ~Do I have anything that can be used for enchanting?~ */ + ag_tom_up_check
  + ~Global("ag_tomthal_upgrade","GLOBAL",4) GlobalTimerExpired("ag_tom_upgrade_timer","GLOBAL")~ + @136 /* ~So, what about my order?~ */ + ag_tom_up_battle_give
  + ~Global("ag_tomthal_upgrade","GLOBAL",5) GlobalTimerExpired("ag_tom_upgrade_timer","GLOBAL")~ + @136 /* ~So, what about my order?~ */ + ag_tom_up_stinky_give
  + ~Global("ag_tomthal_upgrade","GLOBAL",6) GlobalTimerExpired("ag_tom_upgrade_timer","GLOBAL")~ + @136 /* ~So, what about my order?~ */ + ag_tom_up_drow_give
END

//Store
IF ~~ ag_tom_stock
SAY @36 /* ~Fine. Take a look at the "finest boots in all of Amn!" (Not like that says much... damned wasteland, this).~ */
IF ~~
DO ~StartStore("agaurora",LastTalkedToBy())~ EXIT
END

IF ~~ ag_tom_no
SAY @37 /* ~Goodnight. (Disgusting fools... if I have another <RACE> come into the store tonight, I swear, I will quit... I can't believe... idiots...)~ */
IF ~~ EXIT
END

IF ~~ ag_tom_gnome
  SAY @38 /* ~Bah! Circumstances beyond my control. It is not as if I want to be here, but that cursed...~ */
  = @39 /* ~Wait. What is it to you, <RACE>? Why would you care?~ */
  ++ @40 /* ~Just a question. No need to get offended.~ */ + ag_tom_gnome_1
  ++ @41 /* ~I *hate* svirfneblin.~ */ + ag_tom_gnome_2
  ++ @42 /* ~I don't.~ */ + ag_tom_gnome_1
  ++ @43 /* ~I was just wondering.~ */ + ag_tom_gnome_1
END

IF ~~ ag_tom_rude
  SAY @44 /* ~Well, that is just too bad, is it not? Hmph. Leave me be. I have better things to do than speak with a daft <RACE>.~ */
  IF ~~ EXIT
END

IF ~~ ag_tom_gnome_1
  SAY @45 /* ~Then keep your nose in your own business. Now, unless you are interested in the stock, I have other matters to attend to.~ */
  ++ @33 /* ~I'd like to take a look at your stock, thanks.~ */ + ag_tom_stock
  ++ @46 /* ~I'll leave you be.~ */ + ag_tom_no
END

IF ~~ ag_tom_gnome_2
  SAY @47 /* ~Then the feeling is mutual. Are you going to take a look at the stock, or not? Otherwise, I have other, far more important matters to attend to than trading insults with a <RACE>.~ */
  ++ @33 /* ~I'd like to take a look at your stock, thanks.~ */ + ag_tom_stock
  ++ @46 /* ~I'll leave you be.~ */ + ag_tom_no
END

IF ~~ ag_tom1_stock
  SAY @48 /* ~Wonderful! Here you are, then. I hope you find what you are looking for, <SIRMAAM>!~ */
IF ~~ DO ~StartStore("agaurora",LastTalkedToBy())~ EXIT
END

IF ~~ ag_tom1_no
  SAY @49 /* ~Such a shame - well, come by any time! Goodnight, <SIRMAAM>! And a fine night it is!~ */
IF ~~ EXIT
END


IF ~~ ag_tom1_gnome
  SAY @50 /* ~A series of unfortunate circumstances involving, well, never mind. I am trying to make the best of my situation. I think it is the gods' idea of a joke, but... well, that would be blasphemy, of course. So I will refrain from going there.~ */
  = @51 /* ~Regardless, I am drawn here each and every night to sell these shoes, and nothing can be done about it. Not that it matters.~ */
  = @52 /* ~Are you sure you would not like to take a look at our stock? We have some of the best quality shoes you will find until Calimshan!~ */
  ++ @53 /* ~Of course I'd like to take a look.~ */ + ag_tom1_stock
  ++ @54 /* ~I'm afraid not.~ */ + ag_tom1_no
END

//Ruby contd
IF ~~ ag_tom_gems_1
  SAY @55 /* ~I would be willing to go as high as 350 for such a stone!~ */
  ++ @56 /* ~Done and done.~ */ DO ~IncrementGlobal("ag_tomruby","GLOBAL",1) TakePartyItemNum("aggem01",1) DestroyItem("aggem01") GiveGoldForce(350)~ + ag_tom_gems_3
  ++ @57 /* ~This stone is worth far more than that, surely!~ */ + ag_tom_gems_4
  ++ @58 /* ~On second thought, I'm not interested.~ */ + ag_tom_gems_2
END

IF ~~ ag_tom_gems_2
  SAY @59 /* ~Your loss, I suppose! If you are certain.~ */
  = @60 /* ~Would you like to take a look at our stock? We have some of the best quality shoes you will find until Calimshan!~ */
  ++ @53 /* ~Of course I'd like to take a look.~ */ DO ~IncrementGlobal("ag_tomruby","GLOBAL",1)~ + ag_tom1_stock
  ++ @61 /* ~No, thank you.~ */ DO ~IncrementGlobal("ag_tomruby","GLOBAL",1)~ + ag_tom1_no
END

IF ~~ ag_tom_gems_3
  SAY @62 /* ~Thank you, <SIRMAAM>!~ */
  = @60 /* ~Would you like to take a look at our stock? We have some of the best quality shoes you will find until Calimshan!~ */
  ++ @53 /* ~Of course I'd like to take a look.~ */ + ag_tom1_stock
  ++ @61 /* ~No, thank you.~ */ + ag_tom1_no
END

IF ~~ ag_tom_gems_4
  SAY @63 /* ~Hmm... perhaps 450? Would that be satisfactory?~ */
  ++ @64 /* ~Sure. It's a done deal, then.~ */ DO ~IncrementGlobal("ag_tomruby","GLOBAL",1) TakePartyItemNum("aggem01",1) DestroyItem("aggem01") GiveGoldForce(450)~ + ag_tom_gems_3
  ++ @65 /* ~No, it wouldn't.~ */ + ag_tom_gems_2
END

IF ~~ ag_tom_aurora
  SAY @66 /* ~Who? Oh, you mean the human who runs this place during the day. Yes, I suppose you *could* say it was her stand. (Though she'd never stay in business without someone else looking after the account books, and why *I* have to be that someone...)~ */
= @67 /* ~Now are you buying something, or do you want to wait until daylight when you can have a *human* tend to your needs? (Only a few more hours til I can leave, thank Callarduran...)~ */
  ++ @68 /* ~I'd like to take a look, yes.~ */ + ag_tom_stock
  ++ @69 /* ~I'll wait.~ */ + ag_tom_no
END

IF ~~ ag_tom_aurora_dead
  SAY @207 /* ~Who? Oh, you mean the human who used to run place during the day. This was her stand, but she... she is dead.~ */
= @209 /* ~Now are you buying something, or do you want to wait until daylight when there'll be *no one* here to tend to your needs? (Only a few more hours til I can leave, thank Callarduran...)~ */
  ++ @68 /* ~I'd like to take a look, yes.~ */ + ag_tom_stock
  ++ @69 /* ~I'll wait.~ */ + ag_tom_no
END

IF ~~ ag_tom1_aurora
  SAY @66 /* ~Who? Oh, you mean the human who runs this place during the day. Yes, I suppose you *could* say it was her stand. (Though she'd never stay in business without someone else looking after the account books, and why *I* have to be that someone...)~ */
= @67 /* ~Now are you buying something, or do you want to wait until daylight when you can have a *human* tend to your needs? (Only a few more hours til I can leave, thank Callarduran...)~ */
  ++ @68 /* ~I'd like to take a look, yes.~ */ + ag_tom1_stock
  ++ @69 /* ~I'll wait.~ */ + ag_tom1_no
END

IF ~~ ag_tom1_aurora_dead
  SAY @207 /* ~Who? Oh, you mean the human who used to run place during the day. This was her stand, but she... she is dead.~ */
= @209 /* ~Now are you buying something, or do you want to wait until daylight when there'll be *no one* here to tend to your needs? (Only a few more hours til I can leave, thank Callarduran...)~ */
  ++ @68 /* ~I'd like to take a look, yes.~ */ + ag_tom1_stock
  ++ @69 /* ~I'll wait.~ */ + ag_tom1_no
END

IF
~~  ag_tom_star
SAY
@71 /* ~It's highly unlikely that even you will ever-~ */
= @72 /* ~But if you should find a star ruby, bring it here first. (Mustn't let <HIMHER> guess how much this is worth, or <HESHE> will be overcharging. <HISHER> kind always do).~ */
= @73 /* ~They aren't worth much, and are often flawed, but if you *do* find one...~ */
++ @74 /* ~I will bring it here.~ */ DO ~AddJournalEntry(@75,QUEST)~ + ag_tom_store
++ @76 /* ~I'll think about it.~ */ DO ~AddJournalEntry(@75,QUEST)~ + ag_tom_store
++ @77 /* ~I'll keep it for myself.~ */ DO ~AddJournalEntry(@75,QUEST)~ + ag_tom_store4
END

IF
~~ ag_tom_star3
SAY
@78 /* ~Have you, in your travels, happened upon a star ruby?~ */
++ @79 /* ~Aren't those just myths?~ */ + ag_tom_star4
++ @80 /* ~I have yet to be so fortunate.~ */ + ag_tom_star5
++ @81 /* ~No.~ */ + ag_tom_star5
END

IF
~~ ag_tom_star4
SAY @82 /* ~Oh no, not at all, not at all!~ */
= @83 /* ~Legendary they may be, but I assure you they are real!~ */
= @84 /* ~And if you should happen to find one, I would ask that you-~ */
++ @85 /* ~Say no more. I would never dream of offering it to anyone else.~ */ DO ~AddJournalEntry(@75,QUEST)~ + ag_tom_store
++ @86 /* ~I will bring it straight here, so that we may both admire it.~ */ DO ~AddJournalEntry(@75,QUEST)~ + ag_tom_store
++ @87 /* ~I might let you see it, but I could never bring myself to part with such a beauty.~ */ DO ~AddJournalEntry(@75,QUEST)~ + ag_tom_store
++ @88 /* ~Do you think I would be fool enough to tell *anyone* of such a find?~ */ DO ~AddJournalEntry(@75,QUEST)~ + ag_tom_store4
END

IF
~~ ag_tom_star5
SAY
@89 /* ~Not yet, but in all your travels, it is possible you might, and if you did...~ */
++ @85 /* ~Say no more. I would never dream of offering it to anyone else.~ */ + ag_tom_store
++ @86 /* ~I will bring it straight here, so that we may both admire it.~ */ + ag_tom_store
++ @87 /* ~I might let you see it, but I could never bring myself to part with such a beauty.~ */ + ag_tom_store
++ @90 /* ~Do you think I would tell *anyone* of such a find?~ */ + ag_tom_store4
END

//Buying star ruby from gnome

IF
~~ ag_tom_starbuy2
SAY
@91 /* ~I never thought I would live to see one.~ */
= @92 /* ~May I, could I hold it for a moment?~ */
++ @93 /* ~Of course, my friend, of course.~ */ + ag_tom_starbuy3
++ @94 /* ~Not until you have paid for it!~ */ + ag_tom_starbuy3
++ @95 /* ~This is as close as you are going to get to it.~ */ + ag_tom_store4
END

IF
~~ ag_tom_starbuy3
SAY
@96 /* ~Such a beauty. Such flawless...~ */
= @97 /* ~Could you bear to part with it?~ */
++ @98 /* ~That is why I brought it here. For 2000 gold, it is yours.~ */ + ag_tom_starbuy5
++ @99 /* ~Perhaps. Though it is an extraordinary beauty. I could, perhaps, be persuaded to part with it, for a certain sum. Say, 2000 gold?~ */ + ag_tom_store4
++ @100 /* ~Oh no. I would never let such a vision out of my care. Give it back, now.~ */ + ag_tom_store4
END

IF
~~ ag_tom_starbuy5
SAY
 @101 /* ~Ah, you drive a hard bargain, my friend. But... having held this wondrous stone, you know its worth.~ */
IF
~~
DO ~TakePartyItemNum("aggem02",1) DestroyItem("aggem02") GiveGoldForce(2000) EraseJournalEntry(@75) AddJournalEntry(@102,QUEST_DONE)~ + ag_tom_store5
END

//Buying star ruby from non-gnome
IF
~~ ag_tom_starsee1
SAY
@103 /* ~May I inspect it?~ */
++ @93 /* ~Of course, my friend, of course.~ */ + ag_tom_see2
++ @94 /* ~Not until you have paid for it!~ */ + ag_tom_see3
++ @104 /* ~Are you planning on buying it?~ */ + ag_tom_see3
END

IF
~~ ag_tom_see3
SAY
@105 /* ~I could not possibly venture to buy such a stone without inspecting it.~ */
= @106 /* ~There is clearly a flaw in the center which may detract from its value. (Why won't the <RACE> hand it over... <HESHE> can't suspect anything, can <HESHE>?) May I inspect it?~ */
++ @107 /* ~Of course, you may see it.~ */ + ag_tom_see2
++ @108 /* ~Here, then, take a look.~ */ + ag_tom_see2
END

IF
~~ ag_tom_see2
SAY
@109 /* ~Such flawless... That is... It has, as you can clearly see, a flaw in the center.~ */
= @110 /* ~That does detract from its value, but I will pay you, oh, perhaps 200 gold for it.~ */
++ @111 /* ~It's a deal.~ */ DO ~TakePartyItemNum("aggem02",1) DestroyItem("aggem02") GiveGoldForce(200) EraseJournalEntry(@75) AddJournalEntry(@102,QUEST_DONE)~ + ag_tom_store5
++ @113 /* ~I have a feeling that the "flaw" only adds to its value. I'll sell it to you for 1000 gold.~ */ + ag_tom_see4
+ ~Class(LastTalkedToBy,BARD_ALL)~ + @114 /* ~Oh no you don't! I have heard of star rubies, and I won't let this beauty out of my sight for anything under 2000 gold!~ */ + ag_tom_starbuy6
END

IF
~~ ag_tom_see4
SAY
@115 /* ~For such a stone? It is a risk on my part, a great risk. But you have been a good customer. Very well then, for you I will pay that amount.~ */
IF
~~
DO ~TakePartyItemNum("aggem02",1) DestroyItem("aggem02") GiveGoldForce(1000)
EraseJournalEntry(@75)
AddJournalEntry(@102,QUEST_DONE)~ + ag_tom_store5
END

IF
~~ ag_tom_starbuy6
SAY
@101 /* ~Ah, you drive a hard bargain, my friend. But... having held this wondrous stone, you know its worth.~ */
IF
~~
DO ~TakePartyItemNum("aggem02",1) DestroyItem("aggem02") GiveGoldForce(2000) EraseJournalEntry(@75) AddJournalEntry(@102,QUEST_DONE)~ + ag_tom_gogondy
END

IF
~~ ag_tom_gogondy
SAY
@117 /* ~Let's celebrate this with a toast of gogondy. This is something few non-svirfneblin have ever clapped their lips on, but you've earned the right to taste it. Don't worry, this is the watered-down version. You couldn't handle the real stuff, heh heh.~ */
IF
~~
DO ~GiveItemCreate("agpotn04",LastTalkedToBy(),1,0,0)~ + ag_tom_store5
END

//No star ruby, still selling other rubies
IF
~~ ag_tom_gems_still
SAY
@118 /* ~Hmm. Well, that is a fine specimen you have there.~ */
= @119 /* ~I'll give you... 350 gold for it.~ */
++ @56 /* ~Done and done.~ */ DO ~IncrementGlobal("ag_tomruby","GLOBAL",1) TakePartyItemNum("aggem01",1) DestroyItem("aggem01") GiveGoldForce(350)~ + ag_tom_gems_3
  ++ @57 /* ~This stone is worth far more than that, surely!~ */ + ag_tom_gems_4
  ++ @58 /* ~On second thought, I'm not interested.~ */ + ag_tom_gems_2
END

//Back to mundane matters

IF
~~ ag_tom_store5
SAY
@112 /* ~Are you here to buy anything yourself this fine night?~ */
++ @33 /* ~I'd like to take a look at your stock, thanks.~ */ + ag_tom_stock
++ @46 /* ~I'll leave you be.~ */ + ag_tom_no
END

IF
~~ ag_tom_store4
SAY
@116 /* ~I suppose I could expect little else. Well, are you wishing to buy anything yourself?~ */
++ @33 /* ~I'd like to take a look at your stock, thanks.~ */ + ag_tom_stock
++ @46 /* ~I'll leave you be.~ */ + ag_tom_no
END

IF
~~ ag_tom_store
SAY
@70 /* ~Splendid! Are you wishing to make any purchases tonight?~ */
++ @33 /* ~I'd like to take a look at your stock, thanks.~ */ + ag_tom_stock
++ @46 /* ~I'll leave you be.~ */ + ag_tom_no
+ ~Global("ag_tomthal_upgrade","GLOBAL",0) GlobalTimerExpired("ag_tomup","GLOBAL")~ + @132 /* ~I'm curious if you can provide other products than what you've got in stock.~ */ + ag_tom_up_service
+ ~Global("ag_tomthal_upgrade","GLOBAL",1)~ + @133 /* ~I want to talk about your enchanter acquaintance.~ */ + ag_tom_up_help
+ ~Global("ag_tomthal_upgrade","GLOBAL",2) GlobalTimerExpired("ag_tom_upgrade_timer","GLOBAL")~ + @134 /* ~So, what about the enchanter?~ */ + ag_tom_up_info
+ ~Global("ag_tomthal_upgrade","GLOBAL",3)~ + @135 /* ~Do I have anything that can be used for enchanting?~ */ + ag_tom_up_check
+ ~Global("ag_tomthal_upgrade","GLOBAL",4) GlobalTimerExpired("ag_tom_upgrade_timer","GLOBAL")~ + @136 /* ~So, what about my order?~ */ + ag_tom_up_battle_give
+ ~Global("ag_tomthal_upgrade","GLOBAL",5) GlobalTimerExpired("ag_tom_upgrade_timer","GLOBAL")~ + @136 /* ~So, what about my order?~ */ + ag_tom_up_stinky_give
+ ~Global("ag_tomthal_upgrade","GLOBAL",6) GlobalTimerExpired("ag_tom_upgrade_timer","GLOBAL")~ + @136 /* ~So, what about my order?~ */ + ag_tom_up_drow_give
END

//////////////////////////////////
//Below is the item upgrade code//
//////////////////////////////////

IF
~~ ag_tom_up_service
SAY @137 /* ~That's a rather unexpected request. Is what I've got here in stock not good enough for you or what? Why do you ask, <RACE>?~ */
++ @138 /* ~Just curious, as I've said. Can you, or can you not?~ */ + ag_tom_up_curious
++ @139 /* ~It's good enough, thank you very much. But I thought perhaps it can get even better. I'll pay handsomely, of course.~ */ + ag_tom_up_pay_gold
++ @140 /* ~On second thought, nevermind. Let's get back to usual business.~ */ + ag_tom_stock
END

IF
~~ ag_tom_up_curious
SAY @141 /* ~Look, <RACE>, I'm not here to satisfy your stubborn interest as to what I can or what I can't do. That's my business, not yours. If you wish to make a special order and can pay for it then do so. I'll think about it, if it piques my interest.~ */
++ @142 /* ~You have well-enchanted goods for sale, so you should have some connections. Is it possible to haggle a special deal?~ */ + ag_tom_up_special
++ @143 /* ~I wonder if you can provide special merchandise not usually available for sale.~ */ + ag_tom_up_special
++ @140 /* ~On second thought, nevermind. Let's get back to usual business.~ */ + ag_tom_stock
END

IF
~~ ag_tom_up_pay_gold
SAY @144 /* ~Why haven't you said from the start that it's about business? What kind of service are you looking for exactly?~ */
++ @145 /* ~You have well-enchanted goods for offer, so you should have some connections. Is it possible to haggle a special deal?~ */ + ag_tom_up_special
++ @143 /* ~I wonder if you can provide special merchandise not usually available for sale.~ */ + ag_tom_up_special
++ @140 /* ~On second thought, nevermind. Let's get back to usual business.~ */ + ag_tom_stock
END

IF
~~ ag_tom_up_special
SAY @146 /* ~Hrmph, I don't know. It's not like my usual suppliers are going to have something to offer. You might be better off hiring a professional enchanter who'll make your stuff. Not that I know one, though... On the other hand, hmmm... Well, I probably do, albeit he's not exactly what you'd expect from a licensed specialist.~ */
= @147 /* ~You see, he doesn't do the enchanting process himself, but instead tinkers with already made enchantments. I've got no clue if that's due to him not paying bribes to Cowled Wizards or just because he's a surface human who can't comprehend the simplest of magical arts. (Not that I can either, though... Takes two illithids to understand how that stupid magic works, mark my words.)~ */
= @148 /* ~For a certain price he can reassemble some stuff and make it work better than before. But here's a problem, now that I think of it. Last I've heard of him, he was short on supplies, much like me, so I doubt he can be compelled to work even if you pay a dozen thousand gold coins.~ */
++ @149 /* ~Indeed that's a heavy sum. But before I go, what can I expect from that acquaintance of yours?~ */ DO ~SetGlobal("ag_tomthal_upgrade","GLOBAL",1)~ + ag_tom_up_problem
+ ~PartyGoldGT(11999)~ + @150 /* ~I've got money. Will you tell me more?~ */ DO ~SetGlobal("ag_tomthal_upgrade","GLOBAL",1)~ + ag_tom_up_problem
+ ~PartyGoldGT(24999)~ + @151 /* ~I can afford that much, or more if needed. I want to know the details.~ */ DO ~SetGlobal("ag_tomthal_upgrade","GLOBAL",1)~ + ag_tom_up_problem
++ @152 /* ~Even?~ */ DO ~SetGlobal("ag_tomthal_upgrade","GLOBAL",1)~ + ag_tom_up_exactly
END

IF
~~ ag_tom_up_problem
SAY @153 /* ~Did you hear me well, <RACE>? I said *even* if you pay that much. He simply has no materials to work on, that's the matter. So you have to wait it out for a bit. But since you've got an interest in this, you'll hear a word from me when the situation changes.~ */
++ @154 /* ~Can the situation be helped one way or another? I would really appreciate an improvement in my equipment. Preferably sooner than later.~ */ + ag_tom_up_help
++ @155 /* ~And when roughly am I to expect your friend to get back into work?~ */ + ag_tom_up_not_friend
++ @156 /* ~What kind of material does he need?~ */ + ag_tom_up_help
++ @157 /* ~A pity. Let's leave this matter for a better time then.~ */ + ag_tom_stock
END

IF
~~ ag_tom_up_exactly
SAY @158 /* ~Exactly. He's got no materials to work on, so however much you pay it won't make them appear anytime soon. But since you've got an interest in this, you'll hear a word from me when the situation changes.~ */
++ @154 /* ~Can the situation be helped one way or another? I would really appreciate an improvement in my equipment. Preferably sooner than later.~ */ + ag_tom_up_help
++ @155 /* ~And when roughly am I to expect your friend to get back into work?~ */ + ag_tom_up_not_friend
++ @156 /* ~What kind of material does he need?~ */ + ag_tom_up_help
++ @157 /* ~A pity. Let's leave this matter for a better time then.~ */ + ag_tom_stock
END

IF
~~ ag_tom_up_not_friend
SAY @159 /* ~Friend? Hardly. (Like I would need such a friend, and a surfacer at that. Bah!) As for when, I know no better than you do.~ */
++ @205 /* ~I see.~ */ + ag_tom_up_help
++ @206 /* ~Tell me more.~ */ + ag_tom_up_help
END

IF
~~ ag_tom_up_help
SAY @161 /* ~Like I've said, he doesn't make enchantments, he rebuilds them. So he needs rather strong materials, things not easily obtainable in your regular shop. In other words, he takes enchanted items and plays with them a bit. As a usual result, something better comes out.~ */
++ @162 /* ~Are these materials something I can provide?~ */ + ag_tom_up_how
++ @163 /* ~Do you know exactly which items he needs?~ */ + ag_tom_up_how
++ @164 /* ~I have plenty of magical stuff. What will do?~ */ + ag_tom_up_how
END

IF
~~ ag_tom_up_how
SAY @165 /* ~How do you think I'm supposed to know that, <RACE>? If you're so persistent, I can send him a query, but it'll cost you a bit of coin. Five hundred should be enough, I guess.~ */
+ ~PartyGoldGT(499)~ + @166 /* ~Here you go.~ */ + ag_tom_up_query
++ @167 /* ~Can you instead introduce me to him?~ */ + ag_tom_up_introduce
++ @168 /* ~Later, then. Let's get back to usual business.~ */ + ag_tom_stock
END

IF
~~ ag_tom_up_introduce
SAY @169 /* ~So that you will strike a deal behind my back? No way, and don't even ask. (Does that <RACE> think I'm as stupid as a pile of dung? Ha!)~ */
+ ~PartyGoldGT(499)~ + @170 /* ~Fine, here are your coins.~ */ + ag_tom_up_query
++ @168 /* ~Later, then. Let's get back to usual business.~ */ + ag_tom_stock
END

IF
~~ ag_tom_up_query
SAY @171 /* ~Ah-ha, that's the business. It takes a little time to hear the answer, so come back tomorrow. I'll tell you what I find out.~ */
++ @172 /* ~Great. Now let's get back to usual business.~ */ DO ~SetGlobal("ag_tomthal_upgrade","GLOBAL",2) SetGlobalTimer("ag_tom_upgrade_timer","GLOBAL",6000) TakePartyGold(500) DestroyGold(500)~ + ag_tom_stock
++ @173 /* ~See you tomorrow then. Good night.~ */ DO ~SetGlobal("ag_tomthal_upgrade","GLOBAL",2) SetGlobalTimer("ag_tom_upgrade_timer","GLOBAL",6000) TakePartyGold(500) DestroyGold(500)~ EXIT
END

IF
~~ ag_tom_up_info
SAY @174 /* ~Yes, yes, the information you've paid so well for. He told me what kind of stuff he needs. Unfortunately, I'm no magician and can't always discern if the enchantment is good enough or not. But I think I can tell for sure about boots, since I deal often with them. So, is there anything I can help you with?~ */
++ @175 /* ~Will anything I have do?~ */ DO ~SetGlobal("ag_tomthal_upgrade","GLOBAL",3)~ + ag_tom_up_check
++ @176 /* ~For now, let's get back to usual business.~ */ DO ~SetGlobal("ag_tomthal_upgrade","GLOBAL",3)~ + ag_tom_stock
END

IF
~~ ag_tom_up_battle
SAY @177 /* ~According to what I know, it's possible to combine the magic of Bravery boots together with that of Battle boots. The process also requires a topaz to be successful. The work takes about a day, so come later. The cost is a dozen and a half thousand gold coins. Half now, half upon receiving your order.~ */
+ ~OR(2)
PartyHasItem("agboot15")
PartyHasItem("agboot28")~ + @178 /* ~Tell me about this "stinking" you mentioned.~ */ + ag_tom_up_stinky
+ ~OR(2)
PartyHasItem("agboot30")
PartyHasItem("boot07")~ + @179 /* ~Tell me about elven boots.~ */ + ag_tom_up_drow
+ ~PartyGoldGT(6249)
PartyHasItem("aggem06")
PartyHasItem("agboot04")
PartyHasItem("agboot05")~ + @180 /* ~Sounds good to me. Here you go.~ */ + ag_tom_up_battle_do
++ @181 /* ~Another time, perhaps. For now, let's talk about usual business.~ */ + ag_tom_stock
END

IF
~~ ag_tom_up_stinky
SAY @182 /* ~If you bring together Gnomish boots and what they know as "Stinky Feet," the latter can be refashioned to keep their power without having to smell like horse's dung. To work properly they also have to be electrified somehow or whatever that guy said. In any case it needs an amber gem. It can be done within two days. The price is twenty thousand gold. Ten now, ten later.~ */
+ ~OR(2)
PartyHasItem("agboot04")
PartyHasItem("agboot05")~ + @183 /* ~Tell me about combat enchantments.~ */ + ag_tom_up_battle
+ ~OR(2)
PartyHasItem("agboot30")
PartyHasItem("boot07")~ + @179 /* ~Tell me about elven boots.~ */ + ag_tom_up_drow
++ @184 /* ~I thought the talk was about a dozen thousand gold at most?~ */ + ag_tom_up_cost
+ ~PartyGoldGT(9999)
PartyHasItem("aggem07")
PartyHasItem("agboot15")
PartyHasItem("agboot28")~ + @185 /* ~No constant stench anymore? We have a deal.~ */ + ag_tom_up_stinky_do
++ @181 /* ~Another time, perhaps. For now, let's talk about usual business.~ */ + ag_tom_stock
END

IF
~~ ag_tom_up_drow
SAY @186 /* ~Both dark and surface elves put strong magic into their boots. So strong that it's very difficult to add any more. But the tinker we're talking about is a cunning one, and he knows a couple of dirty tricks. So if you can hand over Elven and Drow boots, an amethyst gem and a magical scroll that will hasten the boots up and wait for three days then you may see the result. Oh, yes, and it'll cost you fifteen thousand now and fifteen more when getting the result.~ */
+ ~OR(2)
PartyHasItem("agboot04")
PartyHasItem("agboot05")~ + @183 /* ~Tell me about combat enchantments.~ */ + ag_tom_up_battle
+ ~OR(2)
PartyHasItem("agboot15")
PartyHasItem("agboot28")~ + @178 /* ~Tell me about this "stinking" you mentioned.~ */ + ag_tom_up_stinky
++ @184 /* ~I thought the talk was about a dozen thousand gold at most?~ */ + ag_tom_up_cost
+ ~PartyGoldGT(14999)
PartyHasItem("aggem05")
PartyHasItem("scrl1h")
PartyHasItem("agboot30")
PartyHasItem("boot07")~ + @187 /* ~It better be worth it. Here you go.~ */ + ag_tom_up_drow_do
++ @181 /* ~Another time, perhaps. For now, let's talk about usual business.~ */ + ag_tom_stock
END

IF
~~ ag_tom_up_cost
SAY @188 /* ~I don't know what other components are required. Besides, I need to get my share as well, to keep staying on my feet.~ */
+ ~OR(2)
PartyHasItem("agboot04")
PartyHasItem("agboot05")~ + @183 /* ~Tell me about combat enchantments.~ */ EXTERN agtomtha ag_tom_up_battle
+ ~OR(2)
PartyHasItem("agboot15")
PartyHasItem("agboot28")~ + @178 /* ~Tell me about this "stinking" you mentioned.~ */ EXTERN agtomtha ag_tom_up_stinky
+ ~OR(2)
PartyHasItem("agboot30")
PartyHasItem("boot07")~ + @179 /* ~Tell me about elven boots.~ */ EXTERN agtomtha ag_tom_up_drow
++ @189 /* ~I see. Another time, then. For now, let's talk about usual business.~ */ + ag_tom_stock
END

IF
~~ ag_tom_up_battle_do
SAY @190 /* ~Remember, 6250 more gold or you won't see it. Come back tomorrow.~ */
IF ~~ THEN DO ~
TakePartyItem("agboot04")
DestroyItem("agboot04")
TakePartyItem("agboot05")
DestroyItem("agboot05")
TakePartyItemNum("aggem06",1)
DestroyItem("aggem06")
TakePartyGold(6250)
DestroyGold(6250)
SetGlobalTimer("ag_tom_upgrade_timer","GLOBAL",6000)
SetGlobal("ag_tomthal_upgrade","GLOBAL",4)~ EXIT
END

IF
~~ ag_tom_up_stinky_do
SAY @191 /* ~Remember, ten thousand or you won't see it. Come back the day after tomorrow.~ */
IF ~~ THEN DO ~
TakePartyItemNum("aggem07",1)
DestroyItem("aggem07")
TakePartyItem("agboot15")
DestroyItem("agboot15")
TakePartyItem("agboot28")
DestroyItem("agboot28")
TakePartyGold(10000)
DestroyGold(10000)
SetGlobalTimer("ag_tom_upgrade_timer","GLOBAL",13000)
SetGlobal("ag_tomthal_upgrade","GLOBAL",5)~ EXIT
END

IF
~~ ag_tom_up_drow_do
SAY @192 /* ~Remember, fifteen thousand or you won't see it. Come back in three days.~ */
IF ~~ THEN DO ~
TakePartyItemNum("aggem05",1)
DestroyItem("aggem05")
TakePartyItemNum("scrl1h",1)
DestroyItem("scrl1h")
TakePartyItem("agboot30")
DestroyItem("agboot30")
TakePartyItem("boot07")
DestroyItem("boot07")
TakePartyGold(15000)
DestroyGold(15000)
SetGlobalTimer("ag_tom_upgrade_timer","GLOBAL",20000)
SetGlobal("ag_tomthal_upgrade","GLOBAL",6)~ EXIT
END

IF
~~ ag_tom_up_battle_give
SAY @193 /* ~Yes, I've got them here. Now if you pay my share of the deal then you may have them.~ */
+ ~PartyGoldGT(6249)~ + @166 /* ~Here you go.~ */ + ag_tom_up_battle_deal
++ @194 /* ~I think I'll take them later. Back to usual business, if you don't mind.~ */ + ag_tom_stock
END

IF
~~ ag_tom_up_stinky_give
SAY @195 /* ~Yes, I've got them here. Now, if you pay my share of the deal then you may have them.~ */
+ ~PartyGoldGT(9999)~ + @166 /* ~Here you go.~ */ + ag_tom_up_stinky_deal
++ @194 /* ~I think I'll take them later. Back to usual business, if you don't mind.~ */ + ag_tom_stock
END

IF
~~ ag_tom_up_drow_give
SAY @195 /* ~Yes, I've got them here. Now, if you pay my share of the deal then you may have them.~ */
+ ~PartyGoldGT(14999)~ + @166 /* ~Here you go.~ */ + ag_tom_up_drow_deal
++ @194 /* ~I think I'll take them later. Back to usual business, if you don't mind.~ */ + ag_tom_stock
END

IF
~~ ag_tom_up_battle_deal
SAY @196 /* ~Most excellent! Here is your merchandise. A pleasure doing business with you, <SIRMAAM>. Come back again, if you ever need more.~ */
IF ~~ THEN DO ~
TakePartyGold(6250)
DestroyGold(6250)
SetGlobal("ag_tomthal_upgrade","GLOBAL",3)
GiveItemCreate("agboot32",LastTalkedToBy(),0,0,0)~ EXIT
END

IF
~~ ag_tom_up_stinky_deal
SAY @196 /* ~Most excellent! Here is your merchandise. A pleasure doing business with you, <SIRMAAM>. Come back again, if you ever need more.~ */
IF ~~ THEN DO ~
TakePartyGold(10000)
DestroyGold(10000)
SetGlobal("ag_tomthal_upgrade","GLOBAL",3)
GiveItemCreate("agboot34",LastTalkedToBy(),1,0,0)~ EXIT
END

IF
~~ ag_tom_up_drow_deal
SAY @196 /* ~Most excellent! Here is your merchandise. A pleasure doing business with you, <SIRMAAM>. Come back again, if you ever need more.~ */
IF ~~ THEN DO ~
TakePartyGold(15000)
DestroyGold(15000)
SetGlobal("ag_tomthal_upgrade","GLOBAL",3)
GiveItemCreate("agboot36",LastTalkedToBy(),2,0,0)~ EXIT
END

CHAIN agtomtha ag_tom_up_check
@197 /* ~Let's see...~ */
== agtomtha IF ~OR(2)
PartyHasItem("agboot04")
PartyHasItem("agboot05")~ THEN @198 /* ~Aha, so you fight a good battle at times. These boots are surely of a great help when fighting against the odds.~ */
== agtomtha IF ~OR(2)
PartyHasItem("agboot15")
PartyHasItem("agboot28")~ THEN @199 /* ~Have you ever heard the disgusting joke about a stinking gnome? Maybe you have, maybe you haven't. What I mean is, I see here something which reminds me of that surface tale.~ */
== agtomtha IF ~OR(2)
PartyHasItem("agboot30")
PartyHasItem("boot07")~ THEN @200 /* ~Here we've got some fancy shoes made by pointy-eared ones. (Ugh, how can these possibly be worn?) These can be made into one nasty combination, I tell you.~ */
== agtomtha IF ~OR(6)
PartyHasItem("agboot04")
PartyHasItem("agboot05")
PartyHasItem("agboot15")
PartyHasItem("agboot28")
PartyHasItem("agboot30")
PartyHasItem("boot07")~ THEN @201 /* ~That's all, I think. There might be something else, but it's beyond my skill to tell if it's truly so.~ */
== agtomtha IF ~
!PartyHasItem("agboot04")
!PartyHasItem("agboot05")
!PartyHasItem("agboot15")
!PartyHasItem("agboot28")
!PartyHasItem("agboot30")
!PartyHasItem("boot07")~ THEN @202 /* ~Hmm... No, nothing will do, as far as I can tell.~ */
END
+ ~OR(2)
PartyHasItem("agboot04")
PartyHasItem("agboot05")~ + @183 /* ~Tell me about combat enchantments.~ */ EXTERN agtomtha ag_tom_up_battle
+ ~OR(2)
PartyHasItem("agboot15")
PartyHasItem("agboot28")~ + @178 /* ~Tell me about this "stinking" you mentioned.~ */ EXTERN agtomtha ag_tom_up_stinky
+ ~OR(2)
PartyHasItem("agboot30")
PartyHasItem("boot07")~ + @179 /* ~Tell me about elven boots.~ */ EXTERN agtomtha ag_tom_up_drow
++ @203 /* ~May I see your usual wares instead?.~ */ EXTERN agtomtha ag_tom_stock
++ @160 /* ~Nothing for now. See you later.~ */ EXIT
