//
//  List.swift
//  TestTable
//
//  Created by mohammad mahdi on ۱۳۹۷/۴/۱۶.
//  Copyright © ۱۳۹۷ mohammad mahdi. All rights reserved.
//

import Foundation
import SwiftyJSON
class List {
 var ListOfRep = [repo]()
    init(items:JSON) {
        
        let arr = items.array
        for i in arr! {
          let d = repo(items: i)
            ListOfRep.append(d)
        }
    }
    init() {}
    init(repos:[repo]) {
        ListOfRep = repos
    }

    
}



class repo {
    var name : String?
    var FullName:String?
    
    
    
    
    
    init(items:JSON) {
        
        
   
        let nameG = items["name"].string
        let FullnameG = items["full_name"].string

        name = nameG
        FullName = FullnameG
    }

}
