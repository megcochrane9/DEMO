import UIKit

class FoodViewController: UIViewController {
  
  @IBOutlet weak var collectionView: UICollectionView!
  
  var vcs = [SubCollectionViewController]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let a = SubCollectionViewController()
    a.x = [Receipe(name: "One"), Receipe(name: "Two"), Receipe(name: "Three")]
    
    vcs.append(a)
    
    let b = SubCollectionViewController()
    b.x = [Receipe(name: "asfdsg"), Receipe(name: "Tfhfgchjcfgwo"), Receipe(name: "Tdsfhree")]
    
    vcs = [a, b]
  
    
    for vc in vcs {
      addChildContentViewController(vc)
    }
    
    
    collectionView.delegate = self
    collectionView.dataSource = self
    collectionView.register(FoodCell.self, forCellWithReuseIdentifier: "FoodCell")
  }
  
  private func addChildContentViewController(_ childViewController: UIViewController) {
    addChild(childViewController)
    childViewController.didMove(toParent: self)
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
