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
    var toyList: [Toy] = [Toy]()
    var idx = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
//        fstToyBtn.imageFromUrl(gsno(toyUrlList[0]), defaultImgPath: "default.png")
//        secToyBtn.imageFromUrl(gsno(toyUrlList[1]), defaultImgPath: "default.png")
    }
    
    func setup() {
        getToys()
        fstToyBtn.addTarget(self, action: #selector(imageTapped), for: .touchUpInside)
        secToyBtn.addTarget(self, action: #selector(imageTapped), for: .touchUpInside)
    }
    

    @objc func imageTapped() {
        manager.addTapCnt()
        manager.pushToy(selectedToy: toyList[idx])
        knckStageLb.text = manager.getKnckStage()
        maxRoundsLb.text = "\(manager.getMaxRounds())"
        curRoundsLb.text = "\(manager.getCurRounds())"
        changeToyImg()
        
        if manager.getCurRounds() == 1 && manager.getMaxRounds() != 8 {
            toyList = manager.getSelectedToys()
            manager.selectedToys.removeAll()
            
        }
    }
    
    func getToys() {
        ContestService.shared.getToyList(userId: "ing") { [weak self] (data) in
            guard let `self` = self else {return}
            self.toyList = data
            self.fstToyBtn.imageFromUrl(gsno(self.toyList[0].img_path), defaultImgPath: "default.png")
            self.secToyBtn.imageFromUrl(gsno(self.toyList[1].img_path), defaultImgPath: "default.png")
        }
    }
    
    func changeToyImg() {
        idx = manager.getImgIdx()
        fstToyBtn.imageFromUrl(gsno(toyList[idx].img_path), defaultImgPath: "default.png")
        secToyBtn.imageFromUrl(gsno(toyList[idx+1].img_path), defaultImgPath: "default.png")
    }
}
