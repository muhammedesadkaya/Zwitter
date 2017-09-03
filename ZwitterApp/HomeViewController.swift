//
//  HomeViewController.swift
//  ZwitterApp
//
//  Created by Muhammed Esad Kaya on 03/09/2017.
//  Copyright © 2017 Muhammed Esad Kaya. All rights reserved.
//

import UIKit
import Firebase

class HomeViewController: UIViewController {

    @IBOutlet weak var mentionName: UITextField!
    @IBOutlet weak var fullName: UITextField!
    @IBOutlet weak var about: UITextField!
    @IBOutlet weak var zwitter: UIButton!
    
    var ref = Database.database().reference()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        zwitter.layer.cornerRadius = 8
            }

    

    @IBAction func startZwitter(_ sender: Any)
    {
        let userID = Auth.auth().currentUser?.uid
        print(userID!)
        
        ref.child("users").child(userID!).observeSingleEvent(of: .value, with: { (snapshot) in
            
            if (snapshot.exists())
            {
                self.ref.child("users").child(userID!).child("mentionName").setValue(self.mentionName.text!)
                self.ref.child("users").child(userID!).child("fullName").setValue(self.fullName.text!)
                self.ref.child("users").child(userID!).child("about").setValue(self.about.text!)
                
            }
            
            
        }) { (error) in
            print(error.localizedDescription)
        }

    }
   

}
