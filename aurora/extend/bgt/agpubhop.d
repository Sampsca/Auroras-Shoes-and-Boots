BEGIN agpubhop

IF ~Global("AGBarGo","GLOBAL",1)~ agwhich
  SAY @10 /* ~Where would you like to drink this time?~ */
  ++ @37 /* ~Take me to the Friendly Arm Inn.~ */ + agfriend
  ++ @38 /* ~Take me to Feldepost's Inn in Beregost.~ */ + agbereg
  ++ @39 /* ~Take me to the Nashkel Inn.~ */ + agnashk
  + ~GlobalGT("Chapter","GLOBAL",4)~ + @40 /* ~Take me to Ulgoth's Beard Inn.~ */ + agulgoth
  + ~GlobalGT("Chapter","GLOBAL",4)~ + @41 /* ~Take me to the Elfsong Tavern.~ */ + agelfsng
  + ~GlobalGT("Chapter","GLOBAL",4)~ + @42 /* ~Take me to the Helm and Cloak.~ */ + aghelm
  + ~GlobalGT("Chapter","GLOBAL",4)~ + @43 /* ~Take me to Ye Olde Inn.~ */ + agolde
  ++ @20 /* ~Never mind. I like it here.~ */ + agbarbye
END

IF ~~ agfriend //Friendly Arm
  SAY @23 /* ~Certainly.~ */
  IF ~~ DO ~ClearAllActions()
    SetGlobal("AGBarGo","GLOBAL",0)
    DestroySelf()
    ActionOverride(Player1,LeaveAreaLUA("AR6801","",[970.897],6))
    ActionOverride(Player2,LeaveAreaLUA("AR6801","",[942.927],5))
    ActionOverride(Player3,LeaveAreaLUA("AR6801","",[1026.882],7))
    ActionOverride(Player4,LeaveAreaLUA("AR6801","",[997.959],5))
    ActionOverride(Player5,LeaveAreaLUA("AR6801","",[1029.932],6))
    ActionOverride(Player6,LeaveAreaLUA("AR6801","",[1067.905],7))~ EXIT 
END

IF ~~ agbereg //Feldepost's Inn in Beregost
  SAY @9 /* ~As you wish.~ */
  IF ~~ DO ~ClearAllActions()
    SetGlobal("AGBarGo","GLOBAL",0)
    DestroySelf()
    ActionOverride(Player1,LeaveAreaLUA("AR6751","",[803.608],6))
    ActionOverride(Player2,LeaveAreaLUA("AR6751","",[790.639],5))
    ActionOverride(Player3,LeaveAreaLUA("AR6751","",[835.588],7))
    ActionOverride(Player4,LeaveAreaLUA("AR6751","",[808.659],5))
    ActionOverride(Player5,LeaveAreaLUA("AR6751","",[838.631],6))
    ActionOverride(Player6,LeaveAreaLUA("AR6751","",[861.604],7))~ EXIT 
END

IF ~~ agnashk //Nashkel
  SAY @24 /* ~Gladly!~ */
  IF ~~ DO ~ClearAllActions()
    SetGlobal("AGBarGo","GLOBAL",0)
    DestroySelf()
    ActionOverride(Player1,LeaveAreaLUA("AR3701","",[335.515],10))
    ActionOverride(Player2,LeaveAreaLUA("AR3701","",[300.495],11))
    ActionOverride(Player3,LeaveAreaLUA("AR3701","",[362.530],9))
    ActionOverride(Player4,LeaveAreaLUA("AR3701","",[282.517],11))
    ActionOverride(Player5,LeaveAreaLUA("AR3701","",[314.532],10))
    ActionOverride(Player6,LeaveAreaLUA("AR3701","",[350.552],9))~ EXIT 
END

IF ~~ agulgoth //Ulgoth's Beard Inn
  SAY @25 /* ~Are you *sure*? The beer there isn't very... Oh, all right.~ */
  IF ~~ DO ~ClearAllActions()
    SetGlobal("AGBarGo","GLOBAL",0)
    DestroySelf()
    ActionOverride(Player1,LeaveAreaLUA("ARU001","",[740.463],6))
    ActionOverride(Player2,LeaveAreaLUA("ARU001","",[713.478],5))
    ActionOverride(Player3,LeaveAreaLUA("ARU001","",[778.443],7))
    ActionOverride(Player4,LeaveAreaLUA("ARU001","",[730.503],5))
    ActionOverride(Player5,LeaveAreaLUA("ARU001","",[760.488],6))
    ActionOverride(Player6,LeaveAreaLUA("ARU001","",[785.467],7))~ EXIT 
END

IF ~~ agelfsng //Elfsong Tavern
  SAY @26 /* ~Right away.~ */
  IF ~~ DO ~ClearAllActions()
    SetGlobal("AGBarGo","GLOBAL",0)
    DestroySelf()
    ActionOverride(Player1,LeaveAreaLUA("AR7705","",[988.676],6))
    ActionOverride(Player2,LeaveAreaLUA("AR7705","",[955.693],5))
    ActionOverride(Player3,LeaveAreaLUA("AR7705","",[1033.658],7))
    ActionOverride(Player4,LeaveAreaLUA("AR7705","",[970.733],5))
    ActionOverride(Player5,LeaveAreaLUA("AR7705","",[1008.711],6))
    ActionOverride(Player6,LeaveAreaLUA("AR7705","",[1048.683],7))~ EXIT
END

IF ~~ aghelm //Helm and Cloak
  SAY @22 /* ~If you're sure.~ */
  IF ~~ DO ~ClearAllActions()
    SetGlobal("AGBarGo","GLOBAL",0)
    DestroySelf()
    ActionOverride(Player1,LeaveAreaLUA("AR7216","",[817.1003],4))
    ActionOverride(Player2,LeaveAreaLUA("AR7216","",[797.1037],3))
    ActionOverride(Player3,LeaveAreaLUA("AR7216","",[829.969],5))
    ActionOverride(Player4,LeaveAreaLUA("AR7216","",[829.1062],5))
    ActionOverride(Player5,LeaveAreaLUA("AR7216","",[847.1029],4))
    ActionOverride(Player6,LeaveAreaLUA("AR7216","",[869.996],3))~ EXIT
END

IF ~~ agolde //Ye Olde Inn
  SAY @27 /* ~That dump? It's your funeral.~ */
  IF ~~ DO ~ClearAllActions()
    SetGlobal("AGBarGo","GLOBAL",0)
    DestroySelf()
    ActionOverride(Player1,LeaveAreaLUA("AR8013","",[489.451],6))
    ActionOverride(Player2,LeaveAreaLUA("AR8013","",[457.463],5))
    ActionOverride(Player3,LeaveAreaLUA("AR8013","",[524.425],7))
    ActionOverride(Player4,LeaveAreaLUA("AR8013","",[494.498],5))
    ActionOverride(Player5,LeaveAreaLUA("AR8013","",[526.478],6))
    ActionOverride(Player6,LeaveAreaLUA("AR8013","",[554.453],7))~ EXIT
END

IF ~~ agbarbye //No action
  SAY @30 /* ~Very well then. Nice way to waste a charge, <BROTHERSISTER>.~ */
  IF ~~ DO ~SetGlobal("AGBarGo","GLOBAL",0)
    DestroySelf()~ EXIT
END
