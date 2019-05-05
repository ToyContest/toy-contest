//
//  ContestService.swift
//  Toy-Contest
//
//  Created by 구민영 on 05/05/2019.
//  Copyright © 2019 toyContest. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper

struct ContestService : APIManager {
    let toyImgUrl = url("/worldCup/:user")
    
    func getToyList(completion: @escaping ([Toy]) -> Void) {
        
    }
}
