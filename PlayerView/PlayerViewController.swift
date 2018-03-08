
import UIKit
import AVFoundation
import WebKit

class PlayerViewController: UIViewController, WKNavigationDelegate, WKUIDelegate {
    
    @IBOutlet weak var songNameTitle: UITextField!
    var url: String = ""
    var songName: String = ""
    @IBOutlet weak var webContainer: UIView!
    var downloadTimer = Timer()
    var webView: WKWebView!
    let myActivityIndicator = UIActivityIndicatorView(activityIndicatorStyle: .gray)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        songNameTitle.text = songName
        myActivityIndicator.center = view.center
        myActivityIndicator.hidesWhenStopped = true
        myActivityIndicator.startAnimating()
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
    
    @IBAction func goBack(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    func loadURL() {
        let urlString = url.replacingOccurrences(of: "watch?v=", with: "embed/")
        guard let url = NSURL(string: urlString) else {return}
        let request = NSMutableURLRequest(url:url as URL)
        webView.load(request as URLRequest)
    }

   
    



}
