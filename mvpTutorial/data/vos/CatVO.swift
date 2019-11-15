//
//  CatVO.swift
//  mvpTutorial
//
//  Created by Aung Ko Ko on 16/10/2019.
//  Copyright © 2019 Phone Zaw Myint. All rights reserved.
//

import Foundation
class CatVO: Codable{
    var image : String = ""
    var type : String = ""
    var age : String = ""
    var distance : String = ""
    var gender : String = ""
    
    enum CodingKeys: String, CodingKey{
        case image,type,age,distance,gender
    }
}
