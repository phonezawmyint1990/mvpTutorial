//
//  CategoryVO.swift
//  mvpTutorial
//
//  Created by Aung Ko Ko on 06/10/2019.
//  Copyright © 2019 Phone Zaw Myint. All rights reserved.
//

import Foundation
class CategoryVO: Codable {
    var id: Int = 0
    var name: String = ""
    var icon: String = ""
    
    enum CodingKeys: String, CodingKey{
     case id,name,icon
    }
}
