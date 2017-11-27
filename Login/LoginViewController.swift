
import UIKit

class LoginViewController: UIViewController {

        override func viewDidLoad() {
        super.viewDidLoad()

    }
    @IBAction func ocultarTeclado(_ sender: UITextField) {
        sender.resignFirstResponder()
    }

    @IBAction func botonLogin(_ sender: UIButton) {
        performSegue(withIdentifier: "accederLogin", sender: sender)
        
            }

    @IBAction func forgotPassword(_ sender: UIButton) {
        present(alertError(mensaje: "mensajeLoginIncorrecto"), animated: true, completion: nil)
    }
    
}
