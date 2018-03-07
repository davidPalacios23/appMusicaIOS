
import UIKit
import AVFoundation
import WebKit

class PlayerViewController: UIViewController, WKNavigationDelegate, WKUIDelegate {
    
    var url: String = ""
    var songName: String = ""
    @IBOutlet weak var webContainer: UIView!
    var downloadTimer = Timer()
    var webView: WKWebView!
    let myActivityIndicator = UIActivityIndicatorView(activityIndicatorStyle: .gray)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(songName)
        print(url)
        
        myActivityIndicator.center = view.center
        myActivityIndicator.hidesWhenStopped = true
        myActivityIndicator.startAnimating()
        // Create WKWebView in code, because IB cannot add a WKWebView directly
        webView = WKWebView()
        webView.translatesAutoresizingMaskIntoConstraints = false
        webContainer.addSubview(webView)
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "|-[webView]-|",
                                                                           options: NSLayoutFormatOptions(rawValue: 0),
                                                                           metrics: nil,
                                                                           views: ["webView": webView]))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-[webView]-|",
                                                                           options: NSLayoutFormatOptions(rawValue: 0),
                                                                           metrics: nil,
                                                                           views: ["webView": webView]))
        webView.navigationDelegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        loadURL()
    }
    
    func loadURL() {
        let urlString = url
        guard let url = NSURL(string: urlString) else {return}
        let request = NSMutableURLRequest(url:url as URL)
        webView.load(request as URLRequest)
//        DispatchQueue.main.async {
//            self.downloadTimer = Timer.scheduledTimer(timeInterval: 0.06, target: self, selector: #selector(PlayerViewController.update), userInfo: nil, repeats: true)
//        }
    }

   
    



}
