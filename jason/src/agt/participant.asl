value(0).
is_in(false).

!start.

+!start : V = math.random * 100
    <-  -+value(V);
        .print("The horse value for me is $", V).

+initial_price(horse, D)[source(A)]
    :   value(V) & D < V
    <-  .print("Initial value $", D, " is valid for me");
        -+is_in(true);
        .send(A, achieve, register(participant)).

+initial_price(horse, D)[source(A)]
    <- .print("The horse is to expensive for me").

+update_price(horse, D)[source(A)]
    :   value(V) &
        D < V &
        is_in(true)
    <-  .print("Still a good price").

+update_price(horse, D)[source(A)]
    :   is_in(true)
    <-  .print("The horse is to expensive for me");
        -+is_in(false);
        .send(A, achieve, goodbye(participant)).

+update_price(horse, D)[source(A)] .