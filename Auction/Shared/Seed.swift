//
//  Seed.swift
//  Auction
//
//  Created by Raymond Law on 1/25/18.
//  Copyright © 2018 Clean Swift LLC. All rights reserved.
//

import Foundation

struct Seed
{
  static let users: [[String: Any]] = [
    [
      "id": "user_alex",
      "name": "Alex", "email": "alex@gmail.com",
      "soldItems": [
        ["id": "sold_item_apples", "name": "Apples", "quantity": 11, "price":  11.00],
        ["id": "sold_item_apricots", "name": "Apricots", "quantity": 12, "price":  12.00]
      ],
      "boughtItems": [
        ["id": "bought_item_asparagus", "name": "Asparagus", "quantity": 111, "price":  111.00],
        ["id": "bought_item_avocados", "name": "Avocados", "quantity": 112, "price":  112.00]
      ]
    ],
    
    [
      "id": "user_bob", "name": "Bob", "email": "bob@gmail.com",
      "soldItems": [
        ["id": "sold_item_bananas", "name": "Bananas", "quantity": 21, "price":  21.00],
        ["id": "sold_item_blueberries", "name": "Blueberries", "quantity": 22, "price":  22.00]
      ],
      "boughtItems": []
    ],
    
    [
      "id": "user_chloe", "name": "Chloe", "email": "chloe@gmail.com",
      "soldItems": [],
      "boughtItems": [
        ["id": "bought_item_cherries", "name": "Cherries", "quantity": 311, "price":  311.00],
        ["id": "bought_item_cantaloupe", "name": "Cantaloupe", "quantity": 312, "price":  312.00]
      ]
    ],
    
    [
      "id": "user_david", "name": "David", "email": "david@gmail.com",
      "soldItems": [],
      "boughtItems": []
    ]
  ]
}
