//
//  SplashViewController.swift
//  VIPER SIMPLE
//
//  Created by Roman Gorshkov on 02.03.2020.
//  Copyright © 2020 Roman Gorshkov. All rights reserved.
//

import UIKit

class SplashViewController: UIViewController {

    var navigation: SplashWireframe?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func didTapSignupButton(sender: AnyObject) {
        self.navigation?.presentSignupViewController()
    }

    @IBAction func didTapLoginButton(sender: AnyObject) {
        self.navigation?.presentLoginViewController()
    }
}
