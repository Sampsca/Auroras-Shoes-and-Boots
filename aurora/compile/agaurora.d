BEGIN agaurora

//Sleeping dialogue
IF ~StateCheck(Myself,STATE_SLEEPING)~ agaur_sleep
  SAY @682 /* ~Zzzzz...~ */
  IF ~~ EXIT
END

//Charmed dialogue (if A64's patch is installed)
IF ~StateCheck(Myself,STATE_CHARMED)~ agaur_charm
  SAY @600 /* ~Why, <GABBER>! How absolutely marvelous to see you! Come here and give me a hug.~ */
  ++ @601 /* ~Uh, I'm in a bit of a hurry, Aurora.~ */ + agaur_charm1
  ++ @602 /* ~Sure.~ */ + agaur_charm2
  ++ @603 /* ~Not right now. I've got to get going.~ */ + agaur_charm3
END

IF ~~ agaur_charm1
  SAY @604 /* ~Oh I understand... I don't suppose you'd like to check out my stock? I'm running low on some pairs, but overall I think everything should be acceptable.~ */
  ++ @605 /* ~That would be great, thank you.~ */ + agaur_charm4
  ++ @606 /* ~Not this time, Aurora. Just passing through.~ */ + agaur_charm5
END

IF ~~ agaur_charm2
  SAY @607 /* ~Mmmm, that's the stuff. It really is great to see you, <GABBER>.~ */
  = @608 /* ~Care to check out my stock? I'm running low on some pairs, but overall I think everything should be acceptable.~ */
  ++ @605 /* ~That would be great, thank you.~ */ + agaur_charm4
  ++ @606 /* ~Not this time, Aurora. Just passing through.~ */ + agaur_charm5
END

IF ~~ agaur_charm3
  SAY @609 /* ~Sorry to see you rush off, <GABBER>. Please come back soon!~ */
  IF ~~ EXIT
END

IF ~~ agaur_charm4
  SAY @610 /* ~Any time.~ */
  IF ~~ DO ~StartStore("agaurora",LastTalkedToBy())~ EXIT
END

IF ~~ agaur_charm5
  SAY @611 /* ~Fare well then, <GABBER>. I hope to see you again quite soon.~ */
  IF ~~ EXIT
END

//Gossip1.1
IF ~~ THEN BEGIN gossip_block_1
SAY @0 /* ~Let me think...~ */

IF ~
RandomNum(5,1)
Global("ag_gossip1","GLOBAL",0)
InMyArea("Valygar")
~ THEN EXTERN agaurora gossip1a

IF ~
RandomNum(5,1)
Global("ag_gossip1","GLOBAL",0)
!InMyArea("Valygar")
Global("BetrayedValygar","GLOBAL",0)
!Global("TalkedLavok","GLOBAL",0)
~ THEN EXTERN agaurora gossip1a

IF ~
RandomNum(5,1)
Global("ag_gossip1","GLOBAL",0)
!InMyArea("Valygar")
Global("BetrayedValygar","GLOBAL",0)
Global("TalkedLavok","GLOBAL",0)
~ THEN EXTERN agaurora gossip1b

IF ~
RandomNum(5,1)
Global("ag_gossip1","GLOBAL",0)
Global("BetrayedValygar","GLOBAL",1)
~ THEN EXTERN agaurora gossip1c

IF ~
RandomNum(5,1)
Global("ag_gossip1","GLOBAL",1)
Global("ag_gossip2","GLOBAL",0)
~ THEN EXTERN agaurora gossip2

IF ~
RandomNum(5,1)
Global("ag_gossip1","GLOBAL",1)
Global("ag_gossip2","GLOBAL",1)
Global("ag_gossip3","GLOBAL",0)
~ THEN EXTERN agaurora gossip3

IF ~
RandomNum(5,1)
Global("ag_gossip1","GLOBAL",1)
Global("ag_gossip2","GLOBAL",1)
Global("ag_gossip3","GLOBAL",1)
Global("ag_gossip4","GLOBAL",0)
~ THEN EXTERN agaurora gossip4

IF ~
RandomNum(5,1)
Global("ag_gossip1","GLOBAL",1)
Global("ag_gossip2","GLOBAL",1)
Global("ag_gossip3","GLOBAL",1)
Global("ag_gossip4","GLOBAL",1)
Global("ag_gossip5","GLOBAL",0)
~ THEN EXTERN agaurora gossip5

//Gossip1.2

IF ~
RandomNum(5,2)
Global("ag_gossip2","GLOBAL",0)
~ THEN EXTERN agaurora gossip2

IF ~
RandomNum(5,2)
Global("ag_gossip2","GLOBAL",1)
Global("ag_gossip3","GLOBAL",0)
~ THEN EXTERN agaurora gossip3

IF ~
RandomNum(5,2)
Global("ag_gossip2","GLOBAL",1)
Global("ag_gossip3","GLOBAL",1)
Global("ag_gossip4","GLOBAL",0)
~ THEN EXTERN agaurora gossip4

IF ~
RandomNum(5,2)
Global("ag_gossip2","GLOBAL",1)
Global("ag_gossip3","GLOBAL",1)
Global("ag_gossip4","GLOBAL",1)
Global("ag_gossip5","GLOBAL",0)
~ THEN EXTERN agaurora gossip5

IF ~
RandomNum(5,2)
Global("ag_gossip2","GLOBAL",1)
Global("ag_gossip3","GLOBAL",1)
Global("ag_gossip4","GLOBAL",1)
Global("ag_gossip5","GLOBAL",1)
Global("ag_gossip1","GLOBAL",0)
InMyArea("Valygar")
~ THEN EXTERN agaurora gossip1a

IF ~
RandomNum(5,2)
Global("ag_gossip2","GLOBAL",1)
Global("ag_gossip3","GLOBAL",1)
Global("ag_gossip4","GLOBAL",1)
Global("ag_gossip5","GLOBAL",1)
Global("ag_gossip1","GLOBAL",0)
!InMyArea("Valygar")
Global("BetrayedValygar","GLOBAL",0)
!Global("TalkedLavok","GLOBAL",0)
~ THEN EXTERN agaurora gossip1a

IF ~
RandomNum(5,2)
Global("ag_gossip2","GLOBAL",1)
Global("ag_gossip3","GLOBAL",1)
Global("ag_gossip4","GLOBAL",1)
Global("ag_gossip5","GLOBAL",1)
Global("ag_gossip1","GLOBAL",0)
!InMyArea("Valygar")
Global("BetrayedValygar","GLOBAL",0)
Global("TalkedLavok","GLOBAL",0)
~ THEN EXTERN agaurora gossip1b

IF ~
RandomNum(5,2)
Global("ag_gossip2","GLOBAL",1)
Global("ag_gossip3","GLOBAL",1)
Global("ag_gossip4","GLOBAL",1)
Global("ag_gossip5","GLOBAL",1)
Global("ag_gossip1","GLOBAL",0)
Global("BetrayedValygar","GLOBAL",1)
~ THEN EXTERN agaurora gossip1c

//Gossip1.3

IF ~
RandomNum(5,3)
Global("ag_gossip3","GLOBAL",0)
~ THEN EXTERN agaurora gossip3

IF ~
RandomNum(5,3)
Global("ag_gossip3","GLOBAL",1)
Global("ag_gossip4","GLOBAL",0)
~ THEN EXTERN agaurora gossip4

IF ~
RandomNum(5,3)
Global("ag_gossip3","GLOBAL",1)
Global("ag_gossip4","GLOBAL",1)
Global("ag_gossip5","GLOBAL",0)
~ THEN EXTERN agaurora gossip5

IF ~
RandomNum(5,3)
Global("ag_gossip3","GLOBAL",1)
Global("ag_gossip4","GLOBAL",1)
Global("ag_gossip5","GLOBAL",1)
Global("ag_gossip1","GLOBAL",0)
InMyArea("Valygar")
~ THEN EXTERN agaurora gossip1a

IF ~
RandomNum(5,3)
Global("ag_gossip3","GLOBAL",1)
Global("ag_gossip4","GLOBAL",1)
Global("ag_gossip5","GLOBAL",1)
Global("ag_gossip1","GLOBAL",0)
!InMyArea("Valygar")
Global("BetrayedValygar","GLOBAL",0)
!Global("TalkedLavok","GLOBAL",0)
~ THEN EXTERN agaurora gossip1a

IF ~
RandomNum(5,3)
Global("ag_gossip3","GLOBAL",1)
Global("ag_gossip4","GLOBAL",1)
Global("ag_gossip5","GLOBAL",1)
Global("ag_gossip1","GLOBAL",0)
!InMyArea("Valygar")
Global("BetrayedValygar","GLOBAL",0)
Global("TalkedLavok","GLOBAL",0)
~ THEN EXTERN agaurora gossip1b

IF ~
RandomNum(5,3)
Global("ag_gossip3","GLOBAL",1)
Global("ag_gossip4","GLOBAL",1)
Global("ag_gossip5","GLOBAL",1)
Global("ag_gossip1","GLOBAL",0)
Global("BetrayedValygar","GLOBAL",1)
~ THEN EXTERN agaurora gossip1c

IF ~
RandomNum(5,3)
Global("ag_gossip3","GLOBAL",1)
Global("ag_gossip4","GLOBAL",1)
Global("ag_gossip5","GLOBAL",1)
Global("ag_gossip1","GLOBAL",1)
Global("ag_gossip2","GLOBAL",0)
~ THEN EXTERN agaurora gossip2

//Gossip1.4

IF ~
RandomNum(5,4)
Global("ag_gossip4","GLOBAL",0)
~ THEN EXTERN agaurora gossip4

IF ~
RandomNum(5,4)
Global("ag_gossip4","GLOBAL",1)
Global("ag_gossip5","GLOBAL",0)
~ THEN EXTERN agaurora gossip5

IF ~
RandomNum(5,4)
Global("ag_gossip4","GLOBAL",1)
Global("ag_gossip5","GLOBAL",1)
Global("ag_gossip1","GLOBAL",0)
InMyArea("Valygar")
~ THEN EXTERN agaurora gossip1a

IF ~
RandomNum(5,4)
Global("ag_gossip4","GLOBAL",1)
Global("ag_gossip5","GLOBAL",1)
Global("ag_gossip1","GLOBAL",0)
!InMyArea("Valygar")
Global("BetrayedValygar","GLOBAL",0)
!Global("TalkedLavok","GLOBAL",0)
~ THEN EXTERN agaurora gossip1a

IF ~
RandomNum(5,4)
Global("ag_gossip4","GLOBAL",1)
Global("ag_gossip5","GLOBAL",1)
Global("ag_gossip1","GLOBAL",0)
!InMyArea("Valygar")
Global("BetrayedValygar","GLOBAL",0)
Global("TalkedLavok","GLOBAL",0)
~ THEN EXTERN agaurora gossip1b

IF ~
RandomNum(5,4)
Global("ag_gossip4","GLOBAL",1)
Global("ag_gossip5","GLOBAL",1)
Global("ag_gossip1","GLOBAL",0)
Global("BetrayedValygar","GLOBAL",1)
~ THEN EXTERN agaurora gossip1c

IF ~
RandomNum(5,4)
Global("ag_gossip4","GLOBAL",1)
Global("ag_gossip5","GLOBAL",1)
Global("ag_gossip1","GLOBAL",1)
Global("ag_gossip2","GLOBAL",0)
~ THEN EXTERN agaurora gossip2

IF ~
RandomNum(5,4)
Global("ag_gossip4","GLOBAL",1)
Global("ag_gossip5","GLOBAL",1)
Global("ag_gossip1","GLOBAL",1)
Global("ag_gossip2","GLOBAL",1)
Global("ag_gossip3","GLOBAL",0)
~ THEN EXTERN agaurora gossip3

//Gossip1.5

IF ~
RandomNum(5,5)
Global("ag_gossip5","GLOBAL",0)
~ THEN EXTERN agaurora gossip5

IF ~
RandomNum(5,5)
Global("ag_gossip5","GLOBAL",1)
Global("ag_gossip1","GLOBAL",0)
InMyArea("Valygar")
~ THEN EXTERN agaurora gossip1a

IF ~
RandomNum(5,5)
Global("ag_gossip5","GLOBAL",1)
Global("ag_gossip1","GLOBAL",0)
!InMyArea("Valygar")
Global("BetrayedValygar","GLOBAL",0)
!Global("TalkedLavok","GLOBAL",0)
~ THEN EXTERN agaurora gossip1a

IF ~
RandomNum(5,5)
Global("ag_gossip5","GLOBAL",1)
Global("ag_gossip1","GLOBAL",0)
!InMyArea("Valygar")
Global("BetrayedValygar","GLOBAL",0)
Global("TalkedLavok","GLOBAL",0)

~ THEN EXTERN agaurora gossip1b

IF ~
RandomNum(5,5)
Global("ag_gossip5","GLOBAL",1)
Global("ag_gossip1","GLOBAL",0)
Global("BetrayedValygar","GLOBAL",1)
~ THEN EXTERN agaurora gossip1c

IF ~
RandomNum(5,5)
Global("ag_gossip5","GLOBAL",1)
Global("ag_gossip1","GLOBAL",1)
Global("ag_gossip2","GLOBAL",0)
~ THEN EXTERN agaurora gossip2

IF ~
RandomNum(5,5)
Global("ag_gossip5","GLOBAL",1)
Global("ag_gossip1","GLOBAL",1)
Global("ag_gossip2","GLOBAL",1)
Global("ag_gossip3","GLOBAL",0)
~ THEN EXTERN agaurora gossip3

IF ~
RandomNum(5,5)
Global("ag_gossip5","GLOBAL",1)
Global("ag_gossip1","GLOBAL",1)
Global("ag_gossip2","GLOBAL",1)
Global("ag_gossip3","GLOBAL",1)
Global("ag_gossip4","GLOBAL",0)
~ THEN EXTERN agaurora gossip4

END

//Gossip2.1

IF ~~ THEN BEGIN gossip_block_2
SAY @0 /* ~Let me think...~ */

IF ~
RandomNum(5,1)
Global("ag_gossip6","GLOBAL",0)
InMyArea("Anomen")
~ THEN EXTERN agaurora gossip6a

IF ~
RandomNum(5,1)
Global("ag_gossip6","GLOBAL",0)
!InMyArea("Anomen")
~ THEN EXTERN agaurora gossip6b

IF ~
RandomNum(5,1)
Global("ag_gossip6","GLOBAL",1)
Global("ag_gossip7","GLOBAL",0)
~ THEN EXTERN agaurora gossip7

IF ~
RandomNum(5,1)
Global("ag_gossip6","GLOBAL",1)
Global("ag_gossip7","GLOBAL",1)
Global("ag_gossip8","GLOBAL",0)
~ THEN EXTERN agaurora gossip8

IF ~
RandomNum(5,1)
Global("ag_gossip6","GLOBAL",1)
Global("ag_gossip7","GLOBAL",1)
Global("ag_gossip8","GLOBAL",1)
Global("ag_gossip9","GLOBAL",0)
~ THEN EXTERN agaurora gossip9

IF ~
RandomNum(5,1)
Global("ag_gossip6","GLOBAL",1)
Global("ag_gossip7","GLOBAL",1)
Global("ag_gossip8","GLOBAL",1)
Global("ag_gossip9","GLOBAL",1)
Global("ag_gossip10","GLOBAL",0)
~ THEN EXTERN agaurora gossip10

//Gossip2.2

IF ~
RandomNum(5,2)
Global("ag_gossip7","GLOBAL",0)
~ THEN EXTERN agaurora gossip7

IF ~
RandomNum(5,2)
Global("ag_gossip7","GLOBAL",1)
Global("ag_gossip8","GLOBAL",0)
~ THEN EXTERN agaurora gossip8

IF ~
RandomNum(5,2)
Global("ag_gossip7","GLOBAL",1)
Global("ag_gossip8","GLOBAL",1)
Global("ag_gossip9","GLOBAL",0)
~ THEN EXTERN agaurora gossip9

IF ~
RandomNum(5,2)
Global("ag_gossip7","GLOBAL",1)
Global("ag_gossip8","GLOBAL",1)
Global("ag_gossip9","GLOBAL",1)
Global("ag_gossip10","GLOBAL",0)
~ THEN EXTERN agaurora gossip10

IF ~
RandomNum(5,2)
Global("ag_gossip7","GLOBAL",1)
Global("ag_gossip8","GLOBAL",1)
Global("ag_gossip9","GLOBAL",1)
Global("ag_gossip10","GLOBAL",1)
Global("ag_gossip6","GLOBAL",0)
InMyArea("Anomen")
~ THEN EXTERN agaurora gossip6a

IF ~
RandomNum(5,2)
Global("ag_gossip7","GLOBAL",1)
Global("ag_gossip8","GLOBAL",1)
Global("ag_gossip9","GLOBAL",1)
Global("ag_gossip10","GLOBAL",1)
Global("ag_gossip6","GLOBAL",0)
!InMyArea("Anomen")
~ THEN EXTERN agaurora gossip6b

//Gossip2.3

IF ~
RandomNum(5,3)
Global("ag_gossip8","GLOBAL",0)
~ THEN EXTERN agaurora gossip8

IF ~
RandomNum(5,3)
Global("ag_gossip8","GLOBAL",1)
Global("ag_gossip9","GLOBAL",0)
~ THEN EXTERN agaurora gossip9

IF ~
RandomNum(5,3)
Global("ag_gossip8","GLOBAL",1)
Global("ag_gossip9","GLOBAL",1)
Global("ag_gossip10","GLOBAL",0)
~ THEN EXTERN agaurora gossip10

IF ~
RandomNum(5,3)
Global("ag_gossip8","GLOBAL",1)
Global("ag_gossip9","GLOBAL",1)
Global("ag_gossip10","GLOBAL",1)
Global("ag_gossip6","GLOBAL",0)
InMyArea("Anomen")
~ THEN EXTERN agaurora gossip6a

IF ~
RandomNum(5,3)
Global("ag_gossip8","GLOBAL",1)
Global("ag_gossip9","GLOBAL",1)
Global("ag_gossip10","GLOBAL",1)
Global("ag_gossip6","GLOBAL",0)
!InMyArea("Anomen")
~ THEN EXTERN agaurora gossip6b

IF ~
RandomNum(5,3)
Global("ag_gossip8","GLOBAL",1)
Global("ag_gossip9","GLOBAL",1)
Global("ag_gossip10","GLOBAL",1)
Global("ag_gossip6","GLOBAL",1)
Global("ag_gossip7","GLOBAL",0)
~ THEN EXTERN agaurora gossip7

//Gossip2.4

IF ~
RandomNum(5,4)
Global("ag_gossip9","GLOBAL",0)
~ THEN EXTERN agaurora gossip9

IF ~
RandomNum(5,4)
Global("ag_gossip9","GLOBAL",1)
Global("ag_gossip10","GLOBAL",0)
~ THEN EXTERN agaurora gossip10

IF ~
RandomNum(5,4)
Global("ag_gossip9","GLOBAL",1)
Global("ag_gossip10","GLOBAL",1)
Global("ag_gossip6","GLOBAL",0)
InMyArea("Anomen")
~ THEN EXTERN agaurora gossip6a

IF ~
RandomNum(5,4)
Global("ag_gossip9","GLOBAL",1)
Global("ag_gossip10","GLOBAL",1)
Global("ag_gossip6","GLOBAL",0)
!InMyArea("Anomen")
~ THEN EXTERN agaurora gossip6b

IF ~
RandomNum(5,4)
Global("ag_gossip9","GLOBAL",1)
Global("ag_gossip10","GLOBAL",1)
Global("ag_gossip6","GLOBAL",1)
Global("ag_gossip7","GLOBAL",0)
~ THEN EXTERN agaurora gossip7

IF ~
RandomNum(5,4)
Global("ag_gossip9","GLOBAL",1)
Global("ag_gossip10","GLOBAL",1)
Global("ag_gossip6","GLOBAL",1)
Global("ag_gossip7","GLOBAL",1)
Global("ag_gossip8","GLOBAL",0)
~ THEN EXTERN agaurora gossip8

//Gossip2.5

IF ~
RandomNum(5,5)
Global("ag_gossip10","GLOBAL",0)
~ THEN EXTERN agaurora gossip10

IF ~
RandomNum(5,5)
Global("ag_gossip10","GLOBAL",1)
Global("ag_gossip6","GLOBAL",0)
InMyArea("Anomen")
~ THEN EXTERN agaurora gossip6a

IF ~
RandomNum(5,5)
Global("ag_gossip10","GLOBAL",1)
Global("ag_gossip6","GLOBAL",0)
!InMyArea("Anomen")
~ THEN EXTERN agaurora gossip6b

IF ~
RandomNum(5,5)
Global("ag_gossip10","GLOBAL",1)
Global("ag_gossip6","GLOBAL",1)
Global("ag_gossip7","GLOBAL",0)
~ THEN EXTERN agaurora gossip7

IF ~
RandomNum(5,5)
Global("ag_gossip10","GLOBAL",1)
Global("ag_gossip6","GLOBAL",1)
Global("ag_gossip7","GLOBAL",1)
Global("ag_gossip8","GLOBAL",0)
~ THEN EXTERN agaurora gossip8

IF ~
RandomNum(5,5)
Global("ag_gossip10","GLOBAL",1)
Global("ag_gossip6","GLOBAL",1)
Global("ag_gossip7","GLOBAL",1)
Global("ag_gossip8","GLOBAL",1)
Global("ag_gossip9","GLOBAL",0)
~ THEN EXTERN agaurora gossip9

END

//Gossip3.1

IF ~~ THEN BEGIN gossip_block_3
SAY @0 /* ~Let me think...~ */

IF ~
RandomNum(5,1)
Global("ag_gossip11","GLOBAL",0)
~ THEN EXTERN agaurora gossip11

IF ~
RandomNum(5,1)
Global("ag_gossip11","GLOBAL",1)
Global("ag_gossip12","GLOBAL",0)
~ THEN EXTERN agaurora gossip12

IF ~
RandomNum(5,1)
Global("ag_gossip11","GLOBAL",1)
Global("ag_gossip12","GLOBAL",1)
Global("ag_gossip13","GLOBAL",0)
~ THEN EXTERN agaurora gossip13

IF ~
RandomNum(5,1)
Global("ag_gossip11","GLOBAL",1)
Global("ag_gossip12","GLOBAL",1)
Global("ag_gossip13","GLOBAL",1)
Global("ag_gossip14","GLOBAL",0)
~ THEN EXTERN agaurora gossip14

IF ~
RandomNum(5,1)
Global("ag_gossip11","GLOBAL",1)
Global("ag_gossip12","GLOBAL",1)
Global("ag_gossip13","GLOBAL",1)
Global("ag_gossip14","GLOBAL",1)
Global("ag_gossip15","GLOBAL",0)
~ THEN EXTERN agaurora gossip15

//Gossip3.2

IF ~
RandomNum(5,2)
Global("ag_gossip12","GLOBAL",0)
~ THEN EXTERN agaurora gossip12

IF ~
RandomNum(5,2)
Global("ag_gossip12","GLOBAL",1)
Global("ag_gossip13","GLOBAL",0)
~ THEN EXTERN agaurora gossip13

IF ~
RandomNum(5,2)
Global("ag_gossip12","GLOBAL",1)
Global("ag_gossip13","GLOBAL",1)
Global("ag_gossip14","GLOBAL",0)
~ THEN EXTERN agaurora gossip14

IF ~
RandomNum(5,2)
Global("ag_gossip12","GLOBAL",1)
Global("ag_gossip13","GLOBAL",1)
Global("ag_gossip14","GLOBAL",1)
Global("ag_gossip15","GLOBAL",0)
~ THEN EXTERN agaurora gossip15

IF ~
RandomNum(5,2)
Global("ag_gossip12","GLOBAL",1)
Global("ag_gossip13","GLOBAL",1)
Global("ag_gossip14","GLOBAL",1)
Global("ag_gossip15","GLOBAL",1)
Global("ag_gossip11","GLOBAL",0)
~ THEN EXTERN agaurora gossip11

//Gossip3.3

IF ~
RandomNum(5,3)
Global("ag_gossip13","GLOBAL",0)
~ THEN EXTERN agaurora gossip13

IF ~
RandomNum(5,3)
Global("ag_gossip13","GLOBAL",1)
Global("ag_gossip14","GLOBAL",0)
~ THEN EXTERN agaurora gossip14

IF ~
RandomNum(5,3)
Global("ag_gossip13","GLOBAL",1)
Global("ag_gossip14","GLOBAL",1)
Global("ag_gossip15","GLOBAL",0)
~ THEN EXTERN agaurora gossip15

IF ~
RandomNum(5,3)
Global("ag_gossip13","GLOBAL",1)
Global("ag_gossip14","GLOBAL",1)
Global("ag_gossip15","GLOBAL",1)
Global("ag_gossip11","GLOBAL",0)
~ THEN EXTERN agaurora gossip11

IF ~
RandomNum(5,3)
Global("ag_gossip13","GLOBAL",1)
Global("ag_gossip14","GLOBAL",1)
Global("ag_gossip15","GLOBAL",1)
Global("ag_gossip11","GLOBAL",1)
Global("ag_gossip12","GLOBAL",0)
~ THEN EXTERN agaurora gossip12

//Gossip3.4

IF ~
RandomNum(5,4)
Global("ag_gossip14","GLOBAL",0)
~ THEN EXTERN agaurora gossip14

IF ~
RandomNum(5,4)
Global("ag_gossip14","GLOBAL",1)
Global("ag_gossip15","GLOBAL",0)
~ THEN EXTERN agaurora gossip15

IF ~
RandomNum(5,4)
Global("ag_gossip14","GLOBAL",1)
Global("ag_gossip15","GLOBAL",1)
Global("ag_gossip11","GLOBAL",0)
~ THEN EXTERN agaurora gossip11

IF ~
RandomNum(5,4)
Global("ag_gossip14","GLOBAL",1)
Global("ag_gossip15","GLOBAL",1)
Global("ag_gossip11","GLOBAL",1)
Global("ag_gossip12","GLOBAL",0)
~ THEN EXTERN agaurora gossip12

IF ~
RandomNum(5,4)
Global("ag_gossip14","GLOBAL",1)
Global("ag_gossip15","GLOBAL",1)
Global("ag_gossip11","GLOBAL",1)
Global("ag_gossip12","GLOBAL",1)
Global("ag_gossip13","GLOBAL",0)
~ THEN EXTERN agaurora gossip13

//Gossip3.5

IF ~
RandomNum(5,5)
Global("ag_gossip15","GLOBAL",0)
~ THEN EXTERN agaurora gossip15

IF ~
RandomNum(5,5)
Global("ag_gossip15","GLOBAL",1)
Global("ag_gossip11","GLOBAL",0)
~ THEN EXTERN agaurora gossip11

IF ~
RandomNum(5,5)
Global("ag_gossip15","GLOBAL",1)
Global("ag_gossip11","GLOBAL",1)
Global("ag_gossip12","GLOBAL",0)
~ THEN EXTERN agaurora gossip12

IF ~
RandomNum(5,5)
Global("ag_gossip15","GLOBAL",1)
Global("ag_gossip11","GLOBAL",1)
Global("ag_gossip12","GLOBAL",1)
Global("ag_gossip13","GLOBAL",0)
~ THEN EXTERN agaurora gossip13

IF ~
RandomNum(5,5)
Global("ag_gossip15","GLOBAL",1)
Global("ag_gossip11","GLOBAL",1)
Global("ag_gossip12","GLOBAL",1)
Global("ag_gossip13","GLOBAL",1)
Global("ag_gossip14","GLOBAL",0)
~ THEN EXTERN agaurora gossip14

END

//Gossip4.1

IF ~~ THEN BEGIN gossip_block_4
SAY @0 /* ~Let me think...~ */

IF ~
RandomNum(5,1)
Global("ag_gossip16","GLOBAL",0)
~ THEN EXTERN agaurora gossip16

IF ~
RandomNum(5,1)
Global("ag_gossip16","GLOBAL",1)
Global("ag_gossip17","GLOBAL",0)
~ THEN EXTERN agaurora gossip17

IF ~
RandomNum(5,1)
Global("ag_gossip16","GLOBAL",1)
Global("ag_gossip17","GLOBAL",1)
Global("ag_gossip18","GLOBAL",0)
~ THEN EXTERN agaurora gossip18

IF ~
RandomNum(5,1)
Global("ag_gossip16","GLOBAL",1)
Global("ag_gossip17","GLOBAL",1)
Global("ag_gossip18","GLOBAL",1)
Global("ag_gossip19","GLOBAL",0)
~ THEN EXTERN agaurora gossip19

IF ~
RandomNum(5,1)
Global("ag_gossip16","GLOBAL",1)
Global("ag_gossip17","GLOBAL",1)
Global("ag_gossip18","GLOBAL",1)
Global("ag_gossip19","GLOBAL",1)
Global("ag_gossip20","GLOBAL",0)
Global("MurdersSolved","GLOBAL",0)
~ THEN EXTERN agaurora gossip20a

IF ~
RandomNum(5,1)
Global("ag_gossip16","GLOBAL",1)
Global("ag_gossip17","GLOBAL",1)
Global("ag_gossip18","GLOBAL",1)
Global("ag_gossip19","GLOBAL",1)
Global("ag_gossip20","GLOBAL",0)
Global("ToldInspector","GLOBAL",1)
Global("MurdersSolved","GLOBAL",1)
~ THEN EXTERN agaurora gossip20b

IF ~
RandomNum(5,1)
Global("ag_gossip16","GLOBAL",1)
Global("ag_gossip17","GLOBAL",1)
Global("ag_gossip18","GLOBAL",1)
Global("ag_gossip19","GLOBAL",1)
Global("ag_gossip20","GLOBAL",0)
Global("ToldInspector","GLOBAL",0)
Global("MurdersSolved","GLOBAL",1)
~ THEN EXTERN agaurora gossip20c

//Gossip4.2

IF ~
RandomNum(5,2)
Global("ag_gossip17","GLOBAL",0)
~ THEN EXTERN agaurora gossip17

IF ~
RandomNum(5,2)
Global("ag_gossip17","GLOBAL",1)
Global("ag_gossip18","GLOBAL",0)
~ THEN EXTERN agaurora gossip18

IF ~
RandomNum(5,2)
Global("ag_gossip17","GLOBAL",1)
Global("ag_gossip18","GLOBAL",1)
Global("ag_gossip19","GLOBAL",0)
~ THEN EXTERN agaurora gossip19

IF ~
RandomNum(5,2)
Global("ag_gossip17","GLOBAL",1)
Global("ag_gossip18","GLOBAL",1)
Global("ag_gossip19","GLOBAL",1)
Global("ag_gossip20","GLOBAL",0)
Global("MurdersSolved","GLOBAL",0)
~ THEN EXTERN agaurora gossip20a

IF ~
RandomNum(5,2)
Global("ag_gossip17","GLOBAL",1)
Global("ag_gossip18","GLOBAL",1)
Global("ag_gossip19","GLOBAL",1)
Global("ag_gossip20","GLOBAL",0)
Global("ToldInspector","GLOBAL",1)
Global("MurdersSolved","GLOBAL",1)
~ THEN EXTERN agaurora gossip20b

IF ~
RandomNum(5,2)
Global("ag_gossip17","GLOBAL",1)
Global("ag_gossip18","GLOBAL",1)
Global("ag_gossip19","GLOBAL",1)
Global("ag_gossip20","GLOBAL",0)
Global("ToldInspector","GLOBAL",0)
Global("MurdersSolved","GLOBAL",1)
~ THEN EXTERN agaurora gossip20c

IF ~
RandomNum(5,2)
Global("ag_gossip17","GLOBAL",1)
Global("ag_gossip18","GLOBAL",1)
Global("ag_gossip19","GLOBAL",1)
Global("ag_gossip20","GLOBAL",1)
Global("ag_gossip16","GLOBAL",0)
~ THEN EXTERN agaurora gossip16

//Gossip4.3

IF ~
RandomNum(5,3)
Global("ag_gossip18","GLOBAL",0)
~ THEN EXTERN agaurora gossip18

IF ~
RandomNum(5,3)
Global("ag_gossip18","GLOBAL",1)
Global("ag_gossip19","GLOBAL",0)
~ THEN EXTERN agaurora gossip19

IF ~
RandomNum(5,3)
Global("ag_gossip18","GLOBAL",1)
Global("ag_gossip19","GLOBAL",1)
Global("ag_gossip20","GLOBAL",0)
Global("MurdersSolved","GLOBAL",0)
~ THEN EXTERN agaurora gossip20a

IF ~
RandomNum(5,3)
Global("ag_gossip18","GLOBAL",1)
Global("ag_gossip19","GLOBAL",1)
Global("ag_gossip20","GLOBAL",0)
Global("ToldInspector","GLOBAL",1)
Global("MurdersSolved","GLOBAL",1)
~ THEN EXTERN agaurora gossip20b

IF ~
RandomNum(5,3)
Global("ag_gossip18","GLOBAL",1)
Global("ag_gossip19","GLOBAL",1)
Global("ag_gossip20","GLOBAL",0)
Global("ToldInspector","GLOBAL",0)
Global("MurdersSolved","GLOBAL",1)
~ THEN EXTERN agaurora gossip20c

IF ~
RandomNum(5,3)
Global("ag_gossip18","GLOBAL",1)
Global("ag_gossip19","GLOBAL",1)
Global("ag_gossip20","GLOBAL",1)
Global("ag_gossip16","GLOBAL",0)
~ THEN EXTERN agaurora gossip16

IF ~
RandomNum(5,3)
Global("ag_gossip18","GLOBAL",1)
Global("ag_gossip19","GLOBAL",1)
Global("ag_gossip20","GLOBAL",1)
Global("ag_gossip16","GLOBAL",1)
Global("ag_gossip17","GLOBAL",0)
~ THEN EXTERN agaurora gossip17

//Gossip4.4

IF ~
RandomNum(5,4)
Global("ag_gossip19","GLOBAL",0)
~ THEN EXTERN agaurora gossip19

IF ~
RandomNum(5,4)
Global("ag_gossip19","GLOBAL",1)
Global("ag_gossip20","GLOBAL",0)
Global("MurdersSolved","GLOBAL",0)
~ THEN EXTERN agaurora gossip20a

IF ~
RandomNum(5,4)
Global("ag_gossip19","GLOBAL",1)
Global("ag_gossip20","GLOBAL",0)
Global("ToldInspector","GLOBAL",1)
Global("MurdersSolved","GLOBAL",1)
~ THEN EXTERN agaurora gossip20b

IF ~
RandomNum(5,4)
Global("ag_gossip19","GLOBAL",1)
Global("ag_gossip20","GLOBAL",0)
Global("ToldInspector","GLOBAL",0)
Global("MurdersSolved","GLOBAL",1)
~ THEN EXTERN agaurora gossip20c

IF ~
RandomNum(5,4)
Global("ag_gossip19","GLOBAL",1)
Global("ag_gossip20","GLOBAL",1)
Global("ag_gossip16","GLOBAL",0)
~ THEN EXTERN agaurora gossip16

IF ~
RandomNum(5,4)
Global("ag_gossip19","GLOBAL",1)
Global("ag_gossip20","GLOBAL",1)
Global("ag_gossip16","GLOBAL",1)
Global("ag_gossip17","GLOBAL",0)
~ THEN EXTERN agaurora gossip17

IF ~
RandomNum(5,4)
Global("ag_gossip19","GLOBAL",1)
Global("ag_gossip20","GLOBAL",1)
Global("ag_gossip16","GLOBAL",1)
Global("ag_gossip17","GLOBAL",1)
Global("ag_gossip18","GLOBAL",0)
~ THEN EXTERN agaurora gossip18

//Gossip4.5

IF ~
RandomNum(5,5)
Global("ag_gossip20","GLOBAL",0)
Global("MurdersSolved","GLOBAL",0)
~ THEN EXTERN agaurora gossip20a

IF ~
RandomNum(5,5)
Global("ag_gossip20","GLOBAL",0)
Global("ToldInspector","GLOBAL",1)
Global("MurdersSolved","GLOBAL",1)
~ THEN EXTERN agaurora gossip20b

IF ~
RandomNum(5,5)
Global("ag_gossip20","GLOBAL",0)
Global("ToldInspector","GLOBAL",0)
Global("MurdersSolved","GLOBAL",1)
~ THEN EXTERN agaurora gossip20c

IF ~
RandomNum(5,5)
Global("ag_gossip20","GLOBAL",1)
Global("ag_gossip16","GLOBAL",0)
~ THEN EXTERN agaurora gossip16

IF ~
RandomNum(5,5)
Global("ag_gossip20","GLOBAL",1)
Global("ag_gossip16","GLOBAL",1)
Global("ag_gossip17","GLOBAL",0)
~ THEN EXTERN agaurora gossip17

IF ~
RandomNum(5,5)
Global("ag_gossip20","GLOBAL",1)
Global("ag_gossip16","GLOBAL",1)
Global("ag_gossip17","GLOBAL",1)
Global("ag_gossip18","GLOBAL",0)
~ THEN EXTERN agaurora gossip18

IF ~
RandomNum(5,5)
Global("ag_gossip20","GLOBAL",1)
Global("ag_gossip16","GLOBAL",1)
Global("ag_gossip17","GLOBAL",1)
Global("ag_gossip18","GLOBAL",1)
Global("ag_gossip19","GLOBAL",0)
~ THEN EXTERN agaurora gossip19

END

//Gossip5.1

IF ~~ THEN BEGIN gossip
SAY @1 /* ~Some gossip, you say...~ */

IF  ~
RandomNum(4,1)
GlobalLT("ag_gossip_block_1","GLOBAL",5)
~  THEN EXTERN agaurora gossip_block_1

IF  ~
RandomNum(4,1)
Global("ag_gossip_block_1","GLOBAL",5)
GlobalLT("ag_gossip_block_2","GLOBAL",5)
~  THEN EXTERN agaurora gossip_block_2

IF  ~
RandomNum(4,1)
Global("ag_gossip_block_1","GLOBAL",5)
Global("ag_gossip_block_2","GLOBAL",5)
GlobalLT("ag_gossip_block_3","GLOBAL",5)
~  THEN EXTERN agaurora gossip_block_3

IF  ~
RandomNum(4,1)
Global("ag_gossip_block_1","GLOBAL",5)
Global("ag_gossip_block_2","GLOBAL",5)
Global("ag_gossip_block_3","GLOBAL",5)
GlobalLT("ag_gossip_block_4","GLOBAL",5)
~  THEN EXTERN agaurora gossip_block_4

//Gossip5.2

IF  ~
RandomNum(4,2)
GlobalLT("ag_gossip_block_2","GLOBAL",5)
~  THEN EXTERN agaurora gossip_block_2

IF  ~
RandomNum(4,2)
Global("ag_gossip_block_2","GLOBAL",5)
GlobalLT("ag_gossip_block_3","GLOBAL",5)
~  THEN EXTERN agaurora gossip_block_3

IF  ~
RandomNum(4,2)
Global("ag_gossip_block_2","GLOBAL",5)
Global("ag_gossip_block_3","GLOBAL",5)
GlobalLT("ag_gossip_block_4","GLOBAL",5)
~  THEN EXTERN agaurora gossip_block_4

IF  ~
RandomNum(4,2)
Global("ag_gossip_block_2","GLOBAL",5)
Global("ag_gossip_block_3","GLOBAL",5)
Global("ag_gossip_block_4","GLOBAL",5)
GlobalLT("ag_gossip_block_1","GLOBAL",5)
~  THEN EXTERN agaurora gossip_block_1

//Gossip5.3

IF  ~
RandomNum(4,3)
GlobalLT("ag_gossip_block_3","GLOBAL",5)
~  THEN EXTERN agaurora gossip_block_3

IF  ~
RandomNum(4,3)
Global("ag_gossip_block_3","GLOBAL",5)
GlobalLT("ag_gossip_block_4","GLOBAL",5)
~  THEN EXTERN agaurora gossip_block_4

IF  ~
RandomNum(4,3)
Global("ag_gossip_block_3","GLOBAL",5)
Global("ag_gossip_block_4","GLOBAL",5)
GlobalLT("ag_gossip_block_1","GLOBAL",5)
~  THEN EXTERN agaurora gossip_block_1

IF  ~
RandomNum(4,3)
Global("ag_gossip_block_3","GLOBAL",5)
Global("ag_gossip_block_4","GLOBAL",5)
Global("ag_gossip_block_1","GLOBAL",5)
GlobalLT("ag_gossip_block_2","GLOBAL",5)
~  THEN EXTERN agaurora gossip_block_2

//Gossip5.4

IF  ~
RandomNum(4,4)
GlobalLT("ag_gossip_block_4","GLOBAL",5)
~  THEN EXTERN agaurora gossip_block_4

IF  ~
RandomNum(4,4)
Global("ag_gossip_block_4","GLOBAL",5)
GlobalLT("ag_gossip_block_1","GLOBAL",5)
~  THEN EXTERN agaurora gossip_block_1

IF  ~
RandomNum(4,4)
Global("ag_gossip_block_4","GLOBAL",5)
Global("ag_gossip_block_1","GLOBAL",5)
GlobalLT("ag_gossip_block_2","GLOBAL",5)
~  THEN EXTERN agaurora gossip_block_2

IF  ~
RandomNum(4,4)
Global("ag_gossip_block_4","GLOBAL",5)
Global("ag_gossip_block_1","GLOBAL",5)
Global("ag_gossip_block_2","GLOBAL",5)
GlobalLT("ag_gossip_block_3","GLOBAL",5)
~  THEN EXTERN agaurora gossip_block_3

IF ~
Global("ag_gossip_block_1","GLOBAL",5)
Global("ag_gossip_block_2","GLOBAL",5)
Global("ag_gossip_block_3","GLOBAL",5)
Global("ag_gossip_block_4","GLOBAL",5)
~  THEN EXTERN agaurora gossip_no_more

END

//Gossip Chains

CHAIN
agaurora gossip1a
@2 /* ~I can't believe how long the repairs on Waukeen's Promenade are taking! No one can decide who is supposed to be doing the rebuilding. The merchants say the Cowled Wizards should do it, the Cowled Wizards say it's the city's responsibility, and the city says the merchants should do it. No one wants the responsibility, everyone wants the money, and the ruins just sit there.~ */ DO ~
SetGlobal("ag_gossip1","GLOBAL",1)
IncrementGlobal("ag_gossip_block_1","GLOBAL",1)
~ EXTERN agaurora now

CHAIN
agaurora gossip1b
@3 /* ~I hear the young Lord Corthala has killed half a dozen Cowled Wizards and made a run for it. Well... that family always was a bit on the mad side. I heard Lady Corthala turned herself into a lich. Or was it a vampire? I know it was something similarly creepy.~ */ DO ~
SetGlobal("ag_gossip1","GLOBAL",1)
IncrementGlobal("ag_gossip_block_1","GLOBAL",1)
~ EXTERN agaurora now

CHAIN
agaurora gossip1c
@4 /* ~I hear young Lord Corthala got himself in trouble with the Cowled Wizards. They say he went wild and killed a dozen of them before he was hunted down and killed.~ */
= @5 /* ~Such a handsome young man... It seems a shame. Well, that family always was a bit on the mad side. They say Lady Corthala turned herself into a lich. Or was it a vampire? I know it was something similarly creepy.~ */ DO ~
SetGlobal("ag_gossip1","GLOBAL",1)
IncrementGlobal("ag_gossip_block_1","GLOBAL",1)
~ EXTERN agaurora now

CHAIN
agaurora gossip2
@6 /* ~Have you been to Mayona's shop lately? Those desserts of hers are almost *too* good, let me tell you!~ */
= @7 /* ~She seems a little lonely, though, don't you think? It's time someone helped her meet someone. Maybe that handsome guard who patrols there every evening. I wonder... perhaps if I "tripped" while leaving her place... Hmmm... This needs planning.~ */ DO ~
SetGlobal("ag_gossip2","GLOBAL",1)
IncrementGlobal("ag_gossip_block_1","GLOBAL",1)
~ EXTERN agaurora now

CHAIN
agaurora gossip3
@8 /* ~Oriana makes an amazing amount out of her work. Do you suppose she is blackmailing a few of her customers?~ */ DO ~
SetGlobal("ag_gossip3","GLOBAL",1)
IncrementGlobal("ag_gossip_block_1","GLOBAL",1)
~ EXTERN agaurora now

CHAIN
agaurora gossip4
@9 /* ~You know, I have been talking to Rose lately. That girl seems far too educated for her calling. I think she must be a noble. Perhaps she's from Calimport. Do you suppose she was kidnapped? Or maybe she ran away from home...~ */ DO ~
SetGlobal("ag_gossip4","GLOBAL",1)
IncrementGlobal("ag_gossip_block_1","GLOBAL",1)
~ EXTERN agaurora now

CHAIN
agaurora gossip5
@10 /* ~You heard about Belmin? Poor guy's gone clean crazy. They say his wife ran off with an elven lover and took the kids with her. Their bodies were found a week later. Belmin has not been the same since. Wastes his life, hanging around the Promenade and yelling at people. Such a shame.~ */ DO ~
SetGlobal("ag_gossip5","GLOBAL",1)
IncrementGlobal("ag_gossip_block_1","GLOBAL",1)
~ EXTERN agaurora now

CHAIN
agaurora gossip6a
@11 /* ~Something strange is going on with the Shadow Thieves. I've had three different people come by asking for "protection" money. They're usually more organized than that. I wouldn't know who to pay even if I planned to. Which I don't.~ */ DO ~
SetGlobal("ag_gossip6","GLOBAL",1)
IncrementGlobal("ag_gossip_block_2","GLOBAL",1)
~ EXTERN agaurora now

CHAIN
agaurora gossip6b
@12 /* ~Shame about Lord Cor losing his grip, isn't it? I mean, *there* was a man with good taste in shoes. I used to get some of my best stock from him. I have to deal with Lord Farrahd now, and I must say he's prompt in his deliveries, which Lord Cor never was, but he has no sense of style. No style at all.~ */ DO ~
SetGlobal("ag_gossip6","GLOBAL",1)
IncrementGlobal("ag_gossip_block_2","GLOBAL",1)
~ EXTERN agaurora now

CHAIN
agaurora gossip7
@13 /* ~It's terrible the way Black Lotus is spreading in this city, absolutely terrible.~ */
= @14 /* ~Mind, I've nothing against a bit of fun, I've tried it once or twice myself. I *might* even have sold it... on occasion.~ */
= @15 /* ~But the folk around here, they don't know when to stop. They use the stuff, and use it, and use it again. Pretty soon they're addicted and their lives are over.~ */
= @16 /* ~It's terrible.~ */ DO ~
SetGlobal("ag_gossip7","GLOBAL",1)
IncrementGlobal("ag_gossip_block_2","GLOBAL",1)
~ EXTERN agaurora now

CHAIN
agaurora gossip8
@17 /* ~Have you been to the Sea's Bounty yet? Great drinks, but I don't believe for a minute that The Thumb was ever actually a pirate. I think it's all an act he puts on for the customers. Oh, I won't say he never sailed, but piracy? I don't think he has it in him!~ */
= @18 /* ~Gracie, on the other hand... that girl is definitely up to something!~ */ DO ~
SetGlobal("ag_gossip8","GLOBAL",1)
IncrementGlobal("ag_gossip_block_2","GLOBAL",1)
~ EXTERN agaurora now

CHAIN
agaurora gossip9
@19 /* ~Have you seen the Cowled Wizards around? Take a look at their shoes, if you do.~ */
= @20 /* ~They may be good with magic, but they have *no* idea about boots. They make them themselves, I hear, and flimsier stuff I have never seen. One of these days, a young wizard will be casting a spell, and his shoes will fall apart on him, and then where will he be?~ */ DO ~
SetGlobal("ag_gossip9","GLOBAL",1)
IncrementGlobal("ag_gossip_block_2","GLOBAL",1)
~ EXTERN agaurora now

CHAIN
agaurora gossip10
@21 /* ~Have you noticed how many tourists there are wandering around these days? I wonder what brings them here. It is good for business, I suppose, but they tend to be terribly impatient. They are all going somewhere else next week and can't wait to have their shoes properly finished. Give me more settled folk any day.~ */ DO ~
SetGlobal("ag_gossip10","GLOBAL",1)
IncrementGlobal("ag_gossip_block_2","GLOBAL",1)
~ EXTERN agaurora now

CHAIN
agaurora gossip11
@22 /* ~You know, Lord and Lady Ophal are terribly snobbish. They'll hardly speak to anyone who does not have a noble pedigree, signed and stamped by the proper officials in the government. They won't even come themselves to have fittings for new shoes, which I cannot begin to understand.~ */
= @23 /* ~But, from all I hear, they're coming down in the world. They owe any number of people money, and those people are going to want to collect.~ */ DO ~
SetGlobal("ag_gossip11","GLOBAL",1)
IncrementGlobal("ag_gossip_block_3","GLOBAL",1)
~ EXTERN agaurora now

CHAIN
agaurora gossip12
@24 /* ~Have you stopped in at the Den of the Seven Vales yet? You really must go there sometime if you want a good meal. The cook there is *superb*. Patricia, the owner, is a good friend of mine.~ */
= @25 /* ~Pity she's turned against men lately - except for that horrible De Bonito, or whatever he calls himself. I cannot *think* why she keeps him around. He's a terrible bard and not a very good wizard, either. I wonder if he is a relative of some sort?~ */ DO ~
SetGlobal("ag_gossip12","GLOBAL",1)
IncrementGlobal("ag_gossip_block_3","GLOBAL",1)
~ EXTERN agaurora now

CHAIN
agaurora gossip13
@26 /* ~It's strange, an awful lot of people have been disappearing lately... Most of them have been beggars and thieves, folks you sort of expect to disappear from time to time. But some of them have been quite ordinary folk. Bene, for example. I haven't seen him around at all lately. I wonder what happened to him?~ */ DO ~
SetGlobal("ag_gossip13","GLOBAL",1)
IncrementGlobal("ag_gossip_block_3","GLOBAL",1)
~ EXTERN agaurora now

CHAIN
agaurora gossip14
@27 /* ~Doing any business in the government building? If you do, try to get there when Llarsh is not on duty. He's just there to hand out and file forms, but the way he acts, you'd think all of Athkatla depended on him. I had to fill out my tax form *three times* before he'd accept it. And that was *with* payment!~ */
= @28 /* ~He's probably got a nice little hoard stashed away somewhere. I could almost admire him, if he only had more flair.~ */ DO ~
SetGlobal("ag_gossip14","GLOBAL",1)
IncrementGlobal("ag_gossip_block_3","GLOBAL",1)
~ EXTERN agaurora now

CHAIN
agaurora gossip15
@29 /* ~Lady Beth is always talking about her stable boy. I wonder if she is getting more from him than news?~ */ DO ~
SetGlobal("ag_gossip15","GLOBAL",1)
IncrementGlobal("ag_gossip_block_3","GLOBAL",1)
~ EXTERN agaurora now

CHAIN
agaurora gossip16
@30 /* ~Have you been to Ribald's Mart lately? What do you think of Lady Yuth? You know, people say that it's only a business relationship, but I wonder... She and Ribald seem awfully close, if you know what I mean.~ */ DO ~
SetGlobal("ag_gossip16","GLOBAL",1)
IncrementGlobal("ag_gossip_block_4","GLOBAL",1)
~ EXTERN agaurora now

CHAIN
agaurora gossip17
@31 /* ~I wonder... Pip claims that he's only a secretary for Lord Balthis, and that the Lord is only acting for the Council. Don't you think that posing as a secretary would be an excellent way to hide yourself if you were *really* the one in power? That halfling is worth watching.~ */ DO ~
SetGlobal("ag_gossip17","GLOBAL",1)
IncrementGlobal("ag_gossip_block_4","GLOBAL",1)
~ EXTERN agaurora now

CHAIN
agaurora gossip18
@32 /* ~I feel sorry for Enge having to run his shop on his own. Young Biff woke up one morning and decided he wanted to act. He was an excellent clerk. I don't believe he's doing so well as an actor, though...~ */ DO ~
SetGlobal("ag_gossip18","GLOBAL",1)
IncrementGlobal("ag_gossip_block_4","GLOBAL",1)
~ EXTERN agaurora now

CHAIN
agaurora gossip19
@33 /* ~Can you tell me how it is that Calibur, of all people, ended up running an inn? I can think of few people less suited to the job.~ */
= @34 /* ~I wonder if someone died and left it to him? As a form of revenge, perhaps?~ */ DO ~
SetGlobal("ag_gossip19","GLOBAL",1)
IncrementGlobal("ag_gossip_block_4","GLOBAL",1)
~ EXTERN agaurora now

CHAIN
agaurora gossip20a
@35 /* ~Have you heard about the terrible murders? People skinned alive, they say! I can take care of myself, but it gives me the chills!~ */
= @36 /* ~There is one good thing about it, though. That handsome young lieutenant they've sent to investigate, Aegisfield. He's always willing to walk a lady home after dark. I'll almost be sorry when the murders are solved and he is reassigned.~ */ DO ~
SetGlobal("ag_gossip20","GLOBAL",1)
IncrementGlobal("ag_gossip_block_4","GLOBAL",1)
~ EXTERN agaurora now

CHAIN
agaurora gossip20b
@37 /* ~I hear we have you to thank for putting an end to those horrible murders. Is it true the murderer was skinning his victims alive? It's just too bad that poor Lieutenant Aegisfield was killed. He was such a handsome young man, always had the time to stay and talk for a while.~ */ DO ~
SetGlobal("ag_gossip20","GLOBAL",1)
IncrementGlobal("ag_gossip_block_4","GLOBAL",1)
~ EXTERN agaurora now

CHAIN
agaurora gossip20c
@38 /* ~Lieutenant Aegisfield tells me that we have you to thank for putting an end to those horrible murders. I can't believe it was Rejiek. You know, I have been doing business with him for years! And all this time... It makes me shiver to think of it!~ */ DO ~
SetGlobal("ag_gossip20","GLOBAL",1)
IncrementGlobal("ag_gossip_block_4","GLOBAL",1)
~ EXTERN agaurora now

CHAIN
agaurora gossip_no_more
@0 /* ~Let me think...~ */
= @39 /* ~Sorry, I fear I've already told you everything interesting I know.~ */ EXTERN agaurora now

//Initial Greeting: Male

CHAIN
IF ~
Global("ag_greeting","GLOBAL",0)
Gender(LastTalkedToBy(),MALE)
CheckStatGT(LastTalkedToBy(),9,CHR)
~ THEN agaurora male
@40 /* ~Hello, handsome. What's someone like you doing in boots like those?~ */ DO ~SetGlobalTimer("ag_lissa_timer","GLOBAL",TWO_DAYS)~
END
++ @41 /* ~Hello.~ */ EXTERN agaurora aurora2
++ @42 /* ~What?~ */ EXTERN agaurora aurora2
++ @43 /* ~Wishing I had new ones. May I see your stock?~ */ EXTERN agaurora aurora3
++ @44 /* ~Walking. Past you.~ */ DO ~
SetGlobal("ag_greeting","GLOBAL",2)~ EXIT

CHAIN
agaurora aurora2
@45 /* ~You're new around here, aren't you?~ */
END
++ @46 /* ~Yes.~ */ EXTERN agaurora aurora3
++ @47 /* ~Is it that obvious?~ */ EXTERN agaurora aurora4
++ @48 /* ~No.~ */ EXTERN agaurora aurora5
++ @49 /* ~Can we skip the discussion and get to the shopping?~ */ EXTERN agaurora aurora6

CHAIN
agaurora aurora3
@50 /* ~I thought so. I couldn't possibly have missed seeing someone as good-looking as you going by my shop. I must say, you make a lovely change.~ */
END
++ @51 /* ~And it is a pleasure to meet such an attractive lady as yourself.~ */ EXTERN agaurora aurora7
++ @52 /* ~Um... thanks, I guess.~ */ EXTERN agaurora aurora8
++ @53 /* ~I prefer a more business-like conversation with shopkeepers.~ */ EXTERN agaurora aurora9
++ @49 /* ~Can we skip the discussion and get to the shopping?~ */ EXTERN agaurora aurora6

CHAIN
agaurora aurora4
@54 /* ~I know most of the people who come through here, and I haven't seen you before.~ */
END
++ @55 /* ~So you pay attention to everyone who goes by?~ */ EXTERN agaurora aurora10
++ @56 /* ~Oh, so that is what it is. I was afraid I was standing out too much.~ */ EXTERN agaurora aurora11
++ @49 /* ~Can we skip the discussion and get to the shopping?~ */ EXTERN agaurora aurora6

CHAIN
agaurora aurora5
@57 /* ~Really? I know most folk around here, and I'm sure I haven't seen you around.~ */
END
++ @55 /* ~So you pay attention to everyone who goes by?~ */ EXTERN agaurora aurora10
++ @58 /* ~Well, you must have missed seeing me.~ */ EXTERN agaurora aurora12
++ @59 /* ~It's true, I am new. I've just gotten tired of talking about it.~ */ EXTERN agaurora aurora13

CHAIN
agaurora aurora6
@60 /* ~If that is the way you want it.~ */
DO ~
SetGlobal("ag_greeting","GLOBAL",2)
StartStore("agaurora",LastTalkedToBy())
~ EXIT

CHAIN
agaurora aurora7
@61 /* ~Why thank you!~ */
DO ~
SetGlobal("ag_greeting","GLOBAL",1)~
EXTERN agaurora looking_for

CHAIN
agaurora aurora8
@62 /* ~And modest, too. How charming!~ */
DO ~
SetGlobal("ag_greeting","GLOBAL",1)~
EXTERN agaurora looking_for

CHAIN
agaurora aurora9
@63 /* ~So formal! Well, whatever you want!~ */
DO ~
SetGlobal("ag_greeting","GLOBAL",2)~
EXTERN agaurora looking_for

CHAIN
agaurora aurora10
@64 /* ~Of course! There's no point being in business if you don't keep an eye on what's going on.~ */
DO ~
SetGlobal("ag_greeting","GLOBAL",2)~
EXTERN agaurora looking_for

CHAIN
agaurora aurora11
@65 /* ~This is a merchant town. Folk come here from all over. You'd have to be *really* strange to stand out here!~ */
DO ~
SetGlobal("ag_greeting","GLOBAL",2)~
EXTERN agaurora looking_for

CHAIN
agaurora aurora12
@66 /* ~If you like.~ */
DO ~
SetGlobal("ag_greeting","GLOBAL",2)~
EXTERN agaurora looking_for

CHAIN
agaurora aurora13
@67 /* ~Whatever for?~ */
DO ~
SetGlobal("ag_greeting","GLOBAL",2)~
EXTERN agaurora looking_for

CHAIN
agaurora looking_for
@68 /* ~So, what brings you to Athkatla?~ */
END
+ ~GlobalLT("Chapter","GLOBAL",4)~ + @69 /* ~I'm looking for an old friend, Imoen, who was arrested by the Cowled Wizards. Do you know where they might have taken her?~ */ EXTERN agaurora aurora14
+ ~GlobalLT("Chapter","GLOBAL",4)~ + @70 /* ~I am looking for a wizard, Irenicus, who was captured by the Cowled Wizards. Do you know where they might have taken him?~ */ EXTERN agaurora aurora15
++ @71 /* ~I'm hoping to buy some supplies. What are you selling?~ */ EXTERN agaurora aurora16
++ @72 /* ~That is none of your business. Now, let me see what you are selling.~ */ EXTERN agaurora aurora17

CHAIN
agaurora aurora14
@73 /* ~How'd your friend manage to cross the Cowleds? Good luck finding her, in any case. No one really knows what the Wizards do to the folk they arrest. In fact, they're often never seen again.~ */
EXTERN agaurora now

CHAIN
agaurora aurora15
@74 /* ~A wizard? If you want a wizard, why not hire one of the Cowleds? But if you really insist on finding *that* wizard, I can't help you. No one really knows where the Cowleds take people.~ */
EXTERN agaurora now

CHAIN
agaurora aurora16
@75 /* ~I've the best shoes and boots in all of Amn! I've something for everyone. Take a look!~ */
DO ~
StartStore("agaurora",LastTalkedToBy())
~ EXIT

CHAIN
agaurora aurora17
@76 /* ~I was just being polite! Unlike you. Here.~ */
DO ~
SetGlobal("ag_greeting","GLOBAL",2)
StartStore("agaurora",LastTalkedToBy())
~ EXIT

//Initial Greeting: Female

CHAIN
IF ~
Global("ag_greeting","GLOBAL",0)
Gender(LastTalkedToBy(),FEMALE)
~ THEN agaurora female
@77 /* ~Hi! New around here, aren't you?~ */ DO ~
SetGlobal("ag_greeting","GLOBAL",2) SetGlobalTimer("ag_lissa_timer","GLOBAL",TWO_DAYS)
~ END
++ @46 /* ~Yes.~ */ EXTERN agaurora auroraf3
++ @47 /* ~Is it that obvious?~ */ EXTERN agaurora auroraf4
++ @48 /* ~No.~ */ EXTERN agaurora auroraf5
++ @49 /* ~Can we skip the discussion and get to the shopping?~ */ EXTERN agaurora auroraf6

//Initial Greeting: Lowly Male

CHAIN
IF ~
Global("ag_greeting","GLOBAL",0)
Gender(LastTalkedToBy(),MALE)
CheckStatLT(LastTalkedToBy(),10,CHR)
~ THEN agaurora lowly_male
@77 /* ~Hi! New around here, aren't you?~ */ DO ~
SetGlobal("ag_greeting","GLOBAL",2) SetGlobalTimer("ag_lissa_timer","GLOBAL",TWO_DAYS)
~ END
++ @46 /* ~Yes.~ */ EXTERN agaurora auroraf3
++ @47 /* ~Is it that obvious?~ */ EXTERN agaurora auroraf4
++ @48 /* ~No.~ */ EXTERN agaurora auroraf5
++ @49 /* ~Can we skip the discussion and get to the shopping?~ */ EXTERN agaurora auroraf6

CHAIN
agaurora auroraf3
@78 /* ~I thought so. I know most of the people who come through here, and I haven't seen you before.~ */
END
++ @55 /* ~So you pay attention to everyone who goes by?~ */ EXTERN agaurora auroraf10
++ @56 /* ~Oh, so that is what it is. I was afraid I was standing out too much.~ */ EXTERN agaurora auroraf11
++ @49 /* ~Can we skip the discussion and get to the shopping?~ */ EXTERN agaurora auroraf6

CHAIN
agaurora auroraf4
@54 /* ~I know most of the people who come through here, and I haven't seen you before.~ */
END
++ @55 /* ~So you pay attention to everyone who goes by?~ */ EXTERN agaurora auroraf10
++ @56 /* ~Oh, so that is what it is. I was afraid I was standing out too much.~ */ EXTERN agaurora auroraf11
++ @49 /* ~Can we skip the discussion and get to the shopping?~ */ EXTERN agaurora auroraf6

CHAIN
agaurora auroraf5
@57 /* ~Really? I know most folk around here, and I'm sure I haven't seen you around.~ */
END
++ @55 /* ~So you pay attention to everyone who goes by?~ */ EXTERN agaurora auroraf10
++ @58 /* ~Well, you must have missed seeing me.~ */ EXTERN agaurora auroraf12
++ @59 /* ~It's true, I am new. I've just gotten tired of talking about it.~ */ EXTERN agaurora auroraf13

CHAIN
agaurora auroraf6
@60 /* ~If that is the way you want it.~ */ DO ~
StartStore("agaurora",LastTalkedToBy())
~ EXIT

CHAIN
agaurora auroraf10
@64 /* ~Of course! There's no point being in business if you don't keep an eye on what's going on.~ */
EXTERN agaurora looking_for2

CHAIN
agaurora auroraf11
@65 /* ~This is a merchant town. Folk come here from all over. You'd have to be *really* strange to stand out here!~ */
EXTERN agaurora looking_for2

CHAIN
agaurora auroraf12
@66 /* ~If you like.~ */
EXTERN agaurora looking_for2

CHAIN
agaurora auroraf13
@67 /* ~Whatever for?~ */
EXTERN agaurora looking_for2

CHAIN
agaurora looking_for2
@68 /* ~So, what brings you to Athkatla?~ */
END
+ ~GlobalLT("Chapter","GLOBAL",4)~ + @69 /* ~I'm looking for an old friend, Imoen, who was arrested by the Cowled Wizards. Do you know where they might have taken her?~ */ EXTERN agaurora auroraf14
+ ~GlobalLT("Chapter","GLOBAL",4)~ + @70 /* ~I am looking for a wizard, Irenicus, who was captured by the Cowled Wizards. Do you know where they might have taken him?~ */ EXTERN agaurora auroraf15
++ @71 /* ~I'm hoping to buy some supplies. What are you selling?~ */ EXTERN agaurora auroraf16
++ @72 /* ~That is none of your business. Now, let me see what you are selling.~ */ EXTERN agaurora auroraf17

CHAIN
agaurora auroraf14
@80 /* ~How'd your friend manage to cross the Cowleds? Good luck finding her, in any case. No one really knows what the Wizards do to the folk they arrest.~ */
EXTERN agaurora now

CHAIN
agaurora auroraf15
@74 /* ~A wizard? If you want a wizard, why not hire one of the Cowleds? But if you really insist on finding *that* wizard, I can't help you. No one really knows where the Cowleds take people.~ */
EXTERN agaurora now

CHAIN
agaurora auroraf16
@75 /* ~I've the best shoes and boots in all of Amn! I've something for everyone. Take a look!~ */
DO ~
StartStore("agaurora",LastTalkedToBy())
~ EXIT

CHAIN
agaurora auroraf17
@76 /* ~I was just being polite! Unlike you. Here.~ */
DO ~
StartStore("agaurora",LastTalkedToBy())
~ EXIT

//Greeting: Handsome

CHAIN
IF ~
Global("ag_greeting","GLOBAL",1)
Gender(LastTalkedToBy(),MALE)
CheckStatGT(LastTalkedToBy(),9,CHR)
~ THEN agaurora handsome
@81 /* ~Hello again, handsome!~ */
EXTERN agaurora now

//Greeting: Not So Handsome

CHAIN
IF ~
GlobalGT("ag_greeting","GLOBAL",0)
GlobalLT("ag_greeting","GLOBAL",3)
~ THEN agaurora not_so_handsome
@82 /* ~Welcome back!~ */
EXTERN agaurora now

//Greeting: Silent

CHAIN
IF ~
Global("ag_greeting","GLOBAL",3)
~ THEN agaurora silent
@83 /* ~Shoes and boots! The finest in all of Amn!~ */
END
++ @84 /* ~Let me see what you have.~ */ DO ~
StartStore("agaurora",LastTalkedToBy())
~ EXIT
++ @85 /* ~I won't be buying anything today.~ */ EXIT
++ @691 /* ~I'm sorry I was rude earlier. Do you have any gossip?~ */ DO ~
SetGlobal("ag_greeting","GLOBAL",2)
~ EXTERN agaurora gossip

//Items: Cloak

CHAIN
IF WEIGHT #-1 ~
Global("ag_cloak","GLOBAL",0)
OR(2)
  Global("ag_greeting","GLOBAL",1)
  Global("ag_greeting","GLOBAL",2)
PartyHasItem("agclck01")
~ THEN agaurora aurora_cloak_1
@86 /* ~Is that... yes, it is, my old cloak!~ */
= @87 /* ~I'm surprised to see it again after so long. It does bring back memories. It saw me do a lot of growing up, that cloak. I went from a young would-be fighter lucky to live through her first encounters with real danger to someone really worth hiring.~ */
= @88 /* ~Though I wasn't *quite* experienced enough to keep from losing the cloak.~ */ DO ~
SetGlobal("ag_cloak","GLOBAL",1)
~ END
++ @89 /* ~What happened?~ */ EXTERN agaurora aurora_cloak_2
++ @90 /* ~How did you lose it?~ */ EXTERN agaurora aurora_cloak_2
++ @91 /* ~I really only want to buy shoes.~ */ EXTERN agaurora aurora_cloak_8

CHAIN
agaurora aurora_cloak_2
@92 /* ~I knew enough by then to know a bad storm when I saw it brewing, but not enough to convince anyone else. Certainly not enough to convince the caravan leader. He was in a hurry to get back to the city and to his family.~ */
= @93 /* ~Sure enough, the rain started up in the mountains and the river flooded. Fool man tried to cross it anyway, "before it got too bad." I tried to tell him it already *was* too bad and that we needed to get up the hill, quickly, but he didn't listen. I was only a guard, after all.~ */
END
++ @94 /* ~That must have been frustrating!~ */ EXTERN agaurora aurora_cloak_3
++ @95 /* ~I suppose he had several more years of experience than you had.~ */ EXTERN agaurora aurora_cloak_4
++ @96 /* ~I think I can guess the rest of the story. May I see what you have?~ */ EXTERN agaurora aurora_cloak_8

CHAIN
agaurora aurora_cloak_3
@97 /* ~Very. If I had had any sense, I'd have left then, or hung back and kept myself out of things. But, I was feeling terribly important and honorable that day, so I got myself stuck in the middle of things.~ */
EXTERN agaurora aurora_cloak_5

CHAIN
agaurora aurora_cloak_4
@98 /* ~His "experience" cost a lot of people their lives. It almost cost me mine.~ */
EXTERN agaurora aurora_cloak_5

CHAIN
agaurora aurora_cloak_5
@99 /* ~About half the caravan was across when the real flood hit. I found myself in the middle of the river, hanging onto a wagon for dear life and trying to convince the oxen to keep pulling straight.~ */
= @100 /* ~Lucky for me, they did so. I lost my cloak in the flood, but not my life. The folks behind me were not so lucky, nor the ones behind them. I'd like to say the idiot who got us into the mess paid for it, but of course he was one of the ones in front. Still, I don't suppose anyone hired him to lead caravans after that.~ */
END
++ @101 /* ~You "don't suppose"? Don't you know?~ */ EXTERN agaurora aurora_cloak_6
++ @102 /* ~I should think not.~ */ EXTERN agaurora aurora_cloak_7
++ @103 /* ~It was lucky you lived. May I see what you have in the store today?~ */ EXTERN agaurora aurora_cloak_8

CHAIN
agaurora aurora_cloak_6
@104 /* ~No. I had better things to do than to follow the career of a single caravan leader. I signed on as an escort to a noble traveling to Calimport the next day. Thought it would be fun to see another land. And, after that... well, there were more interesting things to do. It's good to see the old cloak again. Will you sell it to me?~ */
END
++ @105 /* ~I hate to charge you for an old cloak. Take it as a gift from me.~ */ EXTERN agaurora aurora_cloak_9
++ @106 /* ~I'll sell it to you for 100 gold.~ */ EXTERN agaurora aurora_cloak_10
++ @107 /* ~I'll sell it to you for 200 gold.~ */ EXTERN agaurora aurora_cloak_11
++ @108 /* ~For 500 gold, it's yours.~ */ EXTERN agaurora aurora_cloak_12

CHAIN
agaurora aurora_cloak_7
@109 /* ~Not that I know for sure. I had better things to do than following the career of a single caravan leader. I signed on as an escort to a noble traveling to Calimport the next day. Thought it would be fun to see another land. And, after that... well, there were still other adventures to be had. It's good to see the old cloak again. Will you sell it to me?~ */
END
++ @105 /* ~I hate to charge you for an old cloak. Take it as a gift from me.~ */ EXTERN agaurora aurora_cloak_9
++ @106 /* ~I'll sell it to you for 100 gold.~ */ EXTERN agaurora aurora_cloak_10
++ @107 /* ~I'll sell it to you for 200 gold.~ */ EXTERN agaurora aurora_cloak_11
++ @108 /* ~For 500 gold, it's yours.~ */ EXTERN agaurora aurora_cloak_12

CHAIN
agaurora aurora_cloak_8
@110 /* ~Oh, of course. But first, may I buy the cloak from you? It does bring back a lot of memories.~ */
END
++ @105 /* ~I hate to charge you for an old cloak. Take it as a gift from me.~ */ EXTERN agaurora aurora_cloak_9
++ @106 /* ~I'll sell it to you for 100 gold.~ */ EXTERN agaurora aurora_cloak_10
++ @107 /* ~I'll sell it to you for 200 gold.~ */ EXTERN agaurora aurora_cloak_11
++ @108 /* ~For 500 gold, it's yours.~ */ EXTERN agaurora aurora_cloak_12

CHAIN
agaurora aurora_cloak_9
@111 /* ~Thank you.~ */ DO ~
IncrementGlobal("ag_items","GLOBAL",1)
TakePartyItem("agclck01")
FillSlot(SLOT_CLOAK)
~ EXTERN agaurora aurora_bring_more

CHAIN
agaurora aurora_cloak_10
@112 /* ~Fair enough. Here you are.~ */ DO ~
IncrementGlobal("ag_items","GLOBAL",1)
TakePartyItem("agclck01")
FillSlot(SLOT_CLOAK)
GiveGoldForce(100)
~  EXTERN agaurora aurora_bring_more

CHAIN
agaurora aurora_cloak_11
@113 /* ~That's a lot to pay for sentiment, but... all right.~ */ DO ~
IncrementGlobal("ag_items","GLOBAL",1)
TakePartyItem("agclck01")
FillSlot(SLOT_CLOAK)
GiveGoldForce(200)
~ EXTERN agaurora aurora_bring_more

CHAIN
agaurora aurora_cloak_12
@114 /* ~The memories are good, but not *that* good. I won't be paying that.~ */
END
++ @115 /* ~How about 100 gold then?~ */ EXTERN agaurora aurora_cloak_10
++ @116 /* ~Then 200 gold.~ */ EXTERN agaurora aurora_cloak_11
++ @117 /* ~Then I guess we won't be selling it to you after all.~ */ EXTERN agaurora aurora_have_it

//Items: Ring

CHAIN
IF WEIGHT #-1 ~
Global("ag_ring","GLOBAL",0)
OR(2)
  Global("ag_greeting","GLOBAL",1)
  Global("ag_greeting","GLOBAL",2)
PartyHasItem("t-ring03")
~ THEN agaurora aurora_ring_1
@118 /* ~I recognize that ring! I never thought I'd see it again...~ */ DO ~
SetGlobal("ag_ring","GLOBAL",1)
~ END
++ @119 /* ~How did you come to lose it?~ */ EXTERN agaurora aurora_ring_2
++ @120 /* ~Do you?~ */ EXTERN agaurora aurora_ring_2
++ @121 /* ~All I really want is some supplies.~ */ EXTERN agaurora aurora_ring_20

CHAIN
agaurora aurora_ring_2
@122 /* ~I didn't part with it willingly, I can tell you.~ */
= @123 /* ~The group I was with had been having a run of bad luck. Merchants hired us and then went bankrupt... Various treasures weren't where they were supposed to be... Our cleric left us for a better-paying position...~ */
= @124 /* ~Then bandits attacked the caravan we were supposed to be guarding. Turns out the group who was supposed to be guarding them *with* us had decided that the bandits made a better offer. I can't say I blame them much for that: the merchant *was* a skinflint. I do think they should have warned us, at least, and given us time to get away.~ */
END
++ @125 /* ~Wait... Bandits attacked you, and you were more concerned with saving your skins than doing your job?~ */ EXTERN agaurora aurora_ring_3
++ @126 /* ~And then what happened?~ */ EXTERN agaurora aurora_ring_4
++ @127 /* ~I suppose they were afraid you'd warn the caravan.~ */ EXTERN agaurora aurora_ring_5

CHAIN
agaurora aurora_ring_3
@128 /* ~With half the "guards" on the bandits' side, we didn't have a chance.~ */
EXTERN agaurora aurora_ring_4

CHAIN
agaurora aurora_ring_4
@129 /* ~We ended up fighting for our lives and then running into the hills with next to no supplies.~ */
EXTERN agaurora aurora_ring_7

CHAIN
agaurora aurora_ring_5
@130 /* ~Small chance of that! The man in charge was one of the most unpleasant people it has been my misfortune to meet. Three days in, and we'd have liked to murder him ourselves. It's more likely they were afraid we'd want a share of the loot.~ */
= @131 /* ~At any rate, they did not warn us.~ */
EXTERN agaurora aurora_ring_4

CHAIN
agaurora aurora_ring_7
@132 /* ~And, of course, several of us were wounded. We were lucky enough to make it to a small village within the next few days. Though I think we could have been luckier and *not* ended up in a village full of the bandits' kin.~ */
END
++ @133 /* ~Why do you think this was the bandits' village?~ */ EXTERN agaurora aurora_ring_8
++ @134 /* ~Did you say anything?~ */ EXTERN agaurora aurora_ring_9
++ @135 /* ~I find it best not to question luck.~ */ EXTERN agaurora aurora_ring_10

CHAIN
agaurora aurora_ring_8
@136 /* ~Had to be, so close to their lair. Besides, I recognized some of the goods in the shops.~ */
EXTERN agaurora aurora_ring_11

CHAIN
agaurora aurora_ring_9
@137 /* ~Of course not. I have *some* sense.~ */
EXTERN agaurora aurora_ring_11

CHAIN
agaurora aurora_ring_10
@138 /* ~Oh, we all thanked Tymora, right enough. It could have been better, but it could have been worse.~ */
EXTERN agaurora aurora_ring_11

CHAIN
agaurora aurora_ring_11
@139 /* ~It was a difficult time. They charged us for everything. It cost us all the jewelry we were wearing, some of our armor, even a few weapons to get everyone healed. And, of course, nothing was valued at anything like its true worth. I tried to keep the ring, even sold my dancing shoes before I offered this. But, in the end, it was sell the ring or go down the mountain with no supplies.~ */
END
++ @140 /* ~So, what about the inscription?~ */ EXTERN agaurora aurora_ring_12
++ @141 /* ~At least you made it out alive.~ */ EXTERN agaurora aurora_ring_13
++ @142 /* ~An interesting story. May we see your wares now?~ */ EXTERN agaurora aurora_ring_20

CHAIN
agaurora aurora_ring_12
@143 /* ~What about it?~ */
END
++ @144 /* ~"To the sunshine of my life." Who wrote it?~ */ EXTERN agaurora aurora_ring_14
++ @145 /* ~Where does it fit in?~ */ EXTERN agaurora aurora_ring_14
++ @146 /* ~Who had it made for you?~ */ EXTERN agaurora aurora_ring_14

CHAIN
agaurora aurora_ring_13
@147 /* ~At least we did, and glad enough we were, at that.~ */
END
++ @140 /* ~So, what about the inscription?~ */ EXTERN agaurora aurora_ring_12
++ @141 /* ~At least you made it out alive.~ */ EXTERN agaurora aurora_ring_13
++ @142 /* ~An interesting story. May we see your wares now?~ */ EXTERN agaurora aurora_ring_20

CHAIN
agaurora aurora_ring_14
@148 /* ~That is one story I won't be telling you. Some memories are too precious to share, even with friends.~ */
EXTERN agaurora aurora_ring_15

CHAIN
agaurora aurora_ring_15
@149 /* ~There are a lot of memories attached to this ring. I'd like to buy it back from you.~ */
END
++ @150 /* ~I hate to charge you for something that means so much to you. Here, take it as a gift.~ */ EXTERN agaurora aurora_ring_16
++ @151 /* ~It's yours for 500 gold~ */ EXTERN agaurora aurora_ring_17
++ @152 /* ~For 800 gold, it's yours.~ */ EXTERN agaurora aurora_ring_18
++ @153 /* ~For 1500, you can have it.~ */ EXTERN agaurora aurora_ring_19

CHAIN
agaurora aurora_ring_16
@111 /* ~Thank you.~ */ DO ~
IncrementGlobal("ag_items","GLOBAL",1)
TakePartyItem("t-ring03")
FillSlot(SLOT_RING_RIGHT)
~ EXTERN agaurora aurora_bring_more

CHAIN
agaurora aurora_ring_17
@112 /* ~Fair enough. Here you are.~ */ DO ~
IncrementGlobal("ag_items","GLOBAL",1)
TakePartyItem("t-ring03")
GiveGoldForce(500)
FillSlot(SLOT_RING_RIGHT)
~ EXTERN agaurora aurora_bring_more

CHAIN
agaurora aurora_ring_18
@113 /* ~That's a lot to pay for sentiment, but... all right.~ */ DO ~
IncrementGlobal("ag_items","GLOBAL",1)
TakePartyItem("t-ring03")
GiveGoldForce(800)
FillSlot(SLOT_RING_RIGHT)
~ EXTERN agaurora aurora_bring_more

CHAIN
agaurora aurora_ring_19
@154 /* ~I like the ring, but not *that* much. I won't be paying that.~ */
END
++ @155 /* ~How about 500 gold then?~ */ EXTERN agaurora aurora_ring_17
++ @156 /* ~Then 800 gold.~ */ EXTERN agaurora aurora_ring_18
++ @117 /* ~Then I guess we won't be selling it to you after all.~ */ EXTERN agaurora aurora_have_it

CHAIN
agaurora aurora_ring_20
@157 /* ~You'll get your supplies, don't worry. But there is something I would like to ask you, first.~ */
EXTERN agaurora aurora_ring_15

//Items: Earring

CHAIN
IF WEIGHT #-1 ~
Global("ag_earring","GLOBAL",0)
OR(2)
  Global("ag_greeting","GLOBAL",1)
  Global("ag_greeting","GLOBAL",2)
PartyHasItem("agearr01")
~ THEN agaurora aurora_earring_1
@158 /* ~I recognize that earring! I still have its mate.~ */ DO ~
SetGlobal("ag_earring","GLOBAL",1)
~ END
++ @159 /* ~How did you come to lose this one?~ */ EXTERN agaurora aurora_earring_2
++ @160 /* ~So, will you buy it from us?~ */ EXTERN agaurora aurora_earring_8
++ @161 /* ~All I want is supplies.~ */ EXTERN agaurora aurora_earring_7

CHAIN
agaurora aurora_earring_2
@162 /* ~I lost it in a dungeon, a long time ago.~ */
= @163 /* ~We had been hired to retrieve a lost family treasure - or at least, our employer said it was a family treasure, and we were not about to argue.~ */
= @164 /* ~It was a typical dungeon in all but one way. It was dank, dark and completely empty of the usual spiders, ghosts and goblins. At first, we were glad. It made our job considerably easier. So, we found the treasure, right where it was supposed to be, and started back.~ */
END
++ @165 /* ~And then?~ */ EXTERN agaurora aurora_earring_3
++ @166 /* ~Let me guess, the dungeon's missing inhabitants showed up?~ */ EXTERN agaurora aurora_earring_4

CHAIN
agaurora aurora_earring_3
@167 /* ~And then the dungeon's "missing inhabitants" showed up... a small army of bone golems.~ */
EXTERN agaurora aurora_earring_5

CHAIN
agaurora aurora_earring_4
@168 /* ~Right you are... a small army of bone golems.~ */
EXTERN agaurora aurora_earring_5

CHAIN
agaurora aurora_earring_5
@169 /* ~It was a hard fight and we barely made it out.~ */
= @170 /* ~Roc was badly wounded. We didn't have a cleric with us, and there was nothing we could do.~ */
= @171 /* ~He died the next day. We buried him in what was left of his armor and his second-best boots.~ */
END
++ @172 /* ~Why his "second best" boots?~ */ EXTERN agaurora aurora_earring_6
++ @173 /* ~Wasn't that a bit cold-hearted of you?~ */ EXTERN agaurora aurora_earring_6
++ @142 /* ~An interesting story. May we see your wares now?~ */ EXTERN agaurora aurora_earring_7

CHAIN
agaurora aurora_earring_6
@174 /* ~His best pair were too good to bury. They were the first really good pair he'd ever owned. He was so proud of them. He'd grown up poor and couldn't afford any good shoes until months after we started our travels.~ */
= @175 /* ~We had some thoughts about taking them to his family, but then we realized we didn't know where they were. We weren't even sure Roc was his real name. In the end, we sold them and used the money for supplies.~ */
EXTERN agaurora aurora_earring_8

CHAIN
agaurora aurora_earring_7
@176 /* ~Getting impatient? Before you look, I'd like to ask you something.~ */

EXTERN agaurora aurora_earring_8

CHAIN
agaurora aurora_earring_8
@177 /* ~There are a lot of memories attached to this earring. I'd like to buy it back from you.~ */
END
++ @178 /* ~I hate to charge you for a single earring. Here, take it as a gift.~ */ EXTERN agaurora aurora_earring_9
++ @179 /* ~It's yours for 100 gold~ */ EXTERN agaurora aurora_earring_10
++ @180 /* ~For 200 gold, it's yours.~ */ EXTERN agaurora aurora_earring_11
++ @181 /* ~For 500, you can have it.~ */ EXTERN agaurora aurora_earring_12

CHAIN
agaurora aurora_earring_9
@111 /* ~Thank you.~ */ DO ~
IncrementGlobal("ag_items","GLOBAL",1)
TakePartyItem("agearr01")
FillSlot(SLOT_HELMET)
~ EXTERN agaurora aurora_bring_more

CHAIN
agaurora aurora_earring_10
@112 /* ~Fair enough. Here you are.~ */ DO ~
IncrementGlobal("ag_items","GLOBAL",1)
TakePartyItem("agearr01")
FillSlot(SLOT_HELMET)
GiveGoldForce(100)
~ EXTERN agaurora aurora_bring_more

CHAIN
agaurora aurora_earring_11
@113 /* ~That's a lot to pay for sentiment, but... all right.~ */ DO ~
IncrementGlobal("ag_items","GLOBAL",1)
TakePartyItem("agearr01")
FillSlot(SLOT_HELMET)
GiveGoldForce(200)
~ EXTERN agaurora aurora_bring_more

CHAIN
agaurora aurora_earring_12
@114 /* ~The memories are good, but not *that* good. I won't be paying that.~ */
END
++ @115 /* ~How about 100 gold then?~ */ EXTERN agaurora aurora_earring_10
++ @116 /* ~Then 200 gold.~ */ EXTERN agaurora aurora_earring_11
++ @117 /* ~Then I guess we won't be selling it to you after all.~ */ EXTERN agaurora aurora_have_it

//Items: Shoes

CHAIN
IF WEIGHT #-1 ~
Global("ag_shoes","GLOBAL",0)
OR(2)
  Global("ag_greeting","GLOBAL",1)
  Global("ag_greeting","GLOBAL",2)
PartyHasItem("agboot24")
~ THEN agaurora aurora_shoes_1
@182 /* ~May I see those? I don't believe it! That's my first pair of adventuring shoes.~ */ DO ~
SetGlobal("ag_shoes","GLOBAL",1)
~ END
++ @183 /* ~Really?~ */ EXTERN agaurora aurora_shoes_2
++ @184 /* ~Oh?~ */ EXTERN agaurora aurora_shoes_2
++ @185 /* ~I thought they looked like something you'd wear.~ */ EXTERN agaurora aurora_shoes_2
++ @186 /* ~I couldn't care less.~ */ EXTERN agaurora aurora_shoes_3

CHAIN
agaurora aurora_shoes_2
@187 /* ~Oh, I loved those shoes! I hated parting with them... It was for a good cause, though. Would you believe I killed a dragon with them?~ */
END
++ @188 /* ~How did that happen?~ */ EXTERN agaurora aurora_shoes_4
++ @189 /* ~Are you serious?~ */ EXTERN agaurora aurora_shoes_4
++ @190 /* ~I don't believe you.~ */ EXTERN agaurora aurora_shoes_5
++ @191 /* ~I want shoes, not a story.~ */ EXTERN agaurora aurora_shoes_3

CHAIN
agaurora aurora_shoes_3
@192 /* ~*Someone* is in a bad mood today. Here, buy what you want and get out of here.~ */
EXTERN agaurora aurora_shoes_85

CHAIN
agaurora aurora_shoes_35
@193 /* ~Oh, very well. Here.~ */
EXTERN agaurora aurora_shoes_85

CHAIN
agaurora aurora_shoes_4
@194 /* ~Of course, it wasn't a very *big* dragon.~ */
= @195 /* ~Scared us enough at the time, though.~ */
= @196 /* ~There we were, a bunch of kids, barely old enough to be on the road. Why anyone ever hired us, I don't know. Anyway, it was a hot day and we decided to stop and wade in a stream that crossed the road.~ */
END
++ @197 /* ~Where does the dragon come in?~ */ EXTERN agaurora aurora_shoes_6
++ @198 /* ~Don't stop there. Tell us the story!~ */ EXTERN agaurora aurora_shoes_6
++ @199 /* ~I'm sure it was very exciting, but really, all we want is some supplies.~ */ EXTERN agaurora aurora_shoes_35

CHAIN
agaurora aurora_shoes_5
@200 /* ~Neither did Tessa, our wizard, but that is what happened!~ */
END
++ @201 /* ~How did it happen?~ */ EXTERN agaurora aurora_shoes_4
++ @202 /* ~Go on, then.~ */ EXTERN agaurora aurora_shoes_4
++ @199 /* ~I'm sure it was very exciting, but really, all we want is some supplies.~ */ EXTERN agaurora aurora_shoes_35

CHAIN
agaurora aurora_shoes_6
@203 /* ~None of us thought to set guard. Come to think of it, that may have saved our lives since the dragon landed instead of burning us.~ */
= @204 /* ~It landed on the bank opposite us and leaned down. I suppose maybe it just wanted a drink.~ */
= @205 /* ~We didn't make a very good showing, I'm afraid... We pretty much panicked. Tessa started shouting spells, Roc dove for his sword.~ */
END
++ @206 /* ~And you?~ */ EXTERN agaurora aurora_shoes_7
++ @165 /* ~And then?~ */ EXTERN agaurora aurora_shoes_7
++ @207 /* ~This story is taking too long, please just show us your what you have in stock.~ */ EXTERN agaurora aurora_shoes_3

CHAIN
agaurora aurora_shoes_7
@208 /* ~And I threw my shoes.~ */
= @209 /* ~They hit the dragon in one eye, startled it. It opened its mouth, to roar, I suppose, and Tessa's next spell went right down its throat and knocked it down. Gave Roc time to reach his sword and cut its head off. Of course he said *he* had killed it, and Tessa said *she* killed it, but neither one of them would have gotten anything done if it hadn't been for my shoes. It was a long time before I could afford another pair as nice. We never did find the dragon's treasure.~ */
END
++ @210 /* ~I will remember that the next time I face a dragon.~ */ EXTERN agaurora aurora_shoes_8
++ @211 /* ~An interesting story. Thank you for telling us.~ */ EXTERN agaurora aurora_shoes_8
++ @212 /* ~An unlikely story.~ */ EXTERN agaurora aurora_shoes_9
++ @213 /* ~Speaking of shoes, we could use some. May we see what you have?~ */ EXTERN agaurora aurora_shoes_8

CHAIN
agaurora aurora_shoes_8
@214 /* ~Seeing those shoes brings back so many memories. I'd be glad to buy them back from you.~ */
END
++ @215 /* ~I hate to charge you for an old pair of shoes. You may have them for nothing.~ */ EXTERN agaurora aurora_shoes_10
++ @216 /* ~I'll sell them to you for 100 gold.~ */ EXTERN agaurora aurora_shoes_11
++ @217 /* ~I'll sell them to you for 200 gold.~ */ EXTERN agaurora aurora_shoes_12
++ @218 /* ~For 500 gold, they're yours.~ */ EXTERN agaurora aurora_shoes_13

CHAIN
agaurora aurora_shoes_85
@219 /* ~But before you look at my stock...~ */
EXTERN agaurora aurora_shoes_8

CHAIN
agaurora aurora_shoes_9
@220 /* ~It happened. How we stayed alive to learn anything is more than I can understand sometimes.~ */
EXTERN agaurora aurora_shoes_8

CHAIN
agaurora aurora_shoes_10
@685 /* ~Thank you. Oh, and since I won't be needing these old boots anymore, you might as well have them.~ */ DO ~
IncrementGlobal("ag_items","GLOBAL",1)
TakePartyItem("agboot24")
FillSlot(SLOT_BOOTS)
GiveItemCreate("agboot25",LastTalkedToBy(),0,0,0)
~ EXTERN agaurora aurora_bring_more

CHAIN
agaurora aurora_shoes_11
@112 /* ~Fair enough. Here you are.~ */ DO ~
IncrementGlobal("ag_items","GLOBAL",1)
TakePartyItem("agboot24")
FillSlot(SLOT_BOOTS)
GiveGoldForce(100)
~
= @595 /* ~Well, now I've no need for these old boots... you wouldn't be interested in buying them from me, would you? For 5,000 gold, perhaps?~ */
END
+ ~PartyGoldGT(4999)~ + @596 /* ~Sure, why not?~ */ EXTERN agaurora aurora_shoes_14
++ @597 /* ~Ah, no thanks.~ */ EXTERN agaurora aurora_shoes_15

CHAIN
agaurora aurora_shoes_12
@113 /* ~That's a lot to pay for sentiment, but... all right.~ */ DO ~
IncrementGlobal("ag_items","GLOBAL",1)
TakePartyItem("agboot24")
FillSlot(SLOT_BOOTS)
GiveGoldForce(200)
~ EXTERN agaurora aurora_bring_more

CHAIN
agaurora aurora_shoes_13
@114 /* ~The memories are good, but not *that* good. I won't be paying that.~ */
END
++ @115 /* ~How about 100 gold then?~ */ EXTERN agaurora aurora_shoes_11
++ @116 /* ~Then 200 gold.~ */ EXTERN agaurora aurora_shoes_12
++ @221 /* ~Then I guess we won't be selling them to you after all.~ */ EXTERN agaurora aurora_have_it

CHAIN
agaurora aurora_shoes_14
@598 /* ~I'm glad to know they'll be in good hands.~ */ DO ~
GiveItemCreate("agboot25",LastTalkedToBy(),0,0,0)
TakePartyGold(5000)
DestroyGold(5000)
~ EXTERN agaurora aurora_bring_more

CHAIN
agaurora aurora_shoes_15
@599 /* ~Oh well, I guess I'll just dump these in the trash then.~ */
EXTERN agaurora aurora_bring_more

//Items: Sword

CHAIN
IF WEIGHT #-1 ~
Global("ag_sword","GLOBAL",0)
OR(2)
  Global("ag_greeting","GLOBAL",1)
  Global("ag_greeting","GLOBAL",2)
PartyHasItem("agsw1h01")
~ THEN agaurora aurora_sword_1
@222 /* ~That's my sword!~ */ DO ~
GiveItemCreate("agsw1h02",LastTalkedToBy(),0,0,0)
TakePartyItem("agsw1h01")
DestroyItem("agsw1h01")
SetGlobal("ag_sword","GLOBAL",1)
SmallWait(5)
~ END
++ @223 /* ~You recognize it?~ */ EXTERN agaurora aurora_sword_2
++ @183 /* ~Really?~ */ EXTERN agaurora aurora_sword_2
++ @224 /* ~That's nice. Can we get to the buying and selling now?~ */ EXTERN agaurora aurora_sword_9

CHAIN
agaurora aurora_sword_2
@225 /* ~I know the jewel. I had it set there myself. I first got that sword when I rode with the Order to save a little village on the coast.~ */
== ANOMENJ IF ~
InParty("anomen")
!StateCheck("Anomen",CD_STATE_NOTVALID)
~ THEN @226 /* ~*You* rode with the Order?~ */
== agaurora IF ~
InParty("anomen")
!StateCheck("Anomen",CD_STATE_NOTVALID)
~ THEN @227 /* ~Don't look so surprised. I've done my share of heroic deeds.~ */
END
++ @228 /* ~When did you ride with the Order?~ */ EXTERN agaurora aurora_sword_3
++ @229 /* ~Sounds very heroic.~ */ EXTERN agaurora aurora_sword_3
++ @230 /* ~I guess there's a story behind this?~ */ EXTERN agaurora aurora_sword_3

CHAIN
agaurora aurora_sword_3
@231 /* ~It was a while back. The Order was all spread out, busy with this war, and that campaign, and I don't know what else. There were a few knights assigned the task of protecting a coastal area from attack. Too few, as it turned out. After the third village burned, they put out a call for volunteers.~ */
= @232 /* ~I had just finished a nice, profitable job and had some time to spare, so I thought "Why not?" I've always liked knights, to look at, at least.~ */
= @233 /* ~They got a bunch of us together, mostly tradesmen and farmers who had *no* idea what to do with a sword, and drilled us for a day or two, and then we set out in a hurry, trying to beat the pirates to their next target.~ */
END
++ @234 /* ~Did you succeed?~ */ EXTERN agaurora aurora_sword_4
++ @165 /* ~And then?~ */ EXTERN agaurora aurora_sword_45
++ @235 /* ~I think I can guess the rest. Can I see what you have in stock?~ */ EXTERN agaurora aurora_sword_9

CHAIN
agaurora aurora_sword_4
@236 /* ~Let me tell you, those knights can march! I never would have guessed they could go so fast with all that armor and equipment. We left a few people behind, here and there, but we made it just as the pirates landed.~ */
= @237 /* ~It was a nasty fight, but we won in the end. I must say, it helps to have a few good clerics along.~ */
END
++ @238 /* ~And the sword?~ */ EXTERN agaurora aurora_sword_5
++ @239 /* ~I've found the same thing.~ */ EXTERN agaurora aurora_sword_5
++ @240 /* ~So what came of it all?~ */ EXTERN agaurora aurora_sword_5

CHAIN
agaurora aurora_sword_45
@237 /* ~It was a nasty fight, but we won in the end. I must say, it helps to have a few good clerics along.~ */
EXTERN agaurora aurora_sword_5

CHAIN
agaurora aurora_sword_5
@241 /* ~It was kind of nice being all heroic and saving the town and everything. Of course, the Order folk got all stern and noble and refused any payment in gold, but they let us keep what we found on the field. This sword was by far the best of what I found.~ */
END
++ @242 /* ~So what is its name?~ */ EXTERN agaurora aurora_sword_6
++ @243 /* ~So how did you lose it?~ */ EXTERN agaurora aurora_sword_7
++ @244 /* ~So did you ever work for the Order again?~ */ EXTERN agaurora aurora_sword_8
++ @245 /* ~Thank you for the story. May I see what is in stock now?~ */ EXTERN agaurora aurora_sword_9

CHAIN
agaurora aurora_sword_6
@246 /* ~It doesn't have a name. Haven't you noticed that the folk running around with famous swords always die young? And then all anyone talks about is the *sword*. No, I was not going to name my sword!~ */
END
++ @243 /* ~So how did you lose it?~ */ EXTERN agaurora aurora_sword_7
++ @244 /* ~So did you ever work for the Order again?~ */ EXTERN agaurora aurora_sword_8
++ @245 /* ~Thank you for the story. May I see what is in stock now?~ */ EXTERN agaurora aurora_sword_9

CHAIN
agaurora aurora_sword_7
@247 /* ~Oh, I had one of those long spells with no work. Finally had to sell it so I could afford to go somewhere else to get work. I always meant to go back to reclaim it, but you know how that goes!~ */
END
++ @248 /* ~So what is the sword's name?~ */ EXTERN agaurora aurora_sword_6
++ @244 /* ~So did you ever work for the Order again?~ */ EXTERN agaurora aurora_sword_8
++ @245 /* ~Thank you for the story. May I see what is in stock now?~ */ EXTERN agaurora aurora_sword_9

CHAIN
agaurora aurora_sword_8
@249 /* ~Oh, from time to time. That was the time I remember best, though.~ */
END
++ @248 /* ~So what is the sword's name?~ */ EXTERN agaurora aurora_sword_6
++ @250 /* ~So how did come to lose it?~ */ EXTERN agaurora aurora_sword_7
++ @245 /* ~Thank you for the story. May I see what is in stock now?~ */ EXTERN agaurora aurora_sword_9

CHAIN
agaurora aurora_sword_9
@251 /* ~Of course. But first, it's good to see the old sword again. I never did have one as good. May I buy it from you?~ */
END
++ @252 /* ~I hate to charge you for your own sword. You may have it for nothing.~ */ EXTERN agaurora aurora_sword_10
++ @253 /* ~I'll sell it to you for 6000 gold.~ */ EXTERN agaurora aurora_sword_11
++ @254 /* ~I'll sell it to you for 8000 gold.~ */ EXTERN agaurora aurora_sword_12
++ @255 /* ~For 10,000 gold, it's yours.~ */ EXTERN agaurora aurora_sword_13

CHAIN
agaurora aurora_sword_10
@111 /* ~Thank you.~ */ DO ~
IncrementGlobal("ag_items","GLOBAL",1)
TakePartyItem("agsw1h02")
FillSlot(SLOT_WEAPON0)
EquipItem("agsw1h02")
SmallWait(5)
~ EXTERN agaurora aurora_bring_more

CHAIN
agaurora aurora_sword_11
@112 /* ~Fair enough. Here you are.~ */ DO ~
IncrementGlobal("ag_items","GLOBAL",1)
TakePartyItem("agsw1h02")
GiveGoldForce(6000)
FillSlot(SLOT_WEAPON0)
EquipItem("agsw1h02")
SmallWait(5)
~ EXTERN agaurora aurora_bring_more

CHAIN
agaurora aurora_sword_12
@113 /* ~That's a lot to pay for sentiment, but... all right.~ */ DO ~
IncrementGlobal("ag_items","GLOBAL",1)
TakePartyItem("agsw1h02")
GiveGoldForce(8000)
FillSlot(SLOT_WEAPON0)
EquipItem("agsw1h02")
SmallWait(5)
~ EXTERN agaurora aurora_bring_more

CHAIN
agaurora aurora_sword_13
@256 /* ~The sword is good, but not *that* good. I won't be paying that.~ */
END
++ @257 /* ~How about 6000 gold then?~ */ EXTERN agaurora aurora_sword_11
++ @258 /* ~Then 8000 gold.~ */ EXTERN agaurora aurora_sword_12
++ @259 /* ~Then I guess I won't be selling it to you after all.~ */ EXTERN agaurora aurora_have_it

//Items: Necklace

CHAIN
IF WEIGHT #-1 ~
Global("ag_necklace","GLOBAL",0)
OR(2)
  Global("ag_greeting","GLOBAL",1)
  Global("ag_greeting","GLOBAL",2)
PartyHasItem("agamul01")
~ THEN agaurora aurora_necklace_1
@262 /* ~Why, that is my necklace you have there!~ */
= @263 /* ~I have not seen it in years, not since it was stolen from me.~ */ DO ~
SetGlobal("ag_necklace","GLOBAL",1)
~ END
++ @264 /* ~I'm surprised you didn't go after the thief yourself.~ */ EXTERN agaurora aurora_necklace_2
++ @265 /* ~How did you come by it in the first place?~ */ EXTERN agaurora aurora_necklace_3
++ @266 /* ~Really, all I want is to buy some supplies. Can I see what you have here?~ */ EXTERN agaurora aurora_necklace_175

CHAIN
agaurora aurora_necklace_2
@267 /* ~I would have, but Shana was all in a hurry to go after some treasure she'd heard of. Turned out to be a very small kobold's very small hoard, but by the time we got back to town, the thief was long gone.~ */
EXTERN agaurora aurora_necklace_3

CHAIN
agaurora aurora_necklace_3
@268 /* ~Would you believe a pirate gave it to me?~ */
END
++ @183 /* ~Really?~ */ EXTERN agaurora aurora_necklace_5
++ @269 /* ~Somehow, that doesn't surprise me.~ */ EXTERN agaurora aurora_necklace_5
++ @48 /* ~No.~ */ EXTERN agaurora aurora_necklace_4

CHAIN
agaurora aurora_necklace_4
@270 /* ~You're grumpy enough to scare the spiders today. Did you miss your sleep last night? Well, if you aren't in the mood for a story, we'll go straight to business.~ */
EXTERN agaurora aurora_necklace_17

CHAIN
agaurora aurora_necklace_5
@271 /* ~A handsome fellow he was, too. I was sorry to part with him.~ */
END
++ @272 /* ~Well, why did you?~ */ EXTERN agaurora aurora_necklace_6
++ @273 /* ~I'm sure he was.~ */ EXTERN agaurora aurora_necklace_7
++ @274 /* ~Let me guess, he was captain of a fine ship?~ */ EXTERN agaurora aurora_necklace_8

CHAIN
agaurora aurora_necklace_6
@275 /* ~I started wanting to see more than just the ports of a few scattered places. And, the ship's captain was talking about taking to slaving. I have done a lot, but I have always drawn the line there.~ */
EXTERN agaurora aurora_necklace_10

CHAIN
agaurora aurora_necklace_7
@276 /* ~He had the greenest eyes I've ever seen, and dark, dark black hair.~ */
EXTERN agaurora aurora_necklace_11

CHAIN
agaurora aurora_necklace_8
@277 /* ~Half of that guess is right. It was a fine ship, but he was the helmsman, not the captain. That's how I got to know him, hanging around and asking him about how he kept the ship on course.~ */
END
++ @278 /* ~So how did you end up with pirates, anyway?~ */ EXTERN agaurora aurora_necklace_12
++ @279 /* ~But what were you doing on a pirate ship in the first place?~ */ EXTERN agaurora aurora_necklace_12
++ @280 /* ~And he gave you the necklace as a love-token?~ */ EXTERN agaurora aurora_necklace_13

CHAIN
agaurora aurora_necklace_10
@281 /* ~So, we parted.~ */
END
++ @278 /* ~So how did you end up with pirates, anyway?~ */ EXTERN agaurora aurora_necklace_12
++ @279 /* ~But what were you doing on a pirate ship in the first place?~ */ EXTERN agaurora aurora_necklace_12
++ @280 /* ~And he gave you the necklace as a love-token?~ */ EXTERN agaurora aurora_necklace_13

CHAIN
agaurora aurora_necklace_11
@282 /* ~He was helmsman on the ship. That's how I got to know him, hanging around and asking him about how he kept the ship on course.~ */
END
++ @278 /* ~So how did you end up with pirates, anyway?~ */ EXTERN agaurora aurora_necklace_12
++ @279 /* ~But what were you doing on a pirate ship in the first place?~ */ EXTERN agaurora aurora_necklace_12
++ @280 /* ~And he gave you the necklace as a love-token?~ */ EXTERN agaurora aurora_necklace_13

CHAIN
agaurora aurora_necklace_12
@283 /* ~I wasn't always terribly careful who I signed on with, in those days. I heard someone was hiring folk who knew how to fight, and I joined. Wasn't until later I learned they were pirates, and by then it was too late to fuss. So, I made the best of it.~ */
END
++ @284 /* ~Sounds like you enjoyed it, though.~ */ EXTERN agaurora aurora_necklace_14
++ @285 /* ~You really should have been more careful.~ */ EXTERN agaurora aurora_necklace_15
++ @286 /* ~I cannot believe you speak so casually about piracy!~ */ EXTERN agaurora aurora_necklace_16

CHAIN
agaurora aurora_necklace_13
@287 /* ~I think he was mostly trying to impress me with his wealth and generosity. Not that I didn't appreciate the necklace. Like I said, I was furious when it was stolen.~ */
END
++ @278 /* ~So how did you end up with pirates, anyway?~ */ EXTERN agaurora aurora_necklace_12
++ @279 /* ~But what were you doing on a pirate ship in the first place?~ */ EXTERN agaurora aurora_necklace_12
++ @288 /* ~Well, it has come back to you now.~ */ EXTERN agaurora aurora_necklace_17

CHAIN
agaurora aurora_necklace_14
@289 /* ~Oh, I did, for a while. It was kind of exciting learning about life on the ship, and raiding towns. Though... I wasn't real fond of killing kids. Usually left that to the others and stuck with fighting the folk who could fight back.~ */
EXTERN agaurora aurora_necklace_17

CHAIN
agaurora aurora_necklace_15
@290 /* ~Probably, but then, if I had been careful, I would not have had nearly as much fun as I did, overall.~ */
EXTERN agaurora aurora_necklace_17

CHAIN
agaurora aurora_necklace_16
@291 /* ~I was on the ship. The only thing fussing would have done was get me killed.~ */
EXTERN agaurora aurora_necklace_17

CHAIN
agaurora aurora_necklace_17
@292 /* ~I wore that necklace for years. It's good to see it again. Will you sell it to me?~ */
END

++ @293 /* ~I hate to charge you for something that has so much value to you. Take it as a gift from me.~ */ EXTERN agaurora aurora_necklace_18
++ @294 /* ~I'll sell it to you for 100 gold.~ */ EXTERN agaurora aurora_necklace_19
++ @295 /* ~I'll sell it to you for 200 gold.~ */ EXTERN agaurora aurora_necklace_20
++ @296 /* ~For 500 gold, it's yours.~ */ EXTERN agaurora aurora_necklace_21

CHAIN
agaurora aurora_necklace_175
@297 /* ~Before I show you what I have in stock, there is something I would like to ask you.~ */
EXTERN agaurora aurora_necklace_17

CHAIN
agaurora aurora_necklace_18
@111 /* ~Thank you.~ */ DO ~
IncrementGlobal("ag_items","GLOBAL",1)
TakePartyItem("agamul01")
FillSlot(SLOT_AMULET)
~ EXTERN agaurora aurora_bring_more

CHAIN
agaurora aurora_necklace_19
@112 /* ~Fair enough. Here you are.~ */ DO ~
IncrementGlobal("ag_items","GLOBAL",1)
TakePartyItem("agamul01")
FillSlot(SLOT_AMULET)
GiveGoldForce(100)
~ EXTERN agaurora aurora_bring_more

CHAIN
agaurora aurora_necklace_20
@113 /* ~That's a lot to pay for sentiment, but... all right.~ */ DO ~
IncrementGlobal("ag_items","GLOBAL",1)
TakePartyItem("agamul01")
GiveGoldForce(200)
FillSlot(SLOT_AMULET)
~ EXTERN agaurora aurora_bring_more

CHAIN
agaurora aurora_necklace_21
@298 /* ~The memories are good, but not *that* good. I won't be paying that.~ */
END
++ @115 /* ~How about 100 gold then?~ */ EXTERN agaurora aurora_necklace_19
++ @116 /* ~Then 200 gold.~ */ EXTERN agaurora aurora_necklace_20
++ @299 /* ~Then I guess we won't be selling it to you after all.~ */ EXTERN agaurora aurora_have_it

//Items: Bring More

CHAIN
agaurora aurora_have_it
@300 /* ~Have it your way then.~ */
EXTERN agaurora now

CHAIN
agaurora aurora_bring_more
@301 /* ~By the way, if you should happen to find anything else of mine, I'd appreciate it if you'd bring it by.~ */
EXTERN agaurora now

//MTS Pipe

CHAIN
IF WEIGHT #-1 ~
Global("ag_pipe","GLOBAL",0)
OR(2)
  Global("ag_greeting","GLOBAL",1)
  Global("ag_greeting","GLOBAL",2)
PartyHasItem("mts#pipe")
~ THEN agaurora aurora_pipe_talk
@593 /* ~What a striking pipe!~ */
DO ~SetGlobal("ag_pipe","GLOBAL",1)~
= @594 /* ~If it's the one I think it is, you should take good care of it. It has quite a history - I hear it once belonged to the famous Major Tom Sawyer himself.~ */
EXTERN agaurora now

//Silver Horn of Valhalla

CHAIN
IF WEIGHT #-1 ~
Global("ag_horn","GLOBAL",0)
OR(2)
  Global("ag_greeting","GLOBAL",1)
  Global("ag_greeting","GLOBAL",2)
PartyHasItem("misc3i")
~ THEN agaurora ag_horn1
@738 /* ~A silver horn! I have only seen its like once before... Wherever did you get it?~ */
DO ~SetGlobal("ag_horn","GLOBAL",1)~ END
++ @739 /* ~Just around.~ */ EXTERN agaurora ag_horn2
++ @740 /* ~From a house just north of here.~ */ EXTERN agaurora ag_horn3
++ @741 /* ~Mind your own business.~ */ EXTERN agaurora ag_horn4

CHAIN
agaurora ag_horn2
@742 /* ~Really? Not from a chest at the foot of someone's bed in a house nearby, by any chance?~ */
END
++ @743 /* ~Nope. It's from a... dragon's hoard.~ */ EXTERN agaurora ag_horn5
++ @744 /* ~Why yes, as a matter of fact, that's exactly correct.~ */ EXTERN agaurora ag_horn3
++ @741 /* ~Mind your own business.~ */ EXTERN agaurora ag_horn4

CHAIN
agaurora ag_horn3
@745 /* ~That's *my* house! Do you think you can go around just pinching everything in sight? I ought to turn you in...~ */
END
++ @746 /* ~I really had no idea, Aurora. The place looked abandoned...~ */ EXTERN agaurora ag_horn6
++ @747 /* ~Well it wasn't nailed down...~ */ EXTERN agaurora ag_horn7
++ @748 /* ~Fat lot I care. Do your worst.~ */ EXTERN agaurora ag_horn8

CHAIN
agaurora ag_horn4
@749 /* ~Hmph. Have it your way then.~ */ DO ~
SetGlobal("ag_greeting","GLOBAL",3)~ EXIT

CHAIN
agaurora ag_horn5
@750 /* ~Indeed? I don't suppose it has a small "A" with a circle around it scratched on the inside. Well, so it does. That's *my* horn! I ought to turn you in...~ */
END
++ @746 /* ~I really had no idea, Aurora. The place looked abandoned...~ */ EXTERN agaurora ag_horn6
++ @747 /* ~Well it wasn't nailed down...~ */ EXTERN agaurora ag_horn7
++ @748 /* ~Fat lot I care. Do your worst.~ */ EXTERN agaurora ag_horn8

CHAIN
agaurora ag_horn6
@751 /* ~Abandoned, Tymora's rump! I bet the bed was still warm when you filched it. Still, at least you were somewhat honest with me.~ */
= @752 /* ~Tell you what. I'll let you have it for a thousand gold. It's worth at least that.~ */
END
+ ~PartyGoldGT(999)~ + @753 /* ~Fair enough. Here you go.~ */ EXTERN agaurora ag_horn9
+ ~PartyGoldLT(1000)~ + @754 /* ~I haven't got that much.~ */ EXTERN agaurora ag_horn10
++ @755 /* ~No chance. I pinched it fair and square.~ */ EXTERN agaurora ag_horn8

CHAIN
agaurora ag_horn7
@756 /* ~I figured as much. You *do* steal everything that isn't nailed down. I'll be sure to keep an eye on my goods around you lot from now on.~ */
= @752 /* ~Tell you what. I'll let you have it for a thousand gold. It's worth at least that.~ */
END
+ ~PartyGoldGT(999)~ + @753 /* ~Fair enough. Here you go.~ */ EXTERN agaurora ag_horn9
+ ~PartyGoldLT(1000)~ + @754 /* ~I haven't got that much...~ */ EXTERN agaurora ag_horn10
++ @755 /* ~No chance. I pinched it fair and square.~ */ EXTERN agaurora ag_horn8

CHAIN
agaurora ag_horn8
@757 /* ~In that case, I *will* have to turn you in. The authorities will certainly hear of this. Now get out of my sight.~ DO ~ReputationInc(-2) SetDialogue("agsteal0")~ */ EXIT

CHAIN
agaurora ag_horn9
@758 /* ~Thank you. Now was there anything else?~ */ DO ~
TakePartyGold(1000)
DestroyGold(1000)~
END
++ @759 /* ~Where did you get the horn anyway?~ */ EXTERN agaurora ag_horn11
++ @84 /* ~Let me see what you have.~ */ DO ~
StartStore("agaurora",LastTalkedToBy())
~ EXIT

CHAIN
agaurora ag_horn10
@760 /* ~Fine, I'll just take what you've got. Be thankful I'm lenient. Now was there something else?~ */ DO ~
TakePartyGold(1000)
DestroyGold(1000)~
END
++ @759 /* ~Where did you get the horn anyway?~ */ EXTERN agaurora ag_horn11
++ @84 /* ~Let me see what you have.~ */ DO ~
StartStore("agaurora",LastTalkedToBy())
~ EXIT

CHAIN
agaurora ag_horn11
@761 /* ~Oh, a party of adventurers and I abstracted it from the bedchamber of a mage at an inn we were staying at. Clever job, that, if I do say so. The snoring fool probably didn't even realize his loss until we were miles away.~ */ EXTERN agaurora now

//Yoshimo

CHAIN
IF WEIGHT #-1 ~
OR(2)
  Global("ag_greeting","GLOBAL",1)
  Global("ag_greeting","GLOBAL",2)
Global("ag_chat_yoshimo","GLOBAL",0)
Global("ag_atimer2","GLOBAL",0)
InParty("Yoshimo")
InMyArea("Yoshimo")
!StateCheck("Yoshimo",CD_STATE_NOTVALID)
~ THEN agaurora banter_yoshimo
@302 /* ~You're not from around here, are you?~ */ DO ~
SetGlobal("ag_chat_yoshimo","GLOBAL",1)
SetGlobal("ag_atimer2","GLOBAL",1)~
== YOSHJ @303 /* ~I admit, this fair city and its inhabitants are all new to me.~ */
== agaurora @304 /* ~Where are you from, then?~ */
== YOSHJ @305 /* ~I hail from far away Kara-Tur, gracious lady.~ */
== agaurora @306 /* ~My! Handsome and polite, too.~ */
= @307 /* ~You know, I have never seen any goods from Kara-Tur. What kind of shoes do you wear?~ */
== YOSHJ @308 /* ~Gracious lady...~ */
== agaurora @309 /* ~Call me Aurora, do.~ */
== YOSHJ @310 /* ~Aurora, then. I know little about the making of shoes, alas.~ */
== agaurora @311 /* ~You know, people often find they know more than they think. Why not come over some evening, after the shop is closed, and we can discuss things in peace?~ */
== YOSHJ @312 /* ~A delightful prospect, I am sure.~ */ EXTERN agaurora now

//Korgan

CHAIN
IF WEIGHT #-1 ~
OR(2)
  Global("ag_greeting","GLOBAL",1)
  Global("ag_greeting","GLOBAL",2)
Global("ag_chat_korgan","GLOBAL",0)
Global("ag_atimer2","GLOBAL",0)
InParty("Korgan")
InMyArea("Korgan")
!StateCheck("Korgan",CD_STATE_NOTVALID)
~ THEN agaurora banter_korgan
@313 /* ~You, dwarf! What *have* you done to your shoes?!~ */ DO ~
SetGlobal("ag_chat_korgan","GLOBAL",1)
SetGlobal("ag_atimer2","GLOBAL",1)~
== KORGANJ @314 /* ~Are ye insultin' me boots, lass?!~ */
== agaurora @315 /* ~Boots? Those *may* have been boots at some time, but now? They're hardly being held together! You need to clean and polish, or better yet, replace them.~ */
== KORGANJ @316 /* ~I dinnae have time for that sort o' fancy nonsense, wench! Just open the store already, so <CHARNAME> can do <PRO_HISHER> shoppin' and we can be out o' here!~ */
== agaurora @317 /* ~If you don't take time for that "fancy nonsense", as you put it, your boots will be falling apart in the middle of battle and you'll be falling face-first onto your own axe. Now, take a look here - let's see if we can't find something that suits you...~ */ DO ~
StartStore("agaurora",LastTalkedToBy())
~ EXIT

//Edwin

CHAIN
IF WEIGHT #-1 ~
OR(2)
  Global("ag_greeting","GLOBAL",1)
  Global("ag_greeting","GLOBAL",2)
Global("ag_chat_edwin","GLOBAL",0)
Global("ag_atimer2","GLOBAL",0)
InParty("Edwin")
InMyArea("Edwin")
!StateCheck("EDWIN",CD_STATE_NOTVALID)
~ THEN agaurora banter_edwin
@318 /* ~You a Red Wizard?~ */ DO ~
SetGlobal("ag_chat_edwin","GLOBAL",1)
SetGlobal("ag_atimer2","GLOBAL",1)~
== EDWINJ @319 /* ~I should think that would be apparent even to someone of your obviously limited intelligence.~ */
== agaurora @320 /* ~You never know. Some people like to dress up for the fun of it. But you're certainly rude enough to be a Red Wizard. Not that I've ever met one, but I've heard stories.~ */
== EDWINJ @321 /* ~I will not stand here and be insulted by a lowly *shopkeeper.* Bah.~ */
== agaurora @322 /* ~I have to say, though, that your people have good taste in clothing. The embroidery on your cloak... It's splendid! And the few times I've been able to get shoes from your country - marvelous workmanship, to say the least!~ */
== EDWINJ @323 /* ~We train our slaves well.~ */
== agaurora @324 /* ~Ah, yes. Slaves.~ */ EXTERN agaurora now

//PC1 Hendak

CHAIN
IF WEIGHT #-1 ~
OR(2)
  Global("ag_greeting","GLOBAL",1)
  Global("ag_greeting","GLOBAL",2)
Global("ag_chat_pc1","GLOBAL",0)
Global("ag_atimer2","GLOBAL",0)
Global("ag_hend","GLOBAL",1)
~ THEN agaurora banter_pc11
@325 /* ~Hello there!~ */ DO ~
SetGlobal("ag_chat_pc1","GLOBAL",1)
SetGlobal("ag_atimer2","GLOBAL",1)~
=  @326 /* ~Have you met the new owner of the Copper Coronet yet? *Such* a handsome fellow!~ */
END
+ ~Gender(LastTalkedToBy(),MALE)~ + @327 /* ~Hendak? Yes, in fact I helped free him.~ */ EXTERN agaurora banter_pc12
+ ~Gender(LastTalkedToBy(),FEMALE)~ + @327 /* ~Hendak? Yes, in fact I helped free him.~ */ EXTERN agaurora banter_pc13
+ ~Gender(LastTalkedToBy(),MALE)~ + @328 /* ~Handsome? I... suppose he is.~ */ EXTERN agaurora banter_pc14
+ ~Gender(LastTalkedToBy(),FEMALE)~ + @328 /* ~Handsome? I... suppose he is.~ */ EXTERN agaurora banter_pc15
++ @329 /* ~If you say so. May we see the shoes, now?~ */ EXTERN agaurora banter_pc16

CHAIN
agaurora banter_pc12
@330 /* ~You did? Well, I must say, you did us all a favor! Getting rid of those nasty slavers, and putting someone like him in charge!~ */
= @331 /* ~Hendak, you say? I shall certainly have to get down there to meet him. Welcome him to the city, and all that. Perhaps give him some shoes. Surely slavery can't have been terribly kind to his feet!~ */ EXTERN agaurora now

CHAIN
agaurora banter_pc13
@332 /* ~You did? Well, of course. How could any girl resist helping a handsome fellow like that?~ */
= @333 /* ~Hendak, you said? You wouldn't mind if I went to visit him, would you? To welcome him to the city and all that?~ */
END
++ @334 /* ~No, of course not... Why would I?~ */ EXTERN agaurora banter_pc16
++ @335 /* ~It's your decision.~ */  EXTERN agaurora banter_pc16
++ @336 /* ~You keep your hands off him!~ */  EXTERN agaurora banter_pc17
++ @337 /* ~I would like to see the shoes now.~ */ DO ~
StartStore("agaurora",LastTalkedToBy())
~ EXIT

CHAIN
agaurora banter_pc14
@338 /* ~You suppose? Ah well, I suppose you'd rather be looking at the women.~ */
= @339 /* ~And having them look at you, I'm sure.~ */ EXTERN agaurora now

CHAIN
agaurora banter_pc15
@340 /* ~You suppose! What's wrong with you, girl! The man is a dream come true.~ */
= @341 /* ~Ah well. That leaves him free for the rest of us.~ */ EXTERN agaurora now

CHAIN
agaurora banter_pc16
@342 /* ~I am glad that is settled, then.~ */ EXTERN agaurora now

CHAIN
agaurora banter_pc17
@343 /* ~My goodness! If you want him for yourself, just say so!~ */
= @344 /* ~I'll stay away, then, for the time being.~ */ EXTERN agaurora now

//Jan - has been in jail

CHAIN
IF WEIGHT #-1 ~
OR(2)
  Global("ag_greeting","GLOBAL",1)
  Global("ag_greeting","GLOBAL",2)
Global("ag_chat_jan","GLOBAL",0)
Global("ag_atimer2","GLOBAL",0)
Global("JanFree","GLOBAL",1)
InParty("Jan")
InMyArea("Jan")
!StateCheck("JAN",CD_STATE_NOTVALID)
~ THEN agaurora banter_jan
@345 /* ~Jan, you rascal! I'd heard you were in jail!~ */ DO ~
SetGlobal("ag_chat_jan","GLOBAL",1)
SetGlobal("ag_atimer2","GLOBAL",1)~
== JANJ @346 /* ~You can't keep a Jansen down, Aurora, you know that!~ */
=  @347 /* ~<CHARNAME> bailed me out. I'll be traveling with <PRO_HIMHER> for the time being.~ */
== agaurora @348 /* ~Good! It's time someone got you out of the city and out of mischief, for a while, anyway!~ */ EXTERN agaurora now

//Jan - hasn't been in jail

CHAIN
IF WEIGHT #-1 ~
OR(2)
  Global("ag_greeting","GLOBAL",1)
  Global("ag_greeting","GLOBAL",2)
Global("ag_chat_jan","GLOBAL",0)
Global("ag_atimer2","GLOBAL",0)
Global("JanFree","GLOBAL",0)
InParty("Jan")
InMyArea("Jan")
!StateCheck("JAN",CD_STATE_NOTVALID)
~ THEN agaurora banter_jan
@349 /* ~Jan, you rascal! Not in jail yet, I see.~ */ DO ~
SetGlobal("ag_chat_jan","GLOBAL",1)
SetGlobal("ag_atimer2","GLOBAL",1)~
== JANJ @350 /* ~No one can catch a Jansen, you know that!~ */
== agaurora @351 /* ~I know I haven't caught you cheating me - yet.~ */
== JANJ @352 /* ~You think I would cheat you? I'm hurt, Aurora! Wounded!~ */
== agaurora @353 /* ~Those turnip-scented boots...~ */
== JANJ @354 /* ~Would have been the talk of the town, I tell you!~ */
== agaurora @355 /* ~I'm sure they would have.~ */
= @356 /* ~So, what are you up to now?~ */
== JANJ @357 /* ~I'll be traveling with <CHARNAME> here, helping <PRO_HIMHER> on <PRO_HISHER> quest.~ */
== agaurora @358 /* ~Good! It'll get you out of the city and out of mischief, for awhile, anyway.~ */ EXTERN agaurora now

//Valygar1

CHAIN
IF WEIGHT #-1 ~
OR(2)
  Global("ag_greeting","GLOBAL",1)
  Global("ag_greeting","GLOBAL",2)
Global("ag_chat_valygar1","GLOBAL",0)
Global("ag_chat_valygar2","GLOBAL",0)
Global("ag_atimer2","GLOBAL",0)
InParty("Valygar")
InMyArea("Valygar")
!StateCheck("Valygar",CD_STATE_NOTVALID)
Global("TalkedLavok","GLOBAL",0)
~ THEN agaurora banter_valygar1
@359 /* ~Lord Corthala! It's good to see you! I had heard... well, never mind what I heard. How are you?~ */ DO ~
SetGlobal("ag_chat_valygar1","GLOBAL",1)
SetGlobal("ag_atimer2","GLOBAL",1)~
== VALYGARJ @360 /* ~Well enough. Let me guess: You heard I went insane and killed two Cowled Wizards?~ */
== agaurora @361 /* ~Something like that, yes. I should have known better. Someone with your taste in shoes couldn't *possibly* be insane.~ */
== VALYGARJ @362 /* ~I would not be so sure, Aurora. It always pays to be cautious.~ */
== agaurora @363 /* ~True enough.~ */ EXTERN agaurora now

//Valygar2

CHAIN
IF WEIGHT #-1 ~
OR(2)
  Global("ag_greeting","GLOBAL",1)
  Global("ag_greeting","GLOBAL",2)
Global("ag_chat_valygar2","GLOBAL",0)
Global("ag_atimer2","GLOBAL",0)
InParty("Valygar")
InMyArea("Valygar")
!StateCheck("Valygar",CD_STATE_NOTVALID)
!Global("TalkedLavok","GLOBAL",0)
~ THEN agaurora banter_valygar2
@364 /* ~Lord Corthala! I am glad to see you again. How are you this fine day?~ */ DO ~
SetGlobal("ag_chat_valygar2","GLOBAL",1)
SetGlobal("ag_atimer2","GLOBAL",1)~
== VALYGARJ @365 /* ~I am doing well. Better than I have in years, thanks to <CHARNAME>.~ */
== agaurora @184 /* ~Oh?~ */
== VALYGARJ @366 /* ~Most truly.~ */
== agaurora @367 /* ~Care to satisfy a lady's curiosity?~ */
== VALYGARJ @368 /* ~What is it, Aurora? (sigh)~ */
== agaurora @369 /* ~I've been hearing the strangest stories about you... They say you went insane and killed a dozen Cowled Wizards!~ */
== VALYGARJ @370 /* ~Yet here I am.~ */
== agaurora @371 /* ~Is that all you're going to tell me? That you're alive?! For shame, Lord Corthala!~ */
== VALYGARJ @372 /* ~I am sure that "they" will tell you a far better story than I ever could.~ */
== agaurora @373 /* ~Oh, very well. You're too handsome by far to stay annoyed with.~ */  EXTERN agaurora now

//Lissa

CHAIN
IF WEIGHT #-1 ~
TimeOfDay(0)
OR(2)
  Global("ag_greeting","GLOBAL",1)
  Global("ag_greeting","GLOBAL",2)
Global("ag_lissa","GLOBAL",0)
Global("ag_atimer2","GLOBAL",0)
GlobalTimerExpired("ag_lissa_timer","GLOBAL")
!InParty("Jan")
!Dead("Lissa")
~ THEN agaurora banter_lissa
@374 /* ~Welcome!~ */
= @375 /* ~Oh, wait a minute please...~ */ DO ~
SetGlobal("ag_lissa","GLOBAL",1)
SetGlobal("ag_atimer2","GLOBAL",1)
StartCutSceneMode()
StartCutScene("aglissa")
~ EXIT

CHAIN
IF WEIGHT #-1 ~
Global("ag_lissa","GLOBAL",1)
~ THEN agaurora banter_lissa2
@376 /* ~I'm sorry you had to wait. She is - or was - one of my better customers.~ */
END
++ @377 /* ~That's all right. I'm just glad to know you keep your standards high.~ */ DO
~SetGlobal("ag_lissa","GLOBAL",2)~
EXTERN agaurora banter_lissa3
++ @378 /* ~I don't mind waiting for workmanship as fine as yours.~ */ DO
~SetGlobal("ag_lissa","GLOBAL",2)~
EXTERN agaurora banter_lissa3
++ @379 /* ~I'm used to lines. May I see your wares now?~ */ DO
~SetGlobal("ag_lissa","GLOBAL",2) StartStore("agaurora",LastTalkedToBy())~ EXIT
++ @380 /* ~I am *not* used to waiting. This had better not happen again! Now, show me what you are selling.~ */ DO
~SetGlobal("ag_lissa","GLOBAL",2) StartStore("agaurora",LastTalkedToBy())~ EXIT
++ @381 /* ~We're not buying anything today. Thank you anyway!~ */ DO ~SetGlobal("ag_lissa","GLOBAL",2)~ EXIT
++ @382 /* ~I don't want to hear anything from you, ever again.~ */ DO ~
SetGlobal("ag_lissa","GLOBAL",2)
SetGlobal("ag_greeting","GLOBAL",3)~ EXIT
+ ~Global("ag_aran","GLOBAL",0) Global("E3ARANSMUMEXISTS","GLOBAL",1)~ + @719 /* ~I came across a... lady in a house north of here. Isn't that your house? You never mentioned a roommate...~ */ DO ~SetGlobal("ag_aran","GLOBAL",1)~ + agarans_mum
+ ~NumTimesTalkedToGT(1) Global("agaur_upgrade","GLOBAL",0)~ + @612 /* ~I'm curious if you can provide other products than those you've got in stock.~ */ DO ~SetGlobal("ag_lissa","GLOBAL",2)~ + agaur_up_service
+ ~Global("agaur_upgrade","GLOBAL",1)~ + @613 /* ~I want to talk about your enchanter acquaintance.~ */ DO ~SetGlobal("ag_lissa","GLOBAL",2)~ + agaur_up_help
+ ~Global("agaur_upgrade","GLOBAL",2) GlobalTimerExpired("agaur_upgrade_timer","GLOBAL")~ + @614 /* ~So, what about the enchanter?~ */  DO ~SetGlobal("ag_lissa","GLOBAL",2)~ + agaur_up_info
+ ~Global("agaur_upgrade","GLOBAL",3)~ + @615 /* ~Do I have anything that can be used for enchanting?~ */ DO ~SetGlobal("ag_lissa","GLOBAL",2)~ + agaur_up_check
+ ~Global("agaur_upgrade","GLOBAL",4) GlobalTimerExpired("agaur_upgrade_timer","GLOBAL")~ + @616 /* ~So, what about my order?~ */ DO ~SetGlobal("ag_lissa","GLOBAL",2)~ + agaur_up_love_give
+ ~Global("agaur_upgrade","GLOBAL",5) GlobalTimerExpired("agaur_upgrade_timer","GLOBAL")~ + @616 /* ~So, what about my order?~ */ DO ~SetGlobal("ag_lissa","GLOBAL",2)~ + agaur_up_armored_give
+ ~Global("agaur_upgrade","GLOBAL",6) GlobalTimerExpired("agaur_upgrade_timer","GLOBAL")~ + @616 /* ~So, what about my order?~ */ DO ~SetGlobal("ag_lissa","GLOBAL",2)~ + agaur_up_daemon_give

CHAIN
agaurora banter_lissa3
@383 /* ~It is a pleasure to have customers as discriminating as you are.~ */
= @384 /* ~As you can see, not everyone cares as much as you do. Lissa, there... She's been a faithful customer, but she has no real appreciation for good workmanship, and no patience whatsoever. She can be, as you just saw, quite trying, at times.~ */ EXTERN agaurora now

//PC2 Viconia

CHAIN
IF WEIGHT #-1 ~
OR(2)
  Global("ag_greeting","GLOBAL",1)
  Global("ag_greeting","GLOBAL",2)
Global("ag_chat_pcvic","GLOBAL",0)
Global("ag_atimer2","GLOBAL",0)
OR(2)
  Global("viconiaromanceactive","GLOBAL",1)
  Global("viconiaromanceactive","GLOBAL",2)
IsGabber(Player1)
Gender(Player1,MALE)
InParty("Viconia")
InMyArea("Viconia")
!StateCheck("Viconia",CD_STATE_NOTVALID)
~ THEN agaurora banter_pcvic
@385 /* ~You sleeping with her?~ */ DO ~
SetGlobal("ag_chat_pcvic","GLOBAL",1)
SetGlobal("ag_atimer2","GLOBAL",1)~
END
++ @42 /* ~What?~ */ EXTERN agaurora banter_pcvic1
++ @386 /* ~Are you talking to me?~ */ EXTERN agaurora banter_pcvic2
++ @387 /* ~None of your business.~ */ EXTERN agaurora banter_pcvic3

CHAIN
agaurora banter_pcvic1
@388 /* ~The drow, Viconia. Are you sleeping with her?~ */
END
++ @389 /* ~Uh... no.~ */ EXTERN agaurora banter_pcvic4
++ @390 /* ~Gods, no!~ */ EXTERN agaurora banter_pcvic4
++ @391 /* ~Not yet.~ */ EXTERN agaurora banter_pcvic7
++ @392 /* ~Of course!~ */ EXTERN agaurora banter_pcvic5
++ @46 /* ~Yes.~ */ EXTERN agaurora banter_pcvic5
++ @393 /* ~What of it?~ */ EXTERN agaurora banter_pcvic6
++ @387 /* ~None of your business.~ */ EXTERN agaurora banter_pcvic3

CHAIN
agaurora banter_pcvic2
@394 /* ~Of course. *Are* you sleeping with her?~ */
END
++ @389 /* ~Uh... no.~ */ EXTERN agaurora banter_pcvic4
++ @390 /* ~Gods, no!~ */ EXTERN agaurora banter_pcvic4
++ @391 /* ~Not yet.~ */ EXTERN agaurora banter_pcvic7
++ @392 /* ~Of course!~ */ EXTERN agaurora banter_pcvic5
++ @46 /* ~Yes.~ */ EXTERN agaurora banter_pcvic5
++ @393 /* ~What of it?~ */ EXTERN agaurora banter_pcvic6
++ @387 /* ~None of your business.~ */ EXTERN agaurora banter_pcvic3

CHAIN
agaurora banter_pcvic3
@395 /* ~Fine. I'm sure I don't want to intrude!~ */ EXIT

CHAIN
agaurora banter_pcvic4
@396 /* ~Well, take this, just in case matters change. From all I've heard, you'll need it!~ */ DO ~
SetGlobal("ag_balm","GLOBAL",1)
GiveItemCreate("agpotn02",Player1,1,0,0)
~ EXTERN agaurora now

CHAIN
agaurora banter_pcvic5
@397 /* ~Good for you! Here's a little gift from me. From all I've heard, you'll need it!~ */ DO ~
SetGlobal("ag_balm","GLOBAL",1)
GiveItemCreate("agpotn02",Player1,1,0,0)
~ EXTERN agaurora now

CHAIN
agaurora banter_pcvic6
@398 /* ~Nothing! Nothing! Really, some people are *so* ready to take offense!~ */ EXTERN agaurora now

CHAIN
agaurora banter_pcvic7
@399 /* ~Good luck to you, then. And here's a little gift from me, in case matters change. If even half of what I have heard is true, you'll need it.~ */ DO ~
SetGlobal("ag_balm","GLOBAL",1)
GiveItemCreate("agpotn02",Player1,1,0,0)
~ EXTERN agaurora now

//Aerie

CHAIN
IF WEIGHT #-1 ~
OR(2)
  Global("ag_greeting","GLOBAL",1)
  Global("ag_greeting","GLOBAL",2)
Global("ag_chat_aerie","GLOBAL",0)
Global("ag_atimer2","GLOBAL",0)
InParty("Aerie")
InMyArea("Aerie")
!StateCheck("Aerie",CD_STATE_NOTVALID)
~ THEN agaurora banter_aerie
@400 /* ~My dear! You are limping!~ */ DO ~
SetGlobal("ag_chat_aerie","GLOBAL",1)
SetGlobal("ag_atimer2","GLOBAL",1)~
== AERIEJ @401 /* ~I... I guess my feet do hurt a bit.~ */
== agaurora @402 /* ~And no wonder, I'm sure, with all the walking you must be doing.~ */
= @403 /* ~We need to get you into some decent shoes right away!~ */
= @404 /* ~I am sure you'll find some in my stock.~ */ DO ~
StartStore("agaurora",LastTalkedToBy())
~ EXIT

//Anomen1

CHAIN
IF WEIGHT #-1 ~
OR(2)
  Global("ag_greeting","GLOBAL",1)
  Global("ag_greeting","GLOBAL",2)
Global("ag_chat_anomen","GLOBAL",0)
Global("ag_atimer2","GLOBAL",0)
InParty("Anomen")
InMyArea("Anomen")
!StateCheck("Anomen",CD_STATE_NOTVALID)
~ THEN agaurora banter_anomen1
@405 /* ~Anomen Delryn, is that you? My, what a handsome young man you've become!~ */ DO ~
SetGlobal("ag_chat_anomen","GLOBAL",1)
SetGlobal("ag_atimer2","GLOBAL",1)~
= @406 /* ~Do you remember me? You used to come in with your mother. One of my best customers, she was, really knew her shoes. You used to sit in that corner and wait for her. Sometimes had a cake or two while she wasn't looking.~ */
= @407 /* ~You were such a good boy, and always helped to carry her the parcels afterwards.~ */
== ANOMENJ @408 /* ~I... remember your cakes quite well, Mistress Aurora. And how could I forget such an... extraordinary woman as yourself?~ */
== agaurora @409 /* ~Always so polite! And now you're off adventuring... Oh, they grow up so fast!~ */
= @410 /* ~Well, take a look around at the shoes. I'll give you a bit of a discount, for old times sake.~ */ DO ~
StartStore("agaurora",LastTalkedToBy())
~ EXIT

//Anomen2

CHAIN
IF WEIGHT #-1 ~
OR(2)
  Global("ag_greeting","GLOBAL",1)
  Global("ag_greeting","GLOBAL",2)
Global("ag_chat_anomen","GLOBAL",1)
!Global("SaerkPlot","GLOBAL",0)
Global("ag_atimer2","GLOBAL",0)
InParty("Anomen")
InMyArea("Anomen")
!StateCheck("Anomen",CD_STATE_NOTVALID)
~ THEN agaurora banter_anomen2
@411 /* ~Anomen, I wanted to tell you how sorry I am about Moira's death. She was such a beautiful girl, so full of life and hope.~ */ DO ~
SetGlobal("ag_chat_anomen","GLOBAL",2)
SetGlobal("ag_atimer2","GLOBAL",1)~
== ANOMENJ @412 /* ~I... thank you, Mistress Aurora.~ */
== agaurora @413 /* ~I remember her as a little girl, playing with your mother in the park... both of them laughing and laughing...~ */
== ANOMENJ @414 /* ~You remember my mother?~ */
== agaurora @415 /* ~Outside of the store? Yes. I didn't know her well, mind you. She was always so very dutiful, not to mention noble, which I am not.~ */
= @416 /* ~But we did meet, from time to time. For all her duty, she did know how to enjoy herself. I remember one night, she'd have been about sixteen then, I think, she snuck out of the house to a party.~ */
== ANOMENJ @417 /* ~She snuck out?~ */
== agaurora @418 /* ~Don't look so shocked! She was a dutiful daughter, but that doesn't mean she *never* broke the rules.~ */
= @419 /* ~As I was saying, she joined our party... uninvited, so far as I knew. She became its heart and center almost at once... flirting with all the boys there, dancing and laughing until dawn. Ah, she had a wonderful laugh, made everyone who heard it laugh with her. I didn't see her often after that. I took to adventuring, and she married your father.~ */
== ANOMENJ @420 /* ~Yes, she did.~ */
== agaurora @421 /* ~And she had you kids. She adored the two of you. She was always telling anyone who would listen what smart, beautiful, wonderful children she had.~ */
= @422 /* ~I was not usually one of the listeners, if I could help it. Children tend to bore me rather quickly.~ */
== ANOMENJ @423 /* ~I... thank you, Mistress Aurora, for sharing your memories.~ */
== agaurora @424 /* ~You're welcome, I'm sure. It's not every day I get such an attentive audience.~ */
= @425 /* ~Well, I'm sure <CHARNAME> didn't stop by just to hear me chatter.~ */ EXTERN agaurora now

//Haer'Dalis1

CHAIN
IF WEIGHT #-1 ~
OR(2)
  Global("ag_greeting","GLOBAL",1)
  Global("ag_greeting","GLOBAL",2)
Global("ag_chat_haerdalis","GLOBAL",0)
Global("ag_atimer2","GLOBAL",0)
InParty("Haerdalis")
InMyArea("Haerdalis")
!StateCheck("Haerdalis",CD_STATE_NOTVALID)
~ THEN agaurora banter_haerdalis
@426 /* ~You're the handsome actor from the Five Flagons!~ */ DO ~
SetGlobal("ag_chat_haerdalis","GLOBAL",1)
SetGlobal("ag_atimer2","GLOBAL",1)~
== HAERDAJ @427 /* ~I, my hawk?~ */
== agaurora @428 /* ~There aren't that many blue-haired elves in Athkatla. You travel with <CHARNAME>. Does that mean you are a hero offstage as well as on?~ */
== HAERDAJ @429 /* ~You tax me with your question, dear lady. Who can truly tell the space between the actor and the act? It is a task certainly far beyond this sparrow's powers.~ */
== agaurora @430 /* ~Well, you certainly talk like you are onstage.~ */
== HAERDAJ @431 /* ~What are the worlds but stages wherein we act our various parts?~ */
== agaurora @432 /* ~This world is one where you can buy shoes. Are you planning to do so?~ */
== HAERDAJ @433 /* ~Alas! The mundane asserts itself... I shall leave that decision to <CHARNAME> while I ponder the beauty of the skies, I believe.~ */
== agaurora @434 /* ~And so dreamy... Oh, but now for business.~ */ EXTERN agaurora now

//Haer'Dalis2

CHAIN
IF WEIGHT #-1 ~
OR(2)
  Global("ag_greeting","GLOBAL",1)
  Global("ag_greeting","GLOBAL",2)
Global("ag_chat_haerdalis","GLOBAL",1)
Global("ag_atimer2","GLOBAL",0)
InParty("Haerdalis")
InMyArea("Haerdalis")
!StateCheck("Haerdalis",CD_STATE_NOTVALID)
~ THEN agaurora banter_haerdalis
@82 /* ~Welcome back!~ */ DO ~
SetGlobal("ag_chat_haerdalis","GLOBAL",2)
SetGlobal("ag_atimer2","GLOBAL",1)~
== HAERDAJ @435 /* ~Might this sparrow have a moment of your time wherein he may satisfy his curiosity?~ */
== agaurora @436 /* ~If that means you want to ask me a question, go ahead.~ */
== HAERDAJ @437 /* ~How is it that a bright hawk such as yourself is tethered to a place of commerce? Would it not be better to flee such sordid ties and enjoy the pleasures of travel once more?~ */
== agaurora @438 /* ~Sordid ties? This is the finest shoe shop in all of Amn!~ */
== HAERDAJ @439 /* ~Fine or faded, 'tis not fit housing for a fighter's soul.~ */
== agaurora @440 /* ~I think *I'll* be the judge of that.~ */
= @441 /* ~As to how I came here...~ */
== HAERDAJ @442 /* ~Yes?~ */
== agaurora @443 /* ~The group I was with one year was hired to guard a shipment on its way here to Athkatla. When we arrived, we found the merchant had gone bankrupt. We took our payment in goods. As it happened, there were several pairs of good, sturdy shoes among them, and, of course, I chose to take those. The band broke up, I saw the booth here and thought, "Why not?" I've been here ever since.~ */
== HAERDAJ @444 /* ~And so a grand career ends here, amidst the smell of leather and the sound of peddlers crying their wares.~ */
== agaurora @445 /* ~And so a new career begins. Are you going to stand here all day, or are you buying?~ */ EXTERN agaurora now

//Nalia

CHAIN
IF WEIGHT #-1 ~
OR(2)
  Global("ag_greeting","GLOBAL",1)
  Global("ag_greeting","GLOBAL",2)
Global("ag_chat_nalia","GLOBAL",0)
Global("ag_atimer2","GLOBAL",0)
!Global("NaliaKeepPlot","GLOBAL",0)
InParty("Nalia")
InMyArea("Nalia")
!StateCheck("Nalia",CD_STATE_NOTVALID)
~ THEN agaurora banter_nalia
@446 /* ~Nalia D'Arnise, isn't it? How are you enjoying your travels? And how is that Isaea fellow? I hear he's after marrying you, dear girl.~ */ DO ~
SetGlobal("ag_chat_nalia","GLOBAL",1)
SetGlobal("ag_atimer2","GLOBAL",1)~
== NALIAJ @447 /* ~I am finally having the chance to help others and make a difference. Must I explain it to everyone?! I am *not* going to marry Isaea! He's a rude, belligerent pig, and I would sooner marry a horse!~ */
== agaurora @448 /* ~You won't hear me telling you to marry him! See the world while you can, and don't settle down until you have plenty of stories!~ */
= @449 /* ~But, if you don't mind my saying so, your hands do look a little chapped today.~ */
== NALIAJ @450 /* ~Oh, it's just the weather.~ */
== agaurora @451 /* ~Of course it's the weather! But you needn't let it ruin your hands.~ */
= @452 /* ~Here, try using this. It's what I used when I traveled, and it helped me to no end!~ */ DO ~
GiveItemCreate("agpotn01",LastTalkedToBy(),1,0,0)
SetGlobal("ag_lotion","GLOBAL",1)~
== NALIAJ @453 /* ~I... thank you, I suppose.~ */ EXTERN agaurora now

//PC3 Anomen

CHAIN
IF WEIGHT #-1 ~
OR(2)
  Global("ag_greeting","GLOBAL",1)
  Global("ag_greeting","GLOBAL",2)
Global("ag_chat_pc2","GLOBAL",0)
Global("ag_atimer2","GLOBAL",0)
Global("anomenromanceactive","GLOBAL",1)
IsGabber(Player1)
Gender(Player1,FEMALE)
InParty("Anomen")
InMyArea("Anomen")
!StateCheck("Anomen",CD_STATE_NOTVALID)
~ THEN agaurora banter_pc21
@454 /* ~What are you doing here?~ */ DO ~
SetGlobal("ag_chat_pc2","GLOBAL",1)
SetGlobal("ag_atimer2","GLOBAL",1)~
END
++ @455 /* ~What?!~ */ EXTERN agaurora banter_pc22
++ @456 /* ~Looking at shoes, of course.~ */ EXTERN agaurora banter_pc22
++ @457 /* ~Isn't that rather obvious?~ */ EXTERN agaurora banter_pc22
++ @458 /* ~Do you always greet people this way?~ */ EXTERN agaurora banter_pc22

CHAIN
agaurora banter_pc22
@459 /* ~If a man were looking at me the way young Delryn is looking at you, I'd think of something better than taking him to buy shoes.~ */
END
++ @460 /* ~You're imagining things. Anomen is a friend, and that's all.~ */ EXTERN agaurora banter_pc23
++ @461 /* ~Anomen? He and I can barely tolerate one another!~ */ EXTERN agaurora banter_pc24
++ @462 /* ~I've thought of a few things, from time to time. We've even put some of them into practice.~ */ EXTERN agaurora banter_pc25
++ @463 /* ~I'm hoping he'll *stop* looking at me that way.~ */ EXTERN agaurora banter_pc26
++ @464 /* ~Anomen?! Ugh. I certainly hope you're wrong!~ */ EXTERN agaurora banter_pc27
++ @465 /* ~You mean there is something better than buying new shoes?~ */ EXTERN agaurora banter_pc28
++ @466 /* ~This is really none of your business, you know.~ */ EXTERN agaurora banter_pc29

CHAIN
agaurora banter_pc23
@467 /* ~A very *close* friend, from the look of it.~ */
END
++ @461 /* ~Anomen? He and I can barely tolerate one another!~ */ EXTERN agaurora banter_pc24
++ @468 /* ~We do indulge in a certain... closeness from time to time.~ */ EXTERN agaurora banter_pc25
++ @469 /* ~I'm hoping he'll *stop* looking at me that way.~ */ EXTERN agaurora banter_pc26
++ @464 /* ~Anomen?! Ugh. I certainly hope you're wrong!~ */ EXTERN agaurora banter_pc27
++ @466 /* ~This is really none of your business, you know.~ */ EXTERN agaurora banter_pc29

CHAIN
agaurora banter_pc24
@470 /* ~Take it from me, the best lovers are the ones you can quarrel with.~ */
END
++ @471 /* ~Anomen is not and will never be my lover!~ */ EXTERN agaurora banter_pc213
++ @472 /* ~So true... and he does apologize beautifully.~ */ EXTERN agaurora banter_pc210
++ @473 /* ~I see your point.~ */ EXTERN agaurora banter_pc211
++ @474 /* ~Anomen?! Ugh! The sooner he ends his interest in me, the better!~ */ EXTERN agaurora banter_pc27
++ @466 /* ~This is really none of your business, you know.~ */ EXTERN agaurora banter_pc29

CHAIN
agaurora banter_pc25
@475 /* ~Good for you! Nothing like a little love to put spice into life!~ */
EXTERN agaurora now

CHAIN
agaurora banter_pc26
@476 /* ~What is *wrong* with you? A handsome young man is crazy about you and you're unhappy about it?~ */
END
++ @477 /* ~I'm sane, that's what's wrong with me!~ */ EXTERN agaurora banter_pc212
++ @478 /* ~I do not like whiny, temperamental young men, that's what's wrong!~ */ EXTERN agaurora banter_pc213
++ @479 /* ~He has a *terrible* temper.~ */ EXTERN agaurora banter_pc214
+ ~GlobalLT("chapter","GLOBAL",4)~ + @480 /* ~I have to save my friend. I don't have time for love!~ */ EXTERN agaurora banter_pc215
+ ~GlobalGT("chapter","GLOBAL",5)~ + @481 /* ~I am missing my soul and have to get it back from a madman. There's no time for love!~ */ EXTERN agaurora banter_pc215
++ @482 /* ~I need more time to think.~ */ EXTERN agaurora banter_pc216
++ @483 /* ~If you think he's so handsome, why don't *you* sleep with him?~ */ EXTERN agaurora banter_pc217
++ @466 /* ~This is really none of your business, you know.~ */ EXTERN agaurora banter_pc29

CHAIN
agaurora banter_pc27
@484 /* ~I tell you that a handsome young man is crazy about you and you hope I'm wrong? What's *wrong* with you?~ */
END
++ @477 /* ~I'm sane, that's what's wrong with me!~ */ EXTERN agaurora banter_pc212
++ @478 /* ~I do not like whiny, temperamental young men, that's what's wrong!~ */ EXTERN agaurora banter_pc213
++ @479 /* ~He has a *terrible* temper.~ */ EXTERN agaurora banter_pc214
+ ~GlobalLT("chapter","GLOBAL",4)~ + @480 /* ~I have to save my friend. I don't have time for love!~ */ EXTERN agaurora banter_pc215
+ ~GlobalGT("chapter","GLOBAL",5)~ + @481 /* ~I am missing my soul and have to get it back from a madman. There's no time for love!~ */ EXTERN agaurora banter_pc215
++ @482 /* ~I need more time to think.~ */ EXTERN agaurora banter_pc216
++ @483 /* ~If you think he's so handsome, why don't *you* sleep with him?~ */ EXTERN agaurora banter_pc217
++ @466 /* ~This is really none of your business, you know.~ */ EXTERN agaurora banter_pc29

CHAIN
agaurora banter_pc28
@485 /* ~The shoes will be here tomorrow. Enjoy the man while you can! Now, choose quickly and go find a nice, comfortable room at an inn somewhere.~ */ DO ~
StartStore("agaurora",LastTalkedToBy())
~ EXIT

CHAIN
agaurora banter_pc29
@486 /* ~I was just being friendly! Well, if that's the way you want it, I won't keep you from your shopping any longer!~ */ DO ~
StartStore("agaurora",LastTalkedToBy())
~ EXIT

CHAIN
agaurora banter_pc210
@487 /* ~And a good apology is worth a thousand quarrels, trust me.~ */
EXTERN agaurora now

CHAIN
agaurora banter_pc211
@488 /* ~Good! Now, I suggest you hurry up with your shopping and find a nice, quiet room in an inn to relax in.~ */ DO ~
StartStore("agaurora",LastTalkedToBy())
~ EXIT

CHAIN
agaurora banter_pc212

@489 /* ~Sanity? My dear girl, sanity is simply boredom under another name. Take your chances while you have them!~ */
EXTERN agaurora now

CHAIN
agaurora banter_pc213
@490 /* ~Well, you will have to make up your own mind, I suppose.~ */
EXTERN agaurora now

CHAIN
agaurora banter_pc214
@491 /* ~Take it from me, it's the ones you quarrel with who make the best lovers.~ */
END
++ @471 /* ~Anomen is not and will never be my lover!~ */ EXTERN agaurora banter_pc213
++ @492 /* ~So true... and he does apologize beautifully.~ */ EXTERN agaurora banter_pc210
++ @473 /* ~I see your point.~ */ EXTERN agaurora banter_pc211
++ @493 /* ~Anomen, my lover? Ugh!~ */ EXTERN agaurora banter_pc213
++ @466 /* ~This is really none of your business, you know.~ */ EXTERN agaurora banter_pc29

CHAIN
agaurora banter_pc215
@494 /* ~Take it from me, if you don't find time for love now, you'll never find the time!~ */
EXTERN agaurora now

CHAIN
agaurora banter_pc216
@495 /* ~More time? The kind of life you lead, "more time" is not an option. You may be dead tomorrow! Or he might. You need to live *now*.~ */
EXTERN agaurora now

CHAIN
agaurora banter_pc217
@496 /* ~Because he's the sort that has room for only one love at a time. Besides, I've known him since he was in diapers.~ */
EXTERN agaurora now

//PC4 Hot Day

CHAIN
IF WEIGHT #-1 ~
TimeOfDay(0)
OR(2)
  Global("ag_greeting","GLOBAL",1)
  Global("ag_greeting","GLOBAL",2)
Global("ag_chat_pc3","GLOBAL",0)
Global("ag_atimer2","GLOBAL",0)
~ THEN agaurora banter_pc31
@497 /* ~Good day to you!~ */ DO ~
SetGlobal("ag_chat_pc3","GLOBAL",1)
SetGlobal("ag_atimer2","GLOBAL",1)~
END
++ @498 /* ~And to you, Aurora.~ */ EXTERN agaurora banter_pc32
++ @499 /* ~It isn't a good day at all - what are you *talking* about?~ */ EXTERN agaurora banter_pc33
++ @500 /* ~I'm not interested in conversation, Aurora. Just show me what you're selling.~ */ DO ~
StartStore("agaurora",LastTalkedToBy())
~ EXIT
++ @501 /* ~I'm in a hurry now. We'll talk later.~ */ EXTERN agaurora now

CHAIN
agaurora banter_pc32
@502 /* ~I'm having a wonderful day, thank you.~ */
= @503 /* ~Of course, it is a bit hot. Almost makes me wish I'd gotten a shop in Waukeen's Promenade when I had the chance.~ */
END
++ @504 /* ~Why didn't you?~ */ EXTERN agaurora banter_pc34
++ @505 /* ~I rather like the weather, actually.~ */ EXTERN agaurora banter_pc35
++ @506 /* ~It *is* hot. A nice, cool shop would be very pleasant just now.~ */ EXTERN agaurora banter_pc36
++ @507 /* ~I am not interested in conversation. Just show me what you're selling.~ */ DO ~
StartStore("agaurora",LastTalkedToBy())
~ EXIT

CHAIN
agaurora banter_pc33
@508 /* ~It is a hot day to be out walking the way you are. Even standing here is hot. It almost makes me wish I'd gotten a shop in Waukeen's Promenade when I had the chance.~ */
END
++ @504 /* ~Why didn't you?~ */ EXTERN agaurora banter_pc34
++ @505 /* ~I rather like the weather, actually.~ */ EXTERN agaurora banter_pc35
++ @506 /* ~It *is* hot. A nice, cool shop would be very pleasant just now.~ */ EXTERN agaurora banter_pc36
++ @507 /* ~I am not interested in conversation. Just show me what you're selling.~ */ DO ~
StartStore("agaurora",LastTalkedToBy())
~ EXIT

CHAIN
agaurora banter_pc34
@509 /* ~Too stuffy. Can you really see me sitting inside and waiting for folks to come? Besides, folks like Rampah over there would never step inside a store. Out here, I get to talk to everyone. And this way, I always know what is going on.~ */ EXTERN agaurora now

CHAIN
agaurora banter_pc35
@510 /* ~Really? What desert did you spring from? I could use a bit of sunshine, but today's almost hot enough to make me regret not getting a shop in the Promenade.~ */
END
++ @504 /* ~Why didn't you?~ */ EXTERN agaurora banter_pc34
++ @507 /* ~I am not interested in conversation. Just show me what you're selling.~ */ DO ~
StartStore("agaurora",LastTalkedToBy())
~ EXIT

CHAIN
agaurora banter_pc36
@511 /* ~Shade would be a welcome relief. Still, there are drawbacks to a shop. Can you really see me sitting inside and waiting for folks to come? Besides, folks like Rampah over there would never step inside a store. Out here, I get to talk to everyone. And this way, I always know what is going on.~ */ EXTERN agaurora now

//Keldorn

CHAIN
IF WEIGHT #-1 ~
OR(2)
  Global("ag_greeting","GLOBAL",1)
  Global("ag_greeting","GLOBAL",2)
Global("ag_chat_keldorn","GLOBAL",0)
Global("KeldornPassesHouse","GLOBAL",0)
Global("ag_atimer2","GLOBAL",0)
InParty("Keldorn")
InMyArea("Keldorn")
!StateCheck("Keldorn",CD_STATE_NOTVALID)
~ THEN agaurora banter_keldorn
@512 /* ~Lord Firecam, it is good to see you.~ */
DO ~
SetGlobal("ag_chat_keldorn","GLOBAL",1)
SetGlobal("ag_atimer2","GLOBAL",1)~
== KELDORJ @513 /* ~A good day to you, Mistress Aurora.~ */
== agaurora @514 /* ~I have not seen you in town much, lately. Seems the Order runs you off your feet.~ */
== KELDORJ @515 /* ~It is my duty and my joy to serve Torm.~ */
== agaurora @516 /* ~Oh, of course.~ */
== agaurora @592 /* ~The Lady Maria and Vesper stopped by the other day. I tell you, that girl is getting prettier by the hour! You're going to be driving suitors away in droves.~ */
== KELDORJ @517 /* ~I am glad to hear they are well.~ */
EXTERN agaurora now

CHAIN
IF WEIGHT #-1 ~
OR(2)
  Global("ag_greeting","GLOBAL",1)
  Global("ag_greeting","GLOBAL",2)
Global("ag_chat_keldorn","GLOBAL",0)
Global("LadyMaria","GLOBAL",5)
Global("ag_atimer2","GLOBAL",0)
InParty("Keldorn")
InMyArea("Keldorn")
!StateCheck("Keldorn",CD_STATE_NOTVALID)
~ THEN agaurora banter_keldorn
@512 /* ~Lord Firecam, it is good to see you.~ */
DO ~
SetGlobal("ag_chat_keldorn","GLOBAL",1)
SetGlobal("ag_atimer2","GLOBAL",1)~
== KELDORJ @513 /* ~A good day to you, Mistress Aurora.~ */
== agaurora @514 /* ~I have not seen you in town much, lately. Seems the Order runs you off your feet.~ */
== KELDORJ @515 /* ~It is my duty and my joy to serve Torm.~ */
== agaurora @516 /* ~Oh, of course.~ */
== agaurora @592 /* ~The Lady Maria and Vesper stopped by the other day. I tell you, that girl is getting prettier by the hour! You're going to be driving suitors away in droves.~ */
== KELDORJ @518 /* ~Maria and I are very proud of both our daughters.~ */
EXTERN agaurora now

CHAIN
IF WEIGHT #-1
~
OR(2)
  Global("ag_greeting","GLOBAL",1)
  Global("ag_greeting","GLOBAL",2)
Global("ag_chat_keldorn2","GLOBAL",0)
Global("ag_atimer2","GLOBAL",0)
OR(2)
Global("LadyMaria","GLOBAL",4)
Global("KeldornFamilyGone","GLOBAL",1)
InParty("Keldorn")
InMyArea("Keldorn")
!StateCheck("Keldorn",CD_STATE_NOTVALID)~ THEN agaurora banter_keldorn2
@519 /* ~Lord Firecam, I just wanted to say how sorry I was to hear about your wife...~ */
DO ~
SetGlobal("ag_chat_keldorn2","GLOBAL",1)
SetGlobal("ag_atimer2","GLOBAL",1)~
== KELDORJ @520 /* ~Some things are better left unsaid.~ */
== agaurora @521 /* ~Oh, of course... but, all the same, I'm very sorry.~ */ EXTERN agaurora now

//Imoen1

CHAIN
IF WEIGHT #-1
~
OR(2)
  Global("ag_greeting","GLOBAL",1)
  Global("ag_greeting","GLOBAL",2)
Global("ag_chat_imoen","GLOBAL",0)
Global("ag_atimer2","GLOBAL",0)
InParty("Imoen2")
InMyArea("Imoen2")
!StateCheck("Imoen2",CD_STATE_NOTVALID)

~ THEN agaurora banter_imoen
@325 /* ~Hello there!~ */ DO ~
SetGlobal("ag_chat_imoen","GLOBAL",1)
SetGlobal("ag_atimer2","GLOBAL",1)~
== IMOEN2J @522 /* ~Heya!~ */
== agaurora @523 /* ~Hello yourself! And what can I do for you this fine day?~ */
== IMOEN2J @524 /* ~You wouldn't happen to have any boots in pink, would you?~ */
== agaurora @525 /* ~Not at the moment, but I am sure I could have a pair dyed for you. What kind are you wanting?~ */
== IMOEN2J @526 /* ~Something I can move about quietly in, you know, sneak up on people, and all that.~ */
== agaurora @527 /* ~I have just the thing! Come back in a week or so and I'll have them ready for you.~ */ DO ~
SetGlobalTimer("ag_pink_boots","GLOBAL",FIVE_DAYS)
~ EXTERN agaurora now

//Imoen2a

CHAIN
IF WEIGHT #-1 ~
OR(2)
  Global("ag_greeting","GLOBAL",1)
  Global("ag_greeting","GLOBAL",2)
GlobalTimerExpired("ag_pink_boots","GLOBAL")
Global("ag_chat_imoen","GLOBAL",1)
Global("ag_chat_imoen2a","GLOBAL",0)
InParty("Imoen2")
InMyArea("Imoen2")
!StateCheck("Imoen2",CD_STATE_NOTVALID)
~ THEN agaurora banter_imoen2a
@325 /* ~Hello there!~ */ DO ~
SetGlobal("ag_chat_imoen2a","GLOBAL",1)
SetGlobal("ag_atimer2","GLOBAL",1)~
== IMOEN2J @528 /* ~Hey Aurora!~ */
== agaurora @529 /* ~Hello, Imoen!~ */
== IMOEN2J @530 /* ~Just wondering... have you got those boots in for me yet?~ */
== agaurora @531 /* ~I certainly do!~ */
= @532 /* ~They're right here, as pretty a pair of boots of stealth as you could wish. I can sell them to you for eighteen hundred gold pieces.~ */
END
++ @533 /* ~I don't have the gold for that right now. I will come back when I do.~ */ DO ~
SetGlobal("ag_pink","GLOBAL",1)
~ EXTERN agaurora banter_imoen21
+ ~PartyGoldGT(1799)~ + @534 /* ~They certainly are... well, pink. Since Imoen wants them, though, I'm happy to pay the price.~ */ DO ~
TakePartyGold(1800)
DestroyGold(1800)
GiveItemCreate("agboot26",LastTalkedToBy(),0,0,0)
~ EXTERN agaurora now
++ @535 /* ~Eighteen hundred gold? Don't you think that's a bit high?~ */ EXTERN agaurora banter_imoen22
++ @536 /* ~I am not paying for *those*!~ */ EXTERN agaurora banter_imoen23

CHAIN
agaurora banter_imoen21
@537 /* ~They'll still be here... unless someone else buys them.~ */ EXTERN agaurora now

CHAIN
agaurora banter_imoen22
@538 /* ~Custom work costs. I think you'll find it is worth it.~ */
END
++ @539 /* ~I'm afraid I do not have the gold for that right now. I'll return when I do.~ */ DO ~
SetGlobal("ag_pink","GLOBAL",1)
~ EXTERN agaurora banter_imoen21
+ ~PartyGoldGT(1799)~ + @540 /* ~Well, they look pink enough for Imoen. Since she wants them, I guess it's worth the price.~ */ DO ~
TakePartyGold(1800)
DestroyGold(1800)
GiveItemCreate("agboot26",LastTalkedToBy(),0,0,0)
~ EXTERN agaurora now
++ @541 /* ~That's an outrageous sum! I don't think we'll be buying *those*, thanks.~ */ EXTERN agaurora banter_imoen23

CHAIN
agaurora banter_imoen23
@542 /* ~Suit yourself. I am sure I'll find another buyer for them.~ */ DO ~
SetGlobal("ag_pink","GLOBAL",2)
~ EXTERN agaurora now

//Imoen2b

CHAIN
IF WEIGHT #-1 ~
OR(2)
  Global("ag_greeting","GLOBAL",1)
  Global("ag_greeting","GLOBAL",2)
!GlobalTimerExpired("ag_pink_boots","GLOBAL")
Global("ag_chat_imoen","GLOBAL",1)
Global("ag_chat_imoen2b","GLOBAL",0)
InParty("Imoen2")
InMyArea("Imoen2")
!StateCheck("Imoen2",CD_STATE_NOTVALID)
~ THEN agaurora banter_imoen2b
@325 /* ~Hello there!~ */ DO ~
SetGlobal("ag_chat_imoen2b","GLOBAL",1)
SetGlobal("ag_atimer2","GLOBAL",1)~
== IMOEN2J @528 /* ~Hey Aurora!~ */
== agaurora @529 /* ~Hello, Imoen!~ */
== IMOEN2J @530 /* ~Just wondering... have you got those boots in for me yet?~ */
== agaurora @543 /* ~Good work takes time. Come back in a few days and they'll be ready.~ */ EXTERN agaurora now

//Minsc1

CHAIN
IF WEIGHT #-1 ~
OR(2)
  Global("ag_greeting","GLOBAL",1)
  Global("ag_greeting","GLOBAL",2)
Global("ag_chat_minsc","GLOBAL",0)
Global("ag_atimer2","GLOBAL",0)
InParty("Minsc")
InMyArea("Minsc")
!StateCheck("Minsc",CD_STATE_NOTVALID)
~ THEN agaurora banter_minsc1
@544 /* ~Is that a mouse on my table?!~ */ DO ~
SetGlobal("ag_chat_minsc","GLOBAL",1)
SetGlobal("ag_atimer2","GLOBAL",1)~
== MINSCJ @545 /* ~Boo is no mouse! Boo is a miniature giant space hamster!~ */
== agaurora @546 /* ~Ah... I see. Could you please get Boo off my counter before he makes a miniature giant mess?~ */
== MINSCJ @547 /* ~Boo would not make a mess of a friend's shoes! Boo does not make messes... Eh, well, he sometimes scatters cracker crumbs, but Minsc does too. Crumbs are hard to keep from falling.~ */
== agaurora @548 /* ~Are you sure he won't chew on the leather?~ */
== MINSCJ @549 /* ~Minsc is very sure!~ */
== agaurora @550 /* ~See to it that he doesn't, or you'll be the one paying.~ */ EXTERN agaurora now

//Minsc2

CHAIN
IF WEIGHT #-1 ~
OR(2)
  Global("ag_greeting","GLOBAL",1)
  Global("ag_greeting","GLOBAL",2)
Global("ag_chat_minsc","GLOBAL",1)
Global("ag_atimer2","GLOBAL",0)
InParty("Minsc")
InMyArea("Minsc")
!StateCheck("Minsc",CD_STATE_NOTVALID)
~ THEN agaurora banter_minsc2
@551 /* ~How is Boo today?~ */ DO ~
SetGlobal("ag_chat_minsc","GLOBAL",2)
SetGlobal("ag_atimer2","GLOBAL",1)~
== MINSCJ @552 /* ~Boo says he is doing very well, though perhaps a little hungry.~ */
== agaurora @553 /* ~A little hungry? Well, I have some cookies here for him, and for you, if you can keep the crumbs off the counter.~ */
== MINSCJ @554 /* ~Oh, that is easy! We will eat them over where the little birds can have what falls.~ */ EXTERN agaurora now

//Jaheira

CHAIN
IF WEIGHT #-1 ~
OR(2)
  Global("ag_greeting","GLOBAL",1)
  Global("ag_greeting","GLOBAL",2)
Global("ag_chat_jaheira","GLOBAL",0)
Global("ag_atimer2","GLOBAL",0)
InParty("Jaheira")
InMyArea("Jaheira")
!StateCheck("Jaheira",CD_STATE_NOTVALID)
~ THEN agaurora banter_jaheira
@555 /* ~You're a druid, right?~ */ DO ~
SetGlobal("ag_chat_jaheira","GLOBAL",1)
SetGlobal("ag_atimer2","GLOBAL",1)~
== JAHEIRAJ @556 /* ~I am.~ */
== agaurora @557 /* ~I've never understood why anyone would want to leave the city for a bunch of rocks and trees.~ */
== JAHEIRAJ @558 /* ~And *I* have never understood the need for the noise and filth of the cities.~ */
== agaurora @559 /* ~It takes all kinds, they say.~ */ EXTERN agaurora now

//Viconia

CHAIN
IF WEIGHT #-1 ~
OR(2)
  Global("ag_greeting","GLOBAL",1)
  Global("ag_greeting","GLOBAL",2)
Global("ag_chat_viconia","GLOBAL",0)
Global("ag_atimer2","GLOBAL",0)
InParty("Viconia")
InMyArea("Viconia")
!StateCheck("Viconia",CD_STATE_NOTVALID)
~ THEN agaurora banter_viconia
@560 /* ~So, I hear that drow are pretty good in the bedroom.~ */ DO ~
SetGlobal("ag_chat_viconia","GLOBAL",1)
SetGlobal("ag_atimer2","GLOBAL",1)~
== VICONIJ @561 /* ~The drow are practitioners of the erotic arts, yes. What is it you want from me, rivvil? Tips, perhaps?~ */
== agaurora @562 /* ~Well, girl-to-girl, and all.~ */
== VICONIJ @563 /* ~The drow do *not* serve as teachers for the lesser races, unless they are slaves, and I doubt that such as you would last beyond the first night of breaking.~ */
== agaurora @564 /* ~You could just say no.~ */
= @565 /* ~And, it's not as though I am doing badly on my own.~ */
== VICONIJ @566 /* ~Do not flatter yourself, frumpish one. I'm sure your pathetic exertions might please these surface scum, but your skills are nothing compared to mine.~ */
== agaurora @567 /* ~You don't say.~ */ EXTERN agaurora now

//Cernd

CHAIN
IF WEIGHT #-1 ~
OR(2)
  Global("ag_greeting","GLOBAL",1)
  Global("ag_greeting","GLOBAL",2)
Global("ag_chat_cernd","GLOBAL",0)
Global("ag_atimer2","GLOBAL",0)
InParty("Cernd")
InMyArea("Cernd")
!StateCheck("Cernd",CD_STATE_NOTVALID)
~ THEN agaurora banter_cernd
@568 /* ~Haven't I seen you around before?~ */ DO ~
SetGlobal("ag_chat_cernd","GLOBAL",1)
SetGlobal("ag_atimer2","GLOBAL",1)~
== CERNDJ @569 /* ~I lived in this city for a time, but Nature called me back into her service, and so I went willingly. The city and its crowds have but little appeal to me.~ */
== agaurora @570 /* ~I can tell. So... You do wear shoes, don't you?~ */
== CERNDJ @571 /* ~Of course. Why would I not?~ */
== agaurora @572 /* ~You struck me as a bit... non-traditional.~ */ EXTERN agaurora now

//Mazzy

CHAIN
IF WEIGHT #-1 ~
OR(2)
  Global("ag_greeting","GLOBAL",1)
  Global("ag_greeting","GLOBAL",2)
Global("ag_chat_mazzy","GLOBAL",0)
Global("ag_atimer2","GLOBAL",0)
InParty("Mazzy")
InMyArea("Mazzy")
!StateCheck("Mazzy",CD_STATE_NOTVALID)
~ THEN agaurora banter_mazzy
@573 /* ~I don't get many halflings here. I am not sure I have any shoes that will fit... I don't have that many children's shoes.~ */ DO ~
SetGlobal("ag_chat_mazzy","GLOBAL",1)
SetGlobal("ag_atimer2","GLOBAL",1)~
== MAZZYJ @574 /* ~I do not know why you people persist on thinking of us as children, for I, at least, am noticeably older than you, Aurora. I will thank you to reconsider your opinions.~ */
== agaurora @575 /* ~I was talking about your *shoe size*, not your character. Now, let me see... These might fit, but they are not suited for a warrior.~ */
== MAZZYJ @576 /* ~The purchase of supplies is in <CHARNAME>'s hands, and <PRO_HESHE> knows my thoughts on the matter.~ */
== agaurora @577 /* ~That is for the best, I am sure.~ */ EXTERN agaurora now

//Kelsey

CHAIN
IF WEIGHT #-1 ~
OR(2)
  Global("ag_greeting","GLOBAL",1)
  Global("ag_greeting","GLOBAL",2)
Global("ag_chat_kelsey","GLOBAL",0)
Global("ag_atimer2","GLOBAL",0)
InParty("j#kelsey")
InMyArea("j#kelsey")
!StateCheck("j#kelsey",CD_STATE_NOTVALID)
~ THEN agaurora banter_kelsey
@692 /* ~Kelsey Coltrane! Is that you?~ */ DO ~
SetGlobal("ag_chat_kelsey","GLOBAL",1)
SetGlobal("ag_atimer2","GLOBAL",1)~
== IF_FILE_EXISTS j#klsyj @693 /* ~Uh, yes?~ */
== agaurora @694 /* ~Where are those shoes I ordered? They should have been here weeks ago!~ */
== IF_FILE_EXISTS j#klsyj @695 /* ~Um, I'm not on Company business just now, Mistress Aurora, but-~ */
== agaurora @696 /* ~Then whose business *are* you on?~ */
== IF_FILE_EXISTS j#klsyj @697 /* ~I'm traveling with <CHARNAME> and helping <PRO_HIMHER> in <PRO_HISHER> quest.~ */
== agaurora @698 /* ~Adventuring, is it?~ */
== IF_FILE_EXISTS j#klsyj @699 /* ~Well, yes. You could put it that way.~ */
== agaurora @700 /* ~Then watch yourself. And if you see that uncle of yours, tell him I still want those shoes!~ */ EXTERN agaurora now

//Solaufein

CHAIN
IF WEIGHT #-1 ~
OR(2)
  Global("ag_greeting","GLOBAL",1)
  Global("ag_greeting","GLOBAL",2)
Global("ag_chat_sola","GLOBAL",0)
Global("ag_atimer2","GLOBAL",0)
InParty("sola")
InMyArea("sola")
!StateCheck("sola",CD_STATE_NOTVALID)
~ THEN agaurora banter_sola
@701 /* ~A drow traveling on the surface? How unusual! Is there anything I can get for you?~ */ DO ~
SetGlobal("ag_chat_sola","GLOBAL",1)
SetGlobal("ag_atimer2","GLOBAL",1)~
== IF_FILE_EXISTS sola @702 /* ~Do you have any books of poetry?~ */
== agaurora @703 /* ~No, unfortunately I don't. Never was much for books, myself. Essel, now, he used to enjoy them. Many's the night we sat together while he recited poetry...~ */
== IF_FILE_EXISTS sola @704 /* ~Perhaps this Essel would have a book I could buy then. Do you know where he is?~ */
== agaurora @705 /* ~He died, poor fellow. Eight? Or was it ten years ago? Haven't met anyone like him since.~ */
== IF_FILE_EXISTS sola @706 /* ~I have heard human poets say "The life of man is like a winter feast around a blazing fire, while the storm howls or the snow drifts abroad. A distressed sparrow darts within the doorway: for a moment it is cheered by warmth and shelter from the blast; then, shooting through the other entrance, it is lost again. Such is man. He comes we know not whence, hastily snatches a scanty share of worldly pleasure, then goes we know not whither."~ */
== agaurora @707 /* ~Essel would have loved that... (sigh) Here. I may not have any books for you, but these should make your life little easier. It can't be easy, being a drow on the surface.~ */
DO ~
GiveItemCreate("agboot23",LastTalkedToBy(),0,0,0)~
== IF_FILE_EXISTS sola @708 /* ~I... thank you.~ */
== agaurora @709 /* ~Think nothing of it. I love a man who can recite poetry.~ */ EXTERN agaurora now

//Hubelpot (only one of these will fire)
//If before Hubelpot's quest is taken care of:

CHAIN
IF WEIGHT #-1 ~
OR(2)
  Global("ag_greeting","GLOBAL",1)
  Global("ag_greeting","GLOBAL",2)
GlobalLT("SC#HubPlot","GLOBAL",5)
Global("ag_chat_hub","GLOBAL",0)
Global("ag_atimer2","GLOBAL",0)
InParty("hubelpot")
InMyArea("hubelpot")
!StateCheck("hubelpot",CD_STATE_NOTVALID)
~ THEN agaurora banter_hubelpot
@710 /* ~Hubelpot! What are you doing with this lot? And is that a *weapon* I see you carrying?~ */ DO ~
SetGlobal("ag_chat_hub","GLOBAL",1)
SetGlobal("ag_atimer2","GLOBAL",1)~
== IF_FILE_EXISTS sc#hubj @711 /* ~Aye, well, th' <LADYLORD> <CHARNAME> is helpin' meh wi' th' little matter o' th' missin' gold.~ */
== agaurora @712 /* ~I remember Morag saying something about gold disappearing. I'm glad you've found someone to help you with that.~ */
== agaurora @713 /* ~Now don't you be getting yourself killed! Athkatla's got plenty of warriors, but not so many honest merchants that we can be sparing one!~ */
== IF_FILE_EXISTS sc#hubj @714 /* ~Ah... thank ye. Ah'll be careful.~ */
== agaurora @715 /* ~See that you are!~ */ EXTERN agaurora now

//If Hubelpot's quest has been solved:

CHAIN
IF WEIGHT #-1 ~
OR(2)
  Global("ag_greeting","GLOBAL",1)
  Global("ag_greeting","GLOBAL",2)
GlobalGT("SC#HubPlot","GLOBAL",4)
Global("ag_chat_hub","GLOBAL",0)
Global("ag_atimer2","GLOBAL",0)
InParty("hubelpot")
InMyArea("hubelpot")
!StateCheck("hubelpot",CD_STATE_NOTVALID)
~ THEN agaurora banter_hubelpot
@710 /* ~Hubelpot! What are you doing with this lot? And is that a *weapon* I see you carrying?~ */ DO ~
SetGlobal("ag_chat_hub","GLOBAL",1)
SetGlobal("ag_atimer2","GLOBAL",1)~
== IF_FILE_EXISTS sc#hubj @716 /* ~Aye, well, th' <LADYLORD> <CHARNAME> helped meh te recover th' guild's gold, an' Ah'm travelin' wi' <PRO_HIMHER> te help repay th' favor.~ */
== agaurora @717 /* ~I remember Morag saying something about the trouble; I'm glad you hear someone's helped you get the gold back.~ */
== agaurora @718 /* ~You be careful out there, you hear? Athkatla's got plenty of warriors, but not so many honest merchants that we can be sparing one!~ */
== IF_FILE_EXISTS sc#hubj @714 /* ~Ah... thank ye. Ah'll be careful.~ */
== agaurora @715 /* ~See that you are!~ */ EXTERN agaurora now

//Key Point

CHAIN
agaurora now
@578 /* ~Is there anything I can do for you today?~ */
END
++ @579 /* ~Have you any gossip to share?~ */ EXTERN agaurora gossip
++ @580 /* ~I would like to see your wares, please.~ */ DO ~
StartStore("agaurora",LastTalkedToBy())
~ EXIT
++ @581 /* ~Nothing today, thank you.~ */ EXIT
++ @382 /* ~I don't want to hear anything from you, ever again.~ */ DO ~
SetGlobal("ag_greeting","GLOBAL",3)~ EXIT
+ ~!Dead("agtomtha") !Dead("agtsleep") Global("ag_aurora_tom","GLOBAL",0) Global("ag_tommeet","GLOBAL",1)~ + @686 /* ~The other night, I met a... delightful gnome by the name of Tomthal manning your stand.~ */ DO ~SetGlobal("ag_aurora_tom","GLOBAL",1)~ EXTERN agaurora tomthal // at end
+ ~OR(2) Dead("agtomtha") Dead("agtsleep") Global("ag_aurora_tom","GLOBAL",0)~ + @687 /* ~The other night, I came across an... interesting gnome. Do you know him?~ */ DO ~SetGlobal("ag_aurora_tom","GLOBAL",1)~ EXTERN agaurora tomthal2 // at end
+ ~Global("ag_pink","GLOBAL",1)
PartyGoldGT(1799)~ + @582 /* ~I want to buy those pink boots Imoen asked you to make.~ */ EXTERN agaurora pink_boots
+ ~Global("ag_lotion","GLOBAL",1)
GlobalLT("ag_buy_lotion","GLOBAL",10)
~ + @583 /* ~Have you got more of those lotions you gave to Nalia?~ */ EXTERN agaurora hand_lotion1
+ ~Global("ag_lotion","GLOBAL",1)
Global("ag_buy_lotion","GLOBAL",10)
~ + @583 /* ~Have you got any more of that lotion you gave to Nalia?~ */ EXTERN agaurora hand_lotion2
+ ~Global("ag_balm","GLOBAL",1)
GlobalLT("ag_buy_balm","GLOBAL",10)
~ + @584 /* ~Have you got any more of that muscle balm?~ */ EXTERN agaurora muscle_balm1
+ ~Global("ag_balm","GLOBAL",1)
Global("ag_buy_balm","GLOBAL",10)
~ + @584 /* ~Have you got any more of that muscle balm?~ */ EXTERN agaurora muscle_balm2
+ ~Global("ag_aran","GLOBAL",0) Global("E3ARANSMUMEXISTS","GLOBAL",1)~ + @719 /* ~I came across a... lady in a house north of here. Isn't that your house? You never mentioned a roommate...~ */ DO ~SetGlobal("ag_aran","GLOBAL",1)~ + agarans_mum
+ ~GlobalTimerExpired("ag_lissa_timer","GLOBAL") NumTimesTalkedToGT(1) Global("agaur_upgrade","GLOBAL",0)~ + @612 /* ~I'm curious if you can provide other products than those you've got in stock.~ */ + agaur_up_service
+ ~Global("agaur_upgrade","GLOBAL",1)~ + @613 /* ~I want to talk about your enchanter acquaintance.~ */ + agaur_up_help
+ ~Global("agaur_upgrade","GLOBAL",2) GlobalTimerExpired("agaur_upgrade_timer","GLOBAL")~ + @614 /* ~So, what about the enchanter?~ */ + agaur_up_info
+ ~Global("agaur_upgrade","GLOBAL",3)~ + @615 /* ~Do I have anything that can be used for enchanting?~ */ + agaur_up_check
+ ~Global("agaur_upgrade","GLOBAL",4) GlobalTimerExpired("agaur_upgrade_timer","GLOBAL")~ + @616 /* ~So, what about my order?~ */ + agaur_up_love_give
+ ~Global("agaur_upgrade","GLOBAL",5) GlobalTimerExpired("agaur_upgrade_timer","GLOBAL")~ + @616 /* ~So, what about my order?~ */ + agaur_up_armored_give
+ ~Global("agaur_upgrade","GLOBAL",6) GlobalTimerExpired("agaur_upgrade_timer","GLOBAL")~ + @616 /* ~So, what about my order?~ */ + agaur_up_daemon_give

//Pink Boots

CHAIN
agaurora pink_boots
@585 /* ~Ah, those lovely boots. I still have them here, all ready for Imoen.~ */
END
++ @533 /* ~I don't have the gold for that right now. I will come back when I do.~ */ DO ~
SetGlobal("ag_pink","GLOBAL",1)
~ EXTERN agaurora banter_imoen21
+ ~PartyGoldGT(1799)~ + @534 /* ~They certainly are... well, pink. Since Imoen wants them, though, I'm happy to pay the price.~ */ DO ~
TakePartyGold(1800)
DestroyGold(1800)
GiveItemCreate("agboot26",LastTalkedToBy(),0,0,0)
~ EXTERN agaurora now
++ @535 /* ~Eighteen hundred gold? Don't you think that's a bit high?~ */ EXTERN agaurora banter_imoen22
++ @536 /* ~I am not paying for *those*!~ */ EXTERN agaurora banter_imoen23

//Hand Lotion

CHAIN
agaurora hand_lotion1
@586 /* ~Yes. But if you need more, I have to charge for it. After all, I *am* running a business, and it is an exclusive recipe. They're 100 gold each, for friends such as yourself.~ */
END
+ ~PartyGoldGT(99)~ + @587 /* ~All right.~ */ DO ~
GiveItemCreate("agpotn01",LastTalkedToBy(),1,0,0)
TakePartyGold(100)
DestroyGold(100)
IncrementGlobal("ag_buy_balm","GLOBAL",1)~ EXTERN agaurora now
++ @588 /* ~I've changed my mind.~ */ EXTERN agaurora now

CHAIN
agaurora hand_lotion2
@589 /* ~Sorry, but I've run out of them.~ */ EXTERN agaurora now

//Muscle Balm

CHAIN
agaurora muscle_balm1
@590 /* ~So, you've found it to be useful? I have a few here, but I fear I can't give them for free. What about 35 gold coins for one?~ */
END
+ ~PartyGoldGT(35)~ + @587 /* ~All right.~ */ DO ~
GiveItemCreate("agpotn02",LastTalkedToBy(),1,0,0)
TakePartyGold(35)
DestroyGold(35)
IncrementGlobal("ag_buy_balm","GLOBAL",1)~ EXTERN agaurora now
++ @591 /* ~I've changed my mind.~ */ EXTERN agaurora now

CHAIN
agaurora muscle_balm2
@589 /* ~Sorry, but I've run out of them.~ */ EXTERN agaurora now

//Fade (Aran's Mother)

APPEND IF_FILE_EXISTS e3fadej
IF ~~ THEN BEGIN ag_fade1
SAY @737 /* ~You can say that again.~ */
IF ~~ THEN EXTERN agaurora now
END
END

APPEND agaurora
IF
~~ agarans_mum
SAY @720 /* ~Ah yes... good old Mrs. Linvail. I rented the ground floor to her. I'm hardly ever there, so we rarely see each other. Which is probably for the best.~ */
++ @721 /* ~She's... an interesting woman.~ */ + agaransm2
++ @722 /* ~A bit mad, isn't she?~ */ + agaransm2
++ @726 /* ~I see... May I see your stock?~ */ + agaur_store
END

IF
~~ agaransm2
SAY @723 /* ~Oh, she's madder than a mutated gibberling. Whatever you do, don't try her cakes. And that cat of hers! Thank Tymora it doesn't like going upstairs. Ha! If she only knew...~ */
++ @724 /* ~Go on.~ */ + agaransm3
++ @725 /* ~Knew what?~ */ + agaransm3
++ @726 /* ~I see... May I see your stock?~ */ + agaur_store
END

IF
~~ agaransm3
SAY @727 /* ~If she only knew a gnome lived in the cellar... well, there's no telling what she'd do. But then she doesn't know her own son is a thief.~ */
++ @728 /* ~Why doesn't she like gnomes?~ */ + agaransm4
++ @729 /* ~Her own son, a thief?~ */ + agaransm5
+ ~!Dead("agtomtha") !Dead("agtsleep")~ + @730 /* ~There's a gnome in your cellar?~ */ + agaransm6
+ ~OR(2) Dead("agtomtha") Dead("agtsleep")~ + @730 /* ~There's a gnome in your cellar?~ */ + agaransm7
++ @726 /* ~I see... May I see your stock?~ */ + agaur_store
END

IF
~~ agaransm4
SAY @731 /* ~Who knows? She claims it has something to do with her son employing them, but she's always on about the "randy little buggers" wanting to ravish her. Fantasy, no doubt. I daresay our Tomthal would rather jump into bed with a goblin than with the likes of her.~ */
++ @732 /* ~You said her son is a thief?~ */ + agaransm5
+ ~!Dead("agtomtha") !Dead("agtsleep")~ + @730 /* ~There's a gnome in your cellar?~ */ + agaransm6
+ ~OR(2) Dead("agtomtha") Dead("agtsleep")~ + @730 /* ~There's a gnome in your cellar?~ */ + agaransm7
++ @726 /* ~I see... May I see your stock?~ */ + agaur_store
END

IF
~~ agaransm5
SAY @733 /* ~Oh yes, Aran's the head of the Shadow Thieves, everyone knows that! Almost everyone, anyway... everyone but his own mother. Daft old biddy.~ */
+ ~InParty("e3fade") InMyArea("e3fade") !StateCheck("e3fade",CD_STATE_NOTVALID)~ + ~~ EXTERN IF_FILE_EXISTS e3fadej ag_fade1
++ @726 /* ~I see... May I see your stock?~ */ + agaur_store
END

IF
~~ agaransm6
SAY @734 /* ~Oh yes, Tomthal, my night attendant, sleeps there during the day. Says it makes him feel closer to his home, being underground.~ */
++ @735 /* ~Mrs. Linvail's son is a thief?~ */ + agaransm5
++ @726 /* ~I see... May I see your stock?~ */ + agaur_store
END

IF
~~ agaransm7
SAY @736 /* ~Well there *was* a gnome in the cellar... Tomthal, my night attendant. He used to sleep there during the day. But he's dead now...~ */
++ @735 /* ~Mrs. Linvail's son is a thief?~ */ + agaransm5
++ @726 /* ~I see... May I see your stock?~ */ + agaur_store
END

//////////////////////////////////
//Below is the item upgrade code//
//////////////////////////////////

IF
~~ agaur_up_service
SAY @617 /* ~Ha ha! Really now, <GABBER>, you must be joking! Do I not have enough footwear for you and your cohorts in stock? Why do you ask, anyway?~ */
++ @618 /* ~Just curious, as I said. So have you got anything else?~ */ + agaur_up_curious
++ @619 /* ~Oh, your shoes are fine enough, to be sure. But I thought perhaps with your skill there is room for improvement. I'll pay handsomely, of course.~ */ + agaur_up_pay_gold
++ @620 /* ~Well, nevermind. Let's get back to usual business.~ */ + agaur_store
END

IF
~~ agaur_up_curious
SAY @621 /* ~Well, <GABBER>, I can do many things, some of which would no doubt surprise you. But you ask a lot. I do fill special orders from time to time, but not without a price. If you have something in mind, run it by me and I'll see if I can do anything.~ */
++ @622 /* ~You have some fancy enchanted boots for sale, so you should have some connections. Is it possible to secure a special deal?~ */ + agaur_up_special
++ @623 /* ~I wonder if you can provide special goods not usually available for sale.~ */ + agaur_up_special
++ @620 /* ~Well, nevermind. Let's get back to usual business.~ */ + agaur_store
END

IF
~~ agaur_up_pay_gold
SAY @624 /* ~Well, why didn't you say it's about business from the start? Ordinarily, I'd see to it at once, but my time and skills are... limited. What exactly are you looking for?~ */
++ @622 /* ~You have some fancy enchanted boots for sale, so you should have some connections. Is it possible to secure a special deal?~ */ + agaur_up_special
++ @623 /* ~I wonder if you can provide special goods not usually available for sale.~ */ + agaur_up_special
++ @620 /* ~Well, nevermind. Let's get back to usual business.~ */ + agaur_store
END

IF
~~ agaur_up_special
SAY @625 /* ~Hmm, I'm not sure. It's not like my usual vendors will have something of the sort. You might be better off hiring a professional enchanter who'll enhance the boots. Not that I know an enchanter. However, on the other hand... hmm. Well, I might, but he's not exactly what you might expect from a licensed specialist.~ */
= @626 /* ~You see, he doesn't do much enchanting himself, but instead hacks around with items that are already enchanted. I have no clue as to whether it's intentional or because he's a simpleton who can't comprehend the basic magical arts. I've got no magical skill myself, so I'm just surmising. Between you and me, of course... we wouldn't want any rumors to start, would we?~ */
= @627 /* ~For a certain price he can retool some materials and make them work better than before. But there's an issue, now that I think of it. Last I heard, he was short on supplies, much like I am, so I doubt he can be compelled to work even if you pay fifteen thousand gold coins.~ */
++ @628 /* ~Indeed that's a heavy sum. But before I consider it, what can I expect from that acquaintance of yours?~ */ DO ~SetGlobal("agaur_upgrade","GLOBAL",1)~ + agaur_up_problem
+ ~PartyGoldGT(14999)~ + @629 /* ~I've got money. Will you tell me more?~ */ DO ~SetGlobal("agaur_upgrade","GLOBAL",1)~ + agaur_up_problem
+ ~PartyGoldGT(24999)~ + @630 /* ~I can afford that much, or more if needed. I want to know the details.~ */ DO ~SetGlobal("agaur_upgrade","GLOBAL",1)~ + agaur_up_problem
++ @631 /* ~Even?~ */ DO ~SetGlobal("agaur_upgrade","GLOBAL",1)~ + agaur_up_exactly
END

IF
~~ agaur_up_problem
SAY @632 /* ~Oh, <GABBER>, you *are* cute! I said *even* if you pay that much. He simply has no materials to work on, that's the problem. So you have to bide your time a bit. But since you're interested in this, you'll hear from me when the situation changes.~ */
++ @633 /* ~Can the situation be helped one way or another? I would really appreciate an improvement in my equipment. Preferably sooner than later.~ */ + agaur_up_help
++ @634 /* ~And when roughly am I to expect your friend to get back into work?~ */ + agaur_up_not_friend
++ @635 /* ~What kind of material does he need?~ */ + agaur_up_help
++ @636 /* ~A pity. Let's leave this matter for a better time then.~ */ + agaur_store
END

IF
~~ agaur_up_exactly
SAY @637 /* ~Precisely. He has no materials to work on, so however much you pay it won't make them appear anytime soon. But since you're interested, you'll hear from me when the situation changes.~ */
++ @633 /* ~Can the situation be helped one way or another? I would really appreciate an improvement in my equipment. Preferably sooner than later.~ */ + agaur_up_help
++ @634 /* ~And when roughly am I to expect your friend to get back into work?~ */ + agaur_up_not_friend
++ @635 /* ~What kind of material does he need?~ */ + agaur_up_help
++ @636 /* ~A pity. Let's leave this matter for a better time then.~ */ + agaur_store
END

IF
~~ agaur_up_not_friend
SAY @638 /* ~Friend? Well... you might say that... at one time anyway. But as for when, I know no better than you do.~ */
++ @683 /* ~I see.~ */ + agaur_up_help
++ @684 /* ~Tell me more.~ */ + agaur_up_help
END

IF
~~ agaur_up_help
SAY @640 /* ~Oh, <GABBER>, he doesn't do enchantments, he refashions them! So he needs certain materials, things not easily gotten in your average shop. In other words, he takes enchanted items and messes with them a bit. Usually, something better results from his tinkering. Though not always. So I've heard...~ */
++ @641 /* ~Are these materials something I can provide?~ */ + agaur_up_how
++ @642 /* ~Do you know exactly which items he needs?~ */ + agaur_up_how
++ @643 /* ~I have plenty of magical things. What will do?~ */ + agaur_up_how
END

IF
~~ agaur_up_how
SAY @644 /* ~I'm, ah... not exactly on great terms with him anymore, <GABBER>. If you really do wish, I can send him a query, but he'll want a bit of coin. Five hundred should be enough, I suppose.~ */
+ ~PartyGoldGT(499)~ + @645 /* ~Here you go.~ */ + agaur_up_query
++ @646 /* ~Can you instead introduce me to him?~ */ + agaur_up_introduce
++ @647 /* ~Later, then. Let's get back to usual business.~ */ + agaur_store
END

IF
~~ agaur_up_introduce
SAY @648 /* ~Well... he's a bit reclusive. An odd fellow. Not exactly the sort of person you'd care to meet, nor does he care to meet others.~ */
+ ~PartyGoldGT(499)~ + @649 /* ~Fine, here are your coins.~ */ + agaur_up_query
++ @647 /* ~Later, then. Let's get back to usual business.~ */ + agaur_store
END

IF
~~ agaur_up_query
SAY @650 /* ~Excellent. It takes a little time to get a response from him, so come back tomorrow. I'll tell you what I find out.~ */
++ @651 /* ~Great. Now let's get back to usual business.~ */ DO ~SetGlobal("agaur_upgrade","GLOBAL",2) SetGlobalTimer("agaur_upgrade_timer","GLOBAL",6000) TakePartyGold(500) DestroyGold(500)~ + agaur_store
++ @652 /* ~See you tomorrow then. Good day.~ */ DO ~SetGlobal("agaur_upgrade","GLOBAL",2) SetGlobalTimer("agaur_upgrade_timer","GLOBAL",6000) TakePartyGold(500) DestroyGold(500)~ EXIT
END

IF
~~ agaur_up_info
SAY @653 /* ~Yes, I have the details you've paid so well for. He told me what kind of materials he needs. Unfortunately, I'm no magician and can't always discern if the enchantment is good enough or not. But I know my boots at least - that much is certain. So, is there anything I can help you with?~ */
++ @654 /* ~Will anything I have do?~ */ DO ~SetGlobal("agaur_upgrade","GLOBAL",3)~ + agaur_up_check
++ @655 /* ~For now, let's get back to usual business.~ */ DO ~SetGlobal("agaur_upgrade","GLOBAL",3)~ + agaur_store
END

IF
~~ agaur_up_love
SAY @656 /* ~According to what I know, it's possible to combine the Stylish Boots of the Cheetah with the shoes called "Love Lies Bleeding." The process also requires a fire opal to bind the enchantment. The work takes about a day, so come back later. The cost is fifteen thousand gold coins. I'll need half now and the other half when the new boots are done.~ */
+ ~OR(4)
PartyHasItem("boot04")
PartyHasItem("agboot21")
PartyHasItem("agboot22")
PartyHasItem("agboot23")~ + @657 /* ~Tell me about armored boots.~ */ + agaur_up_armored
+ ~OR(2)
PartyHasItem("agboot31")
PartyHasItem("boot01")~ + @658 /* ~Tell me about daemon boots.~ */ + agaur_up_daemon
+ ~PartyGoldGT(7499)
PartyHasItem("aggem08")
PartyHasItem("agboot09")
PartyHasItem("agboot19")~ + @659 /* ~Sounds good to me. Here you go.~ */ + agaur_up_love_do
++ @660 /* ~Another time, perhaps. For now, let's talk about usual business.~ */ + agaur_store
END

IF
~~ agaur_up_armored
SAY @661 /* ~It seems you can combine all three colors of my Everyday Boots with the Boots of Avoidance to make a pair giving the wearer a truly remarkable armor protection. Anyone who isn't a jester might find them a bit... flashy... but there's nothing wrong with that, is there? The process also requires a bandfire opal, two days of labor and twenty-five thousand gold. Half now, half later.~ */
+ ~OR(2)
PartyHasItem("agboot09")
PartyHasItem("agboot19")~ + @662 /* ~Tell me about fast, sexy boots.~ */ + agaur_up_love
+ ~OR(2)
PartyHasItem("agboot31")
PartyHasItem("boot01")~ + @658 /* ~Tell me about daemon boots.~ */ + agaur_up_daemon
++ @663 /* ~I thought the talk was about fifteen thousand gold at most?~ */ + agaur_up_cost
+ ~PartyGoldGT(12499)
PartyHasItem("aggem09")
PartyHasItem("boot04")
PartyHasItem("agboot21")
PartyHasItem("agboot22")
PartyHasItem("agboot23")~ + @664 /* ~Flashy *and* protective? We have a deal.~ */ + agaur_up_armored_do
++ @660 /* ~Another time, perhaps. For now, let's talk about usual business.~ */ + agaur_store
END

IF
~~ agaur_up_daemon
SAY @665 /* ~You may have heard of the half-elf, half-fiend crossbreeds known as the daemonfey. Or perhaps not, since they all but vanished from history thousands of years ago. It is difficult to improve the powerful Daemonfey Boots, but my roguish associate has a few nasty tricks up his voluminous sleeves. He'll combine these with the Boots of Speed and a star ruby for a mere thirty-five thousand. Half now, the rest when he's finished in three days.~ */
+ ~OR(2)
PartyHasItem("agboot09")
PartyHasItem("agboot19")~ + @662 /* ~Tell me about fast, sexy boots.~ */ + agaur_up_love
+ ~OR(4)
PartyHasItem("boot04")
PartyHasItem("agboot21")
PartyHasItem("agboot22")
PartyHasItem("agboot23")~ + @657 /* ~Tell me about armored boots.~ */ + agaur_up_armored
++ @663 /* ~I thought the talk was about fifteen thousand gold at most?~ */ + agaur_up_cost
+ ~PartyGoldGT(17499)
PartyHasItem("aggem02")
PartyHasItem("agboot31")
PartyHasItem("boot01")~ + @666 /* ~It better be worth it. Here you go.~ */ + agaur_up_daemon_do
++ @660 /* ~Another time, perhaps. For now, let's talk about usual business.~ */ + agaur_store
END

IF
~~ agaur_up_cost
SAY @667 /* ~Well, the top-of-the-line work will cost you more. Besides, I need to get my share as well, to keep my store open.~ */
+ ~OR(2)
PartyHasItem("agboot09")
PartyHasItem("agboot19")~ + @662 /* ~Tell me about fast, sexy boots.~ */ EXTERN agaurora agaur_up_love
+ ~OR(4)
PartyHasItem("boot04")
PartyHasItem("agboot21")
PartyHasItem("agboot22")
PartyHasItem("agboot23")~ + @657 /* ~Tell me about armored boots.~ */ EXTERN agaurora agaur_up_armored
+ ~OR(2)
PartyHasItem("agboot31")
PartyHasItem("boot01")~ + @658 /* ~Tell me about daemon boots.~ */ EXTERN agaurora agaur_up_daemon
++ @668 /* ~I see. Another time, then. For now, let's talk about usual business.~ */ + agaur_store
END

IF
~~ agaur_up_love_do
SAY @669 /* ~Remember, you'll need seventy-five hundred more for the final product. Come back tomorrow.~ */
IF ~~ THEN DO ~
TakePartyItem("agboot09")
DestroyItem("agboot09")
TakePartyItem("agboot19")
DestroyItem("agboot19")
TakePartyItemNum("aggem08",1)
DestroyItem("aggem08")
TakePartyGold(7500)
DestroyGold(7500)
SetGlobalTimer("agaur_upgrade_timer","GLOBAL",6000)
SetGlobal("agaur_upgrade","GLOBAL",4)~ EXIT
END

IF
~~ agaur_up_armored_do
SAY @670 /* ~Remember, twelve and a half thousand more for the finished boots. Come back the day after tomorrow.~ */
IF ~~ THEN DO ~
TakePartyItemNum("aggem09",1)
DestroyItem("aggem09")
TakePartyItem("boot04")
DestroyItem("boot04")
TakePartyItem("agboot21")
DestroyItem("agboot21")
TakePartyItem("agboot22")
DestroyItem("agboot22")
TakePartyItem("agboot23")
DestroyItem("agboot23")
TakePartyGold(12500)
DestroyGold(12500)
SetGlobalTimer("agaur_upgrade_timer","GLOBAL",13000)
SetGlobal("agaur_upgrade","GLOBAL",5)~ EXIT
END

IF
~~ agaur_up_daemon_do
SAY @671 /* ~Remember, seventeen and a half thousand more when they're done. Come back in three days.~ */
IF ~~ THEN DO ~
TakePartyItemNum("aggem02",1)
DestroyItem("aggem02")
TakePartyItem("agboot31")
DestroyItem("agboot31")
TakePartyItem("boot01")
DestroyItem("boot01")
TakePartyGold(17500)
DestroyGold(17500)
SetGlobalTimer("agaur_upgrade_timer","GLOBAL",20000)
SetGlobal("agaur_upgrade","GLOBAL",6)~ EXIT
END

IF
~~ agaur_up_love_give
SAY @672 /* ~Yes, I've got them here. Now if you pay my share of the deal, they're yours.~ */
+ ~PartyGoldGT(7499)~ + @645 /* ~Here you go.~ */ + agaur_up_love_deal
++ @673 /* ~I think I'll take them later. Back to usual business, if you don't mind.~ */ + agaur_store
END

IF
~~ agaur_up_armored_give
SAY @672 /* ~Yes, I've got them here. Now if you pay my share of the deal, they're yours.~ */
+ ~PartyGoldGT(12499)~ + @645 /* ~Here you go.~ */ + agaur_up_armored_deal
++ @673 /* ~I think I'll take them later. Back to usual business, if you don't mind.~ */ + agaur_store
END

IF
~~ agaur_up_daemon_give
SAY @672 /* ~Yes, I've got them here. Now if you pay my share of the deal, they're yours.~ */
+ ~PartyGoldGT(17499)~ + @645 /* ~Here you go.~ */ + agaur_up_daemon_deal
++ @673 /* ~I think I'll take them later. Back to usual business, if you don't mind.~ */ + agaur_store
END

IF
~~ agaur_up_love_deal
SAY @674 /* ~Great! Here are your new boots. Always a pleasure, <GABBER>. Come back again if you ever need more.~ */
IF ~~ THEN DO ~
TakePartyGold(7500)
DestroyGold(7500)
SetGlobal("agaur_upgrade","GLOBAL",3)
GiveItemCreate("agboot33",LastTalkedToBy(),1,0,0)~ EXIT
END

IF
~~ agaur_up_armored_deal
SAY @674 /* ~Great! Here are your new boots. Always a pleasure, <GABBER>. Come back again if you ever need more.~ */
IF ~~ THEN DO ~
TakePartyGold(12500)
DestroyGold(12500)
SetGlobal("agaur_upgrade","GLOBAL",3)
GiveItemCreate("agboot35",LastTalkedToBy(),0,0,0)~ EXIT
END

IF
~~ agaur_up_daemon_deal
SAY @674 /* ~Great! Here are your new boots. Always a pleasure, <GABBER>. Come back again if you ever need more.~ */
IF ~~ THEN DO ~
TakePartyGold(17500)
DestroyGold(17500)
SetGlobal("agaur_upgrade","GLOBAL",3)
GiveItemCreate("agboot37",LastTalkedToBy(),1,0,0)~ EXIT
END
END

CHAIN agaurora agaur_up_check
@675 /* ~Let's see...~ */
== agaurora IF ~OR(2)
PartyHasItem("agboot09")
PartyHasItem("agboot19")~ THEN @676 /* ~I see you have a taste for sexy footwear. Believe it or not, with some improvements, you can be both sexy *and* fast.~ */
== agaurora IF ~OR(4)
PartyHasItem("boot04")
PartyHasItem("agboot21")
PartyHasItem("agboot22")
PartyHasItem("agboot23")~ THEN @677 /* ~You seem to have some boots that provide adequate protection. However, enough different pairs can be combined to make armored boots that are second to none.~ */
== agaurora IF ~OR(2)
PartyHasItem("agboot31")
PartyHasItem("boot01")~ THEN @678 /* ~I see you have some legendary boots there. But two pairs of the right boots can be combined to make one pair powerful enough for a daemon lord.~ */
== agaurora IF ~OR(8)
PartyHasItem("agboot09")
PartyHasItem("agboot19")
PartyHasItem("boot04")
PartyHasItem("agboot21")
PartyHasItem("agboot22")
PartyHasItem("agboot23")
PartyHasItem("agboot31")
PartyHasItem("boot01")~ THEN @679 /* ~That's all, I think. There might be something else, but it's beyond my skill to tell if it's truly the case.~ */
== agaurora IF ~
!PartyHasItem("agboot09")
!PartyHasItem("agboot19")
!PartyHasItem("boot04")
!PartyHasItem("agboot21")
!PartyHasItem("agboot22")
!PartyHasItem("agboot23")
!PartyHasItem("agboot31")
!PartyHasItem("boot01")~ THEN @680 /* ~Hmm... No, nothing will do, as far as I can tell.~ */
END
+ ~OR(2)
PartyHasItem("agboot09")
PartyHasItem("agboot19")~ + @662 /* ~Tell me about fast, sexy boots.~ */ EXTERN agaurora agaur_up_love
+ ~OR(4)
PartyHasItem("boot04")
PartyHasItem("agboot21")
PartyHasItem("agboot22")
PartyHasItem("agboot23")~ + @657 /* ~Tell me about armored boots.~ */ EXTERN agaurora agaur_up_armored
+ ~OR(2)
PartyHasItem("agboot31")
PartyHasItem("boot01")~ + @658 /* ~Tell me about daemon boots.~ */ EXTERN agaurora agaur_up_daemon
++ @681 /* ~May I see your usual wares instead?~ */ EXTERN agaurora agaur_store
++ @639 /* ~Nothing for now. See you later.~ */ EXIT

CHAIN agaurora agaur_store
@83 /* ~Shoes and boots! The finest in all of Amn!~ */
DO ~
StartStore("agaurora",LastTalkedToBy())
~ EXIT

// K'aeloree: Tomthal mention
CHAIN agaurora tomthal
@688 /* ~Oh, you did, did you? I hope he wasn't rude; he's a rather bitter fellow, I'm afraid. Very generous of him to donate his time to help out at night, though.~ */
EXTERN agaurora tomthal3

CHAIN agaurora tomthal2
@689 /* ~Oh, dear me... I'm afraid to say he was killed. He was such a bitter gnome... it was generous of him to help donate his time, but...~ */
EXTERN agaurora tomthal3

CHAIN agaurora tomthal3
@690 /* ~Now, is there anything I can do for you?~ */
END
++ @579 /* ~Have you any gossip to share?~ */ EXTERN agaurora gossip
++ @580 /* ~I would like to see your wares, please.~ */ DO ~
StartStore("agaurora",LastTalkedToBy())
~ EXIT
++ @581 /* ~Nothing today, thank you.~ */ EXIT
++ @382 /* ~I don't want to hear anything from you, ever again.~ */ DO ~
SetGlobal("ag_greeting","GLOBAL",3)~ EXIT
+ ~Global("ag_pink","GLOBAL",1)
PartyGoldGT(1799)~ + @582 /* ~I want to buy those pink boots Imoen asked you to make.~ */ EXTERN agaurora pink_boots
+ ~Global("ag_lotion","GLOBAL",1)
GlobalLT("ag_buy_lotion","GLOBAL",10)
~ + @583 /* ~Have you got more of those lotions you gave to Nalia?~ */ EXTERN agaurora hand_lotion1
+ ~Global("ag_lotion","GLOBAL",1)
Global("ag_buy_lotion","GLOBAL",10)
~ + @583 /* ~Have you got any more of that lotion you gave to Nalia?~ */ EXTERN agaurora hand_lotion2
+ ~Global("ag_balm","GLOBAL",1)
GlobalLT("ag_buy_balm","GLOBAL",10)
~ + @584 /* ~Have you got any more of that muscle balm?~ */ EXTERN agaurora muscle_balm1
+ ~Global("ag_balm","GLOBAL",1)
Global("ag_buy_balm","GLOBAL",10)
~ + @584 /* ~Have you got any more of that muscle balm?~ */ EXTERN agaurora muscle_balm2
+ ~Global("ag_aran","GLOBAL",0) Global("E3ARANSMUMEXISTS","GLOBAL",1)~ + @719 /* ~I came across a... lady in a house north of here. Isn't that your house? You never mentioned a roommate...~ */ DO ~SetGlobal("ag_aran","GLOBAL",1)~ + agarans_mum
+ ~GlobalTimerExpired("ag_lissa_timer","GLOBAL") NumTimesTalkedToGT(1) Global("agaur_upgrade","GLOBAL",0)~ + @612 /* ~I'm curious if you can provide other products than those you've got in stock.~ */ + agaur_up_service
+ ~Global("agaur_upgrade","GLOBAL",1)~ + @613 /* ~I want to talk about your enchanter acquaintance.~ */ + agaur_up_help
+ ~Global("agaur_upgrade","GLOBAL",2) GlobalTimerExpired("agaur_upgrade_timer","GLOBAL")~ + @614 /* ~So, what about the enchanter?~ */ + agaur_up_info
+ ~Global("agaur_upgrade","GLOBAL",3)~ + @615 /* ~Do I have anything that can be used for enchanting?~ */ + agaur_up_check
+ ~Global("agaur_upgrade","GLOBAL",4) GlobalTimerExpired("agaur_upgrade_timer","GLOBAL")~ + @616 /* ~So, what about my order?~ */ + agaur_up_love_give
+ ~Global("agaur_upgrade","GLOBAL",5) GlobalTimerExpired("agaur_upgrade_timer","GLOBAL")~ + @616 /* ~So, what about my order?~ */ + agaur_up_armored_give
+ ~Global("agaur_upgrade","GLOBAL",6) GlobalTimerExpired("agaur_upgrade_timer","GLOBAL")~ + @616 /* ~So, what about my order?~ */ + agaur_up_daemon_give
