import UIKit
import Foundation

func alertError(mensaje: String) -> UIAlertController{
    let alert = UIAlertController(title: "Error", message: NSLocalizedString(mensaje, comment: ""),preferredStyle: .alert)
    
    alert.addAction(UIAlertAction(title: "ok", style: .default, handler: nil))
    
    return alert
}
