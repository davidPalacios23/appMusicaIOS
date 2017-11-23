

import UIKit

class PlayingViewController: UIViewController {

    @IBOutlet weak var nameSong: UILabel!
    
    @IBOutlet weak var artistSong: UILabel!
    
    @IBOutlet weak var imageSong: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

      nameSong.text = songsList[0].name
      artistSong.text = songsList[0].artist
      imageSong.image = songsList[0].image
    }



}
