import UIKit
import SnapKit
import Firebase

protocol SelectionDelegate {
  func didSelect(data: Any)
}

class RecipeSubCollectionViewController: UIViewController {
  
  var data = [Recipe]()
  var category: String!
  
  var delegate: SelectionDelegate?
  
  lazy var titleLabel: UILabel = {
    let label = UILabel(frame: .zero)
    label.backgroundColor = .white
    label.text = category
    label.font = label.font.withSize(30)
    label.textColor = .darkGray
    return label
  }()
  
  lazy var collectionView: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .horizontal
    layout.sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    collectionView.register(RecipeCell.self, forCellWithReuseIdentifier: "Cell")
    return collectionView
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    collectionView.backgroundColor = .white
    collectionView.delegate = self
    collectionView.dataSource = self
    view.addSubview(collectionView)
    view.addSubview(titleLabel)
    addConstraints()
    let ref = Firestore.firestore().collection(category)
    ref.getDocuments { snapshot, error in
      for document in snapshot!.documents {
        if let recipe = Recipe(data: document) {
          self.data.append(recipe)
        }
      }
      self.collectionView.reloadData()
    }
    
    
    
    
  }
  
  func addConstraints() {
    titleLabel.snp.makeConstraints { make in
      make.top.equalToSuperview()
      make.left.right.equalTo(10)
      make.centerX.equalToSuperview()
      make.height.equalTo(50)
    }
    
    collectionView.snp.makeConstraints { make in
      make.top.equalTo(titleLabel.snp.bottom)
      make.left.right.bottom.equalToSuperview()
      make.centerX.equalToSuperview()
    }
  }
  
}

extension RecipeSubCollectionViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return data.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! RecipeCell
    let recipe = data[indexPath.row]
    cell.titleLabel.text = recipe.name
    cell.imageView.image = recipe.image
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: 220, height: collectionView.frame.height)
  }
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    let recipe = data[indexPath.row]
    delegate?.didSelect(data: recipe)
  }
  
}

