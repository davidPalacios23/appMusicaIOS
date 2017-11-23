
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
        mostrarError(mensaje: "mensajeLoginIncorrecto")
    }

    func mostrarError(mensaje: String){
        let alert = UIAlertController(title: "Error", message: NSLocalizedString(mensaje, comment: ""),preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "ok", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
}
