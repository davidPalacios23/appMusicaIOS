
import UIKit
import Toast_Swift

class LoginViewController: UIViewController {

    @IBOutlet weak var passTextfield: UITextField!
    @IBOutlet weak var userTextfield: UITextField!
    let dataManager = DataManager()
    var toastStyle = ToastStyle() //Estilo del toast
    
    override func viewDidLoad() {
        super.viewDidLoad()
        toastStyle.backgroundColor = UIColor(red: 227.0, green: 0.86, blue: 102.0, alpha: 1.0)
        toastStyle.messageColor = #colorLiteral(red: 0.2666666667, green: 0.2666666667, blue: 0.2666666667, alpha: 1)
        toastStyle.messageFont = UIFont.systemFont(ofSize: 15, weight: 3)
        ToastManager.shared.style = toastStyle

    }
    @IBAction func ocultarTeclado(_ sender: UITextField) {
        sender.resignFirstResponder()
    }

    @IBAction func botonLogin(_ sender: UIButton) {
        
        if (userTextfield.text?.isEmpty)! || (passTextfield.text?.isEmpty)!
        {
           self.view.makeToast("Invalid user or password", duration: 3.0, position: .top)
        }
        else{
            login(parameters: ["name": userTextfield.text!,"password": passTextfield.text!])
        }
    }
    
    func login (parameters: [String: Any]){
        
        //Se hace la llamada a la API y se filtran los códigos de respuesta
        dataManager.getLogin(params: parameters) { (json) in
            if json.code == 200 {
                UserDefaults.standard.set(json.data["encodedToken"], forKey: "token")
                
                UserDefaults.standard.set(json.data["name"], forKey: "username")
                
                self.goToMain()
                
            } else if json.code == 401 || json.code == 419{
                 self.view.makeToast(json.message, duration: 3.0, position: .top)
                
            } else if json.code == 400 || json.code == 500 {
                print(String(describing:json))
            }

        }
        
    }
    
    @IBAction func forgotPassButton(_ sender: UIButton) {
        self.view.makeToast("funcionalidad en desarrollo", duration: 3.0, position: .top)
    }
    
    @IBAction func facebookButton(_ sender: UIButton) {
        self.view.makeToast("funcionalidad en desarrollo", duration: 3.0, position: .top)
    }
    
    @IBAction func gmailButton(_ sender: UIButton) {
        self.view.makeToast("funcionalidad en desarrollo", duration: 3.0, position: .top)
    }
    func goToForgotPass() {
        let vc = storyboard?.instantiateViewController(withIdentifier: "PasswordViewController") as! PasswordViewController
        vc.modalTransitionStyle = .crossDissolve
        self.present(vc, animated: true, completion: nil)
    }
    
    func goToMain() {
        let vc = storyboard?.instantiateViewController(withIdentifier: "MainViewController") as! MainViewController
        vc.modalTransitionStyle = .crossDissolve
        self.present(vc, animated: true, completion: nil)
    }
   
    
    @IBAction func goToRegisterButton(_ sender: UIButton) {
        goToRegister()
    }
    
    func goToRegister() {
        let vc = storyboard?.instantiateViewController(withIdentifier: "RegisterViewController") as! RegisterViewController
        vc.modalTransitionStyle = .crossDissolve
        self.present(vc, animated: true, completion: nil)
    }
}
