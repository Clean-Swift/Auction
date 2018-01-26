# Auction
A sample project to show how to use Realm in a Clean Swift architecture. It also shows how to display different models in only one scene in a DRY manner, another twist to the VIP cycle, and how to use custom table view cells to deal with complex display logic.

You need to have a local Realm server running on localhost on port 9080 per Realm's documentation. Just make sure you have the correct username and password in `AuthenticationWorker.swift`. However, you can simply use the default Realm by changing line 72 of `RealmWorker.swift` from `realm = try! Realm(configuration: configuration)` to `realm = try! Realm()`.

A few highlights about this sample project:

- Same scene displays:
  - Different models (Item and User)
  - Same models, different filters (Buyer and Seller)
- One request, multiple responses, one view model (Table scene)
- Complex table view cells (ItemCell, BuyerCell, and SellerCell)
- Move Realm code out of view controllers and into interactors
- Encapsulate Realm API calls in RealmWorker

