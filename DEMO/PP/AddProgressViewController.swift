import UIKit

class AddProgressViewController: UIViewController {
    
    @IBOutlet weak var popUpView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var saveButton: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        popUpView.addShadowAndRoundedCorners()
        titleLabel.font = UIFont(name: Theme.mainFontName, size: 24)
        
        
        
        
    }
    
    @IBAction func cancel(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    @IBAction func save(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    
    
}
