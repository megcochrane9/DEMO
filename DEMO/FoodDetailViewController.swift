import UIKit

class FoodDetailViewController: UIViewController {
  
  var recipe: Recipe!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    title = recipe.name
  }
  
}
