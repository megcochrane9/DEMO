import UIKit

class SAButton: UIButton {
    
   override init(frame: CGRect) {
        super.init(frame: frame)
    setupButton()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupButton()
    }
    
    func setupButton() {
        setTitleColor(.purple, for: .normal)
        backgroundColor = UIColor.white
        titleLabel?.font = .boldSystemFont(ofSize: 10)
        layer.cornerRadius = frame.size.height / 2
 }
    
}
