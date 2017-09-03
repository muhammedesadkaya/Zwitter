//
//  SignUpViewController.swift
//  ZwitterApp
//
//  Created by Muhammed Esad Kaya on 03/09/2017.
//  Copyright © 2017 Muhammed Esad Kaya. All rights reserved.
//

import UIKit
import Firebase

class SignUpViewController: UIViewController {

    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passField: UITextField!
    @IBOutlet weak var passAgainField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

   
    @IBAction func SignUp(_ sender: Any)
    {
        if(passField.text != passAgainField.text)
        {
            print("sifre tekrari uyusmuyor")
        }
        else if(!(emailField.text?.isEmpty)! || !(passField.text?.isEmpty)! || !(passAgainField.text?.isEmpty)!)
        {
            Auth.auth().createUser(withEmail: emailField.text!, password: passField.text!) { (user, error) in
                
                if(error != nil) // hata varsa
                {
                    print(error!.localizedDescription)
                }
                else
                {
                    print("********** kayit basaliri *************")
                    self.emailField.text = ""
                    self.passField.text = ""
                    self.passAgainField.text = ""
                }
            }
        }
            
    }
    



}
