BEGIN agbarhop

IF ~Global("AGBootBryn","GLOBAL",1)~ agbrynbar
  SAY @6 /* ~I can only reach the Vulgar Monkey. Do you really want to go there?~ */
  ++ @7 /* ~Yes.~ */+ agbryncut
  ++ @8 /* ~Never mind.~ */+ agbarbye
END

IF ~~ agbryncut
  SAY @9 /* ~As you wish.~ */
  IF ~~ DO ~ClearAllActions()
    SetGlobal("AGBootBryn","GLOBAL",0)
    DestroySelf()
    ActionOverride(Player1,LeaveAreaLUA("AR1602","",[200.660],4))
    ActionOverride(Player2,LeaveAreaLUA("AR1602","",[242.640],4))
    ActionOverride(Player3,LeaveAreaLUA("AR1602","",[239.705],4))
    ActionOverride(Player4,LeaveAreaLUA("AR1602","",[291.670],2))
    ActionOverride(Player5,LeaveAreaLUA("AR1602","",[277.726],4))
    ActionOverride(Player6,LeaveAreaLUA("AR1602","",[329.695],0))~ EXIT
END

IF ~Global("AGBootToB","GLOBAL",1)~ agtobbar
  SAY @29 /* ~I can only reach the Tankard Tree and Amkethran Inn from here. Which will it be?~ */
  ++ @33 /* ~Take me to the Tankard Tree.~ */+ agtankard
  ++ @34 /* ~Take me to the Amkethran Inn.~ */+ agamketh
  ++ @35 /* ~Never mind. I'll stay put for now.~ */+ agbarbye
END

IF ~~ agtankard
  SAY @9 /* ~As you wish.~ */
  IF ~~ DO ~ClearAllActions()
    SetGlobal("AGBootToB","GLOBAL",0)
    DestroySelf()
    ActionOverride(Player1,LeaveAreaLUA("AR5003","",[1263.1011],7))
    ActionOverride(Player2,LeaveAreaLUA("AR5003","",[1271.1054],8))
    ActionOverride(Player3,LeaveAreaLUA("AR5003","",[1313.1042],6))
    ActionOverride(Player4,LeaveAreaLUA("AR5003","",[1281.1084],8))
    ActionOverride(Player5,LeaveAreaLUA("AR5003","",[1329.1072],6))
    ActionOverride(Player6,LeaveAreaLUA("AR5003","",[1333.1124],7))~ EXIT
END

IF ~~ agamketh
  SAY @21 /* ~If you want.~ */
  IF ~~ DO ~ClearAllActions()
    SetGlobal("AGBootToB","GLOBAL",0)
    DestroySelf()
    ActionOverride(Player1,LeaveAreaLUA("AR5501","",[293.550],10))
    ActionOverride(Player2,LeaveAreaLUA("AR5501","",[260.539],9))
    ActionOverride(Player3,LeaveAreaLUA("AR5501","",[307.572],11))
    ActionOverride(Player4,LeaveAreaLUA("AR5501","",[235.552],9))
    ActionOverride(Player5,LeaveAreaLUA("AR5501","",[268.570],10))
    ActionOverride(Player6,LeaveAreaLUA("AR5501","",[295.597],11))~ EXIT
END

IF ~Global("AGBarGo","GLOBAL",1)~ agwhich
  SAY @10 /* ~Where would you like to drink this time?~ */
  ++ @11 /* ~Take me to the Mithrest Inn.~ */ + agmith
  ++ @12 /* ~Take me to the Den of the Seven Vales.~ */ + agden
  ++ @13 /* ~Take me to the Sea's Bounty.~ */ + agsea
  ++ @14 /* ~Take me to the Copper Coronet.~ */ + agcopper
  ++ @15 /* ~Take me to the Five Flagons.~ */ + agfive
  ++ @17 /* ~Take me to Calbor's Inn.~ */ + agcalbor
  ++ @16 /* ~Take me to the Crooked Crane.~ */ + agcrane
  ++ @18 /* ~Take me to Imnesvale Inn in the Umar Hills.~ */ + agumar
  ++ @19 /* ~Take me to Vyatri's Pub in Trademeet.~ */ + agtrade
  ++ @20 /* ~Never mind. I like it here.~ */ + agbarbye
END

IF ~~ agmith //Mithrest
  SAY @23 /* ~Certainly.~ */
  IF ~~ DO ~ClearAllActions()
    SetGlobal("AGBarGo","GLOBAL",0)
    DestroySelf()
    ActionOverride(Player1,LeaveAreaLUA("AR0704","",[346.647],4))
    ActionOverride(Player2,LeaveAreaLUA("AR0704","",[358.687],4))
    ActionOverride(Player3,LeaveAreaLUA("AR0704","",[415.629],4))
    ActionOverride(Player4,LeaveAreaLUA("AR0704","",[419.672],2))
    ActionOverride(Player5,LeaveAreaLUA("AR0704","",[463.625],4))
    ActionOverride(Player6,LeaveAreaLUA("AR0704","",[477.672],0))~ EXIT 
END

IF ~~ agden //Den of Seven Vales
  SAY @9 /* ~As you wish.~ */
  IF ~~ DO ~ClearAllActions()
    SetGlobal("AGBarGo","GLOBAL",0)
    DestroySelf()
    ActionOverride(Player1,LeaveAreaLUA("AR0709","",[289.776],4))
    ActionOverride(Player2,LeaveAreaLUA("AR0709","",[329.738],4))
    ActionOverride(Player3,LeaveAreaLUA("AR0709","",[325.797],4))
    ActionOverride(Player4,LeaveAreaLUA("AR0709","",[356.748],2))
    ActionOverride(Player5,LeaveAreaLUA("AR0709","",[394.825],4))
    ActionOverride(Player6,LeaveAreaLUA("AR0709","",[419.791],0))~ EXIT 
END

IF ~~ agsea //Sea's Bounty
  SAY @24 /* ~Gladly!~ */
  IF ~~ DO ~ClearAllActions()
    SetGlobal("AGBarGo","GLOBAL",0)
    DestroySelf()
    ActionOverride(Player1,LeaveAreaLUA("AR0313","",[493.421],4))
    ActionOverride(Player2,LeaveAreaLUA("AR0313","",[543.378],4))
    ActionOverride(Player3,LeaveAreaLUA("AR0313","",[530.442],4))
    ActionOverride(Player4,LeaveAreaLUA("AR0313","",[572.404],2))
    ActionOverride(Player5,LeaveAreaLUA("AR0313","",[576.463],4))
    ActionOverride(Player6,LeaveAreaLUA("AR0313","",[620.422],0))~ EXIT 
END

IF ~~ agcopper //Copper Coronet
  SAY @25 /* ~Are you *sure*? The beer there isn't very... Oh, all right.~ */
  IF ~~ DO ~ClearAllActions()
    SetGlobal("AGBarGo","GLOBAL",0)
    DestroySelf()
    ActionOverride(Player1,LeaveAreaLUA("AR0406","",[1061.1939],4))
    ActionOverride(Player2,LeaveAreaLUA("AR0406","",[1108.1906],4))
    ActionOverride(Player3,LeaveAreaLUA("AR0406","",[1117.1964],4))
    ActionOverride(Player4,LeaveAreaLUA("AR0406","",[1098.1985],2))
    ActionOverride(Player5,LeaveAreaLUA("AR0406","",[1148.1998],4))
    ActionOverride(Player6,LeaveAreaLUA("AR0406","",[1187.2028],0))~ EXIT 
END

IF ~~ agfive //Five Flagons
  SAY @26 /* ~Right away.~ */
  IF ~~ DO ~ClearAllActions()
    SetGlobal("AGBarGo","GLOBAL",0)
    DestroySelf()
    ActionOverride(Player1,LeaveAreaLUA("AR0509","",[587.509],4))
    ActionOverride(Player2,LeaveAreaLUA("AR0509","",[621.492],4))
    ActionOverride(Player3,LeaveAreaLUA("AR0509","",[618.545],4))
    ActionOverride(Player4,LeaveAreaLUA("AR0509","",[651.507],2))
    ActionOverride(Player5,LeaveAreaLUA("AR0509","",[686.507],4))
    ActionOverride(Player6,LeaveAreaLUA("AR0509","",[658.572],0))~ EXIT
END

IF ~~ agcalbor //Calbor's Inn
  SAY @22 /* ~If you're sure.~ */
  IF ~~ DO ~ClearAllActions()
    SetGlobal("AGBarGo","GLOBAL",0)
    DestroySelf()
    ActionOverride(Player1,LeaveAreaLUA("AR0513","",[209.700],4))
    ActionOverride(Player2,LeaveAreaLUA("AR0513","",[267.672],4))
    ActionOverride(Player3,LeaveAreaLUA("AR0513","",[261.719],4))
    ActionOverride(Player4,LeaveAreaLUA("AR0513","",[307.706],2))
    ActionOverride(Player5,LeaveAreaLUA("AR0513","",[299.762],4))
    ActionOverride(Player6,LeaveAreaLUA("AR0513","",[354.732],0))~ EXIT
END

IF ~~ agcrane //Crooked Crane
  SAY @21 /* ~If you want.~ */
  IF ~~ DO ~ClearAllActions()
    SetGlobal("AGBarGo","GLOBAL",0)
    DestroySelf()
    ActionOverride(Player1,LeaveAreaLUA("AR0021","",[465.417],4))
    ActionOverride(Player2,LeaveAreaLUA("AR0021","",[492.370],4))
    ActionOverride(Player3,LeaveAreaLUA("AR0021","",[516.409],4))
    ActionOverride(Player4,LeaveAreaLUA("AR0021","",[590.442],2))
    ActionOverride(Player5,LeaveAreaLUA("AR0021","",[590.389],4))
    ActionOverride(Player6,LeaveAreaLUA("AR0021","",[593.391],0))~ EXIT
END

IF ~~ agumar //Imnesvale
  SAY @27 /* ~That dump? It's your funeral.~ */
  IF ~~ DO ~ClearAllActions()
    SetGlobal("AGBarGo","GLOBAL",0)
    DestroySelf()
    ActionOverride(Player1,LeaveAreaLUA("AR1105","",[650.565],4))
    ActionOverride(Player2,LeaveAreaLUA("AR1105","",[669.529],4))
    ActionOverride(Player3,LeaveAreaLUA("AR1105","",[709.564],4))
    ActionOverride(Player4,LeaveAreaLUA("AR1105","",[739.516],2))
    ActionOverride(Player5,LeaveAreaLUA("AR1105","",[770.535],4))
    ActionOverride(Player6,LeaveAreaLUA("AR1105","",[830.501],0))~ EXIT
END

IF ~~ agtrade //Trademeet
  SAY @28 /* ~Just don't try the Innkeeper's Special.~ */
  IF ~~ DO ~ClearAllActions()
    SetGlobal("AGBarGo","GLOBAL",0)
    DestroySelf()
    ActionOverride(Player1,LeaveAreaLUA("AR2010","",[355.654],4))
    ActionOverride(Player2,LeaveAreaLUA("AR2010","",[369.700],4))
    ActionOverride(Player3,LeaveAreaLUA("AR2010","",[299.655],4))
    ActionOverride(Player4,LeaveAreaLUA("AR2010","",[320.716],2))
    ActionOverride(Player5,LeaveAreaLUA("AR2010","",[239.696],4))
    ActionOverride(Player6,LeaveAreaLUA("AR2010","",[255.723],0))~ EXIT
END

IF ~~ agbarbye //No action
  SAY @30 /* ~Very well then. Nice way to waste a charge, <BROTHERSISTER>.~ */
  IF ~~ DO ~SetGlobal("AGBarGo","GLOBAL",0)
    DestroySelf()~ EXIT
END
