//
//  UIViewController+extensions.swift
//  Toy-Contest
//
//  Created by 구민영 on 05/05/2019.
//  Copyright © 2019 toyContest. All rights reserved.
//

import Foundation

func gsno(_ value: String?) -> String{
    guard let value_ = value else {
        return ""
    }
    return value_
}

func gino(_ value: Int?) -> Int{
    guard let value_ = value else {
        return 0
    }
    return value_
}//func gino

func gbno(_ value: Bool?) -> Bool{
    guard let value_ = value else {
        return false
    }
    return value_
}//func gbno

func gfno(_ value: Float?) -> Float{
    guard let value_ = value else{
        return 0
    }
    return value_
}//func gfno
