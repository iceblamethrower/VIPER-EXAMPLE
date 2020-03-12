//
//  SignupInteractor.swift
//  VIPER SIMPLE
//
//  Created by Roman Gorshkov on 05.03.2020.
//  Copyright © 2020 Roman Gorshkov. All rights reserved.
//

import UIKit
class SignupInteractor: NSObject, SignupInteractorProtocol {
   
    var view: SingupViewController?
   
    func createUser(userModel: UserModel) {
        self.view?.userCreationShow(isSave: DataStore.defaultLocalDB.createUser(userModel: userModel))
    }
}
