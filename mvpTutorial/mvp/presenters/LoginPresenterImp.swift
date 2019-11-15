//
//  LoginPresenterImp.swift
//  mvpTutorial
//
//  Created by Aung Ko Ko on 05/10/2019.
//  Copyright © 2019 Phone Zaw Myint. All rights reserved.
//

import Foundation
class LoginPeresenterImp: BasePresenter {
    var mView:LoginView? = nil
}

extension LoginPeresenterImp : LoginPresenter {
    func onUIReady() {
    }
    
    func attachView(view: LoginView) {
        mView = view
    }
    
    func onClickGetStarted() {
        mView?.displayGreetingMessage(msg:"Hello")
    }
}
