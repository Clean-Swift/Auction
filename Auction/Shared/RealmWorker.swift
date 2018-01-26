//
//  RealmWorker.swift
//  Auction
//
//  Created by Raymond Law on 1/23/18.
//  Copyright © 2018 Clean Swift LLC. All rights reserved.
//

import Foundation
import RealmSwift

protocol RealmWorkerDelegate: class
{
  func realmWorkerHasChanged()
}

class RealmWorker
{
  var realm: Realm!
  private let realmURL = URL(string: "realm://127.0.0.1:9080/~/auction")!
  var notificationToken: NotificationToken?
  private var delegates = [RealmWorkerDelegate]()
  
  // MARK: Object lifecycle
  
  static let shared = RealmWorker()
  
  private init() {}
  
  deinit
  {
    notificationToken?.invalidate()
  }
  
  // MARK: Observer delegates
  
  func addDelegate(delegate: RealmWorkerDelegate)
  {
    if indexOfDelegate(delegate: delegate) == nil {
      delegates.append(delegate)
    }
  }
  
  func removeDelegate(delegate: RealmWorkerDelegate)
  {
    if let index = indexOfDelegate(delegate: delegate) {
      delegates.remove(at: index)
    }
  }
  
  private func indexOfDelegate(delegate: RealmWorkerDelegate) -> Int?
  {
    return delegates.index(where: { $0 === delegate })
  }
  
  // MARK: Setup
  
  func setupRealm()
  {
    configure()
//    clear()
    observe()
    populate()
  }
  
  // MARK: Private
  
  private func configure()
  {
    if let user = SyncUser.current {
      let configuration = Realm.Configuration(syncConfiguration: SyncConfiguration(user: user, realmURL: realmURL))
      realm = try! Realm(configuration: configuration)
    }
  }
  
  private func clear()
  {
    try! realm.write {
      realm.deleteAll()
    }
  }
  
  private func populate()
  {
    try! realm.write {
      for user in Seed.users {
        realm.create(User.self, value: user, update: true)
      }
    }
  }
  
  private func observe()
  {
    notificationToken = realm.observe({ (notification, realm) in
      for delegate in self.delegates {
        delegate.realmWorkerHasChanged()
      }
    })
  }
}

