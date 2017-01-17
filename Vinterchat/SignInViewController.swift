//
//  SignInViewController.swift
//  Vinterchat
//
//  Created by Guillermo García on 11/01/2017.
//  Copyright © 2017 Guillermo García. All rights reserved.
//

import UIKit
import Firebase

class SignInViewController: UIViewController {
    
    @IBOutlet weak var emaiTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    @IBAction func signInTapped(_ sender: Any) {
        
        FIRAuth.auth()?.signIn(withEmail: emaiTextField.text!, password: passwordTextField.text!, completion: { (user, error) in
            print("We tried to sign in")
            if error != nil {
                print("We have an error: \(error)")
                
                FIRAuth.auth()?.createUser(withEmail: self.emaiTextField.text!, password: self.passwordTextField.text!, completion: { (user, error) in
                    print("We tried to create a user")
                    
                    if error != nil {
                        print("We have an error: \(error)")
                    } else {
                        print("Created user succesfully")
                        
                        let users = FIRDatabase.database().reference().child("users").child(user!.uid).child("email").setValue(user!.email!)
                        
                        self.performSegue(withIdentifier: "signInSegue", sender: nil)
                    }
                })
                
            } else {
                print("Signed in Succesfully")
                self.performSegue(withIdentifier: "signInSegue", sender: nil)
            }
        })
        
    }
    
    
    
    
}

