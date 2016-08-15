CHAIN
IF WEIGHT #-1 ~
Detect("agaurora")~ THEN lissa agshchat
@0 /* ~Are those shoes I ordered in?~ */
== agaurora @1 /* ~That they are, my dear!~ */
== lissa @2 /* ~Good. I'll take them now, if you don't mind. I will need some made for next week, as well.~ */
== agaurora @3 /* ~There may not be time for the craftsman to...~ */
== lissa @4 /* ~Never mind the craft! They only have to last for one night, for Lathander's sake!~ */
== agaurora @5 /* ~I'm afraid I cannot do that.~ */
== lissa @6 /* ~Can't?! What are you talking about, Aurora? I'm paying you good money for these shoes!~ */
== agaurora @7 /* ~This store sells only *quality* shoes. I can't be lowering my standards.~ */
== lissa @8 /* ~Not even for one of your best customers?~ */
== agaurora @9 /* ~Not even then.~ */
== lissa @10 /* ~Well! I guess I will have to get them somewhere else! Hmph.~ */ DO ~
EscapeArea() ActionOverride("agaurora",StartDialogNoSet(Player1))~
EXIT
