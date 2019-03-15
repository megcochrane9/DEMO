import UIKit
import Photos

class PPViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    ///////////////////////////////////////////////
                    //Picture//
    ///////////////////////////////////////////////
    
    @IBOutlet weak var profilePicture: UIImageView!
    @IBOutlet weak var addImageButton: UIButton!
    
    @IBAction func addImageAction(_ sender: UIButton) {
    
        let imagePicker = UIImagePickerController()
        
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        
        self.present(imagePicker,animated: true, completion: nil)
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        profilePicture.image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage;
        self.dismiss(animated: true, completion: nil)
    }
    ///////////////////////////////////////////////
                    //Text Fields//
    ///////////////////////////////////////////////
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var weightField: UITextField!
    
    func configureTextFields() {
        nameField.delegate = self as? UITextFieldDelegate
        weightField.delegate = self as? UITextFieldDelegate
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        nameField.resignFirstResponder()
        weightField.resignFirstResponder()
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
        
    ///////////////////////////////////////////////
            //Personal Progres Photos//
    ///////////////////////////////////////////////
    
    var imageArray = [UIImage]()
    
    func grabPhotos() {
    
        let imgManager = PHImageManager.default()
        
        let requestOptions = PHImageRequestOptions()
        requestOptions.isSynchronous = true
        requestOptions.deliveryMode = .highQualityFormat
        
        let fetchOptions = PHFetchOptions()
        fetchOptions.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: false)]
        
        if let fetchResult : PHFetchResult = PHAsset.fetchAssets(with: .image, options: fetchOptions) {
        
            if fetchResult.count > 0 {
            
                for i in 0..<fetchResult.count{
                
                imgManager.requestImage(for: fetchResult.object(at: i) , targetSize: CGSize(width: 200, height: 200) , contentMode: .aspectFill , options: requestOptions, resultHandler: {
                    image, error in
                    
                imageArray.append(image!)
                    
                })
            }
        }
            
        else{
            print("You don't have any images.")
        }
}

        func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
            return imageArray.count
        }
        
        func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath as IndexPath)
            
            let imageView = cell.viewWithTag(1) as! UIImageView
            
            imageView.image = imageArray[indexPath.row]
            
            return cell

        }
    
   // extension PPViewController : UITextFieldDelegate {}
        
        }
    
}


}
