//
//  GetAllPetCategoryResponse.swift
//  mvpTutorial
//
//  Created by Aung Ko Ko on 06/10/2019.
//  Copyright © 2019 Phone Zaw Myint. All rights reserved.
//

import Foundation

class GetAllPetCategoryResponse: Codable {
    var code:Int = 0
    var message: String = ""
    var data: [CategoryVO] = []
}
