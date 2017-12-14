

import UIKit
import AVFoundation

class PlayingViewController: UIViewController {

    @IBOutlet weak var nameSong: UILabel!
    
    @IBOutlet weak var artistSong: UILabel!
    
    @IBOutlet weak var imageSong: UIImageView!
    
    @IBOutlet weak var background: UIImageView!
    
    var player: AVAudioPlayer?
    
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
            UIView.transition(with: view, duration: 1, options: .transitionFlipFromRight, animations: nil, completion: nil) //animacion de voltear la página
            newSong(songIndex: currentSong)
            //appear()
            
        }
       
    }

    @IBAction func changeLeft(_ sender: Any) {
        
        if currentSong > 0 {
            currentSong -= 1
             UIView.transition(with: view, duration: 1, options: .transitionFlipFromLeft, animations: nil, completion: nil) //animacion de voltear la página
            newSong(songIndex: currentSong)
            //appear()
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
    
    func loadAudio(url: URL){ //a esta funcion la llamo dentro de newSong.
        
       do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
          } catch {
                present(alertError(mensaje: "mensajeCancionNoEncontrada"), animated: true, completion: nil)
            }
            
            
    }
    
    
  
    
    func newSong(songIndex: Int) {
        nameSong.text = songsList[songIndex].name
        artistSong.text = songsList[songIndex].artist
        imageSong.image = songsList[songIndex].image
        background.image = songsList[songIndex].image
        
        loadAudio(url: songsList[songIndex].audio) //reproduzco la canción que sale en pantalla
    }
}
