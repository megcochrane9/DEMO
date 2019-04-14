import UIKit
import SnapKit

class RecipeCell: UICollectionViewCell {
  
  lazy var titleLabel: UILabel = {
    return UILabel()
  }()
  
  lazy var imageView: UIImageView = {
    let imageView = UIImageView()
    imageView.contentMode = .scaleAspectFill
    return imageView
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    contentView.add(subviews:[titleLabel, imageView])
    titleLabel.snp.makeConstraints { make in
      make.left.right.top.equalToSuperview()
      make.centerX.equalToSuperview()
      make.height.equalTo(50)
    }
    
    imageView.snp.makeConstraints { make in
      make.top.equalTo(titleLabel.snp.bottom).offset(4)
      make.left.right.bottom.equalToSuperview().inset(10)
      make.centerX.equalToSuperview()

      imageView.layer.cornerRadius = 30.0
      imageView.layer.masksToBounds = true
    }
    
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}
