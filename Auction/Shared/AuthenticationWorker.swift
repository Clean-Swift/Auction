//
//  AuthenticationWorker.swift
//  Auction
//
//  Created by Raymond Law on 1/19/18.
//  Copyright © 2018 Clean Swift LLC. All rights reserved.
//

import Foundation
import RealmSwift

class AuthenticationWorker
{
  let username = "ray"
  let password = "law"
  let serverURL = URL(string: "http://127.0.0.1:9080")!
  
  // MARK: Object lifecycle
  
  static let shared = AuthenticationWorker()
  
  private init() {}
  
  // MARK: Authenticate
  
  func isLoggedIn() -> Bool
  {
    return SyncUser.current != nil
  }
  
  func login(completionHandler: @escaping () -> Void)
  {
    if isLoggedIn() {
      completionHandler()
    } else {
      let credentials = SyncCredentials.usernamePassword(username: username, password: password, register: false)
      SyncUser.logIn(with: credentials, server: serverURL) { (user, error) in
        if let _ = user {
          DispatchQueue.main.async {
            completionHandler()
          }
        } else if let error = error {
          fatalError(String(describing: error))
        }
      }
    }
  }
  
  func logout()
  {
    SyncUser.current?.logOut()
  }
  
  func changePassword(newPassword: String)
  {
    SyncUser.current?.changePassword(newPassword, completion: { (error) in
      if let error = error {
        fatalError(String(describing: error))
      }
    })
  }
}
