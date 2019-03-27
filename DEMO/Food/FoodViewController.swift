import UIKit

class FoodViewController: UIViewController {
  
  @IBOutlet weak var collectionView: UICollectionView!
  
  var vcs = [SubCollectionViewController]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let titles = ["soups", "Party In A Pan", "Pasta", "Lunch Box Ideas", "Baking" ]
    
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
  }
  
  private func addChildContentViewController(_ childViewController: UIViewController) {
    addChild(childViewController)
    childViewController.didMove(toParent: self)
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
