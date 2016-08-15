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
    ActionOverride(Player1,LeaveAreaLUA("FW2301","",[970.897],6))
    ActionOverride(Player2,LeaveAreaLUA("FW2301","",[942.927],5))
    ActionOverride(Player3,LeaveAreaLUA("FW2301","",[1026.882],7))
    ActionOverride(Player4,LeaveAreaLUA("FW2301","",[997.959],5))
    ActionOverride(Player5,LeaveAreaLUA("FW2301","",[1029.932],6))
    ActionOverride(Player6,LeaveAreaLUA("FW2301","",[1067.905],7))~ EXIT 
END

IF ~~ agbereg //Feldepost's Inn in Beregost
  SAY @9 /* ~As you wish.~ */
  IF ~~ DO ~ClearAllActions()
    SetGlobal("AGBarGo","GLOBAL",0)
    DestroySelf()
    ActionOverride(Player1,LeaveAreaLUA("FW3351","",[803.608],6))
    ActionOverride(Player2,LeaveAreaLUA("FW3351","",[790.639],5))
    ActionOverride(Player3,LeaveAreaLUA("FW3351","",[835.588],7))
    ActionOverride(Player4,LeaveAreaLUA("FW3351","",[808.659],5))
    ActionOverride(Player5,LeaveAreaLUA("FW3351","",[838.631],6))
    ActionOverride(Player6,LeaveAreaLUA("FW3351","",[861.604],7))~ EXIT 
END

IF ~~ agnashk //Nashkel
  SAY @24 /* ~Gladly!~ */
  IF ~~ DO ~ClearAllActions()
    SetGlobal("AGBarGo","GLOBAL",0)
    DestroySelf()
    ActionOverride(Player1,LeaveAreaLUA("FW4801","",[335.515],10))
    ActionOverride(Player2,LeaveAreaLUA("FW4801","",[300.495],11))
    ActionOverride(Player3,LeaveAreaLUA("FW4801","",[362.530],9))
    ActionOverride(Player4,LeaveAreaLUA("FW4801","",[282.517],11))
    ActionOverride(Player5,LeaveAreaLUA("FW4801","",[314.532],10))
    ActionOverride(Player6,LeaveAreaLUA("FW4801","",[350.552],9))~ EXIT 
END

IF ~~ agulgoth //Ulgoth's Beard Inn
  SAY @25 /* ~Are you *sure*? The beer there isn't very... Oh, all right.~ */
  IF ~~ DO ~ClearAllActions()
    SetGlobal("AGBarGo","GLOBAL",0)
    DestroySelf()
    ActionOverride(Player1,LeaveAreaLUA("FW1001","",[740.463],6))
    ActionOverride(Player2,LeaveAreaLUA("FW1001","",[713.478],5))
    ActionOverride(Player3,LeaveAreaLUA("FW1001","",[778.443],7))
    ActionOverride(Player4,LeaveAreaLUA("FW1001","",[730.503],5))
    ActionOverride(Player5,LeaveAreaLUA("FW1001","",[760.488],6))
    ActionOverride(Player6,LeaveAreaLUA("FW1001","",[785.467],7))~ EXIT 
END

IF ~~ agelfsng //Elfsong Tavern
  SAY @26 /* ~Right away.~ */
  IF ~~ DO ~ClearAllActions()
    SetGlobal("AGBarGo","GLOBAL",0)
    DestroySelf()
    ActionOverride(Player1,LeaveAreaLUA("FW0705","",[988.676],6))
    ActionOverride(Player2,LeaveAreaLUA("FW0705","",[955.693],5))
    ActionOverride(Player3,LeaveAreaLUA("FW0705","",[1033.658],7))
    ActionOverride(Player4,LeaveAreaLUA("FW0705","",[970.733],5))
    ActionOverride(Player5,LeaveAreaLUA("FW0705","",[1008.711],6))
    ActionOverride(Player6,LeaveAreaLUA("FW0705","",[1048.683],7))~ EXIT
END

IF ~~ aghelm //Helm and Cloak
  SAY @22 /* ~If you're sure.~ */
  IF ~~ DO ~ClearAllActions()
    SetGlobal("AGBarGo","GLOBAL",0)
    DestroySelf()
    ActionOverride(Player1,LeaveAreaLUA("FW0116","",[817.1003],4))
    ActionOverride(Player2,LeaveAreaLUA("FW0116","",[797.1037],3))
    ActionOverride(Player3,LeaveAreaLUA("FW0116","",[829.969],5))
    ActionOverride(Player4,LeaveAreaLUA("FW0116","",[829.1062],5))
    ActionOverride(Player5,LeaveAreaLUA("FW0116","",[847.1029],4))
    ActionOverride(Player6,LeaveAreaLUA("FW0116","",[869.996],3))~ EXIT
END

IF ~~ agolde //Ye Olde Inn
  SAY @27 /* ~That dump? It's your funeral.~ */
  IF ~~ DO ~ClearAllActions()
    SetGlobal("AGBarGo","GLOBAL",0)
    DestroySelf()
    ActionOverride(Player1,LeaveAreaLUA("FW1113","",[489.451],6))
    ActionOverride(Player2,LeaveAreaLUA("FW1113","",[457.463],5))
    ActionOverride(Player3,LeaveAreaLUA("FW1113","",[524.425],7))
    ActionOverride(Player4,LeaveAreaLUA("FW1113","",[494.498],5))
    ActionOverride(Player5,LeaveAreaLUA("FW1113","",[526.478],6))
    ActionOverride(Player6,LeaveAreaLUA("FW1113","",[554.453],7))~ EXIT
END

IF ~~ agbarbye //No action
  SAY @30 /* ~Very well then. Nice way to waste a charge, <BROTHERSISTER>.~ */
  IF ~~ DO ~SetGlobal("AGBarGo","GLOBAL",0)
    DestroySelf()~ EXIT
END
