//
//  SelectCategoryViewController.swift
//  Toy-Contest
//
//  Created by LeeSeungsoo on 05/05/2019.
//  Copyright © 2019 toyContest. All rights reserved.
//

import UIKit

class SelectCategoryViewController: UIViewController {
    
    @IBOutlet weak var category1: UIButton!
    @IBOutlet weak var category2: UIButton!
    @IBOutlet weak var category3: UIButton!
    @IBOutlet weak var category4: UIButton!
    @IBOutlet weak var category5: UIButton!
    @IBOutlet weak var category6: UIButton!
    @IBOutlet weak var category7: UIButton!
    @IBOutlet weak var category8: UIButton!
    @IBOutlet weak var category9: UIButton!
    var categoryBtns: [UIButton] = [UIButton]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.layoutIfNeeded()
        self.categoryBtns = [category1, category2, category3, category4, category5, category6, category7, category8, category9]
        applyCornerOfCatefgoryBtn()
    }
    
    @IBAction func goToMain(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let vc = storyboard.instantiateViewController(withIdentifier: "MainTab") as? CustomTabBarController {
            self.present(vc, animated: true)
        }
    }
    
    func applyCornerOfCatefgoryBtn() {
        for btn in categoryBtns {
            btn.applyCorner()
        } 
    }

}


