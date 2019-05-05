//
//  ToyCollectionViewCell.swift
//  Toy-Contest
//
//  Created by wookeon on 06/05/2019.
//  Copyright © 2019 toyContest. All rights reserved.
//

import UIKit

class ToyCollectionViewCell: UICollectionViewCell {
    // ToyCollection - ToyCollectionViewCell - ContentView - Image
    @IBOutlet var toyImg: UIImageView!
    // ToyCollection - ToyCollectionViewCell - ContentView - Title
    @IBOutlet var toyTitle: UILabel!
    // ToyCollection - ToyCollectionViewCell - ContentView - Category
    @IBOutlet var category: UILabel!
    var like : Int = 0
    var clicked : Bool = false
    
    // 객체 초기화
    override func awakeFromNib() {
        super.awakeFromNib()
        
        toyImg.layer.cornerRadius = 3
        toyImg.layer.masksToBounds = true
    }
    
    @IBAction func likeBtn()
    {
        clicked = true
        
        if clicked == true
        {
            like += 1
            toyImg.image = UIImage(named: "btnLikeon.png")
        }
        else
        {
            toyImg.image = UIImage(named: "btnLikeoff.png")
        }
    }
}
