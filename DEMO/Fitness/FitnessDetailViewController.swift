import UIKit
import FirebaseDatabase
import AVKit

class FitnessDetailViewController: UIViewController {
    
    var fitness: Fitness!
    
    @IBOutlet weak var textField: UITextView!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var fitnessImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = fitness.name
        fitnessImage.image = fitness.image
        textField.text = fitness.body
    
        
        
        if fitness.videoName == nil {
            playButton.isHidden = true
        }
        
    }
    
    
    @IBAction func playButton(_ sender: UIButton) {
        guard let videoName = fitness.videoName else { return }
        
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

