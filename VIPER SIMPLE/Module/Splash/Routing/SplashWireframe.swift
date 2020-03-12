//
//  SplashWireframe.swift
//  VIPER SIMPLE
//
//  Created by Roman Gorshkov on 05.03.2020.
//  Copyright © 2020 Roman Gorshkov. All rights reserved.
//

import UIKit

class SplashWireframe: NSObject, SplashWireframeProtocol {
    
    var splashScreenViewController: SplashViewController?
    var window: UIWindow?
    static var sharedInstance = SplashWireframe()
    
    func presentSplashScreenViewControllerInWindow() {
        let splashScreenViewController = UIStoryboard.init(name: "Splash", bundle: nil)
        .instantiateViewController(identifier: "SplashViewController") as? SplashViewController
        self.splashScreenViewController = splashScreenViewController
        self.splashScreenViewController?.navigation = self
        self.window!.rootViewController = splashScreenViewController
        self.window?.makeKeyAndVisible()
    }
    
    func presentLoginViewController() {
      let loginViewController = UIStoryboard.init(name: "Login", bundle: nil)
        .instantiateViewController(identifier: "LoginViewController") as? LoginViewController
        loginViewController?.interactor = LoginInteractor()
        loginViewController?.interactor?.view = loginViewController
        loginViewController?.navigation = LoginWireframe()
        loginViewController?.navigation?.loginVC = loginViewController
        self.splashScreenViewController?.present(loginViewController!, animated: true, completion: nil)
    }
    
    func presentSignupViewController() {
        let signupViewController = UIStoryboard.init(name: "Signup", bundle: nil)
        .instantiateViewController(identifier: "SignupViewController") as? SingupViewController
        signupViewController?.interactor = SignupInteractor()
        signupViewController?.interactor?.view = signupViewController
        signupViewController?.navigation = SingupWireframe()
        signupViewController?.navigation?.singupViewController = signupViewController
        self.splashScreenViewController?.present(signupViewController!, animated: true, completion: nil)
    }
    

}
