//
//  ContestVC.swift
//  Toy-Contest
//
//  Created by 구민영 on 05/05/2019.
//  Copyright © 2019 toyContest. All rights reserved.
//

import UIKit

class ContestVC: UIViewController {
    @IBOutlet weak var fstToyBtn: UIButton!
    @IBOutlet weak var secToyBtn: UIButton!
    @IBOutlet weak var knckStageLb: UILabel!
    @IBOutlet weak var maxRoundsLb: UILabel!
    @IBOutlet weak var curRoundsLb: UILabel!
    
    
    let manager = ContestManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
    
    func setup() {
        fstToyBtn.addTarget(self, action: #selector(imageTapped), for: .touchUpInside)
        secToyBtn.addTarget(self, action: #selector(imageTapped), for: .touchUpInside)
    }
    

    @objc func imageTapped() {
        manager.addTapCnt()
        manager.roundsPrint()
        knckStageLb.text = manager.getKnckStage()
        maxRoundsLb.text = manager.getMaxRounds()
        curRoundsLb.text = manager.getCurRounds()
    }
}
