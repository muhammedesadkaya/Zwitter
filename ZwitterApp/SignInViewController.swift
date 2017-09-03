//
//  SignInViewController.swift
//  ZwitterApp
//
//  Created by Muhammed Esad Kaya on 03/09/2017.
//  Copyright © 2017 Muhammed Esad Kaya. All rights reserved.
//

import UIKit
import Firebase

class SignInViewController: UIViewController
{
    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    @IBAction func SignIn(_ sender: Any)
    {
        if(!(emailField.text?.isEmpty)! || !(passField.text?.isEmpty)!)
        {
            Auth.auth().signIn(withEmail: emailField.text!, password: passField.text!, completion: { (user, error) in
                if (error != nil)
                {
                    print(error!)
                }
                else
                {
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    
                    let HomeVC = storyboard.instantiateViewController(withIdentifier: "HomeVC") as! HomeViewController
                    
                    self.present(HomeVC, animated: true, completion: nil)
                    
                    print("******* basarili giris ************")
                }
            })
        }
        else
        {
            print("boş bırakmayınız")
        }
        }
}
