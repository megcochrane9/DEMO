import UIKit

class FitnessCell: UICollectionViewCell {
  
  var foodCatergories = [FoodCell]()
  
  var hostedView: UIView? {
    didSet {
      guard let hostedView = hostedView else {
        return
      }
      
        contentView.addSubview(hostedView)
        hostedView.snp.makeConstraints { make in
        make.size.equalToSuperview()
        make.center.equalToSuperview()
        }
    }
  }
  struct Storyboard {
    static let sectionHeaderView = "SectionHeaderView"
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
  // section header view//
  
  func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView
  {
    let sectionHeaderView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: Storyboard.sectionHeaderView, for: indexPath) as! SectionHeaderView
    let category = foodCatergories[indexPath.section]
    
    sectionHeaderView.foodCategories = category
    
    return sectionHeaderView
  }
}
