!start.

+!start
    <-  initiateArena(math.random(10));
        .wait(3000);
        !update_value.

+!update_value
    :   participants_size(S) &
        S > 1 &
        product_value(V)
    <-  NV = V + (math.random * V);
        updateValue(NV);
        .print("New value $", NV);
        .wait(1000);
        !update_value.

+!update_value
    :   participants_size(S) &
        S == 1
    <-  winner(W);
        .print("The winner is ", W).

+!update_value
    <- .print("There are no winners").

{ include("$jacamoJar/templates/common-cartago.asl") }
{ include("$jacamoJar/templates/common-moise.asl") }
{ include("$jacamoJar/templates/org-obedient.asl") }