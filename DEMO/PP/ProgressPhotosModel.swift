import UIKit

class ProgressPhotosModel {
    var id: String!
    var title: String!
    
    init(title: String!) {
        id = UUID().uuidString
        self.title = title
    }
}
