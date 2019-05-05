//
//  ToyDetailVC.swift
//  Toy-Contest
//
//  Created by wookeon on 06/05/2019.
//  Copyright © 2019 toyContest. All rights reserved.
//

import UIKit

class ToyDetailVC: UIViewController {

    // TableView. CollectionView 에서 선택한 Cell 의 정보를 담아둘 변수
    var toyImg: UIImage?
    var toyTitle: String?
    var category: String?
    
    // MusicDetailVC 의 인터페이스 빌더 상의 Outlet 변수들
    @IBOutlet var toyImgView: UIImageView!
    @IBOutlet var toyTitleLabel: UILabel!
    @IBOutlet var toyCategory: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setContents()
        setToyImgView()
    }
    
    func setContents() {
        toyImgView.image = toyImg
        toyTitleLabel.text = toyTitle
        toyCategory.text = category
    }
    
    func setToyImgView() {
        toyImgView.layer.cornerRadius = 5
        toyImgView.layer.masksToBounds = true
    }
    
    @IBAction func likeBtnCicked()
    {
        // 앞에 뷰 좋아요가 눌러져 있는지 상태에 따라 전달받고 싶다.
    }
}
