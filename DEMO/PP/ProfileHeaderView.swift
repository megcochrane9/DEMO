import UIKit
import SnapKit

class ProfileHeaderView: UIView {
    
    lazy var titleLable: UILabel = {
        let view = UILabel()
        view.text = "PROFILE"
        view.textColor = UIColor.white
        return view
    }()
    
    private lazy var imageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "PP grey")
        return view
    }()
    
    var image: UIImage? {
        didSet {
            imageView.image = image
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        self.backgroundColor = UIColor(red: 0.45, green: 0.1, blue: 1.0, alpha: 1)
        add(subviews: [titleLable, imageView])
        addConstraints()
    }
    
    private func addConstraints() {
        titleLable.snp.makeConstraints { make in
            make.top.bottom.right.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.5)
        }
        imageView.snp.makeConstraints { make in
            make.height.equalToSuperview().multipliedBy(0.5)
            make.width.equalTo(imageView.snp.height)
            make.right.equalTo(titleLable.snp.left).inset(-10)
            make.centerY.equalToSuperview()
        }
    }
}
