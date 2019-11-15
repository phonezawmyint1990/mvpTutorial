//
//  LoginPresenter.swift
//  mvpTutorial
//
//  Created by Aung Ko Ko on 05/10/2019.
//  Copyright © 2019 Phone Zaw Myint. All rights reserved.
//

import Foundation
protocol LoginPresenter {
    func onUIReady()
    func attachView(view:LoginView)
    func onClickGetStarted()
}
