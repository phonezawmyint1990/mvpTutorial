//
//  PetListPresenter.swift
//  mvpTutorial
//
//  Created by Aung Ko Ko on 06/10/2019.
//  Copyright © 2019 Phone Zaw Myint. All rights reserved.
//

import Foundation
protocol PetListPresenter {
    func onUIReady()
    func attachView(view:PetListView)
}
