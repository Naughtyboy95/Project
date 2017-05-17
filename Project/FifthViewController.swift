//
//  FifthViewController.swift
//  Project
//
//  Created by DUC PHAM on 10/05/2017.
//  Copyright © 2017 DUC PHAM. All rights reserved.
//reference of the login code:https://www.youtube.com/watch?v=7ldbBNt3KaM


import UIKit

class FifthViewController: UIViewController {
    //connect the textfield with viewcontroller to enable user type the username
    @IBOutlet weak var Username: UITextField!
    //connect the textfield with viewcontroller to enable user type the password
    @IBOutlet weak var Password: UITextField!
    //declare the variable for the username
    let username : String = "Admin"
    //declare the variable for the password
    let pass : String = "Admin"
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    //check the username & password of user
    @IBAction func CheckUser(_ sender: Any) {
    if(Username.text == username &&  Password.text == pass)
    {
        //reference of the code:https://www.youtube.com/watch?v=nRtcWqcvEME
      performSegue(withIdentifier: "goToPaidBook", sender: self)
    }else
    {
        //reference of the code:https://www.youtube.com/watch?v=nRtcWqcvEME
        dismiss(animated: true, completion: nil)
    }
        
    }
}
