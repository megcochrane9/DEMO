import UIKit
import FirebaseDatabase

class FoodDetailViewController: UIViewController {
  
    var recipe: Recipe!
    var text: String!
    var body: String!
    var image: UIImage!
    

    @IBOutlet weak var foodImage: UIImageView!
    
    
    override func viewDidLoad() {
            super.viewDidLoad()
            title = recipe.name

        
    }
  
    private lazy var imageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "PP grey")
        return view
    }()
    
    
    
    private func addConstraints() {
        imageView.snp.makeConstraints { make in
            make.height.equalToSuperview().multipliedBy(0.5)
            make.width.equalTo(imageView.snp.height)
            make.centerY.equalToSuperview()
        }
    }
}
