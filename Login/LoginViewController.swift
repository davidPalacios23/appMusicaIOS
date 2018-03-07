
import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var passTextfield: UITextField!
    @IBOutlet weak var userTextfield: UITextField!
    let dataManager = DataManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    @IBAction func ocultarTeclado(_ sender: UITextField) {
        sender.resignFirstResponder()
    }

    @IBAction func botonLogin(_ sender: UIButton) {
        
        if (userTextfield.text?.isEmpty)! || (passTextfield.text?.isEmpty)!
        {
           present(alertError(mensaje:"mensajeLoginIncorrecto"), animated: true, completion: nil)
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
