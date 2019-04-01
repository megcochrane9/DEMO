import Firebase

class Recipe {
  
    var name: String!
    var imageName: String?
  
  lazy var image: UIImage? = {
    guard let imageName = imageName else { return nil }
    return UIImage(named: imageName)
  }()

  init?(data: DocumentSnapshot) {
    guard let data = data.data() else { return nil }
    name = data["name"] as? String
    imageName = data["image"] as? String

  }

    
}
