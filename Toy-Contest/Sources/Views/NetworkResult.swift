//
//  NetworkResult.swift
//  Toy-Contest
//
//  Created by 구민영 on 05/05/2019.
//  Copyright © 2019 toyContest. All rights reserved.
//

import Foundation

enum NetworkResult<T> {
    case success(T)
    case error(Error)
}
