

import Foundation
import UIKit

class Song  {
    let name: String
    let artist: String
    let audio: URL
    let image: UIImage
    
    init(name: String, artist: String, audio: URL, image: UIImage) {
        self.name = name
        self.artist = artist
        self.audio = audio
        self.image = image
    }
}
