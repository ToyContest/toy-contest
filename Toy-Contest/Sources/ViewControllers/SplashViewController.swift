//
//  SplashViewController.swift
//  Toy-Contest
//
//  Created by LeeSeungsoo on 05/05/2019.
//  Copyright © 2019 toyContest. All rights reserved.
//

import UIKit

class SplashViewController: UIViewController {
    
    let delayInSeconds = 1.0
    @IBOutlet weak var logoImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + delayInSeconds){
            UIView.animate(withDuration: 1.0, delay: 0, usingSpringWithDamping: 0.4, initialSpringVelocity: 0.4, options: .curveEaseInOut, animations: {
                self.logoImage.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
            }) { (_) in
                self.goToNext()
            }
            
        }
        
    }
    func goToNext() {
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "login") else {return}
        self.present(vc, animated: true, completion: nil)
    }
    
}
