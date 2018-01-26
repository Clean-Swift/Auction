//
//  SellerCell.swift
//  Auction
//
//  Created by Raymond Law on 1/23/18.
//  Copyright © 2018 Clean Swift LLC. All rights reserved.
//

import UIKit

class SellerCell: UITableViewCell
{
  var seller: Table.FetchObjects.ViewModel.DisplayedSeller!
  {
    didSet
    {
      textLabel?.text = seller.name
      detailTextLabel?.text = seller.email
    }
  }
}
