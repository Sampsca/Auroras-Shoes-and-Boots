BEGIN agasleep

IF ~True()~ BEGIN agasl
  SAY @1 /* ~Zzzzz...~ */
  IF ~~ DO ~SetGlobal("ag_aslface","LOCALS",1)~ EXIT
END
