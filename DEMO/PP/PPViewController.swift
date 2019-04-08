import UIKit
import Photos
import UserNotifications

class PPViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
   
    
    
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
        profilePicture.layer.borderWidth = 4.0;
        profilePicture.layer.borderColor = UIColor.darkGray.cgColor
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
    ///////////////////////////////////////////////
                //Notifcations//
    ///////////////////////////////////////////////
    
    @IBAction func allowNotifications(_ sender: UISwitch) {

        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge])
    { (granted, error) in
    }
    
    let content = UNMutableNotificationContent()
        content.title = "MEGAFIT"
        content.subtitle = "Hey, I'm a notifcation!"
        content.body = "Look at me!"
        content.badge = 1
    
    let date = Date().addingTimeInterval(15)
        let dateComponents = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: date)
    
    let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
    
    let uuidString = UUID().uuidString
    let request = UNNotificationRequest(identifier: uuidString, content: content, trigger: trigger)
    
    UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
        // check the error parameter and handle any errors
    }
    ///////////////////////////////////////////////
                    //Add Button//
    ///////////////////////////////////////////////
    
  //  var isActive:Bool = false
    
  //  @IBOutlet weak var changeImageButton: UIButton!
 //   @IBAction func buttonStart(_ sender: UIButton) {
            
  //      changeImageButton.layer.shadowRadius = 4
  //      changeImageButton.layer.shadowOffset = CGSize(width: 0, height: 5)
  //      changeImageButton.layer.shadowColor = UIColor.darkGray.cgColor
  //      changeImageButton.layer.cornerRadius = 8
  //      changeImageButton.layer.shadowOpacity = 1
        
   //     if isActive {
   //        isActive = false
   //         changeImageButton.setImage(UIImage(named:"Cancel Button"), for: .normal)
    //    }
        
  //  else {
            
     //     isActive = true
     //       changeImageButton.setImage(UIImage(named:"Add Button"), for: .normal)
    //    }
        
        ///////////////////////////////////////////////
        //Table View//
        ///////////////////////////////////////////////
    
    weak var tableView: UITableView! {
    weak var addButton: UIButton!
    
    let tableView = UITableView()
    
        tableView.dataSource = self
        tableView.delegate = self

    ProgressPhotosFunctions.readProgressPhotos(completion: { [weak self] in
        self?.tableView.reloadData()
    })
    
    addButton.backgroundColor = Theme.tint
    addButton.layer.cornerRadius = addButton.frame.height / 2
    addButton.layer.shadowOpacity = 0.25
    addButton.layer.shadowRadius = 5
    addButton.layer.shadowOffset = CGSize(width: 0, height: 10)
return tableView
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toAddProgressSegue" {
            let popup = segue.destination as! AddProgressViewController
            popup.doneSaving = { [weak self] in
                self?.tableView.reloadData()
            }
        }
    }
    
    
}

extension PPViewController: UITableViewDataSource, UITableViewDelegate {

    
 func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return Data.progressPhotosModels.count
}

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! ProgressTableViewCell
    
    
        cell.setup(progressPhotosModel: Data.progressPhotosModels[indexPath.row])
        
        return cell
}

 func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
  return 160
        

    ///////////////////////////////////////////////
        //Add button tapped - visual effects//
    ///////////////////////////////////////////////
        

    
  //  @IBOutlet var addItemView: UIView!
  
    
//    func animateIn() {
//        self.view.addSubview(addItemView)
//        addItemView.center = self.view.center
//
//        addItemView.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
//        addItemView.alpha = 0
//
//        UIView.animate(withDuration: 0.4){
//           self.visualEffectView.effect = self.effect
//           self.addItemView.alpha = 1
//           self.addItemView.transform = CGAffineTransform.identity
//        }
//    }
//
//    func animateOut(){
//        UIView.animate(withDuration: 0.3, animations: {
//            self.addItemView.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
//            self.addItemView.alpha = 0
//
//            self.visualEffectView.effect = nil
//
//        }) { (success:Bool) in
//            self.addItemView.removeFromSuperview()
//        }
//    }
  
    
 //   @IBAction func addItem(_ sender: Any) {

      

    
 //   @IBAction func dismissPopUp(_ sender: Any) {
        
        

    



}
}

