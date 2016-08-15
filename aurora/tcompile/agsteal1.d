//Pinched from aVENGER's Rogue Rebalancing

BEGIN ~agsteal1~

IF ~Global("agsteal","LOCALS",0)~ THEN BEGIN agstl50
SAY @15
  IF ~Global("agsteal","LOCALS",0) CheckStatGT(LastTalkedToBy(Myself),11,INT)~ THEN REPLY @1 GOTO agstl02
  IF ~Global("agsteal","LOCALS",0) CheckStatGT(LastTalkedToBy(Myself),11,WIS)~ THEN REPLY @2 GOTO agstl02
  IF ~Global("agsteal","LOCALS",0) CheckStatGT(LastTalkedToBy(Myself),11,CHR)~ THEN REPLY @3 GOTO agstl02
  IF ~Global("agsteal","LOCALS",0) CheckStatGT(LastTalkedToBy(Myself),19,LORE)~ THEN REPLY @4 GOTO agstl02
  IF ~Global("agsteal","LOCALS",0) ReputationGT(LastTalkedToBy(Myself),13)~ THEN REPLY @5 GOTO agstl02
  IF ~Global("agsteal","LOCALS",0) ReputationLT(LastTalkedToBy(Myself),8)~ THEN REPLY @6 GOTO agstl02
  IF ~~ THEN REPLY @7 GOTO agstl10
END

IF ~Global("agsteal","LOCALS",1)~ THEN BEGIN agstl51
SAY @16
  IF ~Global("agsteal","LOCALS",1) CheckStatGT(LastTalkedToBy(Myself),14,INT)~ THEN REPLY @1 GOTO agstl03
  IF ~Global("agsteal","LOCALS",1) CheckStatGT(LastTalkedToBy(Myself),14,WIS)~ THEN REPLY @2 GOTO agstl03
  IF ~Global("agsteal","LOCALS",1) CheckStatGT(LastTalkedToBy(Myself),14,CHR)~ THEN REPLY @3 GOTO agstl03
  IF ~Global("agsteal","LOCALS",1) CheckStatGT(LastTalkedToBy(Myself),34,LORE)~ THEN REPLY @4 GOTO agstl03
  IF ~Global("agsteal","LOCALS",1) ReputationGT(LastTalkedToBy(Myself),16)~ THEN REPLY @5 GOTO agstl03
  IF ~Global("agsteal","LOCALS",1) ReputationLT(LastTalkedToBy(Myself),6)~ THEN REPLY @6 GOTO agstl03
  IF ~~ THEN REPLY @7 GOTO agstl10
END

IF ~Global("agsteal","LOCALS",2)~ THEN BEGIN agstl52
SAY @17
  IF ~Global("agsteal","LOCALS",2) CheckStatGT(LastTalkedToBy(Myself),17,INT)~ THEN REPLY @1 GOTO agstl04
  IF ~Global("agsteal","LOCALS",2) CheckStatGT(LastTalkedToBy(Myself),17,WIS)~ THEN REPLY @2 GOTO agstl04
  IF ~Global("agsteal","LOCALS",2) CheckStatGT(LastTalkedToBy(Myself),17,CHR)~ THEN REPLY @3 GOTO agstl04
  IF ~Global("agsteal","LOCALS",2) CheckStatGT(LastTalkedToBy(Myself),49,LORE)~ THEN REPLY @4 GOTO agstl04
  IF ~Global("agsteal","LOCALS",2) ReputationGT(LastTalkedToBy(Myself),19)~ THEN REPLY @5 GOTO agstl04
  IF ~Global("agsteal","LOCALS",2) ReputationLT(LastTalkedToBy(Myself),2)~ THEN REPLY @6 GOTO agstl04
  IF ~~ THEN REPLY @7 GOTO agstl10
END

IF ~~ THEN BEGIN agstl02
  SAY @8
=
@11
  IF ~~ THEN DO ~IncrementGlobal("agsteal","LOCALS",1)~ EXIT
END

IF ~~ THEN BEGIN agstl03
  SAY @12
  IF ~~ THEN DO ~IncrementGlobal("agsteal","LOCALS",1)~ EXIT
END

IF ~~ THEN BEGIN agstl04
  SAY @13
  IF ~~ THEN DO ~IncrementGlobal("agsteal","LOCALS",1)~ EXIT
END

IF ~~ THEN BEGIN agstl10
  SAY @9
  IF ~~ THEN DO ~ReputationInc(-2) SetDialogue("agsteal0")~ EXIT
END

IF ~GlobalGT("agsteal","LOCALS",2)~ THEN BEGIN agstl20
  SAY @10
=
@14
  IF ~~ THEN DO ~ReputationInc(-2) SetDialogue("agsteal0")~ EXIT
END
