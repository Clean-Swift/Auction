//
//  Item.swift
//  Auction
//
//  Created by Raymond Law on 1/17/18.
//  Copyright © 2018 Clean Swift LLC. All rights reserved.
//

import Foundation
import RealmSwift

final class Item: Object
{
  @objc dynamic var id: String = ""
  @objc dynamic var name: String = ""
  @objc dynamic var quantity: Int = 0
  @objc dynamic var price: Double = 0.0
  
  let sellers = LinkingObjects(fromType: User.self, property: "soldItems")
  let buyers = LinkingObjects(fromType: User.self, property: "boughtItems")
  
  override static func primaryKey() -> String?
  {
    return "id"
  }
}
