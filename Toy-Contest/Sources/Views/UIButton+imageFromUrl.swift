//
//  UIButton+imageFromUrl.swift
//  Toy-Contest
//
//  Created by 구민영 on 05/05/2019.
//  Copyright © 2019 toyContest. All rights reserved.
//

import Foundation
import Kingfisher

// Kingfisher를 이용하여 url로부터 이미지를 가져오는 extension
extension UIButton {
    public func imageFromUrl(_ urlString: String?, defaultImgPath : String) {
        let defaultImg = UIImage(named: defaultImgPath)
        if let url = urlString {
            if url.isEmpty {
                //self.image = defaultImg
                self.setImage(defaultImg, for: .normal)
            } else {
//                self.kf.setImage(with: URL(string: url), placeholder: defaultImg, options: [.transition(ImageTransition.fade(0.5))])
                self.kf.setBackgroundImage(with: URL(string: url), for: .normal)
            }
        } else {
            //self.image = defaultImg
            self.setImage(defaultImg, for: .normal)
        }
    }
}
