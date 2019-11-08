value(0).

!start.

+!start : V = math.round(math.random * 100)
    <-  -+value(V);
        .print("The horse value for me is $", V).

+initial_price(horse, D)[source(A)]
    :  value(V) & D < V
    <- .print("Initial value $", D, " is valid for me");
       .send(A, achieve, register(participant)).

+initial_price(horse, D)[source(A)]
    <- .print("The horse is to expensive for me").

+update_price(horse, D)[source(A)]
    :   value(V) &
        D < V
    <-  .print("Still a good price").

+update_price(horse, D)[source(A)]
    <-  .print("The horse is to expensive for me");
        .send(A, achieve, goodbye(participant)).
