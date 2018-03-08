

import UIKit

class SongJSON: NSObject {
    
    var name: String = ""
    var url: String = ""
    override init() {
        //Solo se inicializa el objeto
    }
    
    init(json: [String: Any]) {
        //Se inicializa un objeto recibiendo un diccionario json
        name = json["name"] as! String
        url = json["url"] as! String
    }
    
    init(name: String, url: String) {
        //Se inicializa el objeto con los parametros del objeto
        self.name = name
        self.url = url
    }
    
}
