//
//  HomeInteractor.swift
//  VIPER SIMPLE
//
//  Created by Roman Gorshkov on 05.03.2020.
//  Copyright © 2020 Roman Gorshkov. All rights reserved.
//

import UIKit
class HomeInteractor: NSObject, HomeInteractorProtocol {
    func deleteUsers() {
        DataStore.defaultLocalDB.deleteUsers()
    }
}
