
import UIKit
import Alamofire

class RequestController: NSObject {
    
    //Petición get estandarizada, necesita recibir url en formato URL, parametros como [String: Any] y headers como [String: String]
    func makeGetRequest(url: URL, params: Parameters, headers: HTTPHeaders, completionHandler: @escaping (_ json: JSONhttp) -> Void){
        Alamofire.request(url ,method: .get ,parameters: params, headers: headers).responseJSON(completionHandler: { (resp: DataResponse<Any>) in
            var requestResponse: JSONhttp = JSONhttp()
            
            if resp.result.value != nil{
                //Se parsea la respuesta en caso de que se pueda acceder al servidor y se devuelve
                let json = resp.result.value as! NSDictionary
                requestResponse = JSONhttp(json: json as! [String : Any])
                completionHandler(requestResponse)
            }else{
                //En caso de que la llamada no funcione se devuelve un mensaje estandarizado
                print(url)
                completionHandler(JSONhttp(code: 419, message: "No se ha podido conectar con el servidor, pruebe mas tarde", data: [:]) )
            }
        })
    }
    
    //Petición post estandarizada, necesita recibir url en formato URL, parametros como [String: Any] y headers como [String: String]
    func makePostRequest(url: URL, params: Parameters, headers: HTTPHeaders, completionHandler: @escaping (_ json: JSONhttp) -> Void){
        Alamofire.request(url ,method: .post ,parameters: params, headers: headers).responseJSON(completionHandler: { (resp: DataResponse<Any>) in
            var requestResponse: JSONhttp = JSONhttp()
            
            if resp.result.value != nil{
                //Se parsea la respuesta en caso de que se pueda acceder al servidor y se devuelve
                let json = resp.result.value as! NSDictionary
                requestResponse = JSONhttp(json: json as! [String : Any])
                completionHandler(requestResponse)
            }else{
                //En caso de que la llamada no funcione se devuelve un mensaje estandarizado
                completionHandler(JSONhttp(code: 419, message: "No se ha podido conectar con el servidor, pruebe mas tarde", data: [:]) )
            }
        })
    }
    //Petición post para subir ficheros estandarizada, necesita recibir url en formato URL, image como UIImage, parametros como [String: Any] y headers como [String: String]
    func makePostRequestMultipart(url: URL, params: Parameters, headers: HTTPHeaders, image: UIImage?, completionHandler: @escaping (_ json: JSONhttp) -> Void){
        Alamofire.upload(multipartFormData:{
            (multipartFormData) in
            //Se construye la petición primero comprobando si hay una imagen y despues con los parametros
            if image != nil {
                multipartFormData.append(UIImageJPEGRepresentation(image!, 0.1)!, withName: "photo", fileName: "profileimage.jpeg", mimeType: "image/jpeg")
            }
            for (key, value) in params {
                multipartFormData.append((value as AnyObject).data(using: String.Encoding.utf8.rawValue)!, withName: key)
            }
            //Se especifica la URL y los headers
        }, to: url, headers: headers)
        { (result) in
            //Se recibe la respuesta y se define si sale todo bien o no
            switch result {
            case .success(let upload,_,_ ):
                upload.responseJSON
                    { resp in
                        var requestResponse: JSONhttp = JSONhttp()
                        
                        if resp.result.value != nil{
                            //Se parsea la respuesta en caso de que se pueda acceder al servidor y se devuelve
                            let json = resp.result.value as! NSDictionary
                            requestResponse = JSONhttp(json: json as! [String : Any])
                            completionHandler(requestResponse)
                        }else{
                            //En caso de que la llamada no funcione se devuelve un mensaje estandarizado
                            completionHandler(JSONhttp(code: 419, message: "No se ha podido conectar con el servidor, pruebe mas tarde", data: [:]) )
                        }
                }
            case .failure( _):
                //En caso de que la llamada no funcione se devuelve un mensaje estandarizado
                completionHandler(JSONhttp(code: 419, message: "No se ha podido conectar con el servidor, pruebe mas tarde", data: [:]) )
                break
            }
        }
    }
}


