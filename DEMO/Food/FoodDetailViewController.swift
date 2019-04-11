import UIKit
import FirebaseDatabase

class FoodDetailViewController: UIViewController {
  
  var recipe: Recipe!
  var text: String!

    
    override func viewDidLoad() {
            super.viewDidLoad()
            title = recipe.name
        
           
    }
  
}
