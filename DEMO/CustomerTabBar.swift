import UIKit

class CustomerTabBar: UITabBarController, UITabBarControllerDelegate {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    selectedIndex = 2
    tabBar.tintColor = UIColor.purple
    
  }
  

  
}
