import UIKit

class FitnessCell: UICollectionViewCell {
    
    var fitnessCatergories = [FitnessCell]()
    
    var hostedView: UIView? {
        didSet {
            guard let hostedView = hostedView else {
                return
            }
            
            hostedView.frame = contentView.bounds
            contentView.addSubview(hostedView)
        }
    }
    struct Storyboard {
        static let sectionHeaderView2 = "SectionHeaderView2"
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
    
    func collectionView2(_ collectionView2: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView
    {
        let sectionHeaderView2 = collectionView2.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: Storyboard.sectionHeaderView2, for: indexPath) as! SectionHeaderView2
        let category = fitnessCatergories[indexPath.section]
        
        sectionHeaderView2.fitnessCategories = category
        
        return sectionHeaderView2
    }
}

