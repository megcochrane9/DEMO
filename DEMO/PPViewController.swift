import UIKit
import Photos

class PPViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    let defaults = UserDefaults.standard
    
    struct Keys {
        static let personName = "personName"
        static let personWeight = "personWeight"
        static let profilePicture = "profilePicture"
    }
    
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
        profilePicture.layer.cornerRadius = profilePicture.frame.size.height / 2
        profilePicture.clipsToBounds = true
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
        
    ///////////////////////////////////////////////
                   //Save Button//
    ///////////////////////////////////////////////
    
    @IBAction func saveButtonTapped(_ sender: UIButton) {
        
            
        func saveName() {
            defaults.set(nameField.text!, forKey: Keys.personName)
    }
        
        func checkForSavedName() {
            let name = defaults.value(forKey: Keys.personName) as? String ?? ""
            nameField.text = name
    
    }
        func saveWeight() {
            defaults.set(weightField.text!, forKey: Keys.personWeight)
        }
        
        func checkForSavedWeight() {
            let weight = defaults.value(forKey: Keys.personWeight) as? String ?? ""
            weightField.text = weight
            
    }
        func saveProfilePicture() {
            defaults.set(profilePicture.image, forKey: Keys.profilePicture)
        }
        

}
}
