import UIKit

class ProgressPhotosFunctions {
    static func createProgressPhoto(progressPhotoModel: ProgressPhotosModel) {
        Data.progressPhotosModels.append(progressPhotoModel)
}
    
    static func readProgressPhotos(completion: @escaping () -> ()) {
        DispatchQueue.global(qos: .userInteractive).async {
            if Data.progressPhotosModels.count == 0 {
                Data.progressPhotosModels.append(ProgressPhotosModel(title: "01/01/2019"))
                Data.progressPhotosModels.append(ProgressPhotosModel(title: "01/02/2019"))
                Data.progressPhotosModels.append(ProgressPhotosModel(title: "01/03/2019"))
        }
    }
        
        DispatchQueue.main.async {
            completion()
        }
        
        
}

    static func updateProgressPhotos(progressPhotoModel: ProgressPhotosModel) {
        
}
    
    static func deleteProgressPhotos(progressPhotoModel: ProgressPhotosModel) {
}
}
