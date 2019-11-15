//
//  ViewController.swift
//  mvpTutorial
//
//  Created by Aung Ko Ko on 05/10/2019.
//  Copyright © 2019 Phone Zaw Myint. All rights reserved.
//

import UIKit
import MaterialComponents.MaterialTextFields

class ViewController: UIViewController {
    
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var btnGetstarted: UIButton!
    @IBOutlet weak var txtEmail: MDCTextField!
    @IBOutlet weak var txtPassword: MDCTextField!
    
    private let mPresenter: LoginPeresenterImp = LoginPeresenterImp()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        btnGetstarted.layer.cornerRadius = 20
        mainView.layer.cornerRadius = 5
        txtEmail.placeholder = "phonezawmyint@gmail.com"
        mPresenter.attachView(view: self)
        
    }

    @IBAction func btnGetStartedAction(_ sender: Any) {
        mPresenter.onClickGetStarted()
    }
    
}

extension ViewController : LoginView {
    func displayGreetingMessage(msg: String) {
        print(msg)
    }
}
