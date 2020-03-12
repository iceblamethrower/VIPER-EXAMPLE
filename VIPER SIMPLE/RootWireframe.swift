//
//  RootWireframe.swift
//  VIPER SIMPLE
//
//  Created by Roman Gorshkov on 05.03.2020.
//  Copyright © 2020 Roman Gorshkov. All rights reserved.
//

import UIKit

class RootWireframe: NSObject {
    let splashScreenWireframe: SplashWireframe?
    var homeWireframe: HomeWireframe?
    
    override init() {
        self.splashScreenWireframe = SplashWireframe.sharedInstance
    }
    func application(didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?, window: UIWindow) -> Bool {
        self.splashScreenWireframe?.window = window
        self.homeWireframe = HomeWireframe()
        self.homeWireframe?.window = window
        checkIfAnyUserPersistentOrNot()
        return true
    }
    func checkIfAnyUserPersistentOrNot() -> Bool {
        if DataStore.defaultLocalDB.checkUser() {
            //HOME screen
            self.homeWireframe?.presentHomeVCInWindow()
            print("there")
        } else {
            //SPLASH screen
            self.splashScreenWireframe?.presentSplashScreenViewControllerInWindow()
        }
        return true
    }
}
