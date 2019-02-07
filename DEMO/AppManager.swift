//
//  AppManager.swift
//  DEMO
//
//  Created by Meg Cochrane on 31/01/2019.
//  Copyright © 2019 Meg Cochrane. All rights reserved.
//

import UIKit
import Firebase
import GeoFire


class AppManager {
    
    static let shared = AppManager()
    
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    var appContainer: AppContainerViewControl!
    
    private init() {}
    
    func showApp() {
        
        var viewController = UIViewController()
        
        if Auth.auth().currentUser == nil {
            viewController = storyboard.instantiateViewController(withIdentifier: "LoginViewController")
        } else {
          viewController = storyboard.instantiateViewController(withIdentifier: "MainViewController")
        }
        
        appContainer.present(viewController, animated: true, completion: nil)
        
    }
    
    func logout() {
        try! Auth.auth().signOut()
        appContainer.presentedViewController?.dismiss(animated: true, completion: nil)
    }
}
