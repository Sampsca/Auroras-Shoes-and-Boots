BEGIN agtsleep

IF ~True()~ BEGIN agtsl
  SAY @1 /* ~Zzzzz (bah!)...~ */
  IF ~~ DO ~SetGlobal("ag_tslface","LOCALS",1)~ EXIT
END
