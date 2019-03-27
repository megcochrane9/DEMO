import UIKit
import WebKit

class HomeViewController: UIViewController, WKUIDelegate {
    
    @IBOutlet weak var webViewController: WKWebView!
    
    
    var webView: WKWebView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let myURL = URL(string: "https://megafit.home.blog")
        let myRequest = URLRequest(url: myURL!)
        setupWKWebViewConstraints()
        webViewController.load(myRequest)
    }
    
    func setupWKWebViewConstraints() {
        
        let paddingConstant:CGFloat = 0
        
        webViewController.translatesAutoresizingMaskIntoConstraints = true
        
        webViewController.topAnchor.constraint(equalTo: self.view.topAnchor, constant: paddingConstant).isActive = true
        webViewController.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -paddingConstant).isActive = true
        webViewController.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: paddingConstant).isActive = true
        webViewController.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -paddingConstant).isActive = true
    }
    
}
