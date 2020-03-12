//
//  HomeViewController.swift
//  VIPER SIMPLE
//
//  Created by Roman Gorshkov on 02.03.2020.
//  Copyright © 2020 Roman Gorshkov. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    var interactor: HomeInteractor?
    var navigation: HomeWireframe?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func didTapLogoutButton(sender: AnyObject) {
        self.navigation?.dismissHomeVC()
    }
    
    @IBAction func didTapDeleteUserButton(sende: AnyObject) {
        self.interactor?.deleteUsers()
        self.navigation?.dismissHomeVC()
    }
}
