import UIKit

class ProgressPhotosViewController: UIViewController {

    
    @IBOutlet weak var backgroundImageView: UIImageView!
    
    var progressId: UUID!
    var progressPhotosModel: ProgressPhotosModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
      ProgressPhotosFunctions.readProgressPhoto(by: progressId) { [weak self] model in
            guard let self = self else { return }
            self.progressPhotosModel = model
            
            guard let model = model else { return }
            self.title = model.title
            self.backgroundImageView.image = model.image
        }
        
        
    }
}

