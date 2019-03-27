import UIKit
import SnapKit

class SubCollectionViewController: UIViewController {
  
  var x = [Recipe]()
  
  lazy var collectionView: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .horizontal
    layout.sectionInset = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    collectionView.register(RecipeCell.self, forCellWithReuseIdentifier: "Cell")
    collectionView.backgroundColor = .blue
    return collectionView
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    collectionView.delegate = self
    collectionView.dataSource = self
    view.addSubview(collectionView)
    addConstraints()
  }
  
  func addConstraints() {
    collectionView.snp.makeConstraints { make in
      make.size.equalToSuperview()
      make.center.equalToSuperview()
    }
  }
  
}

extension SubCollectionViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return x.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! RecipeCell
    let recepie = x[indexPath.row]
    cell.titleLabel.text = recepie.name
    cell.contentView.backgroundColor = .red
    cell.imageView.image = UIImage(named: "test")
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: 220, height: view.frame.height)
  }
  
}

