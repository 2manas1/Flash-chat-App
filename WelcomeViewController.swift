//
//  WelcomeViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import CLTypingLabel

class WelcomeViewController: UIViewController {
    
    
    /* titleLabel.text = ""
     var charIndex = 0.0
     let titleText = "⚡️FlashChat"
     for letter in titleText{
         print("-")
         print(0.1*charIndex)
         print(letter)
         Timer.scheduledTimer(withTimeInterval: 0.1*charIndex, repeats: false) { (timer) in
             self.titleLabel.text?.append(letter)
         }
         charIndex+=1
     }
     */

    @IBOutlet weak var titleLabel: CLTypingLabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = k.appname
       
       
    }
    
}
