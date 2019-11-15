//
//  PetCollectionViewCell.swift
//  mvpTutorial
//
//  Created by Aung Ko Ko on 05/10/2019.
//  Copyright © 2019 Phone Zaw Myint. All rights reserved.
//

import UIKit
import SDWebImage

class PetCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imvCat: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    
    var mdata : CategoryVO?{
        didSet{
            imvCat.sd_setImage(with: URL(string: mdata!.icon))
            lblName.text = mdata?.name
        }
    }

    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

}
