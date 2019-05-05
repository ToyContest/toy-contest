//
//  ResultVC.swift
//  Toy-Contest
//
//  Created by 구민영 on 05/05/2019.
//  Copyright © 2019 toyContest. All rights reserved.
//

import UIKit

class ResultVC: UIViewController {
    @IBOutlet weak var shareBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    func setup() {
        shareBtn.addTarget(self, action: #selector(tapShareBtn), for: .touchUpInside)
    }
    
    @objc func tapShareBtn() {
        // Feed 타입 템플릿 오브젝트 생성
        let template = KMTFeedTemplate { (feedTemplateBuilder) in
            
            // 컨텐츠
            feedTemplateBuilder.content = KMTContentObject(builderBlock: { (contentBuilder) in
                contentBuilder.title = "장난감이름장난감이름장난감이름"
                contentBuilder.desc = "나 이거 사죠!!!!!!!!!!!!!!!!!!!!!!!"
                contentBuilder.imageURL = URL(string: "http://mud-kage.kakao.co.kr/dn/Q2iNx/btqgeRgV54P/VLdBs9cvyn8BJXB3o7N8UK/kakaolink40_original.png")!
                contentBuilder.link = KMTLinkObject(builderBlock: { (linkBuilder) in
                    linkBuilder.mobileWebURL = URL(string: "https://developers.kakao.com")
                })
            })
            
            // 버튼
            feedTemplateBuilder.addButton(KMTButtonObject(builderBlock: { (buttonBuilder) in
                buttonBuilder.title = "자세히 보기"
                buttonBuilder.link = KMTLinkObject(builderBlock: { (linkBuilder) in
                    linkBuilder.mobileWebURL = URL(string: "https://developers.kakao.com")
                })
            }))
        }
        
        // 카카오링크 실행
        KLKTalkLinkCenter.shared().sendDefault(with: template, success: { (warningMsg, argumentMsg) in
            
            // 성공
            print("warning message: \(String(describing: warningMsg))")
            print("argument message: \(String(describing: argumentMsg))")
            
        }, failure: { (error) in
            
            // 실패
            print("error \(error)")
            
        })
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
