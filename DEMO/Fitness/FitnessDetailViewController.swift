import UIKit
import FirebaseDatabase

class FitnessDetailViewController: UIViewController {
    
    var fitness: Fitness!
    var text: String!
    
    
    override func viewDidLoad() {
            super.viewDidLoad()
            title = fitness.name
        
    }
    
}
