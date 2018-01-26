//
//  User.swift
//  Auction
//
//  Created by Raymond Law on 1/17/18.
//  Copyright © 2018 Clean Swift LLC. All rights reserved.
//

import Foundation
import RealmSwift

final class User: Object
{
  @objc dynamic var id: String = ""
  @objc dynamic var name: String = ""
  @objc dynamic var email: String = ""
  
  let soldItems = List<Item>()
  let boughtItems = List<Item>()
  
  var isSeller: Bool { return !soldItems.isEmpty }
  
  override static func primaryKey() -> String?
  {
    return "id"
  }
  
  override static func indexedProperties() -> [String]
  {
    return ["selling"]
  }
}
