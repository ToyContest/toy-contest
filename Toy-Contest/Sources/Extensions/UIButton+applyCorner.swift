//
//  UIButton+applyCorner.swift
//  Toy-Contest
//
//  Created by LeeSeungsoo on 05/05/2019.
//  Copyright © 2019 toyContest. All rights reserved.
//

import UIKit

extension UIButton {
    func applyCorner() {
        self.layer.cornerRadius = self.frame.height / 2
        self.clipsToBounds = true
        self.backgroundColor = UIColor.cyan
    }
}
