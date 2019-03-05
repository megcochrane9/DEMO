import UIKit

class FitnessViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var vcs = [SubCollectionViewController]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let abs = SubCollectionViewController()
        abs.x = [Recipe(name: "10 Minute Core Blast"), Recipe(name: "Two"), Recipe(name: "Three")]
        
        vcs.append(abs)
        
        let legs = SubCollectionViewController()
        legs.x = [Recipe(name: "Glute Activation"), Recipe(name: "Tfhfgchjcfgwo"), Recipe(name: "Tdsfhree")]
        
        vcs = [abs, legs]
        
        
        for vc in vcs {
            addChildContentViewController(vc)
        }
        
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(FitnessCell.self, forCellWithReuseIdentifier: "FitnessCell")
    }
    
    private func addChildContentViewController(_ childViewController: UIViewController) {
        addChild(childViewController)
        childViewController.didMove(toParent: self)
    }
    
    
}

extension FitnessViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return vcs.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FitnessCell", for: indexPath) as! FitnessCell
        cell.contentView.backgroundColor = .black
        let vc = vcs[indexPath.row]
        cell.hostedView = vc.view
        return cell
    }
    
    
}

extension FitnessViewController: UICollectionViewDelegate {
    
}


extension FitnessViewController: UICollectionViewDelegateFlowLayout {
    
    //  func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
    //
    //  }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 220)
    }
    
}
