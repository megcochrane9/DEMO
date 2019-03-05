import UIKit

class PPViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    var imageArroy = [UIImage(named: "1"),UIImage(named: "1"),UIImage(named: "1")]

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageArroy.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PPImageCollectionViewCell", for: indexPath) as! PPImageCollectionViewCell
        
        cell.PPImage.image = imageArroy[indexPath.row]
        
        return cell
    }
    
    
}
