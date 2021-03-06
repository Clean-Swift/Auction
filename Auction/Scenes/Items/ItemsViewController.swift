//
//  ItemsViewController.swift
//  Auction
//
//  Created by Raymond Law on 1/17/18.
//  Copyright (c) 2018 Clean Swift LLC. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol ItemsDisplayLogic: class
{
  func displayFetchItems(viewModel: Items.FetchItems.ViewModel)
}

class ItemsViewController: UITableViewController, ItemsDisplayLogic
{
  var interactor: ItemsBusinessLogic?
  var router: (NSObjectProtocol & ItemsRoutingLogic & ItemsDataPassing)?
  
  // MARK: Object lifecycle
  
  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?)
  {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    setup()
  }
  
  required init?(coder aDecoder: NSCoder)
  {
    super.init(coder: aDecoder)
    setup()
  }
  
  // MARK: Setup
  
  private func setup()
  {
    let viewController = self
    let interactor = ItemsInteractor()
    let presenter = ItemsPresenter()
    let router = ItemsRouter()
    viewController.interactor = interactor
    viewController.router = router
    interactor.presenter = presenter
    presenter.viewController = viewController
    router.viewController = viewController
    router.dataStore = interactor
  }
  
  // MARK: Routing
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?)
  {
    if let scene = segue.identifier {
      let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
      if let router = router, router.responds(to: selector) {
        router.perform(selector, with: segue)
      }
    }
  }
  
  // MARK: View lifecycle
  
  override func viewDidLoad()
  {
    super.viewDidLoad()
    fetchItems()
  }
  
  // MARK: Table view
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
  {
    return displayedItems.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
  {
    let displayedItem = displayedItems[indexPath.row]
    let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath)
    cell.textLabel?.text = "\(displayedItem.name) x \(displayedItem.quantity)"
    cell.detailTextLabel?.text = displayedItem.price
    return cell
  }
  
  // MARK: Fetch items
  
  var displayedItems = [Items.FetchItems.ViewModel.DisplayedItem]()
  
  func fetchItems()
  {
    let request = Items.FetchItems.Request()
    interactor?.fetchItems(request: request)
  }
  
  func displayFetchItems(viewModel: Items.FetchItems.ViewModel)
  {
    displayedItems = viewModel.displayedItems
    tableView.reloadData()
  }
}
