//
//  UIViewController+simpleAlert.swift
//  Toy-Contest
//
//  Created by LeeSeungsoo on 05/05/2019.
//  Copyright © 2019 toyContest. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    func simpleAlert(title: String, message msg: String, completion: ((UIAlertAction) -> Void)?) {
        let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "확인", style: .default, handler: completion)
        alert.addAction(okAction)
        present(alert, animated:true)
    }
}
