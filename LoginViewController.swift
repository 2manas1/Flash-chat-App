//
//  LoginViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {
    

    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    // once the user is in the login screen, they will enter a email and password.
     // when data is entered the mail id and password will be checked using the below function in thedatabase of firebase. the error will be thrown only when the user enters a wrong id password, or is not registered, it will throw error.
    // after authentication the segue will be performed and the user will be sent to the chatscreen.

    @IBAction func loginPressed(_ sender: UIButton) {
        
        if let email = emailTextfield.text, let password = passwordTextfield.text {
            
            Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                if let e = error{
                    print(e)
                }
                else{
                    self.performSegue(withIdentifier: k.loginsegue, sender: self)
                }
            }
            // when the user is authorised by the firebase, via segue the user will be taken to the chatviewscreen. we have used the name of the identifier here for the loginview and chatview connector, which is "logintochat" which is stored in the constant file.
        }
    }

}
