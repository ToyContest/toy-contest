//
//  Toy.swift
//  Toy-Contest
//
//  Created by 구민영 on 05/05/2019.
//  Copyright © 2019 toyContest. All rights reserved.
//

import Foundation
import ObjectMapper

struct Toy : Mappable {
    var user_id : String?
    var item_name : String?
    var img_path : String?
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        user_id <- map["user_id"]
        item_name <- map["item_name"]
        img_path <- map["img_path"]
    }
}
