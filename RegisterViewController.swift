//
//  RegisterViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController {

    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    // once the user is in the register screen, they will enter a email and password.
     // when data is entered the mail id and password will be stored in the authentication database of firebase. the error will be thrown only when the user enters a password of length less than 6.
    // after authentication the segue will be performed and the user will be sent to the chatscreen.
    
    @IBAction func registerPressed(_ sender: UIButton) {
        if let email = emailTextfield.text ,let password = passwordTextfield.text{
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                // ...
                if let e = error{
                    print(e)
                }
                else{
                    // once registered we have to navigate to the chatviewcontroller
                    self.performSegue(withIdentifier: k.registersegue, sender: self)
                    // with segue we are connecting our reigster screen to now the chatscreen via the identifier we had marked RegisterToChat
                }
            }
        }
    }
    
}
