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
    static let shared = ContestService()
    let contestUrl = url("/worldCup/")
    
    func getToyList(userId : String, completion: @escaping ([Toy]) -> Void) {
        //let body = ["user_id" : userId]
        let toyURL = contestUrl + userId
        
        Alamofire.request(toyURL, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseObject { (res: DataResponse<ResponseArray<Toy>>) in
            switch res.result {
            case .success:
                guard let data = res.result.value else { return }
                guard let toys = data.data else {return}
                completion(toys)
                
            // 실패했을 때
            case .failure(let err):
                print(err)
            }
        }
    }
}
