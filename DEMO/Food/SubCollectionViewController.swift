import UIKit
import SnapKit
import Firebase

protocol FoodSelectedDelegate {
  func didSelect(recipe: Recipe)
}

class SubCollectionViewController: UIViewController {
  
  var data = [Recipe]()
  var category: String!
  
  var delegate: FoodSelectedDelegate?
  
  lazy var collectionView: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .horizontal
    layout.sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
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
    collectionView.snp.makeConstraints { make in
      make.size.equalToSuperview()
      make.center.equalToSuperview()
    }
  }
  
}

extension SubCollectionViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {
  
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
    return CGSize(width: 220, height: view.frame.height)
  }
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    let recipe = data[indexPath.row]
    delegate?.didSelect(recipe: recipe)
  }
  
}

