import UIKit
import FirebaseDatabase

class FitnessViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var vcs = [FitnessSubCollectionViewController]()
    var ref: DatabaseReference?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let titles = ["Cardio"]
        let headerId = "headerId"
        
        for title in titles {
            let vc = FitnessSubCollectionViewController()
            vc.category = title
            addChildContentViewController(vc)
            vc.delegate = self
            vcs.append(vc)
        }
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(FitnessCell.self, forCellWithReuseIdentifier: "Cell")
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
        if let desitnationVC = segue.destination as? FitnessDetailViewController {
            desitnationVC.fitness = (sender as! Fitness)
        }
    }
    
    
}

extension FitnessViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return vcs.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! FitnessCell
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
    
    func collectionView(_ collectionView2: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 220)
    }
    
}

extension FitnessViewController: SelectionDelegate {
    
    func didSelect(data: Any) {
        performSegue(withIdentifier: "Detail", sender: data)
    }
    
}
