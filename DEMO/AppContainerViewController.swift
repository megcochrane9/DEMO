//
//  AppContainerViewControl.swift
//  
//
//  Created by Meg Cochrane on 31/01/2019.
//

import UIKit

class AppContainerViewControl: UIViewController {
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        AppManager.shared.appContainer = self
        AppManager.shared.showApp()
    }
    
}

