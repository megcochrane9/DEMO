import UIKit

class ProgressPhotosFunctions {
    static func createProgressPhoto(progressPhotoModel: ProgressPhotosModel) {
}
    
    static func readProgressPhotos() {
        if Data.progressPhotosModels.count == 0 {
            Data.progressPhotosModels.append(ProgressPhotosModel(title: "01/01/2019"))
            Data.progressPhotosModels.append(ProgressPhotosModel(title: "01/02/2019"))
            Data.progressPhotosModels.append(ProgressPhotosModel(title: "01/03/2019"))
        }
}

    static func updateProgressPhotos(progressPhotoModel: ProgressPhotosModel) {
        
}
    
    static func deleteProgressPhotos(progressPhotoModel: ProgressPhotosModel) {
}
}
