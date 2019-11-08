value(0).
participants([]).

!start.

+!start
    : V = math.random(10)
    <- 
    .wait(1000);
    -+value(V);
    .broadcast(tell, initial_price(horse, V));
    .at("now + 2 seconds", {+!decide(V)}).

@l0[atomic]
+!register(participant)[source(N)]
    :    participants(P)
    <-  .print(N, " is a participant");
        .concat(P, [N], PN);
        -+participants(PN).

+!new_price(L)
    :   L > 1 &
        value(V)
    <-  NV = V + (math.random * V)
        .print("new price ", NV);
        -+value(NV);
        .broadcast(tell, update_price(horse, NV));
        .at("now + 1 seconds", {+!decide(V)}).

+!new_price(L) <- .wait(1).

+!decide(V)
    :   participants(P) &
        .length(P, LP) &
        LP > 1
    <-  !new_price(LP).

+!decide(V)
    :   participants(P)
    <-  .print("The winner is", P).

@l1[atomic]
+!goodbye(participant)[source(N)]
    :   participants(P)
    <-  .print("Goodbay ", N);
        .delete(N, P, NP);
        -+participants(NP).
