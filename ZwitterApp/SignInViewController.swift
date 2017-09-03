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
                    // bu kısım başka sayfaya gitmesi için
                    let storyboard = UIStoryboard(name: "Main", bundle: nil) // main = main.storyboard ismi.
                    
                    let HomeVC = storyboard.instantiateViewController(withIdentifier: "HomeVC") as! HomeViewController //homevc ye gitmesi için
                    // HomeVC bir segue gibi çalışır. StoryBoard ID ye verilen isim.
                    self.present(HomeVC, animated: true, completion: nil) // animasyonlu şekilde sayfa geçişi
                }
            })
        }
        else
        {
            print("boş bırakmayınız!")
        }
    }
}
