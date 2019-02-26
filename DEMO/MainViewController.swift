import UIKit

class CustomerTabBar: UITabBarController {
    
    var tabBarItem = UITabBarItem()
    
 
  override func viewDidLoad() {
    super.viewDidLoad()
    
    UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor : UIColor.white], for: .selected)
    
    UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor : UIColor.darkGray], for: .normal)
  }
    
}
