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
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
