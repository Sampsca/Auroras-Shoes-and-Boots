BEGIN aggnom02

IF ~StateCheck(Myself,STATE_CHARMED)
~ THEN BEGIN 1
  SAY @0 /* ~Heh heh heh. I know a secret! But hmm... my memory isn't so good anymore for some reason...~ */
  IF ~~ THEN EXIT
END

IF ~See([EVILCUTOFF])
~ THEN BEGIN 2
  SAY @1 /* ~Callarduran be praised, deliverance is here! Release me from these swine-faced dirt merchants, I implore you!~ */
  IF ~~ THEN REPLY @2 /* ~This lot? It should be but the work of a few seconds.~ */ GOTO 4
  IF ~~ THEN REPLY @3 /* ~I think not, short stuff. I've got far more pressing things to do here.~ */ GOTO 3
END

IF ~~ THEN BEGIN 3 // from 2.2
  SAY @4 /* ~Then kill me! I'd rather die with these scum than face more slavery!~ */
  IF ~~ THEN DO ~Enemy()
~ EXIT
END

IF ~~ THEN BEGIN 4 // from 2.1
  SAY @5 /* ~I haven't got much in the way of a reward, but I'll let you in on a secret once they're dead.~ */
  IF ~~ THEN DO ~CreateCreature("aggob03",[2452.416],11)
CreateCreature("aggob04",[2580.371],4)
~ EXIT
END

IF ~!See([EVILCUTOFF])
~ THEN BEGIN 5
  SAY @6 /* ~Free at last! Loose my fetters, will you?~ */
  IF ~~ THEN REPLY @7 /* ~All right then.~ */ GOTO 7
  IF ~~ THEN REPLY @8 /* ~Ha ha! I don't think so, goblin-bait.~ */ GOTO 6
END

IF ~~ THEN BEGIN 6 // from 5.2
  SAY @9 /* ~Oh, so it's like that, is it? Have at you then!~ */
  IF ~~ THEN DO ~ReputationInc(-1)
Enemy()
~ EXIT
END

IF ~~ THEN BEGIN 7 // from 5.1
  SAY @10 /* ~Never let it be said a deep gnome did not keep his word! I mentioned a secret, yes. Seek out the ruined barrow directly south of here. Look under a small mushroom by what used to be its entrance, and you will find a stone valuable to my kind. I stashed it there before these dung-eaters took me, but my brother has plenty more. Now I must be off to find him, far to the north. I only hope goblins haven't taken him too.~ */
  IF ~~ THEN DO ~ReputationInc(1)
ActionOverride("Container 1",CreateItem("aggem01",1,0,0))
EscapeArea()
~ EXIT
END
