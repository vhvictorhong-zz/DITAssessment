//
//  LoginViewController.swift
//  DITAssessment
//
//  Created by Victor Hong on 17/02/2017.
//  Copyright © 2017 Victor Hong. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {


    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var userPasswordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        usernameTextField.delegate = self
        userPasswordTextField.delegate = self
        
        hideKeyboard()
        
    }


    @IBAction func loginButtonTapped(_ sender: UIButton) {
        
        let username = usernameTextField.text
        let userPassword = userPasswordTextField.text
        
        let userList = UserDefaults.standard.array(forKey: "userList") as? [[String: AnyObject]]
        
        if let userList = userList {
            for user in userList {
                let isUserLoggedIn = UserDefaults.standard.bool(forKey: "isUserLoggedIn")
                
                if(!isUserLoggedIn) {
                    let usernameStored = user["name"] as? String
                    let userPasswordStored = user["password"] as? String
                    if(usernameStored == username) {
                        if(userPasswordStored == userPassword) {
                            // Login is successfull
                            UserDefaults.standard.set(user, forKey: "currentUser")
                            UserDefaults.standard.set(true,forKey:"isUserLoggedIn")
                            UserDefaults.standard.synchronize()
                            
                            self.dismiss(animated: true, completion:nil)
                            
                        }
                    }
                }
            }
        }
        
        displayMyAlertMessage("Username or password is incorrect")
        
    }
    
    func displayMyAlertMessage(_ userMessage:String) {
        
        let myAlert = UIAlertController(title:"Alert", message:userMessage, preferredStyle: UIAlertControllerStyle.alert)
        
        let okAction = UIAlertAction(title:"Ok", style:UIAlertActionStyle.default, handler:nil)
        
        myAlert.addAction(okAction)
        
        self.present(myAlert, animated:true, completion:nil)
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension LoginViewController: UITextFieldDelegate {
    
    func hideKeyboard() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(LoginViewController.dismissKeyboard))
        
        view.addGestureRecognizer(tap)
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        dismissKeyboard()
        
        return false
    }
    
}
