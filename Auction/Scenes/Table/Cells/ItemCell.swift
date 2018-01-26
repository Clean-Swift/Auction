//
//  ItemCell.swift
//  Auction
//
//  Created by Raymond Law on 1/23/18.
//  Copyright © 2018 Clean Swift LLC. All rights reserved.
//

import UIKit

class ItemCell: UITableViewCell
{
  var item: Table.FetchObjects.ViewModel.DisplayedItem!
  {
    didSet
    {
      textLabel?.text = "\(item.name) x \(item.quantity)"
      detailTextLabel?.text = item.price
    }
  }
}
