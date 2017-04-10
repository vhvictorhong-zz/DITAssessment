//
//  RegisterViewController.swift
//  DITAssessment
//
//  Created by Victor Hong on 17/02/2017.
//  Copyright © 2017 Victor Hong. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {

    
    @IBOutlet weak var userFirstNameTextField: UITextField!
    @IBOutlet weak var userLastNameTextField: UITextField!
    @IBOutlet weak var userAddressTextField: UITextField!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var userPasswordTextField: UITextField!
    @IBOutlet weak var repeatPasswordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
    }

    @IBAction func registerButtonTapped(_ sender: UIButton) {
        
        let userFirstName = userFirstNameTextField.text
        let userLastName = userLastNameTextField.text
        let userAddress = userAddressTextField.text
        let username = usernameTextField.text
        let userPassword = userPasswordTextField.text
        let userRepeatPassword = repeatPasswordTextField.text
        
        if ((username ?? "").isEmpty || (userPassword ?? "").isEmpty || (userRepeatPassword ?? "").isEmpty) {
            
            displayMyAlertMessage("All fields are required")
            
            return
        }
        
        if(userPassword != userRepeatPassword) {
            displayMyAlertMessage("Passwords do not match")
            return
            
        }
        
        if var userInfos: [AnyObject] = UserDefaults.standard.array(forKey: "userList") as? [AnyObject] {
            var userDict: [String: String] = [:]
            
            for userInfo in userInfos {
                if userInfo["name"] as? String == username {
                    displayMyAlertMessage("This name is registered already")
                    return
                }
            }
            
            userDict["firstName"] = userFirstName
            userDict["lastName"] = userLastName
            userDict["address"] = userAddress
            userDict["name"] = username
            userDict["password"] = userPassword
            
            userInfos.append(userDict as AnyObject)
            
            UserDefaults.standard.set(userInfos, forKey: "userList")
            UserDefaults.standard.synchronize()
            
            dismiss(animated: true, completion:nil)
            
        } else {
            
            var userInfo: [AnyObject] = []
            
            var userDict: [String: String] = [:]
            
            userDict["firstName"] = userFirstName
            userDict["lastName"] = userLastName
            userDict["address"] = userAddress
            userDict["name"] = username
            userDict["password"] = userPassword
            
            userInfo.append(userDict as AnyObject)
            
            UserDefaults.standard.set(userInfo, forKey: "userList")
            UserDefaults.standard.synchronize()
            
            dismiss(animated: true, completion:nil)
        }
        
    }
    
    @IBAction func haveAccountButtonTapped(_ sender: UIButton) {
        
        dismiss(animated: true, completion:nil)

    }
    
    func displayMyAlertMessage(_ userMessage:String) {
        
        let myAlert = UIAlertController(title:"Alert", message:userMessage, preferredStyle: UIAlertControllerStyle.alert)
        
        let okAction = UIAlertAction(title:"Ok", style:UIAlertActionStyle.default, handler:nil)
        
        myAlert.addAction(okAction)
        
        self.present(myAlert, animated:true, completion:nil)
        
    }

}

