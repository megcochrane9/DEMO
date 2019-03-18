import UIKit
import Photos

class PPViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkForSavedName()
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
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var weightField: UITextField!
    
    let defaults = UserDefaults.standard
        
    struct Keys {
        static let name = "name"
    }
    
    
    func configureTextFields() {
        nameTextField.delegate = self as? UITextFieldDelegate
        weightField.delegate = self as? UITextFieldDelegate
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        nameTextField.resignFirstResponder()
        weightField.resignFirstResponder()
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
        
    }
    
    ///////////////////////////////////////////////
                    //Save Button//
    ///////////////////////////////////////////////
    
    @IBAction func saveButtonTapped(_ sender: Any) {
    }
    
    func saveName() {
        defaults.set(nameTextField.text!, forKey: Keys.name)
            
        }
    func checkForSavedName() {
        let name = defaults.value(forKey: Keys.name) as! String
            nameTextField.text = name
        }
        
    ///////////////////////////////////////////////
            //Personal Progres Photos//
    ///////////////////////////////////////////////
    
  
        }

