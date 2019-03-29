import UIKit
import SnapKit
import Firebase

protocol FitnessSelectedDelegate {
    func didSelect(fitness: Fitness)
}

class SubCollectionViewController2: UIViewController {
    
    var data = [Fitness]()
    var category: String!
    
    var delegate: FitnessSelectedDelegate?
    
    lazy var collectionView2: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        let collectionView2 = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView2.register(WorkoutCell.self, forCellWithReuseIdentifier: "Cell")
        collectionView2.backgroundColor = .blue
        return collectionView2
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView2.delegate = self as UICollectionViewDelegate
        collectionView2.dataSource = self as UICollectionViewDataSource
        view.addSubview(collectionView2)
        addConstraints()
        
        let ref = Firestore.firestore().collection(category)
        ref.getDocuments { snapshot, error in
            for document in snapshot!.documents {
                if let fitness = Fitness(data: document) {
                    self.data.append(fitness)
                }
            }
            self.collectionView2.reloadData()
        }
        
        
        
        
    }
    
    func addConstraints() {
        collectionView2.snp.makeConstraints { make in
            make.size.equalToSuperview()
            make.center.equalToSuperview()
        }
    }
    
}

extension SubCollectionViewController2: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {
    
    func collectionView2(_ collectionView2: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    private func collectionView2(_ collectionView2: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView2.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! WorkoutCell
        let fitness = data[indexPath.row]
        cell.titleLabel.text = fitness.name
        cell.imageView.image = fitness.image
        return cell
    }
    
    func collectionView2(_ collectionView2: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 220, height: view.frame.height)
    }
    
    func collectionView2(_ collectionView2: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let fitness = data[indexPath.row]
        delegate?.didSelect(fitness: fitness)
    }
    
}

