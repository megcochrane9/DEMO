import UIKit

class FoodViewController: UIViewController {
  
  @IBOutlet weak var collectionView: UICollectionView!
  
  var vcs = [SubCollectionViewController]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let soup = SubCollectionViewController()
    soup.x = [Recipe(name: "Butternut Squash and Chill Soup"), Recipe(name: "Two"), Recipe(name: "Three")]
    
    vcs.append(soup)
    
    let partyInAPan = SubCollectionViewController()
    partyInAPan.x = [Recipe(name: "Chicken and Noodles"), Recipe(name: "Tfhfgchjcfgwo"), Recipe(name: "Tdsfhree")]
    
    vcs = [soup, partyInAPan]
  
    
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
