import UIKit
import SnapKit

class WorkoutCell: UICollectionViewCell {
    
    lazy var titleLabel: UILabel = {
        return UILabel()
    }()
    
    lazy var imageView: UIImageView = {
        return UIImageView()
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(titleLabel)
        contentView.addSubview(imageView)
        
        titleLabel.snp.makeConstraints { make in
            make.left.right.top.equalToSuperview()
            make.centerX.equalToSuperview()
            make.height.equalTo(50)
        }
        
        imageView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(4)
            make.left.right.bottom.equalToSuperview().inset(10)
            make.centerX.equalToSuperview()
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
