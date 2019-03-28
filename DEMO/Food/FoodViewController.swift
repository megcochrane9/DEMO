import UIKit
import FirebaseDatabase

class FoodViewController: UIViewController {
  
  @IBOutlet weak var collectionView: UICollectionView!
  
  var vcs = [SubCollectionViewController]()
  var ref: DatabaseReference?

  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let titles = ["soups", "Party In A Pan", "Pasta", "Lunch Box Ideas", "Baking" ]
    let headerId = "headerId"
    
    for title in titles {
      let vc = SubCollectionViewController()
      vc.category = title
      addChildContentViewController(vc)
      vc.delegate = self
      vcs.append(vc)
    }
    
    collectionView.delegate = self
    collectionView.dataSource = self
    collectionView.register(FoodCell.self, forCellWithReuseIdentifier: "FoodCell")
    collectionView.register(UICollectionViewCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerId)
  }
    
  private func addChildContentViewController(_ childViewController: UIViewController) {
    addChild(childViewController)
    childViewController.didMove(toParent: self)
  }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 50)
    }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if let desitnationVC = segue.destination as? FoodDetailViewController {
      desitnationVC.recipe = (sender as! Recipe)
    }
  }
  
  
}

extension FoodViewController: UICollectionViewDataSource {
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return vcs.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FoodCell", for: indexPath) as! FoodCell
    cell.contentView.backgroundColor = .black
    let vc = vcs[indexPath.row]
    cell.hostedView = vc.view
    return cell
  }
  
  
}

extension FoodViewController: UICollectionViewDelegate {
  
}


extension FoodViewController: UICollectionViewDelegateFlowLayout {
  
//  func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
//
//  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: view.frame.width, height: 220)
  }
  
}

extension FoodViewController: FoodSelectedDelegate {
  
  func didSelect(recipe: Recipe) {
    performSegue(withIdentifier: "Detail", sender: recipe)
  }
  
}
