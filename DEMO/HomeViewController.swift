import UIKit
import WebKit

class HomeViewController: UIViewController, WKUIDelegate {
    
    var webView: WKWebView?
    
    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView?.uiDelegate = self
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let myURL = URL(string: "https://megafit.home.blog/")
        let myRequest = URLRequest(url: myURL!)
        webView?.load(myRequest)
}

}
