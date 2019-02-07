//
//  AppContainerViewControl.swift
//  
//
//  Created by Meg Cochrane on 31/01/2019.
//

import UIKit
import Firebase
import GeoFire

class AppContainerViewControl: UIViewController {
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        AppManager.shared.appContainer = self
        AppManager.shared.shareApp
    }
    
}

