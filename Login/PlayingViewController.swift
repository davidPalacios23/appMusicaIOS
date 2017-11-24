

import UIKit

class PlayingViewController: UIViewController {

    @IBOutlet weak var nameSong: UILabel!
    
    @IBOutlet weak var artistSong: UILabel!
    
    @IBOutlet weak var imageSong: UIImageView!
    
    @IBOutlet weak var background: UIImageView!
    
    var currentSong: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

      currentSong = 0
        
      newSong(songIndex: 0)
      
        appear()
      
      
            }


    @IBAction func changeRight(_ sender: Any) {
        
        if currentSong < songsList.count-1 {
            currentSong += 1
            newSong(songIndex: currentSong)
            appear()
            
        }
       
    }

    @IBAction func changeLeft(_ sender: Any) {
        
        if currentSong > 0 {
            currentSong -= 1
            newSong(songIndex: currentSong)
            appear()
        }
        
    }
   
   
    func appear() {
        imageSong.alpha = 0
            UIView.animate(withDuration: 0.5) {
                self.imageSong.alpha = 1
            }
        
            UIView.animate(withDuration: 1, animations: {
        
            self.nameSong.center = CGPoint(x: 100, y:100)
        
            })

    }
  
    
    func newSong(songIndex: Int) {
        nameSong.text = songsList[songIndex].name
        artistSong.text = songsList[songIndex].artist
        imageSong.image = songsList[songIndex].image
        background.image = songsList[songIndex].image
    }
}
