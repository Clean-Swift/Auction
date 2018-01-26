//
//  BuyerCell.swift
//  Auction
//
//  Created by Raymond Law on 1/23/18.
//  Copyright © 2018 Clean Swift LLC. All rights reserved.
//

import UIKit

class BuyerCell: UITableViewCell
{
  var buyer: Table.FetchObjects.ViewModel.DisplayedBuyer!
  {
    didSet
    {
      textLabel?.text = buyer.name
      detailTextLabel?.text = buyer.email
    }
  }
}
