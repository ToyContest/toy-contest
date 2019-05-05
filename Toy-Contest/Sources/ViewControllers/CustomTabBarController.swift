//
//  CustomTabBarController.swift
//  Toy-Contest
//
//  Created by LeeSeungsoo on 06/05/2019.
//  Copyright © 2019 toyContest. All rights reserved.
//

import UIKit

class CustomTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        // Do any additional setup after loading the view.
    }

}

extension CustomTabBarController: UITabBarControllerDelegate {
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        if viewController is TempViewController {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            if let vc = storyboard.instantiateViewController(withIdentifier: "temp") as? TempViewController {
                vc.modalPresentationStyle = .fullScreen
                present(vc, animated: true)
            }
            return false
        }
        
        return true
    }
}
