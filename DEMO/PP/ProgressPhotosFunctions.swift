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

  static func readProgressPhoto(by id:UUID, completion: @escaping (ProgressPhotosModel?) -> ()) {
    DispatchQueue.global(qos: .userInitiated).async {
      let progress = Data.progressPhotosModels.first(where: { $0.id == id })
      DispatchQueue.main.async {
        completion(progress)
      }
    }
  }

  static func updateProgressPhotos(at index: Int, title: String, image: UIImage? = nil) {
    Data.progressPhotosModels[index].title = title
    Data.progressPhotosModels[index].image = image

  }

  static func deleteProgressPhotos(index: Int) {
    Data.progressPhotosModels.remove(at: index)
  }
}
