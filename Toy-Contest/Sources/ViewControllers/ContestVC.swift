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
    var toyUrlList = ["https://i.pinimg.com/564x/b4/ed/c5/b4edc50a72b865e4296dac713af12804.jpg",
        "https://i.pinimg.com/564x/c0/1c/b6/c01cb6e2c42811cd51b7a26b1845fa76.jpg",
        "https://i.pinimg.com/564x/97/f9/35/97f93569e79136866c542b4a9d89477c.jpg",
        "https://i.pinimg.com/564x/ad/2e/c0/ad2ec0c66e040d73ac2ae49f0cfbee86.jpg",
        "https://i.pinimg.com/564x/38/96/5c/38965c3b943d775408f9bdc168d231af.jpg",
        "https://i.pinimg.com/564x/01/2b/18/012b1893a7b8ff098eb9c07894ec947a.jpg",
        "https://i.pinimg.com/564x/bb/17/2f/bb172f0b5fb91b1ed50f11a552626e3d.jpg",
        "https://i.pinimg.com/564x/39/d2/09/39d209b65794ddfb797fea4c3e1efbff.jpg",
        "https://i.pinimg.com/564x/a8/48/7b/a8487b09b10fb3512967324b5e2e759f.jpg",
        "https://i.pinimg.com/564x/92/e6/24/92e624d8392f7ae612c107b3c487919c.jpg",
        "https://i.pinimg.com/564x/49/54/4c/49544c5b9f6d44c91c426669f168112c.jpg",
        "https://i.pinimg.com/564x/41/f5/e9/41f5e903af805004bf5138dc079a63bf.jpg",
        "https://i.pinimg.com/564x/d2/2d/86/d22d86ff7879eb9ac21e04e4ad7f8167.jpg",
        "https://i.pinimg.com/564x/dd/bf/85/ddbf85bfbbeb9a38945d9f0ad51b9df3.jpg",
        "https://i.pinimg.com/564x/bd/cf/fb/bdcffb2d1585b2742b95ac76da1930a3.jpg",
        "https://i.pinimg.com/564x/cb/57/bd/cb57bdbcda7c6ef4bc4ed07fecad34b4.jpg"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        fstToyBtn.imageFromUrl(gsno(toyUrlList[0]), defaultImgPath: "default.png")
        secToyBtn.imageFromUrl(gsno(toyUrlList[1]), defaultImgPath: "default.png")
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
        changeToyImg()
    }
    
    func changeToyImg() {
        let idx = manager.getImgIdx()
        fstToyBtn.imageFromUrl(gsno(toyUrlList[idx]), defaultImgPath: "default.png")
        secToyBtn.imageFromUrl(gsno(toyUrlList[idx+1]), defaultImgPath: "default.png")
    }
}
