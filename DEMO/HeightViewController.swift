import UIKit

class HeightViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = String( Int(sliderOutlet.value) )
        sliderOutlet.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi / 2))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var sliderOutlet: UISlider!
   
    @IBAction func sliderSlid(_ sender: UISlider) {
        label.text = String( Int(sliderOutlet.value) )
    }
    
}
