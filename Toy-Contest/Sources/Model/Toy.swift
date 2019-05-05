//
//  Toy.swift
//  Toy-Contest
//
//  Created by 구민영 on 05/05/2019.
//  Copyright © 2019 toyContest. All rights reserved.
//

import Foundation

class Toy {
    var imgUrl = ""
    var name = ""
    
    init() {}
    
    init(imgUrl : String, name : String) {
        self.imgUrl = imgUrl
        self.name = name
    }
}
