BEGIN agkaraea

//Sleeping dialogue
IF ~StateCheck(Myself,STATE_SLEEPING)~ agkar_sleep
  SAY @256 /* ~Zzzzz...~ */
  IF ~~ EXIT
END

//Charmed dialogue (if A64's patch is installed)
IF ~StateCheck(Myself,STATE_CHARMED)~ agkar_charm
  SAY @151 /* ~Ooh, it's <GABBER>! I've been waiting for you to get here! Want to see my latest jam recipe? It's a secret, but I'll let you in on it!~ */
  ++ @152 /* ~That's nice, Karaea, but I'm in a bit of a hurry.~ */ + agkar_charm1
  ++ @153 /* ~Sure, why not?~ */ + agkar_charm2
  ++ @154 /* ~Not right now. I've got to get going.~ */ + agkar_charm3
END

IF ~~ agkar_charm1
  SAY @155 /* ~Oh... right. Well, would you fancy rummaging through my stock? I'm running low on some stuff, but I'll do my best to find what you want.~ */
  ++ @156 /* ~I think I would actually, thanks.~ */ + agkar_charm4
  ++ @157 /* ~Not this time, Karaea. Just passing through.~ */ + agkar_charm5
END

IF ~~ agkar_charm2
  SAY @158 /* ~Here it is. Three parts lingonberries, one part honey and a dash of anise seed. But don't tell anyone else!~ */
  = @159 /* ~Fancy rummaging through my stock? I'm running low on some stuff, but I'll do my best to find what you want.~ */
  ++ @156 /* ~I think I would actually, thanks.~ */ + agkar_charm4
  ++ @157 /* ~Not this time, Karaea. Just passing through.~ */ + agkar_charm5
END

IF ~~ agkar_charm3
  SAY @160 /* ~Oh... that's too bad. Well, come back soon, <GABBER>! I'll bake you a special pie!~ */
  IF ~~ EXIT
END

IF ~~ agkar_charm4
  SAY @161 /* ~Any time.~ */
  IF ~Global("ag_karbg","GLOBAL",1)~ DO ~StartStore("agkarbg1",LastTalkedToBy())~ EXIT
  IF ~Global("ag_karbg","GLOBAL",0)~ DO ~StartStore("agkaraea",LastTalkedToBy())~ EXIT
END

IF ~~ agkar_charm5
  SAY @162 /* ~Okay, bye then. I hope to see you again soon!~ */
  IF ~~ EXIT
END

IF ~~ ag_kstore
  SAY @107 /* ~Here's my wares, then! I hope you find something you like!~ */
  IF ~Global("ag_karbg","GLOBAL",1)~ DO ~StartStore("agkarbg1",LastTalkedToBy())~ EXIT
  IF ~Global("ag_karbg","GLOBAL",0)~ DO ~StartStore("agkaraea",LastTalkedToBy())~ EXIT
END

CHAIN IF
~
Global("ag_karagreet","GLOBAL",0)
Global("ag_karawalk","GLOBAL",1)~ THEN agkaraea ag_kargreet
@0 /* ~Hello. You look tired.~ */
= @1 /* ~Would you like some bread and jam?~ */
DO ~SetGlobal("ag_karagreet","GLOBAL",1) SetGlobalTimer("ag_karup","GLOBAL",TWO_DAYS)~
END
++ @2 /* ~I would enjoy that. Thank you.~ */ EXTERN agkaraea ag_jam1
++ @3 /* ~Are you trying to sell me something?~ */ EXTERN agkaraea ag_jam2
++ @4 /* ~No.~ */ EXTERN agkaraea ag_jam3
++ @5 /* ~Go away.~ */ DO ~IncrementGlobal("ag_karrude","GLOBAL",1) ActionOverride("agkaraea",EscapeArea())~ EXIT

CHAIN agkaraea ag_jam1
@6 /* ~Ooh good. What kind do you want?~ */
DO ~SetGlobal("ag_atejam","GLOBAL",1)~
= @7 /* ~I have blueberry, blackberry, raspberry, strawberry, goodberry and some apple spread. No gooseberry, though. I haven't had gooseberry in a long time.~ */
END
++ @8 /* ~I'll take the blueberry, thank you.~ */ EXTERN agkaraea ag_jamblue
++ @9 /* ~I'll take the blackberry, thank you.~ */ EXTERN agkaraea ag_jamblack
++ @10 /* ~I'll take the raspberry, thank you.~ */ EXTERN agkaraea ag_jamras
++ @11 /* ~I'll take the goodberry, thank you.~ */ EXTERN agkaraea ag_jamgood
++ @12 /* ~I'll take the apple spread, thank you.~ */ EXTERN agkaraea ag_jamapple
++ @13 /* ~I'll take the strawberry, thank you.~ */ EXTERN agkaraea ag_jamstraw
++ @14 /* ~Why no gooseberry?~ */ EXTERN agkaraea ag_jamgoose
++ @15 /* ~How much will this cost, anyway?~ */ EXTERN agkaraea ag_jam2

CHAIN agkaraea ag_jam2
@16 /* ~Oh, no! I'm not... This is just...~ */
= @17 /* ~I mean, I do sell things. I have boots, and jars of jam, and pies and things.~ */
= @18 /* ~But this is just a gift. Because you look tired, and I thought maybe you'd like some. It's fresh bread, you know. I just got it from the baker.~ */
END
+ ~Global("ag_atejam","GLOBAL",0) Global("ag_karagreet","GLOBAL",1)~ + @19 /* ~Then thank you. I would love to have some bread and jam.~ */ EXTERN agkaraea ag_jam1
+ ~Global("ag_atejam","GLOBAL",0) Global("ag_karagreet","GLOBAL",1)~ + @20 /* ~I don't want anything to eat, but I would love to see your wares.~ */ EXTERN agkaraea ag_kstore

+ ~!Dead("agaurora") !Dead("agasleep") !Dead("agtomtha") !Dead("agtsleep") Global("ag_kboots","GLOBAL",0)~ + @21 /* ~Boots, jam and pie? Isn't that an odd combination?~ */ EXTERN agkaraea ag_kboots
+ ~OR(2) Dead("agaurora") Dead("agasleep") !Dead("agtomtha") !Dead("agtsleep") Global("ag_kboots","GLOBAL",0)~ + @21 /* ~Boots, jam and pie? Isn't that an odd combination?~ */ EXTERN agkaraea ag_kboots2
+ ~OR(2) Dead("agtomtha") Dead("agtsleep") Global("ag_kboots","GLOBAL",0)~ + @21 /* ~Boots, jam and pie? Isn't that an odd combination?~ */ EXTERN agkaraea ag_kboots3

+ ~!Dead("agaurora") !Dead("agasleep") !Dead("agtomtha") !Dead("agtsleep") Global("ag_ksvir","GLOBAL",0)~ + @22 /* ~Wait, aren't you a svirfneblin? What's a svirfneblin doing on the surface?~ */ EXTERN agkaraea ag_karsvir
+ ~OR(2) Dead("agaurora") Dead("agasleep") !Dead("agtomtha") !Dead("agtsleep") Global("ag_ksvir","GLOBAL",0)~ + @22 /* ~Wait, aren't you a svirfneblin? What's a svirfneblin doing on the surface?~ */ EXTERN agkaraea ag_karsvir2
+ ~OR(2) Dead("agtomtha") Dead("agtsleep") Global("ag_ksvir","GLOBAL",0)~ + @22 /* ~Wait, aren't you a svirfneblin? What's a svirfneblin doing on the surface?~ */ EXTERN agkaraea ag_karsvir3
++ @23 /* ~I don't want anything now, but I shall certainly keep your goods in mind for the future.~ */ EXTERN agkaraea ag_karbye
++ @24 /* ~I hate charity. Go away.~ */ DO ~IncrementGlobal("ag_karrude","GLOBAL",1) ActionOverride("agkaraea",EscapeArea())~ EXIT

CHAIN agkaraea ag_jam3
@25 /* ~Oh. I-I'm sorry for disturbing you.~ */
= @26 /* ~I like bread and jam when I'm tired, and I thought you might, too.~ */
END
+ ~Global("ag_atejam","GLOBAL",0) Global("ag_karagreet","GLOBAL",1)~ + @27 /* ~I am sorry for being rude. I am tired, and I would love to have some bread and jam.~ */ EXTERN agkaraea ag_jam1
+ ~Global("ag_atejam","GLOBAL",0) Global("ag_karagreet","GLOBAL",1)~ + @28 /* ~I don't want anything to eat, but it looks like you have quite a pack full of stuff there. May I see your wares?~ */ EXTERN agkaraea ag_kstore
++ @29 /* ~I just assumed you were trying to sell me something.~ */ EXTERN agkaraea ag_jam2

+ ~!Dead("agaurora") !Dead("agasleep") !Dead("agtomtha") !Dead("agtsleep") Global("ag_ksvir","GLOBAL",0)~ + @22 /* ~Wait, aren't you a svirfneblin? What's a svirfneblin doing on the surface?~ */ EXTERN agkaraea ag_karsvir
+ ~OR(2) Dead("agaurora") Dead("agasleep") !Dead("agtomtha") !Dead("agtsleep") Global("ag_ksvir","GLOBAL",0)~ + @22 /* ~Wait, aren't you a svirfneblin? What's a svirfneblin doing on the surface?~ */ EXTERN agkaraea ag_karsvir2
+ ~OR(2) Dead("agtomtha") Dead("agtsleep") Global("ag_ksvir","GLOBAL",0)~ + @22 /* ~Wait, aren't you a svirfneblin? What's a svirfneblin doing on the surface?~ */ EXTERN agkaraea ag_karsvir3
++ @23 /* ~I don't want anything now, but I shall certainly keep your goods in mind for the future.~ */ EXTERN agkaraea ag_karbye
++ @24 /* ~I hate charity. Go away.~ */ DO ~IncrementGlobal("ag_karrude","GLOBAL",1) ActionOverride("agkaraea",EscapeArea())~ EXIT

CHAIN agkaraea ag_jamblue
@30 /* ~Ooh, that's one of my favorites! The blueberries were really sweet this year!~ */ DO ~GiveItemCreate("agbrea01",LastTalkedToBy(),1,0,0)~ EXTERN agkaraea ag_else

CHAIN agkaraea ag_jamblack
@31 /* ~Here you are! Careful, blackberry jam can really stain your clothes!~ */ DO ~GiveItemCreate("agbrea01",LastTalkedToBy(),1,0,0)~ EXTERN agkaraea ag_else

CHAIN agkaraea ag_jamras
@32 /* ~I love raspberry jam! It's such a cheerful color.~ */ DO ~GiveItemCreate("agbrea01",LastTalkedToBy(),1,0,0)~ EXTERN agkaraea ag_else

CHAIN agkaraea ag_jamgood
@33 /* ~Here you are! You know, goodberries are healing, too. Most people can't make jam out of them, though.~ */ DO ~GiveItemCreate("agbrea01",LastTalkedToBy(),1,0,0)~ EXTERN agkaraea ag_else

CHAIN agkaraea ag_jamapple
@34 /* ~Oh, the apple spread is extra-good this time! I was able to get *all* the right spices!~ */ DO ~GiveItemCreate("agbrea01",LastTalkedToBy(),1,0,0)~ EXTERN agkaraea ag_else

CHAIN agkaraea ag_jamstraw
@35 /* ~Here you are! It isn't the *best* strawberry jam I ever made, but it's still pretty good!~ */ DO ~GiveItemCreate("agbrea01",LastTalkedToBy(),1,0,0)~ EXTERN agkaraea ag_else

CHAIN agkaraea ag_jamgoose
@36 /* ~Nobody's brought me any gooseberries this year, and I haven't been able to find any, either.~ */
= @37 /* ~And I do so love gooseberry pie!~ */
END
+ ~PartyHasItem("agberr01")~ + @38 /* ~I have some here, would you like them?~ */ EXTERN agkaraea ag_goose2
+ ~!PartyHasItem("agberr01")~ + @39 /* ~I haven't seen any either, but if I do, I'll be sure to bring them to you.~ */ EXTERN agkaraea ag_gooseFuture

CHAIN agkaraea ag_gooseFuture
@40 /* ~Ooh, thank you! I would really like that! Here, have some bread and jam. Raspberry, my favorite!~ */ DO ~IncrementGlobal("ag_goosehunt","GLOBAL",1) GiveItemCreate("agbrea01",LastTalkedToBy(),1,0,0)~
= @41 /* ~Um, would you like to buy anything? I've jam and pie, and boots and things.~ */
END
++ @42 /* ~I don't want anything just now, thank you.~ */  EXTERN agkaraea ag_karbye
++ @43 /* ~So this was all a sales ploy. Figures.~ */ EXTERN agkaraea ag_jam5
++ @44 /* ~Sure, I'd love to see what you have to sell.~ */ EXTERN agkaraea ag_kstore

+ ~!Dead("agaurora") !Dead("agasleep") !Dead("agtomtha") !Dead("agtsleep") Global("ag_ksvir","GLOBAL",0)~ + @22 /* ~Wait, aren't you a svirfneblin? What's a svirfneblin doing on the surface?~ */ EXTERN agkaraea ag_karsvir
+ ~OR(2) Dead("agaurora") Dead("agasleep") !Dead("agtomtha") !Dead("agtsleep") Global("ag_ksvir","GLOBAL",0)~ + @22 /* ~Wait, aren't you a svirfneblin? What's a svirfneblin doing on the surface?~ */ EXTERN agkaraea ag_karsvir2
+ ~OR(2) Dead("agtomtha") Dead("agtsleep") Global("ag_ksvir","GLOBAL",0)~ + @22 /* ~Wait, aren't you a svirfneblin? What's a svirfneblin doing on the surface?~ */ EXTERN agkaraea ag_karsvir3
+ ~!Dead("agaurora") !Dead("agasleep") !Dead("agtomtha") !Dead("agtsleep") Global("ag_kboots","GLOBAL",0)~ + @21 /* ~Boots, jam and pie? Isn't that an odd combination?~ */ EXTERN agkaraea ag_kboots
+ ~OR(2) Dead("agaurora") Dead("agasleep") !Dead("agtomtha") !Dead("agtsleep") Global("ag_kboots","GLOBAL",0)~ + @21 /* ~Boots, jam and pie? Isn't that an odd combination?~ */ EXTERN agkaraea ag_kboots2
+ ~OR(2) Dead("agtomtha") Dead("agtsleep") Global("ag_kboots","GLOBAL",0)~ + @21 /* ~Boots, jam and pie? Isn't that an odd combination?~ */ EXTERN agkaraea ag_kboots3

+ ~Global("ag_atejam","GLOBAL",0) Global("ag_karagreet","GLOBAL",1)~ + @45 /* ~I think I would like to have some of that bread and jam first.~ */ EXTERN agkaraea ag_jam1

CHAIN agkaraea ag_goose2
@46 /* ~Ooh! Wonderful! Now I can make my favorite kind of pie!~ */ DO ~IncrementGlobal("ag_goosehunt","GLOBAL",1)~
= @47 /* ~Um... Do you want me to pay you for them?~ */
END
++ @48 /* ~Just look on it as a gift. Now, about that jam...~ */ DO ~TakePartyItemNum("agberr01",1) DestroyItem("agberr01")~ EXTERN agkaraea ag_goose3
++ @49 /* ~For you, only 20 gold.~ */ DO ~TakePartyItemNum("agberr01",1) DestroyItem("agberr01") GiveGoldForce(20)~ EXTERN agkaraea ag_kstore
++ @50 /* ~50 gold.~ */ EXTERN agkaraea ag_goose4
++ @51 /* ~100 gold.~ */ EXTERN agkaraea ag_goose5

CHAIN agkaraea ag_goose3
@52 /* ~Ooh, thank you!~ */ DO ~IncrementGlobal("ag_goosehunt","GLOBAL",1)~
== agkaraea IF ~Global("ag_goosehunt","GLOBAL",1)~ THEN @53 /* ~Um, let me give you a jar of jam to say thanks.~ */ DO ~GiveItemCreate("agjam05",LastTalkedToBy(),1,0,0)~
= @54 /* ~Would you like to buy anything?~ */ EXTERN agkaraea ag_else2

CHAIN agkaraea ag_goose4
@55 /* ~I can afford that.~ */ DO ~TakePartyItemNum("agberr01",1) DestroyItem("agberr01") GiveGoldForce(50)~
== agkaraea IF ~Global("ag_atejam","GLOBAL",0) Global("ag_karagreet","GLOBAL",1)~ THEN @56 /* ~Um, would you like some bread and jam now?~ */
== agkaraea IF ~Global("ag_atejam","GLOBAL",1)~ THEN @57 /* ~Um, would you like to buy anything?~ */
END
+ ~Global("ag_atejam","GLOBAL",0) Global("ag_karagreet","GLOBAL",1)~ + @58 /* ~Thank you. I would love to have some bread and jam.~ */ EXTERN agkaraea ag_jam1
+ ~Global("ag_atejam","GLOBAL",0) Global("ag_karagreet","GLOBAL",1)~ + @20 /* ~I don't want anything to eat, but I would love to see your wares.~ */ EXTERN agkaraea ag_kstore
+ ~!Dead("agaurora") !Dead("agasleep") !Dead("agtomtha") !Dead("agtsleep") Global("ag_ksvir","GLOBAL",0)~ + @22 /* ~Wait, aren't you a svirfneblin? What's a svirfneblin doing on the surface?~ */ EXTERN agkaraea ag_karsvir
+ ~OR(2) Dead("agaurora") Dead("agasleep") !Dead("agtomtha") !Dead("agtsleep") Global("ag_ksvir","GLOBAL",0)~ + @22 /* ~Wait, aren't you a svirfneblin? What's a svirfneblin doing on the surface?~ */ EXTERN agkaraea ag_karsvir2
+ ~OR(2) Dead("agtomtha") Dead("agtsleep") Global("ag_ksvir","GLOBAL",0)~ + @22 /* ~Wait, aren't you a svirfneblin? What's a svirfneblin doing on the surface?~ */ EXTERN agkaraea ag_karsvir3
++ @23 /* ~I don't want anything now, but I shall certainly keep your goods in mind for the future.~ */ EXTERN agkaraea ag_karbye
+ ~Global("ag_atejam","GLOBAL",0) Global("ag_karagreet","GLOBAL",1)~ + @24 /* ~I hate charity. Go away.~ */ DO ~IncrementGlobal("ag_karrude","GLOBAL",1) ActionOverride("agkaraea",EscapeArea())~ EXIT
+ ~Global("ag_atejam","GLOBAL",1)~ + @59 /* ~I am not interested. Go away.~ */ DO ~IncrementGlobal("ag_karrude","GLOBAL",1) ActionOverride("agkaraea",EscapeArea())~ EXIT

CHAIN agkaraea ag_goose5
@60 /* ~Oh. I can't afford that.~ */
END
++ @61 /* ~Then make it 20 gold.~ */ DO ~TakePartyItemNum("agberr01",1) DestroyItem("agberr01") GiveGoldForce(20)~ EXTERN agkaraea ag_else2
++ @50 /* ~50 gold.~ */ EXTERN agkaraea ag_goose4
++ @62 /* ~Then I guess I won't be selling it to you.~ */ DO ~IncrementGlobal("ag_karrude","GLOBAL",1)~ EXTERN agkaraea ag_nopie

CHAIN agkaraea ag_else
@64 /* ~If there's anything else you want, let me know!~ */
= @65 /* ~I have boots, and jars of jam, and pies and things.~ */
= @66 /* ~I mean, those are for sale, but I have good prices!~ */
END
++ @42 /* ~I don't want anything just now, thank you.~ */ EXTERN agkaraea ag_karbye
++ @43 /* ~So this was all a sales ploy. Figures.~ */ EXTERN agkaraea ag_jam5
++ @44 /* ~Sure, I'd love to see what you have to sell.~ */ EXTERN agkaraea ag_kstore
+ ~!Dead("agaurora") !Dead("agasleep") !Dead("agtomtha") !Dead("agtsleep") Global("ag_ksvir","GLOBAL",0)~ + @22 /* ~Wait, aren't you a svirfneblin? What's a svirfneblin doing on the surface?~ */ EXTERN agkaraea ag_karsvir
+ ~OR(2) Dead("agaurora") Dead("agasleep") !Dead("agtomtha") !Dead("agtsleep") Global("ag_ksvir","GLOBAL",0)~ + @22 /* ~Wait, aren't you a svirfneblin? What's a svirfneblin doing on the surface?~ */ EXTERN agkaraea ag_karsvir2
+ ~OR(2) Dead("agtomtha") Dead("agtsleep") Global("ag_ksvir","GLOBAL",0)~ + @22 /* ~Wait, aren't you a svirfneblin? What's a svirfneblin doing on the surface?~ */ EXTERN agkaraea ag_karsvir3
+ ~!Dead("agaurora") !Dead("agasleep") !Dead("agtomtha") !Dead("agtsleep") Global("ag_kboots","GLOBAL",0)~ + @21 /* ~Boots, jam and pie? Isn't that an odd combination?~ */ EXTERN agkaraea ag_kboots
+ ~OR(2) Dead("agaurora") Dead("agasleep") !Dead("agtomtha") !Dead("agtsleep") Global("ag_kboots","GLOBAL",0)~ + @21 /* ~Boots, jam and pie? Isn't that an odd combination?~ */ EXTERN agkaraea ag_kboots2
+ ~OR(2) Dead("agtomtha") Dead("agtsleep") Global("ag_kboots","GLOBAL",0)~ + @21 /* ~Boots, jam and pie? Isn't that an odd combination?~ */ EXTERN agkaraea ag_kboots3

CHAIN agkaraea ag_else2
@65 /* ~I have boots, and jars of jam, and pies and things.~ */
= @66 /* ~I mean, those are for sale, but I have good prices!~ */
END
++ @42 /* ~I don't want anything just now, thank you.~ */ EXTERN agkaraea ag_karbye
++ @43 /* ~So this was all a sales ploy. Figures.~ */ EXTERN agkaraea ag_jam5
++ @44 /* ~Sure, I'd love to see what you have to sell.~ */ EXTERN agkaraea ag_kstore
+ ~!Dead("agaurora") !Dead("agasleep") !Dead("agtomtha") !Dead("agtsleep") Global("ag_ksvir","GLOBAL",0)~ + @22 /* ~Wait, aren't you a svirfneblin? What's a svirfneblin doing on the surface?~ */ EXTERN agkaraea ag_karsvir
+ ~OR(2) Dead("agaurora") Dead("agasleep") !Dead("agtomtha") !Dead("agtsleep") Global("ag_ksvir","GLOBAL",0)~ + @22 /* ~Wait, aren't you a svirfneblin? What's a svirfneblin doing on the surface?~ */ EXTERN agkaraea ag_karsvir2
+ ~OR(2) Dead("agtomtha") Dead("agtsleep") Global("ag_ksvir","GLOBAL",0)~ + @22 /* ~Wait, aren't you a svirfneblin? What's a svirfneblin doing on the surface?~ */ EXTERN agkaraea ag_karsvir3
+ ~Global("ag_kboots","GLOBAL",0)~ + @21 /* ~Boots, jam and pie? Isn't that an odd combination?~ */ EXTERN agkaraea ag_kboots

CHAIN agkaraea ag_jam5
@68 /* ~Oh, no! I mean, it was a gift!~ */
= @69 /* ~I just sell things, too! And I thought you might like some boots, or something.~ */
END
++ @70 /* ~It's ok. I'm sorry I was rude. Let me see what you have.~ */ EXTERN agkaraea ag_kstore
++ @71 /* ~I don't want to hear about it.~ */ DO ~IncrementGlobal("ag_karrude","GLOBAL",1) ActionOverride("agkaraea",EscapeArea())~ EXIT
++ @72 /* ~Whatever. Let me see what you have.~ */ DO ~IncrementGlobal("ag_karrude","GLOBAL",1)~ EXTERN agkaraea ag_kstore
+ ~!Dead("agaurora") !Dead("agasleep") !Dead("agtomtha") !Dead("agtsleep") Global("ag_ksvir","GLOBAL",0)~ + @22 /* ~Wait, aren't you a svirfneblin? What's a svirfneblin doing on the surface?~ */ EXTERN agkaraea ag_karsvir
+ ~OR(2) Dead("agaurora") Dead("agasleep") !Dead("agtomtha") !Dead("agtsleep") Global("ag_ksvir","GLOBAL",0)~ + @22 /* ~Wait, aren't you a svirfneblin? What's a svirfneblin doing on the surface?~ */ EXTERN agkaraea ag_karsvir2
+ ~OR(2) Dead("agtomtha") Dead("agtsleep") Global("ag_ksvir","GLOBAL",0)~ + @22 /* ~Wait, aren't you a svirfneblin? What's a svirfneblin doing on the surface?~ */ EXTERN agkaraea ag_karsvir3
+ ~!Dead("agaurora") !Dead("agasleep") !Dead("agtomtha") !Dead("agtsleep") Global("ag_kboots","GLOBAL",0)~ + @21 /* ~Boots, jam and pie? Isn't that an odd combination?~ */ EXTERN agkaraea ag_kboots
+ ~OR(2) Dead("agaurora") Dead("agasleep") !Dead("agtomtha") !Dead("agtsleep") Global("ag_kboots","GLOBAL",0)~ + @21 /* ~Boots, jam and pie? Isn't that an odd combination?~ */ EXTERN agkaraea ag_kboots2
+ ~OR(2) Dead("agtomtha") Dead("agtsleep") Global("ag_kboots","GLOBAL",0)~ + @21 /* ~Boots, jam and pie? Isn't that an odd combination?~ */ EXTERN agkaraea ag_kboots3

CHAIN agkaraea ag_karsvir
@73 /* ~I, um. I like it here.~ */
= @74 /* ~I mean, I came with my brother, at first. To keep him company.~ */
DO ~SetGlobal("ag_ksvir","GLOBAL",1)~
= @75 /* ~But it's pretty up here too. And I like to explore and meet people.~ */
END
++ @76 /* ~What brought your brother here?~ */ EXTERN agkaraea ag_bro1
+ ~Global("ag_kboots","GLOBAL",0)~ + @77 /* ~So you sell boots, jam and pie. It's a rather odd combination.~ */ EXTERN agkaraea ag_kboots
+ ~Global("ag_atejam","GLOBAL",0)~ + @78 /* ~I think I would like some of that bread and jam now, if I may.~ */ EXTERN agkaraea ag_jam1
++ @79 /* ~May I see your wares, please?~ */ EXTERN agkaraea ag_kstore

CHAIN agkaraea ag_bro1
@80 /* ~He, um, says he's under a curse.~ */
END
++ @81 /* ~A curse? What kind of curse?~ */ EXTERN agkaraea ag_bro3
++ @82 /* ~I guess it would take a curse to bring a svirfneblin up to the surface, but why did you come?~ */ EXTERN agkaraea ag_bro2
++ @83 /* ~Oh. May I see what you have to sell?~ */ EXTERN agkaraea ag_kstore
+ ~Global("ag_kboots","GLOBAL",0)~ + @84 /* ~You sell boots, jam and pie. Isn't that kind of an odd combination?~ */ EXTERN agkaraea ag_kboots

CHAIN agkaraea ag_kboots
@85 /* ~Oh, I sell jam and pie because I like them.~ */
DO ~SetGlobal("ag_kboots","GLOBAL",1)~
= @86 /* ~And my brother sells boots, in Athkatla. So I sell them too.~ */
= @87 /* ~He says they're the best boots you'll find anywhere on the surface.~ */
END
+ ~!Dead("agaurora") !Dead("agasleep") !Dead("agtomtha") !Dead("agtsleep") Global("ag_ksvir","GLOBAL",0)~ + @88 /* ~But what is a svifneblin doing on the surface?~ */ EXTERN agkaraea ag_karsvir
+ ~Global("ag_atejam","GLOBAL",0) Global("ag_karagreet","GLOBAL",1)~ + @78 /* ~I think I would like some of that bread and jam now, if I may.~ */ EXTERN agkaraea ag_jam1
++ @89 /* ~You said your brother is in Athkatla. Isn't that rather far from here?~ */ EXTERN agkaraea ag_bro4
++ @90 /* ~May I see your wares?~ */ EXTERN agkaraea ag_kstore

CHAIN agkaraea ag_bro2
@91 /* ~I thought he shouldn't be alone. He's in Athkatla now though.~ */
= @92 /* ~But I also wanted to see what the surface was like.~ */
END
++ @93 /* ~And what do you think?~ */ EXTERN agkaraea ag_flowers
++ @94 /* ~What sort of a curse did you say your brother was under?~ */ EXTERN agkaraea ag_bro3
+ ~Global("ag_atejam","GLOBAL",0) Global("ag_karagreet","GLOBAL",1)~ + @78 /* ~I think I would like some of that bread and jam now, if I may.~ */ EXTERN agkaraea ag_jam1
++ @95 /* ~You said your brother was in Athkatla? Isn't that rather far from here?~ */ EXTERN agkaraea ag_bro4
++ @90 /* ~May I see your wares?~ */ EXTERN agkaraea ag_kstore

CHAIN agkaraea ag_bro3
@96 /* ~I don't know. Tomthal won't say. He, um, gets really crabby.~ */
= @97 /* ~I mean, he's always crabby, but he gets *really* crabby when I ask. He's in Athkatla now though.~ */
END
++ @98 /* ~So why did you come with him?~ */ EXTERN agkaraea ag_flowers
+ ~Global("ag_atejam","GLOBAL",0) Global("ag_karagreet","GLOBAL",1)~ + @78 /* ~I think I would like some of that bread and jam now, if I may.~ */ EXTERN agkaraea ag_jam1
++ @89 /* ~You said your brother is in Athkatla. Isn't that rather far from here?~ */ EXTERN agkaraea ag_bro4
++ @90 /* ~May I see your wares?~ */ EXTERN agkaraea ag_kstore

CHAIN agkaraea ag_flowers
@99 /* ~Oh, I love it here! There are so many flowers, and fruits, and the sun is so bright!~ */
END
++ @95 /* ~You said your brother was in Athkatla? Isn't that rather far from here?~ */ EXTERN agkaraea ag_bro4
+ ~Global("ag_atejam","GLOBAL",0) Global("ag_karagreet","GLOBAL",1)~ + @78 /* ~I think I would like some of that bread and jam now, if I may.~ */ EXTERN agkaraea ag_jam1
++ @90 /* ~May I see your wares?~ */ EXTERN agkaraea ag_kstore

CHAIN agkaraea ag_bro4
@100 /* ~Oooh, yes.~ */
= @101 /* ~But I go there, sometimes, and we can send letters.~ */
== agkaraea IF ~!Dead("agaurora") !Dead("agasleep")~ THEN @102 /* ~That's where I get the boots, too, from Aurora. My brother says she talks too much, but I think she's nice.~ */
== agkaraea IF ~OR(2) Dead("agaurora") Dead("agasleep")~ THEN @260 /* ~That's where I get the boots, too, from Aurora... or how I did. She gone, I'm afraid. My brother runs the shop now.~ */
= @103 /* ~And the boots are really good. Would you like to see them?~ */
END
+ ~Global("ag_atejam","GLOBAL",0) Global("ag_karagreet","GLOBAL",1)~ + @104 /* ~Actually, I think I would like some of that bread and jam you mentioned.~ */ EXTERN agkaraea ag_jam1
++ @105 /* ~Yes, show me what you have.~ */ EXTERN agkaraea ag_kstore
++ @106 /* ~Not right now.~ */ EXTERN agkaraea ag_karbye

CHAIN agkaraea ag_karbye
@257 /* ~Bye-bye then. Come again soon!~ */
DO ~~ EXIT

//Player's been really really rude
CHAIN IF
~GlobalGT("ag_karrude","GLOBAL",9)~ THEN agkaraea ag_neversell
@126 /* ~Oh! You're the really rude <RACE>! I don't want to talk to you!~ */ DO ~ActionOverride("agkaraea",EscapeArea())~ EXIT

//Second meeting, with amber rose
CHAIN IF
~
Global("ag_karagreet","GLOBAL",1)
Global("ag_kararose","GLOBAL",0)
PartyHasItem("dgiambe2")~ THEN agkaraea ag_rose1
@261 /* ~Ooooh! An amber rose... how pretty! Where did you find it?~ */
DO ~SetGlobal("ag_kararose","GLOBAL",1)~
END
++ @262 /* ~It is from a garden deep under the surface.~ */ EXTERN agkaraea ag_rose2
++ @263 /* ~It was a gift... there is no other like it.~ */ EXTERN agkaraea ag_rose2

CHAIN agkaraea ag_rose2
@264 /* ~I have never seen its like, and I've seen all sorts of flowers above and below ground...~ */
= @265 /* ~Can I buy it from you?~ */
END
++ @266 /* ~A mere 350 gold and it's yours.~ */ EXTERN agkaraea ag_rose3
++ @267 /* ~For you, only 750 gold.~ */ EXTERN agkaraea ag_rose4
++ @268 /* ~1500 gold.~ */ EXTERN agkaraea ag_rose5
++ @269 /* ~2500 gold.~ */ EXTERN agkaraea ag_rose6

CHAIN agkaraea ag_rose3
@270 /* ~Wow, thanks! Here's your gold, and a little of my goodberry jam for such a great price!~ */ DO ~TakePartyItem("dgiambe2") GiveGoldForce(350) FillSlot(SLOT_RING_RIGHT) GiveItemCreate("agjam04",LastTalkedToBy(),1,0,0)~
= @115 /* ~Was there anything you wanted?~ */
END
++ @116 /* ~Yes, I would like to see your wares, please.~ */ EXTERN agkaraea ag_kstore
+ ~Global("ag_ksvir","GLOBAL",0)~ + @117 /* ~I've been wondering, what brings a svirfneblin to the surface anyway?~ */  EXTERN agkaraea ag_karsvir
++ @118 /* ~Not today, thank you.~ */ EXTERN agkaraea ag_karbye

CHAIN agkaraea ag_rose4
@119 /* ~That's a good price!~ */ DO ~TakePartyItem("dgiambe2") GiveGoldForce(750) FillSlot(SLOT_RING_RIGHT)~
= @115 /* ~Was there anything you wanted?~ */
END
++ @116 /* ~Yes, I would like to see your wares, please.~ */ EXTERN agkaraea ag_kstore
+ ~Global("ag_ksvir","GLOBAL",0)~ + @117 /* ~I've been wondering, what brings a svirfneblin to the surface anyway?~ */  EXTERN agkaraea ag_karsvir
++ @118 /* ~Not today, thank you.~ */ EXTERN agkaraea ag_karbye

CHAIN agkaraea ag_rose5
@120 /* ~Oh, I can afford that.~ */ DO ~TakePartyItem("dgiambe2") GiveGoldForce(1500) FillSlot(SLOT_RING_RIGHT)~
= @115 /* ~Was there anything you wanted?~ */
END
++ @116 /* ~Yes, I would like to see your wares, please.~ */ EXTERN agkaraea ag_kstore
+ ~Global("ag_ksvir","GLOBAL",0)~ + @117 /* ~I've been wondering, what brings a svirfneblin to the surface anyway?~ */  EXTERN agkaraea ag_karsvir
++ @118 /* ~Not today, thank you.~ */ EXTERN agkaraea ag_karbye

CHAIN agkaraea ag_rose6
@60 /* ~Oh. I can't afford that.~ */
END
++ @271 /* ~Then make it 750 gold.~ */ EXTERN agkaraea ag_rose4
++ @272 /* ~1500 gold, then.~ */ EXTERN agkaraea ag_rose5
++ @63 /* ~A shame. In that case, may I see your wares?~ */ EXTERN agkaraea ag_kstore
++ @67 /* ~A shame. In that case, I'll be on my way.~ */ EXTERN agkaraea ag_karbye

//Second meeting, with gooseberries
CHAIN IF
~
Global("ag_karagreet","GLOBAL",1)
Global("ag_karagoose","GLOBAL",0)
PartyHasItem("agberr01")~ THEN agkaraea ag_kargreet3
@108 /* ~Ooooh! Are those gooseberries? Where did you find gooseberries?!~ */
DO ~SetGlobal("ag_karagoose","GLOBAL",1)~
END
++ @109 /* ~Just around. Why, do you want them?~ */ EXTERN agkaraea ag_goose1
++ @110 /* ~What is it to you?~ */ EXTERN agkaraea ag_goose1
++ @111 /* ~What do they look like?~ */ EXTERN agkaraea ag_goose1

CHAIN agkaraea ag_goose1
@112 /* ~I love gooseberries! They're my very favorite!~ */
= @113 /* ~Can I buy them from you?~ */
END
++ @114 /* ~Here, take them as a gift.~ */ DO ~IncrementGlobal("ag_goosehunt","GLOBAL",1)~ EXTERN agkaraea ag_gooseTx2
++ @49 /* ~For you, only 20 gold.~ */ EXTERN agkaraea ag_goose7
++ @50 /* ~50 gold.~ */ EXTERN agkaraea ag_goose8
++ @51 /* ~100 gold.~ */ EXTERN agkaraea ag_goose9

CHAIN agkaraea ag_gooseTx2
@46 /* ~Ooh! Wonderful! Now I can make my favorite kind of pie!~ */
== agkaraea IF ~Global("ag_goosehunt","GLOBAL",1)~ THEN @53 /* ~Um, let me give you a jar of jam to say thanks.~ */ DO ~TakePartyItemNum("agberr01",1) DestroyItem("agberr01") GiveItemCreate("agjam06",LastTalkedToBy(),1,0,0)~
= @115 /* ~Was there anything you wanted?~ */
END
++ @116 /* ~Yes, I would like to see your wares, please.~ */ EXTERN agkaraea ag_kstore
+ ~Global("ag_ksvir","GLOBAL",0)~ + @117 /* ~I've been wondering, what brings a svirfneblin to the surface anyway?~ */  EXTERN agkaraea ag_karsvir
++ @118 /* ~Not today, thank you.~ */ EXTERN agkaraea ag_karbye

CHAIN agkaraea ag_goose7
@119 /* ~That's a good price!~ */ DO ~TakePartyItemNum("agberr01",1) DestroyItem("agberr01") GiveGoldForce(20)~
= @115 /* ~Was there anything you wanted?~ */ DO ~IncrementGlobal("ag_goosehunt","GLOBAL",1)~
END
++ @116 /* ~Yes, I would like to see your wares, please.~ */ EXTERN agkaraea ag_kstore
+ ~Global("ag_ksvir","GLOBAL",0)~ + @117 /* ~I've been wondering, what brings a svirfneblin to the surface anyway?~ */  EXTERN agkaraea ag_karsvir
++ @118 /* ~Not today, thank you.~ */ EXTERN agkaraea ag_karbye

CHAIN agkaraea ag_goose8
@120 /* ~Oh, I can afford that.~ */ DO ~TakePartyItemNum("agberr01",1) DestroyItem("agberr01") GiveGoldForce(50)~
= @115 /* ~Was there anything you wanted?~ */ DO ~IncrementGlobal("ag_goosehunt","GLOBAL",1)~
END
++ @116 /* ~Yes, I would like to see your wares, please.~ */ EXTERN agkaraea ag_kstore
+ ~Global("ag_ksvir","GLOBAL",0)~ + @117 /* ~I've been wondering, what brings a svirfneblin to the surface anyway?~ */  EXTERN agkaraea ag_karsvir
++ @118 /* ~Not today, thank you.~ */ EXTERN agkaraea ag_karbye

CHAIN agkaraea ag_goose9
@60 /* ~Oh. I can't afford that.~ */
END
++ @61 /* ~Then make it 20 gold.~ */ EXTERN agkaraea ag_goose7
++ @121 /* ~50 gold, then.~ */ EXTERN agkaraea ag_goose8
++ @122 /* ~Then I guess I'm keeping them.~ */ DO ~IncrementGlobal("ag_karrude","GLOBAL",1)~ EXTERN agkaraea ag_nopie

CHAIN agkaraea ag_nopie
@123 /* ~Oh well. Was there anything you wanted to buy from me?~ */
END
++ @116 /* ~Yes, I would like to see your wares, please.~ */ EXTERN agkaraea ag_kstore
+ ~Global("ag_ksvir","GLOBAL",0)~ + @117 /* ~I've been wondering, what brings a svirfneblin to the surface anyway?~ */  EXTERN agkaraea ag_karsvir
++ @118 /* ~Not today, thank you.~ */ EXTERN agkaraea ag_karbye

//Enough berries for pie
CHAIN IF
~
Global("ag_karagreet","GLOBAL",1)
Global("ag_goosehunt","GLOBAL",15)~ THEN agkaraea ag_karagreet3
@127 /* ~Ooooh! You're here! I'm so glad!~ */
DO ~IncrementGlobal("ag_goosehunt","GLOBAL",1)~
END
++ @128 /* ~Why is that?~ */ EXTERN agkaraea ag_pienow
++ @129 /* ~Hello, Karaea.~ */ EXTERN agkaraea ag_pienow
++ @130 /* ~I'd like to do some shopping now, please.~ */ EXTERN agkaraea ag_butgoose
++ @131 /* ~Shut up.~ */ DO ~IncrementGlobal("ag_karrude","GLOBAL",1)~ EXIT

//Second meeting, without gooseberries, or after first time with
CHAIN IF
~
Global("ag_karagreet","GLOBAL",1)~ THEN agkaraea ag_kargreet2
@124 /* ~Oh! It's you! Is there anything you want?~ */
END
++ @116 /* ~Yes, I would like to see your wares, please.~ */ EXTERN agkaraea ag_kstore
+ ~Global("ag_ksvir","GLOBAL",0)~ + @117 /* ~I've been wondering, what brings a svirfneblin to the surface anyway?~ */  EXTERN agkaraea ag_karsvir
+ ~Global("ag_karagoose","GLOBAL",1) PartyHasItem("agberr01")~ + @125 /* ~I believe you mentioned liking gooseberries? I have some here.~ */ EXTERN agkaraea ag_goose1
+ ~Global("agkar_upgrade","GLOBAL",0) GlobalTimerExpired("ag_karup","GLOBAL")~ + @163 /* ~I'm curious if you can provide other products than those you've got in stock.~ */ + agkar_up_service
+ ~Global("agkar_upgrade","GLOBAL",1)~ + @164 /* ~I want to talk about your transmuter friend.~ */ + agkar_up_help
+ ~Global("agkar_upgrade","GLOBAL",2) GlobalTimerExpired("agkar_upgrade_timer","GLOBAL")~ + @165 /* ~So, what about the transmuter?~ */ + agkar_up_info
+ ~Global("agkar_upgrade","GLOBAL",3)~ + @166 /* ~Do I have anything that can be used for transmutation?~ */ + agkar_up_check
+ ~Global("agkar_upgrade","GLOBAL",4) GlobalTimerExpired("agkar_upgrade_timer","GLOBAL")~ + @167 /* ~What's the status of my order?~ */ + agkar_up_battle_give
+ ~Global("agkar_upgrade","GLOBAL",5) GlobalTimerExpired("agkar_upgrade_timer","GLOBAL")~ + @167 /* ~What's the status of my order?~ */ + agkar_up_love_give
+ ~Global("agkar_upgrade","GLOBAL",6) GlobalTimerExpired("agkar_upgrade_timer","GLOBAL")~ + @167 /* ~What's the status of my order?~ */ + agkar_up_stinky_give
+ ~Global("agkar_upgrade","GLOBAL",7) GlobalTimerExpired("agkar_upgrade_timer","GLOBAL")~ + @167 /* ~What's the status of my order?~ */ + agkar_up_armored_give
+ ~Global("agkar_upgrade","GLOBAL",8) GlobalTimerExpired("agkar_upgrade_timer","GLOBAL")~ + @167 /* ~What's the status of my order?~ */ + agkar_up_drow_give
+ ~Global("agkar_upgrade","GLOBAL",9) GlobalTimerExpired("agkar_upgrade_timer","GLOBAL")~ + @167 /* ~What's the status of my order?~ */ + agkar_up_daemon_give
+ ~Global("agkar_upgrade","GLOBAL",10) GlobalTimerExpired("agkar_upgrade_timer","GLOBAL")~ + @167 /* ~What's the status of my order?~ */ + agkar_up_shield_give
++ @118 /* ~Not today, thank you.~ */ EXTERN agkaraea ag_karbye

CHAIN agkaraea ag_pienow
@132 /* ~I've been baking! And I've got a gooseberry pie just for you!~ */ DO ~GiveItemCreate("agpie01",LastTalkedToBy(),1,0,0)~
END
++ @133 /* ~Thank you, Karaea. I appreciate the gift.~ */ EXTERN agkaraea ag_karbye
++ @134 /* ~Thank you, Karaea. I appreciate the gift. I would like to do some shopping now, as well.~ */ EXTERN agkaraea ag_kstore
++ @135 /* ~Pie? Yuck.~ */ DO ~IncrementGlobal("ag_karrude","GLOBAL",1)~ EXIT

CHAIN agkaraea ag_butgoose
@136 /* ~But I...~ */

END
++ @137 /* ~Sorry I interrupted you. What was it?~ */ EXTERN agkaraea ag_pienow
++ @138 /* ~Look, I'm sorry I was rude, but all I really want to do is shop.~ */ EXTERN agkaraea ag_kstore
++ @139 /* ~Shut up! Just Shut. Up.~ */ DO ~IncrementGlobal("ag_karrude","GLOBAL",2)~ EXIT
++ @140 /* ~Sorry. You seemed excited. What was it you wanted to say?~ */ EXTERN agkaraea ag_pienow

///New lines--out of order of where I'd put them pre-trafying; I'll move them if the translation is not already in progress**

CHAIN agkaraea ag_karsvir2
@73 /* ~I, um. I like it here.~ */
= @74 /* ~I mean, I came with my brother, at first. To keep him company.~ */
DO ~SetGlobal("ag_ksvir","GLOBAL",1)~
= @141 /* ~I... don't know where he is now, but I hope I'll find him someday.~ */
= @142 /* ~And it's pretty up here too. I like to explore and meet people.~ */
END
+ ~Global("ag_kboots","GLOBAL",0)~ + @77 /* ~So you sell boots, jam and pie. It's a rather odd combination.~ */ EXTERN agkaraea ag_kboots2
+ ~Global("ag_atejam","GLOBAL",0)~ + @78 /* ~I think I would like some of that bread and jam now, if I may.~ */ EXTERN agkaraea ag_jam1
++ @79 /* ~May I see your wares, please?~ */ EXTERN agkaraea ag_kstore

CHAIN agkaraea ag_karsvir3
@73 /* ~I, um. I like it here.~ */
= @74 /* ~I mean, I came with my brother, at first. To keep him company.~ */
DO ~SetGlobal("ag_ksvir","GLOBAL",1)~
= @143 /* ~I... he's dead now, but... I still like it here.~ */
= @144 /* ~I like to explore and meet people.~ */
END
+ ~Global("ag_kboots","GLOBAL",0)~ + @77 /* ~So you sell boots, jam and pie. It's a rather odd combination.~ */ EXTERN agkaraea ag_kboots3
+ ~Global("ag_atejam","GLOBAL",0)~ + @78 /* ~I think I would like some of that bread and jam now, if I may.~ */ EXTERN agkaraea ag_jam1
++ @79 /* ~May I see your wares, please?~ */ EXTERN agkaraea ag_kstore

CHAIN agkaraea ag_kboots2
@85 /* ~Oh, I sell jam and pie because I like them.~ */
DO ~SetGlobal("ag_kboots","GLOBAL",1)~
= @145 /* ~And my brother used to sell boots, in Athkatla. So I sell them too.~ */
= @146 /* ~He told me they were the best boots you'll find anywhere on the surface.~ */
= @147 /* ~I haven't seen him in a long time, but... I still have the boots.~ */
END
+ ~OR(2) Dead("agaurora") Dead("agasleep") !Dead("agtomtha") !Dead("agtsleep") Global("ag_ksvir","GLOBAL",0)~ + @88 /* ~But what is a svifneblin doing on the surface?~ */ EXTERN agkaraea ag_karsvir2
+ ~Global("ag_atejam","GLOBAL",0) Global("ag_karagreet","GLOBAL",1)~ + @78 /* ~I think I would like some of that bread and jam now, if I may.~ */ EXTERN agkaraea ag_jam1
++ @90 /* ~May I see your wares?~ */ EXTERN agkaraea ag_kstore

CHAIN agkaraea ag_kboots3
@85 /* ~Oh, I sell jam and pie because I like them.~ */
DO ~SetGlobal("ag_kboots","GLOBAL",1)~
= @145 /* ~And my brother used to sell boots, in Athkatla. So I sell them too.~ */
= @146 /* ~He told me they were the best boots you'll find anywhere on the surface.~ */
= @148 /* ~He's dead now... but... I still have the boots.~ */
END
+ ~OR(2) Dead("agtomtha") Dead("agtsleep") Global("ag_ksvir","GLOBAL",0)~ + @88 /* ~But what is a svifneblin doing on the surface?~ */ EXTERN agkaraea ag_karsvir3
+ ~Global("ag_atejam","GLOBAL",0) Global("ag_karagreet","GLOBAL",1)~ + @78 /* ~I think I would like some of that bread and jam now, if I may.~ */ EXTERN agkaraea ag_jam1
++ @90 /* ~May I see your wares?~ */ EXTERN agkaraea ag_kstore

//////////////////////////////////
//Below is the item upgrade code//
//////////////////////////////////

APPEND agkaraea
IF
~~ agkar_up_service
SAY @168 /* ~Are you pulling my short gnomish leg, <GABBER>? Don't I have more than enough shoes for you and all your friends, one for each day of the week? Maybe each day of the month? Why do you ask, anyway?~ */
++ @169 /* ~Just wondering, like I said. So have you got anything else?~ */ + agkar_up_curious
++ @170 /* ~Oh, your boots are quite plentiful. With your skill, however, are there no opportunities for enhancing them? I'll pay generously, of course.~ */ + agkar_up_pay_gold
++ @171 /* ~Well, nevermind. Let's get back to usual business.~ */ + ag_kstore
END

IF
~~ agkar_up_curious
SAY @172 /* ~Well, I don't make all the boots, you know. Jams and pies are my specialty. But I do fill special orders from time to time, for a price. If you have something in mind, run it by me and I'll try my best.~ */
++ @173 /* ~You have some fancy footwear here, so you should have some connections beyond just Aurora. Is it possible to secure a special deal?~ */ + agkar_up_special
++ @174 /* ~I wonder if you can provide special merchandise not usually available for sale.~ */ + agkar_up_special
++ @171 /* ~Well, nevermind. Let's get back to usual business.~ */ + ag_kstore
END

IF
~~ agkar_up_pay_gold
SAY @175 /* ~Hmm, well I do have costs to cover. Ordinarily, I'd help however I could, but my skills are... limited. What exactly are you looking for?~ */
++ @173 /* ~You have some fancy footwear here, so you should have some connections beyond just Aurora. Is it possible to secure a special deal?~ */ + agkar_up_special
++ @174 /* ~I wonder if you can provide special merchandise not usually available for sale.~ */ + agkar_up_special
++ @171 /* ~Well, nevermind. Let's get back to usual business.~ */ + ag_kstore
END

IF
~~ agkar_up_special
SAY @176 /* ~Hmm, I dunno. It's not like my usual supplier has anything additional. You might be better off hiring a transmuter who'll modify the boots. Not that I know a transmuter. Hmm, well there is this crazy old half-elf hermit...~ */
= @177 /* ~He doesn't really create items but instead messes around with existing ones, combining and changing them. He's not really right in the head though, so I can't guarantee the quality of his work. I have no magical skill myself beyond a few illusions, though that probably wouldn't help you much.~ */
= @178 /* ~I think he can be bribed to refashion some materials and make them work better than before. But there's a problem, now that I think of it. Last I heard, he was short on supplies, much like I am, so I doubt he can be compelled to work even if you pay fifteen thousand gold coins.~ */
++ @179 /* ~A hefty sum indeed. But before I consider it, what can I expect from this transmuter of yours?~ */ DO ~SetGlobal("agkar_upgrade","GLOBAL",1)~ + agkar_up_problem
+ ~PartyGoldGT(14999)~ + @180 /* ~I've got money. Will you tell me more?~ */ DO ~SetGlobal("agkar_upgrade","GLOBAL",1)~ + agkar_up_problem
+ ~PartyGoldGT(24999)~ + @181 /* ~I can afford that much, or more if needed. I want to know the details.~ */ DO ~SetGlobal("agkar_upgrade","GLOBAL",1)~ + agkar_up_problem
++ @182 /* ~Even?~ */ DO ~SetGlobal("agkar_upgrade","GLOBAL",1)~ + agkar_up_exactly
END

IF
~~ agkar_up_problem
SAY @183 /* ~Hee hee! You're funny, <GABBER>. I said *even* if you pay that much. He just has no materials to work on, that's the problem. So you may have to wait a bit. But since you're interested, I'll see if I can get in touch with him and let you know if the situation changes.~ */
++ @184 /* ~Can we remedy this one way or another? I'd really appreciate an improvement in my equipment. Preferably sooner than later.~ */ + agkar_up_help
++ @185 /* ~And when roughly am I to expect this hermit to get back into work?~ */ + agkar_up_hermit
++ @186 /* ~What kind of material does he need?~ */ + agkar_up_help
++ @187 /* ~A pity. Let's leave this matter for a better time then.~ */ + ag_kstore
END

IF
~~ agkar_up_exactly
SAY @188 /* ~Exactly. He has no materials to work with, so however much you pay it won't make them appear anytime soon. But since you're interested, I'll let you know if the situation changes.~ */
++ @184 /* ~Can we remedy this one way or another? I'd really appreciate an improvement in my equipment. Preferably sooner than later.~ */ + agkar_up_help
++ @185 /* ~And when roughly am I to expect this hermit to get back into work?~ */ + agkar_up_hermit
++ @186 /* ~What kind of material does he need?~ */ + agkar_up_help
++ @187 /* ~A pity. Let's leave this matter for a better time then.~ */ + ag_kstore
END

IF
~~ agkar_up_hermit
SAY @189 /* ~Well he *is* reclusive... and a bit mad. So, as for when, I have no real clue.~ */
++ @258 /* ~I see.~ */ + agkar_up_help
++ @259 /* ~Tell me more.~ */ + agkar_up_help
END

IF
~~ agkar_up_help
SAY @191 /* ~He transmutes items, combining them with qualities of all the ingredients. So he needs certain materials, things not easily obtained in shops. In other words, he takes special items and hacks around with them a bit. Usually, something better comes from his tinkering. Or so we hope.~ */
++ @192 /* ~Are these materials something I can provide?~ */ + agkar_up_how
++ @193 /* ~Do you know exactly which items he needs?~ */ + agkar_up_how
++ @194 /* ~I have plenty of magical things. What will do?~ */ + agkar_up_how
END

IF
~~ agkar_up_how
SAY @195 /* ~Ooh, I'm not really sure, <GABBER>. If you wish, I can try to find out, but it'll take some gold just to track him down. Five hundred should be enough, I suppose.~ */
+ ~PartyGoldGT(499)~ + @196 /* ~Here you go.~ */ + agkar_up_query
++ @197 /* ~Can you instead introduce me to him?~ */ + agkar_up_introduce
++ @198 /* ~Later, then. Let's get back to usual business.~ */ + ag_kstore
END

IF
~~ agkar_up_introduce
SAY @199 /* ~I don't even know where he is these days. He keeps low and moves around a lot. So I'll have to make some queries, maybe even bribe some shady characters. Eww.~ */
+ ~PartyGoldGT(499)~ + @200 /* ~Fine, here are your coins.~ */ + agkar_up_query
++ @198 /* ~Later, then. Let's get back to usual business.~ */ + ag_kstore
END

IF
~~ agkar_up_query
SAY @201 /* ~Fair enough. I'll see if I can get a quick response, so come back tomorrow. I'll let you know what I find out then.~ */
++ @202 /* ~Okay. Now let's get back to usual business.~ */ DO ~SetGlobal("agkar_upgrade","GLOBAL",2) SetGlobalTimer("agkar_upgrade_timer","GLOBAL",6000) TakePartyGold(500) DestroyGold(500)~ + ag_kstore
++ @203 /* ~See you tomorrow then. Good day.~ */ DO ~SetGlobal("agkar_upgrade","GLOBAL",2) SetGlobalTimer("agkar_upgrade_timer","GLOBAL",6000) TakePartyGold(500) DestroyGold(500)~ EXIT
END

IF
~~ agkar_up_info
SAY @204 /* ~Well, I tracked down this crazy hermit and found out what kind of materials he needs. My knowledge of lore is fair enough, but I can't always identify everything. I do know a thing or two about boots... and jams, though I don't think jams are of much use in transmuting. So, can I help you with anything?~ */
++ @205 /* ~Will anything I have do?~ */ DO ~SetGlobal("agkar_upgrade","GLOBAL",3)~ + agkar_up_check
++ @206 /* ~For now, let's get back to usual business.~ */ DO ~SetGlobal("agkar_upgrade","GLOBAL",3)~ + ag_kstore
END

IF
~~ agkar_up_battle
SAY @207 /* ~According to what I know, it's possible to combine the Boots of Bravery with Boots of Battle. The process also requires a topaz to be successful. The work takes about a day, so come back tomorrow. The cost is a dozen and a half thousand gold coins. I'll need half now and half when it's done.~ */
+ ~OR(2)
PartyHasItem("agboot09")
PartyHasItem("agboot19")~ + @208 /* ~Tell me about fast, sexy boots.~ */ + agkar_up_love
+ ~OR(2)
PartyHasItem("agboot15")
PartyHasItem("agboot28")~ + @209 /* ~Tell me about this "stinking" you mentioned.~ */ + agkar_up_stinky
+ ~OR(4)
PartyHasItem("%tsu%boot04")
PartyHasItem("agboot21")
PartyHasItem("agboot22")
PartyHasItem("agboot23")~ + @210 /* ~Tell me about armored boots.~ */ + agkar_up_armored
+ ~OR(2)
PartyHasItem("agboot30")
PartyHasItem("%tsu%boot07")~ + @211 /* ~Tell me about elven boots.~ */ + agkar_up_drow
+ ~OR(2)
PartyHasItem("agboot31")
PartyHasItem("%tsu%boot01")~ + @212 /* ~Tell me about daemon boots.~ */ + agkar_up_daemon
+ ~OR(2)
PartyHasItem("%tsu%misc02")
PartyHasItem("agshld01")~ + @213 /* ~Tell me about mirrors and shields.~ */ + agkar_up_shield
+ ~PartyGoldGT(6249)
PartyHasItem("aggem06")
PartyHasItem("agboot04")
PartyHasItem("agboot05")~ + @214 /* ~Sounds good to me. Here you go.~ */ + agkar_up_battle_do
++ @215 /* ~Another time, perhaps. For now, let's talk about usual business.~ */ + ag_kstore
END

IF
~~ agkar_up_love
SAY @216 /* ~Well, apparently, it's possible to combine the Stylish Boots of the Cheetah with the shoes called "Love Lies Bleeding." The process also requires a fire opal to bind the transmutation. The work takes about a day, so come back tomorrow. The cost is fifteen thousand gold coins. I'll need half now and the other half when the new boots are done.~ */
+ ~OR(2)
PartyHasItem("agboot04")
PartyHasItem("agboot05")~ + @217 /* ~Tell me about combat enchantments.~ */ + agkar_up_battle
+ ~OR(2)
PartyHasItem("agboot15")
PartyHasItem("agboot28")~ + @209 /* ~Tell me about this "stinking" you mentioned.~ */ + agkar_up_stinky
+ ~OR(4)
PartyHasItem("%tsu%boot04")
PartyHasItem("agboot21")
PartyHasItem("agboot22")
PartyHasItem("agboot23")~ + @210 /* ~Tell me about armored boots.~ */ + agkar_up_armored
+ ~OR(2)
PartyHasItem("agboot30")
PartyHasItem("%tsu%boot07")~ + @211 /* ~Tell me about elven boots.~ */ + agkar_up_drow
+ ~OR(2)
PartyHasItem("agboot31")
PartyHasItem("%tsu%boot01")~ + @212 /* ~Tell me about daemon boots.~ */ + agkar_up_daemon
+ ~OR(2)
PartyHasItem("%tsu%misc02")
PartyHasItem("agshld01")~ + @213 /* ~Tell me about mirrors and shields.~ */ + agkar_up_shield
+ ~PartyGoldGT(7499)
PartyHasItem("aggem08")
PartyHasItem("agboot09")
PartyHasItem("agboot19")~ + @218 /* ~I have to have these. Here you go.~ */ + agkar_up_love_do
++ @215 /* ~Another time, perhaps. For now, let's talk about usual business.~ */ + ag_kstore
END

IF
~~ agkar_up_stinky
SAY @219 /* ~The hermit can combine Gnomish Boots with the infamous "Stinky Feet." He can even have them keep their power without having to raise a constant stench. Woo! It a special magical process that also needs an amber gem. It can be done in two days for a price of twenty thousand gold. Ten now, ten later.~ */
+ ~OR(2)
PartyHasItem("agboot04")
PartyHasItem("agboot05")~ + @217 /* ~Tell me about combat enchantments.~ */ + agkar_up_battle
+ ~OR(2)
PartyHasItem("agboot09")
PartyHasItem("agboot19")~ + @208 /* ~Tell me about fast, sexy boots.~ */ + agkar_up_love
+ ~OR(4)
PartyHasItem("%tsu%boot04")
PartyHasItem("agboot21")

PartyHasItem("agboot22")
PartyHasItem("agboot23")~ + @210 /* ~Tell me about armored boots.~ */ + agkar_up_armored
+ ~OR(2)
PartyHasItem("agboot30")
PartyHasItem("%tsu%boot07")~ + @211 /* ~Tell me about elven boots.~ */ + agkar_up_drow
+ ~OR(2)
PartyHasItem("agboot31")
PartyHasItem("%tsu%boot01")~ + @212 /* ~Tell me about daemon boots.~ */ + agkar_up_daemon
+ ~OR(2)
PartyHasItem("%tsu%misc02")
PartyHasItem("agshld01")~ + @213 /* ~Tell me about mirrors and shields.~ */ + agkar_up_shield
++ @220 /* ~I thought the talk was about fifteen thousand gold at most?~ */ + agkar_up_cost
+ ~PartyGoldGT(9999)
PartyHasItem("aggem07")
PartyHasItem("agboot15")
PartyHasItem("agboot28")~ + @221 /* ~No constant stench anymore? We have a deal.~ */ + agkar_up_stinky_do
++ @215 /* ~Another time, perhaps. For now, let's talk about usual business.~ */ + ag_kstore
END

IF
~~ agkar_up_armored
SAY @222 /* ~Putting together all three colors of Everyday Boots with the Boots of Avoidance will make a pair giving the wearer outstanding armor protection. They're rather flashy, but who doesn't like bright colors? Well, maybe not my brother, but anyway... the process also requires a bandfire opal, two days of labor and twenty-five thousand gold. Half now, half later.~ */
+ ~OR(2)
PartyHasItem("agboot04")
PartyHasItem("agboot05")~ + @217 /* ~Tell me about combat enchantments.~ */ + agkar_up_battle
+ ~OR(2)
PartyHasItem("agboot09")
PartyHasItem("agboot19")~ + @208 /* ~Tell me about fast, sexy boots.~ */ + agkar_up_love
+ ~OR(2)
PartyHasItem("agboot15")
PartyHasItem("agboot28")~ + @209 /* ~Tell me about this "stinking" you mentioned.~ */ + agkar_up_stinky
+ ~OR(2)
PartyHasItem("agboot30")
PartyHasItem("%tsu%boot07")~ + @211 /* ~Tell me about elven boots.~ */ + agkar_up_drow
+ ~OR(2)
PartyHasItem("agboot31")
PartyHasItem("%tsu%boot01")~ + @212 /* ~Tell me about daemon boots.~ */ + agkar_up_daemon
+ ~OR(2)
PartyHasItem("%tsu%misc02")
PartyHasItem("agshld01")~ + @213 /* ~Tell me about mirrors and shields.~ */ + agkar_up_shield
++ @220 /* ~I thought the talk was about fifteen thousand gold at most?~ */ + agkar_up_cost
+ ~PartyGoldGT(12499)
PartyHasItem("aggem09")
PartyHasItem("%tsu%boot04")
PartyHasItem("agboot21")
PartyHasItem("agboot22")
PartyHasItem("agboot23")~ + @223 /* ~Flashy *and* protective? We have a deal.~ */ + agkar_up_armored_do
++ @215 /* ~Another time, perhaps. For now, let's talk about usual business.~ */ + ag_kstore
END

IF
~~ agkar_up_drow
SAY @224 /* ~The light and dark elves both have boots of strong magic. So strong that it's hard to add any more. But the this hermit is a crafty one, and knows some special elven lore. So if you hand over the Elven Boots, Drow Boots, an amethyst gem and a scroll that will hasten the boots, you'll see the result in three days. Oh, yes, and it'll cost you fifteen thousand now and fifteen more when they're done.~ */
+ ~OR(2)
PartyHasItem("agboot04")
PartyHasItem("agboot05")~ + @217 /* ~Tell me about combat enchantments.~ */ + agkar_up_battle
+ ~OR(2)
PartyHasItem("agboot09")
PartyHasItem("agboot19")~ + @208 /* ~Tell me about fast, sexy boots.~ */ + agkar_up_love
+ ~OR(2)
PartyHasItem("agboot15")
PartyHasItem("agboot28")~ + @209 /* ~Tell me about this "stinking" you mentioned.~ */ + agkar_up_stinky
+ ~OR(4)
PartyHasItem("%tsu%boot04")
PartyHasItem("agboot21")
PartyHasItem("agboot22")
PartyHasItem("agboot23")~ + @210 /* ~Tell me about armored boots.~ */ + agkar_up_armored
+ ~OR(2)
PartyHasItem("agboot31")
PartyHasItem("%tsu%boot01")~ + @212 /* ~Tell me about daemon boots.~ */ + agkar_up_daemon
+ ~OR(2)
PartyHasItem("%tsu%misc02")
PartyHasItem("agshld01")~ + @213 /* ~Tell me about mirrors and shields.~ */ + agkar_up_shield
++ @220 /* ~I thought the talk was about fifteen thousand gold at most?~ */ + agkar_up_cost
+ ~PartyGoldGT(14999)
PartyHasItem("aggem05")
PartyHasItem("%tsu%scrl1h")
PartyHasItem("agboot30")
PartyHasItem("%tsu%boot07")~ + @225 /* ~It better be worth it. Here you go.~ */ + agkar_up_drow_do
++ @215 /* ~Another time, perhaps. For now, let's talk about usual business.~ */ + ag_kstore
END

IF
~~ agkar_up_daemon
SAY @226 /* ~Have you heard of the half-elf, half-fiend crossbreeds known as the daemonfey? Well, nevermind, they pretty much disappeared thousands of years ago. It's difficult to make the powerful Daemonfey Boots any better, but I think this transmuter has a few tricks up his sleeves. He'll combine these with the Boots of Speed and a star ruby for only thirty-five thousand. Half now, the rest when he's finished in three days.~ */
+ ~OR(2)
PartyHasItem("agboot04")
PartyHasItem("agboot05")~ + @217 /* ~Tell me about combat enchantments.~ */ + agkar_up_battle
+ ~OR(2)
PartyHasItem("agboot09")
PartyHasItem("agboot19")~ + @208 /* ~Tell me about fast, sexy boots.~ */ + agkar_up_love
+ ~OR(2)
PartyHasItem("agboot15")
PartyHasItem("agboot28")~ + @209 /* ~Tell me about this "stinking" you mentioned.~ */ + agkar_up_stinky
+ ~OR(4)
PartyHasItem("%tsu%boot04")
PartyHasItem("agboot21")
PartyHasItem("agboot22")
PartyHasItem("agboot23")~ + @210 /* ~Tell me about armored boots.~ */ + agkar_up_armored
+ ~OR(2)
PartyHasItem("agboot30")
PartyHasItem("%tsu%boot07")~ + @211 /* ~Tell me about elven boots.~ */ + agkar_up_drow
+ ~OR(2)
PartyHasItem("%tsu%misc02")
PartyHasItem("agshld01")~ + @213 /* ~Tell me about mirrors and shields.~ */ + agkar_up_shield
++ @220 /* ~I thought the talk was about fifteen thousand gold at most?~ */ + agkar_up_cost
+ ~PartyGoldGT(17499)
PartyHasItem("aggem02")
PartyHasItem("agboot31")
PartyHasItem("%tsu%boot01")~ + @227 /* ~I can afford the best. Here you go.~ */ + agkar_up_daemon_do
++ @215 /* ~Another time, perhaps. For now, let's talk about usual business.~ */ + ag_kstore
END

IF
~~ agkar_up_shield
SAY @228 /* ~Long ago, the valiant knight Gwalhaudh the Pure never returned from a quest, vanishing with his fabled shield that would keep evil at bay. A shield of this nature can be coated with a regular mirror and a diamond to reflect deadly gazes that would otherwise turn you to stone. It'll take two days and twenty-two and a half thousand. The usual story: half-now, half-later.~ */
+ ~OR(2)
PartyHasItem("agboot04")
PartyHasItem("agboot05")~ + @217 /* ~Tell me about combat enchantments.~ */ + agkar_up_battle
+ ~OR(2)
PartyHasItem("agboot09")
PartyHasItem("agboot19")~ + @208 /* ~Tell me about fast, sexy boots.~ */ + agkar_up_love
+ ~OR(2)
PartyHasItem("agboot15")
PartyHasItem("agboot28")~ + @209 /* ~Tell me about this "stinking" you mentioned.~ */ + agkar_up_stinky
+ ~OR(4)
PartyHasItem("%tsu%boot04")
PartyHasItem("agboot21")
PartyHasItem("agboot22")
PartyHasItem("agboot23")~ + @210 /* ~Tell me about armored boots.~ */ + agkar_up_armored
+ ~OR(2)
PartyHasItem("agboot30")
PartyHasItem("%tsu%boot07")~ + @211 /* ~Tell me about elven boots.~ */ + agkar_up_drow
+ ~OR(2)
PartyHasItem("agboot31")
PartyHasItem("%tsu%boot01")~ + @212 /* ~Tell me about daemon boots.~ */ + agkar_up_daemon
++ @220 /* ~I thought the talk was about fifteen thousand gold at most?~ */ + agkar_up_cost
+ ~PartyGoldGT(11249)
PartyHasItem("%tsu%misc02")
PartyHasItem("%tsu%misc42")
PartyHasItem("agshld01")~ + @229 /* ~Sounds like a deal. Here you go.~ */ + agkar_up_shield_do
++ @215 /* ~Another time, perhaps. For now, let's talk about usual business.~ */ + ag_kstore
END

IF
~~ agkar_up_cost
SAY @230 /* ~Well, the best stuff costs more of course. Plus I need a share to stay in business, though my cut isn't much.~ */
+ ~OR(2)
PartyHasItem("agboot04")
PartyHasItem("agboot05")~ + @217 /* ~Tell me about combat enchantments.~ */ EXTERN agkaraea agkar_up_battle
+ ~OR(2)
PartyHasItem("agboot09")
PartyHasItem("agboot19")~ + @208 /* ~Tell me about fast, sexy boots.~ */ EXTERN agkaraea agkar_up_love
+ ~OR(2)
PartyHasItem("agboot15")
PartyHasItem("agboot28")~ + @209 /* ~Tell me about this "stinking" you mentioned.~ */ EXTERN agkaraea agkar_up_stinky
+ ~OR(4)
PartyHasItem("%tsu%boot04")
PartyHasItem("agboot21")
PartyHasItem("agboot22")
PartyHasItem("agboot23")~ + @210 /* ~Tell me about armored boots.~ */ EXTERN agkaraea agkar_up_armored
+ ~OR(2)
PartyHasItem("agboot30")
PartyHasItem("%tsu%boot07")~ + @211 /* ~Tell me about elven boots.~ */ EXTERN agkaraea agkar_up_drow
+ ~OR(2)
PartyHasItem("agboot31")
PartyHasItem("%tsu%boot01")~ + @212 /* ~Tell me about daemon boots.~ */ EXTERN agkaraea agkar_up_daemon
+ ~OR(2)
PartyHasItem("%tsu%misc02")
PartyHasItem("agshld01")~ + @213 /* ~Tell me about mirrors and shields.~ */ EXTERN agkaraea agkar_up_shield
++ @231 /* ~I see. Another time, then. For now, let's talk about usual business.~ */ + ag_kstore
END

IF
~~ agkar_up_battle_do
SAY @232 /* ~Remember, 6250 more gold tomorrow! Come back then.~ */
IF ~~ THEN DO ~
TakePartyItem("agboot04")
DestroyItem("agboot04")
TakePartyItem("agboot05")
DestroyItem("agboot05")
TakePartyItemNum("aggem06",1)
DestroyItem("aggem06")
TakePartyGold(6250)
DestroyGold(6250)
SetGlobalTimer("agkar_upgrade_timer","GLOBAL",6000)
SetGlobal("agkar_upgrade","GLOBAL",4)~ EXIT
END

IF
~~ agkar_up_love_do
SAY @233 /* ~Remember, you'll need seventy-five hundred more for the final product. Come back tomorrow.~ */
IF ~~ THEN DO ~
TakePartyItem("agboot09")
DestroyItem("agboot09")
TakePartyItem("agboot19")
DestroyItem("agboot19")
TakePartyItemNum("aggem08",1)
DestroyItem("aggem08")
TakePartyGold(7500)
DestroyGold(7500)
SetGlobalTimer("agkar_upgrade_timer","GLOBAL",6000)
SetGlobal("agkar_upgrade","GLOBAL",5)~ EXIT
END

IF
~~ agkar_up_stinky_do
SAY @234 /* ~Remember, you'll need ten thousand more when they're done. Come back the day after tomorrow.~ */
IF ~~ THEN DO ~
TakePartyItemNum("aggem07",1)
DestroyItem("aggem07")
TakePartyItem("agboot15")
DestroyItem("agboot15")
TakePartyItem("agboot28")
DestroyItem("agboot28")
TakePartyGold(10000)
DestroyGold(10000)
SetGlobalTimer("agkar_upgrade_timer","GLOBAL",13000)
SetGlobal("agkar_upgrade","GLOBAL",6)~ EXIT
END

IF
~~ agkar_up_armored_do
SAY @235 /* ~Remember, twelve and a half thousand more for the finished boots. Come back the day after tomorrow.~ */
IF ~~ THEN DO ~
TakePartyItemNum("aggem09",1)
DestroyItem("aggem09")
TakePartyItem("%tsu%boot04")
DestroyItem("%tsu%boot04")
TakePartyItem("agboot21")
DestroyItem("agboot21")
TakePartyItem("agboot22")
DestroyItem("agboot22")
TakePartyItem("agboot23")
DestroyItem("agboot23")
TakePartyGold(12500)
DestroyGold(12500)
SetGlobalTimer("agkar_upgrade_timer","GLOBAL",13000)
SetGlobal("agkar_upgrade","GLOBAL",7)~ EXIT
END

IF
~~ agkar_up_drow_do
SAY @236 /* ~Remember, fifteen thousand more when they're completed. Come back in three days.~ */
IF ~~ THEN DO ~
TakePartyItemNum("aggem05",1)
DestroyItem("aggem05")
TakePartyItemNum("%tsu%scrl1h",1)
DestroyItem("%tsu%scrl1h")
TakePartyItem("agboot30")
DestroyItem("agboot30")
TakePartyItem("%tsu%boot07")
DestroyItem("%tsu%boot07")
TakePartyGold(15000)
DestroyGold(15000)
SetGlobalTimer("agkar_upgrade_timer","GLOBAL",20000)
SetGlobal("agkar_upgrade","GLOBAL",8)~ EXIT
END

IF
~~ agkar_up_daemon_do
SAY @237 /* ~Remember, seventeen and a half thousand more when they're done. Come back in three days.~ */
IF ~~ THEN DO ~
TakePartyItemNum("aggem02",1)
DestroyItem("aggem02")
TakePartyItem("agboot31")
DestroyItem("agboot31")
TakePartyItem("%tsu%boot01")
DestroyItem("%tsu%boot01")
TakePartyGold(17500)
DestroyGold(17500)
SetGlobalTimer("agkar_upgrade_timer","GLOBAL",20000)
SetGlobal("agkar_upgrade","GLOBAL",9)~ EXIT
END

IF
~~ agkar_up_shield_do
SAY @238 /* ~Remember, eleven thousand two-fifty more gold when it's done. Come back in two days.~ */
IF ~~ THEN DO ~
TakePartyItem("%tsu%misc02")
DestroyItem("%tsu%misc02")
TakePartyItemNum("%tsu%misc42",1)
DestroyItem("%tsu%misc42")
TakePartyItem("agshld01")
DestroyItem("agshld01")
TakePartyGold(11250)
DestroyGold(11250)
SetGlobalTimer("agkar_upgrade_timer","GLOBAL",13000)
SetGlobal("agkar_upgrade","GLOBAL",10)~ EXIT
END

IF
~~ agkar_up_battle_give
SAY @239 /* ~Yes, I've got them here. Now if you pay the remaining balance, they're yours.~ */
+ ~PartyGoldGT(6249)~ + @196 /* ~Here you go.~ */ + agkar_up_battle_deal
++ @240 /* ~I think I'll take them later. Back to usual business, if you don't mind.~ */ + ag_kstore
END

IF
~~ agkar_up_love_give
SAY @239 /* ~Yes, I've got them here. Now if you pay the remaining balance, they're yours.~ */
+ ~PartyGoldGT(7499)~ + @196 /* ~Here you go.~ */ + agkar_up_love_deal
++ @240 /* ~I think I'll take them later. Back to usual business, if you don't mind.~ */ + ag_kstore
END

IF
~~ agkar_up_stinky_give
SAY @239 /* ~Yes, I've got them here. Now if you pay the remaining balance, they're yours.~ */
+ ~PartyGoldGT(9999)~ + @196 /* ~Here you go.~ */ + agkar_up_stinky_deal
++ @240 /* ~I think I'll take them later. Back to usual business, if you don't mind.~ */ + ag_kstore
END

IF
~~ agkar_up_armored_give
SAY @239 /* ~Yes, I've got them here. Now if you pay the remaining balance, they're yours.~ */
+ ~PartyGoldGT(12499)~ + @196 /* ~Here you go.~ */ + agkar_up_armored_deal
++ @240 /* ~I think I'll take them later. Back to usual business, if you don't mind.~ */ + ag_kstore
END

IF
~~ agkar_up_drow_give
SAY @239 /* ~Yes, I've got them here. Now if you pay the remaining balance, they're yours.~ */
+ ~PartyGoldGT(14999)~ + @196 /* ~Here you go.~ */ + agkar_up_drow_deal
++ @240 /* ~I think I'll take them later. Back to usual business, if you don't mind.~ */ + ag_kstore
END

IF
~~ agkar_up_daemon_give
SAY @239 /* ~Yes, I've got them here. Now if you pay the remaining balance, they're yours.~ */
+ ~PartyGoldGT(17499)~ + @196 /* ~Here you go.~ */ + agkar_up_daemon_deal
++ @240 /* ~I think I'll take them later. Back to usual business, if you don't mind.~ */ + ag_kstore
END

IF
~~ agkar_up_shield_give
SAY @241 /* ~Yes, I've got it here. Now if you pay the rest of the gold, it's yours.~ */
+ ~PartyGoldGT(11249)~ + @196 /* ~Here you go.~ */ + agkar_up_shield_deal
++ @242 /* ~I think I'll take it later. Back to usual business, if you don't mind.~ */ + ag_kstore
END

IF
~~ agkar_up_battle_deal
SAY @243 /* ~Great! Here are your new boots. Happy to help, <GABBER>. Come back again soon!~ */
IF ~~ THEN DO ~
TakePartyGold(6250)
DestroyGold(6250)
SetGlobal("agkar_upgrade","GLOBAL",3)
GiveItemCreate("agboot32",LastTalkedToBy(),0,0,0)~ EXIT
END

IF
~~ agkar_up_love_deal
SAY @243 /* ~Great! Here are your new boots. Happy to help, <GABBER>. Come back again soon!~ */
IF ~~ THEN DO ~
TakePartyGold(7500)
DestroyGold(7500)
SetGlobal("agkar_upgrade","GLOBAL",3)
GiveItemCreate("agboot33",LastTalkedToBy(),1,0,0)~ EXIT
END

IF
~~ agkar_up_stinky_deal
SAY @243 /* ~Great! Here are your new boots. Happy to help, <GABBER>. Come back again soon!~ */
IF ~~ THEN DO ~
TakePartyGold(10000)
DestroyGold(10000)
SetGlobal("agkar_upgrade","GLOBAL",3)
GiveItemCreate("agboot34",LastTalkedToBy(),1,0,0)~ EXIT
END

IF
~~ agkar_up_armored_deal
SAY @243 /* ~Great! Here are your new boots. Happy to help, <GABBER>. Come back again soon!~ */
IF ~~ THEN DO ~
TakePartyGold(12500)
DestroyGold(12500)
SetGlobal("agkar_upgrade","GLOBAL",3)
GiveItemCreate("agboot35",LastTalkedToBy(),0,0,0)~ EXIT
END

IF
~~ agkar_up_drow_deal
SAY @243 /* ~Great! Here are your new boots. Happy to help, <GABBER>. Come back again soon!~ */
IF ~~ THEN DO ~
TakePartyGold(15000)
DestroyGold(15000)
SetGlobal("agkar_upgrade","GLOBAL",3)
GiveItemCreate("agboot36",LastTalkedToBy(),2,0,0)~ EXIT
END

IF
~~ agkar_up_daemon_deal
SAY @243 /* ~Great! Here are your new boots. Happy to help, <GABBER>. Come back again soon!~ */
IF ~~ THEN DO ~
TakePartyGold(17500)
DestroyGold(17500)
SetGlobal("agkar_upgrade","GLOBAL",3)
GiveItemCreate("agboot37",LastTalkedToBy(),1,0,0)~ EXIT
END

IF
~~ agkar_up_shield_deal
SAY @244 /* ~Great! Here's your new shield. Hope it serves you well, <GABBER>. Come back again soon!~ */
IF ~~ THEN DO ~
TakePartyGold(11250)
DestroyGold(11250)
SetGlobal("agkar_upgrade","GLOBAL",3)
GiveItemCreate("agshld02",LastTalkedToBy(),0,0,0)~ EXIT
END
END

CHAIN agkaraea agkar_up_check
@245 /* ~Let's see...~ */
== agkaraea IF ~OR(2)
PartyHasItem("agboot04")
PartyHasItem("agboot05")~ THEN @246 /* ~Ahh, so you like a good battle. Those boots must help a lot when fighting scary monsters!~ */
== agkaraea IF ~OR(2)
PartyHasItem("agboot09")
PartyHasItem("agboot19")~ THEN @247 /* ~Ooh, I see you like sexy footwear. With a few improvements, you can have boots that are sexy *and* fast.~ */
== agkaraea IF ~OR(2)
PartyHasItem("agboot15")
PartyHasItem("agboot28")~ THEN @248 /* ~My brother told me a nasty joke about a stinking gnome. You'll have to ask him about it - it's too crude for me. But I see something here of his tale he falsely attributes to "surfacers."~ */
== agkaraea IF ~OR(4)
PartyHasItem("%tsu%boot04")
PartyHasItem("agboot21")
PartyHasItem("agboot22")
PartyHasItem("agboot23")~ THEN @249 /* ~Looks like you have boots that provide decent protection. However, enough different pairs can be combined to make armored boots that are truly the best.~ */
== agkaraea IF ~OR(2)
PartyHasItem("agboot30")
PartyHasItem("%tsu%boot07")~ THEN @250 /* ~Wow, some fancy footwear made by pointy-eared ones. Such beautiful work, isn't it true? These can be made into one potent combination, that's for sure.~ */
== agkaraea IF ~OR(2)
PartyHasItem("agboot31")
PartyHasItem("%tsu%boot01")~ THEN @251 /* ~I see you have some legendary boots there. But two pairs of the right boots can be combined to make one pair powerful enough for a daemon lord.~ */
== agkaraea IF ~OR(2)
PartyHasItem("%tsu%misc02")
PartyHasItem("agshld01")~ THEN @252 /* ~This has little to do with boots, but there's an old story about a fabulous shield and a common mirror. Looks like you might be interested in it.~ */
== agkaraea IF ~OR(16)
PartyHasItem("agboot04")
PartyHasItem("agboot05")
PartyHasItem("agboot09")
PartyHasItem("agboot19")
PartyHasItem("agboot15")
PartyHasItem("agboot28")
PartyHasItem("%tsu%boot04")
PartyHasItem("agboot21")
PartyHasItem("agboot22")
PartyHasItem("agboot23")
PartyHasItem("agboot30")
PartyHasItem("%tsu%boot07")
PartyHasItem("agboot31")
PartyHasItem("%tsu%boot01")
PartyHasItem("%tsu%misc02")
PartyHasItem("agshld01")~ THEN @253 /* ~That's all, I think. There might be something else, but it's beyond my lore to say if it's really the case.~ */
== agkaraea IF ~
!PartyHasItem("agboot04")
!PartyHasItem("agboot05")
!PartyHasItem("agboot09")
!PartyHasItem("agboot19")
!PartyHasItem("agboot15")
!PartyHasItem("agboot28")
!PartyHasItem("%tsu%boot04")
!PartyHasItem("agboot21")
!PartyHasItem("agboot22")
!PartyHasItem("agboot23")
!PartyHasItem("agboot30")
!PartyHasItem("%tsu%boot07")
!PartyHasItem("agboot31")
!PartyHasItem("%tsu%boot01")
!PartyHasItem("%tsu%misc02")
!PartyHasItem("agshld01")~ THEN @254 /* ~Hmm... No, nothing will do, as far as I can tell.~ */
END
+ ~OR(2)
PartyHasItem("agboot04")
PartyHasItem("agboot05")~ + @217 /* ~Tell me about combat enchantments.~ */ EXTERN agkaraea agkar_up_battle
+ ~OR(2)
PartyHasItem("agboot09")
PartyHasItem("agboot19")~ + @208 /* ~Tell me about fast, sexy boots.~ */ EXTERN agkaraea agkar_up_love
+ ~OR(2)
PartyHasItem("agboot15")
PartyHasItem("agboot28")~ + @209 /* ~Tell me about this "stinking" you mentioned.~ */ EXTERN agkaraea agkar_up_stinky
+ ~OR(4)
PartyHasItem("%tsu%boot04")
PartyHasItem("agboot21")
PartyHasItem("agboot22")
PartyHasItem("agboot23")~ + @210 /* ~Tell me about armored boots.~ */ EXTERN agkaraea agkar_up_armored
+ ~OR(2)
PartyHasItem("agboot30")
PartyHasItem("%tsu%boot07")~ + @211 /* ~Tell me about elven boots.~ */ EXTERN agkaraea agkar_up_drow
+ ~OR(2)
PartyHasItem("agboot31")
PartyHasItem("%tsu%boot01")~ + @212 /* ~Tell me about daemon boots.~ */ EXTERN agkaraea agkar_up_daemon
+ ~OR(2)
PartyHasItem("%tsu%misc02")
PartyHasItem("agshld01")~ + @213 /* ~Tell me about mirrors and shields.~ */ EXTERN agkaraea agkar_up_shield
++ @255 /* ~May I see your usual wares instead?.~ */ EXTERN agkaraea ag_kstore
++ @190 /* ~Nothing for now. See you later.~ */ EXTERN agkaraea ag_karbye
