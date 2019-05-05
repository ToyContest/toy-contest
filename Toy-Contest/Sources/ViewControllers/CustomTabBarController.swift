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
        self.setupMiddleButton()
        // Do any additional setup after loading the view.
    }
    
    func setupMiddleButton() {
        let menuButton = UIButton(frame: CGRect(x: 0, y: 0, width: 86, height: 74))
        
        var menuButtonFrame = menuButton.frame
        menuButtonFrame.origin.y = self.view.bounds.height - menuButtonFrame.height - 30
        menuButtonFrame.origin.x = self.view.bounds.width/2 - menuButtonFrame.size.width/2
        menuButton.frame = menuButtonFrame
        
        menuButton.backgroundColor = UIColor.clear
        menuButton.layer.cornerRadius = menuButtonFrame.height/2
        
        menuButton.setImage(UIImage(named: "btnGacha"), for: .normal)// 450 x 450px
        menuButton.contentMode = .scaleAspectFill
        menuButton.addTarget(self, action: #selector(menuButtonAction(_:)), for: .touchUpInside)
        self.view.addSubview(menuButton)
        self.view.layoutIfNeeded()
    }
    
    @objc func menuButtonAction(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Contest", bundle: nil)
        if let vc = storyboard.instantiateViewController(withIdentifier: "Contest") as? ContestVC {
            vc.modalPresentationStyle = .fullScreen
            present(vc, animated: true)
        }
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
