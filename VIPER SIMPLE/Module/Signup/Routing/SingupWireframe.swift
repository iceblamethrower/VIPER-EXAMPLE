//
//  SingupWireframe.swift
//  VIPER SIMPLE
//
//  Created by Roman Gorshkov on 05.03.2020.
//  Copyright © 2020 Roman Gorshkov. All rights reserved.
//

import UIKit

class SingupWireframe: NSObject, SingupWireframeProtocol {
    
    var singupViewController: SingupViewController?
    func dismissSignupViewController() {
        self.singupViewController?.dismiss(animated: true, completion: nil)
    }
    
    func presentHomeScreen() {
        let homeVC = UIStoryboard.init(name: "Home", bundle: nil)
            .instantiateViewController(identifier: "HomeViewController") as? HomeViewController
        homeVC?.navigation = HomeWireframe()
        homeVC?.navigation?.homeVC = homeVC
        homeVC?.navigation?.splashScreenNavigation = SplashWireframe.sharedInstance
        homeVC?.interactor = HomeInteractor()
        self.singupViewController?.present(homeVC!, animated: true, completion: nil)
    }
}
