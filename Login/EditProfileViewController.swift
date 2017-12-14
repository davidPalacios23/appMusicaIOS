

import UIKit

class EditProfileViewController: UIViewController {

    @IBOutlet weak var profilePicture: UIImageView!
    
    @IBAction func save(_ sender: Any) {
        saveImage(image: profilePicture.image!, name: "profilePicture.jpg")
    }
 
    
    
    @IBAction func load(_ sender: UIButton) {
        let image = loadImage(name: "profilePicture.jpg")
        
        profilePicture.image = image
       
    }


    



}
