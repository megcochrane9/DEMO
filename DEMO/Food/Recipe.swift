import Firebase

class Recipe {
  
    var name: String!
    var imageName: String?
    var body: String!
    var body2: String!
    var videoName: String?
    
  lazy var image: UIImage? = {
    guard let imageName = imageName else { return nil }
    return UIImage(named: imageName)
  }()
    
  init?(data: DocumentSnapshot) {
    guard let data = data.data() else { return nil }
    name = data["name"] as? String
    imageName = data["image"] as? String
    body = data["body"] as? String
    body2 = data["body2"] as? String
    videoName = data["video"] as? String
  }

    
}
