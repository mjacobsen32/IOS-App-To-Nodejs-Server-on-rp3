//
//  APIFunctions.swift
//  Connect_To_Server
//
//  Created by Matthew Jacobsen on 6/6/21.
//

import Foundation
import Alamofire

class APIFunctions {
    func ls(completion: @escaping (String) -> Void){
        var ls_str: String = ""
        AF.request("http://10.34.65.49:8081/ls").response { response in
            ls_str = String(data: response.data!, encoding: .utf8)!
            completion(ls_str)
        }
    }
    func cat(file: String, completion: @escaping (String) -> Void){
        var cat_str: String = ""
        AF.request("http://10.34.65.49:8081/cat/" + file).response { response in
            cat_str = String(data: response.data!, encoding: .utf8)!
            completion(cat_str)
        }
    }
    func vim(name: String){
        let addr = "http://10.34.65.49:8081/vim/" + name
        AF.request(addr, method: .post).responseJSON { response in
            debugPrint(response)
        }
    }
    func append(str: String,file: String){
        let parameters = ["str": str, "file": file]
        AF.request("http://10.34.65.49:8081/append", method: .post, parameters: parameters).responseJSON { response in
            debugPrint(response)
        }
    }
}
