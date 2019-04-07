import UIKit

class ProgressPhotosModel {
    let id: UUID
    var title: String
    
    init(title: String!) {
        id = UUID()
        self.title = title
    }
}
