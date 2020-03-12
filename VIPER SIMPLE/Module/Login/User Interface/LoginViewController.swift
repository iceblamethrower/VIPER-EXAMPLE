//
//  LoginViewController.swift
//  VIPER SIMPLE
//
//  Created by Roman Gorshkov on 02.03.2020.
//  Copyright © 2020 Roman Gorshkov. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    var navigation: LoginWireframe?
    var interactor: LoginInteractor?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func didTapLoginButton(sender: AnyObject) {
        var inputDictionary = [String: AnyObject]()
        inputDictionary["name"] = self.nameTextField.text as AnyObject?
        inputDictionary["password"] = self.passwordTextField.text as AnyObject?
        let userModel = UserModel(inputDictionary: inputDictionary)
        self.interactor?.loginUser(userModel: userModel)
    }
    
    func loginUser(isSaved: Bool) {
        if isSaved {
          print("Success: user logged")
            self.navigation?.presentHomeScreen()
        } else {
          print("Failure: user did not in store")
        }
    }
    
    @IBAction func didTapDissmisButton(sender: AnyObject) {
        self.navigation?.dismissLoginVC()
    }
}
