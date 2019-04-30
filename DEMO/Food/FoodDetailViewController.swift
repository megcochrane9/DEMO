import UIKit
import FirebaseDatabase
import AVKit

class FoodDetailViewController: UIViewController {
  
    var recipe: Recipe!

    @IBOutlet weak var textField: UITextView!
    @IBOutlet weak var instructionsTextField: UITextView!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var foodImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = recipe.name
        foodImage.image = recipe.image
        textField.text = recipe.body
        instructionsTextField.text = recipe.body2 

        
        if recipe.videoName == nil {
            playButton.isHidden = true
        }
        
    }
    
    
    @IBAction func playButton(_ sender: UIButton) {
    guard let videoName = recipe.videoName else { return }
        
        //check to see if the file is in the project
        if let filePath = Bundle.main.path(forResource: videoName, ofType: ".mov") {
            let filePathURL = NSURL.fileURL(withPath: filePath)
            
            let player = AVPlayer(url: filePathURL)
            let playerController = AVPlayerViewController()
            playerController.player = player
            self.present(playerController, animated: true) {
                player.play()
            }
        }
    
    }
}
