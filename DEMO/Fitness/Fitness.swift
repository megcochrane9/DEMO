import Firebase

class Fitness {
    
    var name: String!
    var imageName: String?
    var body: String!
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
        videoName = data["video"] as? String
    }
    
    
}
