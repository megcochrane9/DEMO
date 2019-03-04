import UIKit

class FoodCell: UICollectionViewCell {
  
  var hostedView: UIView? {
    didSet {
      guard let hostedView = hostedView else {
        return
      }
      
      hostedView.frame = contentView.bounds
      contentView.addSubview(hostedView)
    }
  }
  
  override func prepareForReuse() {
    super.prepareForReuse()
    
    if hostedView?.superview == contentView {
      hostedView?.removeFromSuperview()
    } else {
      print("hostedView is no longer attached to this cell")
    }
    
    hostedView = nil
  }
  
}
