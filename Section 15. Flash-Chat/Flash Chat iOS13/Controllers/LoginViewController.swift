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
    

    @IBAction func loginPressed(_ sender: UIButton) {
        
        let email = emailTextfield.text
        let password = passwordTextfield.text
        
        guard let email = email, let password = password else {
            return
        }
        
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            if let e = error {
                print(e)
                let sheet = UIAlertController(title: "", message: e.localizedDescription, preferredStyle: .actionSheet)
                sheet.addAction(UIAlertAction(title: "확인", style: .default, handler: { _ in  }))
                self.present(sheet, animated: true)
            } else {
                self.performSegue(withIdentifier: K.loginSegue, sender: self)
            }
            
        }
    }
    
}
