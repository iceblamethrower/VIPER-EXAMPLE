 //
//  SingupViewController.swift
//  VIPER SIMPLE
//
//  Created by Roman Gorshkov on 02.03.2020.
//  Copyright © 2020 Roman Gorshkov. All rights reserved.
//

import UIKit

class SingupViewController: UIViewController, SingupViewControllerProtocol {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    var navigation: SingupWireframe?
    var interactor: SignupInteractor?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func didTapSignupButton(sender: AnyObject) {
        //save user details in CoreData
        var inputDictionary = [String: AnyObject]()
        inputDictionary["name"] = self.nameTextField.text as AnyObject?
        inputDictionary["password"] = self.passwordTextField.text as AnyObject?
        let userModel = UserModel(inputDictionary: inputDictionary)
        self.interactor?.createUser(userModel: userModel)
    }
    
    @IBAction func didTapDissmisButton(sender: AnyObject) {
        self.navigation?.dismissSignupViewController()
    }
    
    func userCreationShow(isSave: Bool) {
        if isSave {
            print("Success: user created!")
            //Present home
            self.navigation?.presentHomeScreen()
        } else {
            print("Failure: User did not store")
        }
    }
    
}
