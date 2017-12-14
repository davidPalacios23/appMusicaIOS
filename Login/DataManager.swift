

import Foundation
import UIKit



func saveImage(image: UIImage, name: String) {
    
    let fileManager = FileManager.default
    
    let imagePath = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString).appendingPathComponent(name)
    
    fileManager.createFile(atPath: imagePath, contents: UIImageJPEGRepresentation(image, 1.0))

}

func loadImage(name:String) -> UIImage? {
    
    let imagePath = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString).appendingPathComponent(name)
    
    let fileManager = FileManager.default
    
        if fileManager.fileExists(atPath: imagePath) {
            return UIImage(contentsOfFile: imagePath)!
        }else {
    
            return nil
        }
}
