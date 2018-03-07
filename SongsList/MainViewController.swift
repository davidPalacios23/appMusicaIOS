

import UIKit


class MainViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    var url: String = ""
    var songName: String = ""
    
    @IBOutlet weak var songsList: UITableView!
    let dataManager = DataManager()
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        songsList.dataSource = self
        songsList.delegate = self
        getList()
    }
    
    func getList() {
        dataManager.getSongs(params: [:]) { (json) in
            
            if json.code == 200{
                let songsInArray = json.data["allSongs"] as! [NSDictionary]
                for song in songsInArray{
                    songs.append(SongJSON(json: song as! [String : Any]))
                }
                self.songsList.reloadData()
            }else{
                print("error")
            }

        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell : Cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as! Cell
        
        if indexPath.row % 2 == 0 {
            cell.backgroundColor = UIColor.darkGray
        } else{
            cell.backgroundColor = UIColor.clear
        }
        
        cell.songName.text = songs[indexPath.row].name
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return songs.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        url = songs[indexPath.row].url
        songName = songs[indexPath.row].name
        goToMediaPlayer()
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        let destiny = segue.destination as! PlayerViewController
//        let cell = sender as! Cell
//        destiny.url = url
//        destiny.songName = cell.songName.text!
//
//
//    }
    
    func goToMediaPlayer() {
        let vc = storyboard?.instantiateViewController(withIdentifier: "PlayerViewController") as! PlayerViewController
        vc.modalTransitionStyle = .crossDissolve
        vc.url = url
        vc.songName = songName
        self.present(vc, animated: true, completion: nil)
    }
    
    
    

}

