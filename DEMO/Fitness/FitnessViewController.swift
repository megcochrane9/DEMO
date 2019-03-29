import UIKit
import FirebaseDatabase

class FitnessViewController: UIViewController {
    
    @IBOutlet weak var collectionView2: UICollectionView!
    
    var vcs = [SubCollectionViewController2]()
    var ref: DatabaseReference?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let titles = ["Cardio"]
        let headerId = "headerId"
        
        for title in titles {
            let vc = SubCollectionViewController2()
            vc.category = title
            addChildContentViewController(vc)
            vc.delegate = self
            vcs.append(vc)
        }
        
        collectionView2.delegate = self
        collectionView2.dataSource = self
        collectionView2.register(FitnessCell.self, forCellWithReuseIdentifier: "FitnessCell")
        collectionView2.register(UICollectionViewCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerId)
    }
    
    private func addChildContentViewController(_ childViewController: UIViewController) {
        addChild(childViewController)
        childViewController.didMove(toParent: self)
    }
    
    func collectionView2(_ collectionView2: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 50)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let desitnationVC = segue.destination as? FitnessDetailViewController {
            desitnationVC.fitness = (sender as! Fitness)
        }
    }
    
    
}

extension FitnessViewController: UICollectionViewDataSource {
    
    func collectionView2(_ collectionView2: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return vcs.count
    }
    
    func collectionView2(_ collectionView2: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView2.dequeueReusableCell(withReuseIdentifier: "FitnessCell", for: indexPath) as! FitnessCell
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
    
    private func collectionView2(_ collectionView2: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 220)
    }
    
}

extension FitnessViewController: FitnessSelectedDelegate {
    
    func didSelect(fitness: Fitness) {
        performSegue(withIdentifier: "Detail", sender: fitness)
    }
    
}
