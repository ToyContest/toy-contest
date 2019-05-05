//
//  APIManager.swift
//  Toy-Contest
//
//  Created by 구민영 on 05/05/2019.
//  Copyright © 2019 toyContest. All rights reserved.
//

import Foundation

protocol APIManager {}

extension APIManager {
    static func url(_ path: String) -> String {
        return "http://10.10.12.68:3000"+path
    }
}
