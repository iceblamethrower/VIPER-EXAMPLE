//
//  LoginInteractor.swift
//  VIPER SIMPLE
//
//  Created by Roman Gorshkov on 05.03.2020.
//  Copyright © 2020 Roman Gorshkov. All rights reserved.
//

import UIKit
class LoginInteractor: NSObject, LoginInteractorProtocol {
    var view: LoginViewController?
    func loginUser(userModel: UserModel) {
        self.view?.loginUser(isSaved: DataStore.defaultLocalDB.loginUser(userModel: userModel))
    }
}
