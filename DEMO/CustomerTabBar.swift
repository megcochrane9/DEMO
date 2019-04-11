import UIKit

class CustomerTabBar: UITabBarController, UITabBarControllerDelegate {
    
    override func viewDidLoad() {
    super.viewDidLoad()
    selectedIndex = 2
        
        let selectedImage1 = UIImage(named: "Food")?.withRenderingMode(.alwaysOriginal)
        let deSelectedImage1 = UIImage(named: "Food Grey")?.withRenderingMode(.alwaysOriginal)
        tabBarItem = self .tabBar.items?[0]
        tabBarItem.image = deSelectedImage1
        tabBarItem.selectedImage = selectedImage1
        
        let selectedImage2 = UIImage(named: "Fitness")?.withRenderingMode(.alwaysOriginal)
        let deSelectedImage2 = UIImage(named: "Fitness grey")?.withRenderingMode(.alwaysOriginal)
        tabBarItem = self .tabBar.items?[1]
        tabBarItem.image = deSelectedImage2
        tabBarItem.selectedImage = selectedImage2
        
        let selectedImage3 = UIImage(named: "Home")?.withRenderingMode(.alwaysOriginal)
        let deSelectedImage3 = UIImage(named: "Home grey")?.withRenderingMode(.alwaysOriginal)
        tabBarItem = self .tabBar.items?[2]
        tabBarItem.image = deSelectedImage3
        tabBarItem.selectedImage = selectedImage3
        
        let selectedImage4 = UIImage(named: "PP")?.withRenderingMode(.alwaysOriginal)
        let deSelectedImage4 = UIImage(named: "PP grey")?.withRenderingMode(.alwaysOriginal)
        tabBarItem = self .tabBar.items?[3]
        tabBarItem.image = deSelectedImage4
        tabBarItem.selectedImage = selectedImage4
        
        let selectedImage5 = UIImage(named: "Calendar")?.withRenderingMode(.alwaysOriginal)
        let deSelectedImage5 = UIImage(named: "Calendar grey")?.withRenderingMode(.alwaysOriginal)
        tabBarItem = self .tabBar.items?[4]
        tabBarItem.image = deSelectedImage5
        tabBarItem.selectedImage = selectedImage5
    }
        
}
    

