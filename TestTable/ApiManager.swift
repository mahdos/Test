//
//  ApiManager.swift
//  TestTable
//
//  Created by mohammad mahdi on ۱۳۹۷/۴/۱۶.
//  Copyright © ۱۳۹۷ mohammad mahdi. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire

class APImanager {
     func sendRequest(url : String , parameter : [String : Any] = [:] , callback : @escaping (DataResponse<Any>) -> Void){
        
        Alamofire.request(url, method: .get, parameters: nil).responseJSON { (response) in
            callback(response)
        }
        
        
    }
    
     func getData(callback:@escaping(List)->Void){
       let url = "https://api.github.com/repositories?since=500"
        
        
        sendRequest(url: url) { (response) in
            
            switch response.response?.statusCode{
            case 200 :
                do{
            let js = try JSON(data: response.data!)
            let list = List(items: js)
            callback(list)
                }catch let er{print(er)}
                
            break
            default:
                break
        }
        
        }
        
    }
    
    
}
