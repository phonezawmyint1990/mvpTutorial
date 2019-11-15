//
//  PetTableViewCell.swift
//  mvpTutorial
//
//  Created by Aung Ko Ko on 05/10/2019.
//  Copyright © 2019 Phone Zaw Myint. All rights reserved.
//

import UIKit

class PetTableViewCell: UITableViewCell {
    @IBOutlet weak var imvCat: UIImageView!
    @IBOutlet weak var lblType: UILabel!
    @IBOutlet weak var lblAge: UILabel!
    @IBOutlet weak var lblDistance: UIButton!
    @IBOutlet weak var imvGender: UIImageView!
    
    var mdata : CatVO?{
        didSet{
            imvCat.sd_setImage(with: URL(string: mdata!.image))
            lblType.text = mdata?.type
            lblAge.text = mdata?.age
            lblDistance.setTitle( "Distance: " + mdata!.distance, for: .normal)
            if mdata?.gender == "male" {
                imvGender.image = UIImage(named: "icon_male")
            }else{
                imvGender.image = UIImage(named: "icon_female")
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
