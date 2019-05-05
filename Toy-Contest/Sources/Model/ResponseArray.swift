//
//  ResponseArray.swift
//  Toy-Contest
//
//  Created by 구민영 on 06/05/2019.
//  Copyright © 2019 toyContest. All rights reserved.
//

import Foundation
import ObjectMapper

struct ResponseArray<T: Mappable>: Mappable {
    
    var status: Int?
    var message: String?
    var data: [T]?
    
    init?(map: Map) {}
    
    mutating func mapping(map: Map) {
        status <- map["status"]
        message <- map["message"]
        data <- map["data"]
    }
}
