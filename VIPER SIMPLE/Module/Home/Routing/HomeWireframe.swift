//
//  HomeWireframe.swift
//  VIPER SIMPLE
//
//  Created by Roman Gorshkov on 05.03.2020.
//  Copyright © 2020 Roman Gorshkov. All rights reserved.
//

import UIKit

class HomeWireframe: NSObject, HomeWireframeProtocol {
    var window: UIWindow?
    var homeVC: HomeViewController?
    var splashScreenNavigation: SplashWireframe?
    func presentHomeVCInWindow() {
        let homeVC = UIStoryboard.init(name: "Home", bundle: nil)
        .instantiateViewController(identifier: "HomeViewController") as? HomeViewController
        self.homeVC = homeVC
        self.homeVC?.navigation = self
        self.homeVC?.interactor = HomeInteractor()
        self.window!.rootViewController = homeVC
        self.window?.makeKeyAndVisible()
    }
    
    func dismissHomeVC() {
        self.homeVC?.dismiss(animated: true, completion: nil)
        self.splashScreenNavigation? = SplashWireframe.sharedInstance
        self.splashScreenNavigation?.presentSplashScreenViewControllerInWindow()
    }
    

}
