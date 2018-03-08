

import UIKit
import Toast_Swift

class RegisterViewController: UIViewController {

    
    @IBOutlet weak var user: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!
    
    @IBOutlet weak var repeatPassField: UITextField!
    
    @IBOutlet weak var emailField: UITextField!
    
    var dataManager = DataManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    
    @IBAction func register(_ sender: UIButton) {
        //Se comprueban que todos los campos sean válidos y se hace la llamada a la API
        if (user.text?.isEmpty)! || (passwordField.text?.isEmpty)! /*|| (emailField.text?.isEmpty)!*/ {
            self.view.makeToast("No puede haber campos vacíos", duration: 3.0, position: .top)
            print("campos vacios")
        }/*else if !(emailField.text?.isValidEmail())!{
            self.view.makeToast("El email debe tener un formato adecuado", duration: 3.0, position: .top)
        }*/else if (passwordField.text?.count)! < 6{
            self.view.makeToast("La contraseña debe tener al menos 6 caracteres", duration: 3.0, position: .top)
        }else if passwordField.text != repeatPassField.text{
            self.view.makeToast("Las contraseñas deben coincidir", duration: 3.0, position: .top)
        }else{
            
            register(parameters: ["name": user.text!, "password": passwordField.text!, "repeatPass": repeatPassField.text!, "email": emailField.text!])
        }
    }

    func register (parameters: [String: Any]){
      
       
            //Se hace la llamada a la API y se filtran los códigos de respuesta
            dataManager.postCreateUser(params: parameters) { (json) in
                if json.code == 200{
                    print("registrado correctamente")
                    self.view.makeToast("Usuario registrado correctamente", duration: 3.0, position: .top)
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                     self.goToLogin()
                    }
                } else if json.code == 401 || json.code == 419{
                    self.view.makeToast(json.message, duration: 3.0, position: .top)
                   
                } else if json.code == 400 || json.code == 500 {
                    self.view.makeToast(json.message, duration: 3.0, position: .top)
                    
                }
                
            }
   
    }
    @IBAction func goBack(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    func goToLogin() {
        let vc = storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        vc.modalTransitionStyle = .crossDissolve
        self.present(vc, animated: true, completion: nil)
    }

}
