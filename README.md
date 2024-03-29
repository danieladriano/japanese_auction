# japanese_auction

A japanse auction developed in:

- Jason
- Jason + CArtAgO
- Jason + CArtAgO + Moise

A Japanese auction (also called ascending clock auction) is a dynamic auction format. It proceeds in the following way:

- An initial price is displayed. This is usually a low price - it may be either 0 or the seller's reserve price.
- All buyers that are interested in buying the item at the displayed price enter the auction arena.
- The displayed price increases continuously, or by small discrete steps (e.g. one cent per second).
- Each buyer may exit the arena at any moment.
- No exiting buyer is allowed to re-enter the arena.
- When a single buyer remains in the arena, the auction stops. The remaining buyer wins the item and pays the displayed price.
