//
//  Toy.swift
//  Toy-Contest
//
//  Created by wookeon on 06/05/2019.
//  Copyright © 2019 toyContest. All rights reserved.
//

import Foundation
import UIKit

// Music 모델입니다.
// 멤버 변수가 총 세 개인 Music 구조체를 생성했습니다.
struct Toy {
    var toyImg: UIImage?
    var toyTitle: String
    var toyCategory: String
    
    init(title: String, toyName: String, category: String) {
        self.toyImg = UIImage(named: toyName)
        self.toyTitle = title
        self.toyCategory = category
    }
}
