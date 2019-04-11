import UIKit

class ProgressTableViewCell: UITableViewCell {

    
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var progressImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        cardView.addShadowAndRoundedCorners()
        titleLabel.font = UIFont(name: Theme.mainFontName, size: 30)
        progressImageView.layer.cornerRadius = cardView.layer.cornerRadius
    }

    func setup(progressPhotosModel: ProgressPhotosModel) {
        titleLabel.text = progressPhotosModel.title
        progressImageView.image = progressPhotosModel.image
        
        if let progressImage = progressPhotosModel.image{
            progressImageView.alpha = 0.3
            progressImageView.image = progressImage
            
            UIView.animate(withDuration: 1) {
                self.progressImageView.alpha = 1
            }
        }
        
    }

}
