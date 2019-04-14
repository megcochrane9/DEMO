import UIKit

extension UIView {
    func addShadowAndRoundedCorners() {
        layer.shadowOpacity = 1
        layer.shadowOffset = CGSize.zero
        layer.shadowColor = UIColor.darkGray.cgColor
        layer.cornerRadius = 10
    }
    
    func add(subviews: [UIView]) {
        for view in subviews {
            addSubview(view)
        }
    }
    
    func debug() {
        for view in subviews {
            view.layer.borderColor = UIColor.red.cgColor
            view.layer.borderWidth = 2 
        }
    }

}
