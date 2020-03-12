//
//  LoginWireframeProtocol.swift
//  VIPER SIMPLE
//
//  Created by Roman Gorshkov on 05.03.2020.
//  Copyright © 2020 Roman Gorshkov. All rights reserved.
//

import UIKit

class LoginWireframe: NSObject, LoginWireframeProtocol {
    var loginVC: LoginViewController?
    
    func dismissLoginVC() {
        self.loginVC?.dismiss(animated: true, completion: nil)
    }
    
    func presentHomeScreen() {
        let homeVC = UIStoryboard.init(name: "Home", bundle: nil)
        .instantiateViewController(identifier: "HomeViewController") as? HomeViewController
        homeVC?.navigation = HomeWireframe()
        homeVC?.interactor = HomeInteractor()
        homeVC?.navigation?.homeVC = homeVC
        self.loginVC?.present(homeVC!, animated: true, completion: nil)
    }
    
}
