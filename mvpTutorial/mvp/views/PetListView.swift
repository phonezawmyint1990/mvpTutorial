//
//  PetListView.swift
//  mvpTutorial
//
//  Created by Aung Ko Ko on 06/10/2019.
//  Copyright © 2019 Phone Zaw Myint. All rights reserved.
//

import Foundation
protocol PetListView: BaseView{
    func displayCategories(data:[CategoryVO])
    func displayErrot(error:String)
    func displayCatsList(data:[CatVO])
}
