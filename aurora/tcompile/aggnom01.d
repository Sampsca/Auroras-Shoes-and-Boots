BEGIN aggnom01

IF ~StateCheck(Myself,STATE_CHARMED)
~ THEN BEGIN 1
  SAY @0 /* ~Have you seen my brother, kind <SIRMAAM>? I haven't heard from him since his trip across the Cloudpeaks...~ */
  IF ~~ THEN EXIT
END

IF ~See([EVILCUTOFF])
~ THEN BEGIN 2
  SAY @1 /* ~The pain. The misery. Release me from these evil creatures, I beg you!~ */
  IF ~~ THEN REPLY @2 /* ~I shall return when every last one of the filthy buggers lies dead.~ */ GOTO 4
  IF ~~ THEN REPLY @3 /* ~No chance, gnome. You probably deserve to be enslaved.~ */ GOTO 3
END

IF ~~ THEN BEGIN 3 // from 2.2
  SAY @4 /* ~You leave me no choice. I would rather fight and die with these vermin than face more servitude!~ */
  IF ~~ THEN DO ~Enemy()
~ EXIT
END

IF ~~ THEN BEGIN 4 // from 2.1
  SAY @5 /* ~You will earn my eternal gratitude, I assure you.~ */
  IF ~~ THEN DO ~CreateCreature("aggob03",[4318.2425],15)
CreateCreature("aggob04",[4458.2435],1)
~ EXIT
END

IF ~!See([EVILCUTOFF])
~ THEN BEGIN 5
  SAY @6 /* ~At last I am unleashed! Break my bonds at once!~ */
  IF ~~ THEN REPLY @7 /* ~Very well. You're a free gnome.~ */ GOTO 7
  IF ~~ THEN REPLY @8 /* ~Fat chance of that, runt. Rot here for all I care.~ */ GOTO 6
END

IF ~~ THEN BEGIN 6 // from 5.2
  SAY @9 /* ~So it has come to this, has it? Well, you won't find me completely defenseless...~ */
  IF ~~ THEN DO ~ReputationInc(-1)
Enemy()
~ EXIT
END

IF ~~ THEN BEGIN 7 // from 5.1
  SAY @10 /* ~Never let it be said a svirfneblin did not honor his promise! Unlike some of my brethren, I do not value riches over freedom. Not much more anyway, heh. But search you the clearing north of here marked by an 'X' and find you a stone most precious. I managed to conceal it there before these uncouth goblins took me, but I also know where to find more. Fare you well!~ */
  IF ~~ THEN DO ~ReputationInc(1)
ActionOverride("Container 1",CreateItem("aggem07",1,0,0))
EscapeArea()
~ EXIT
END
