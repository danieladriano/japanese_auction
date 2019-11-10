+!start
    :   V = math.random(10)
    <-  .print("Initial value $", V);
        initiateArena(V).

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
    <-  .print("Auction Finalized!!").

+!update_value
    <- .print("There are no winners").

+!winner_announce
    :   participants_size(S) &
        S == 1
    <-  winner(W);
        .print("The winner is ", W).

+!winner_announce .

{ include("$jacamoJar/templates/common-cartago.asl") }
{ include("$jacamoJar/templates/common-moise.asl") }
{ include("$jacamoJar/templates/org-obedient.asl") }