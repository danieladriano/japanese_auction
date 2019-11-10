value(0).

!start.

+!start
    :   V = math.random * 100
    <-  -+value(V);
        .print("The value for me is $", V).

+!decide
    :   product_value(S) &
        value(V) &
        S < V &
        .my_name(N)
    <-  joinArena(N).

+!decide
    <- .print("To expensive for me, I pass!!!").

+value_updated
    :   product_value(S) &
        value(V) &
        S < V
    <- .print("Still a good price").

+value_updated
    :   .my_name(N)
    <-  .print("The product is to expensive for me");
        exitArena(N).

+!won
    :   winning_participant(W) &
        .my_name(N) &
        .term2string(N, Ns) & Ns == W
    <- .print("I bought!!").

+!won .

{ include("$jacamoJar/templates/common-cartago.asl") }
{ include("$jacamoJar/templates/common-moise.asl") }
{ include("$jacamoJar/templates/org-obedient.asl") }