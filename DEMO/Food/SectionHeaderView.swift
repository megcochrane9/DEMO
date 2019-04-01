import UIKit

class SectionHeaderView: UICollectionReusableView {
    
    @IBOutlet weak var categoryTitleLabel: UILabel!
    
    var foodCategories: FoodCell! {
        didSet {
    //        categoryTitleLabel.text = FoodCell.title
        }
        
    }
    
    
}
