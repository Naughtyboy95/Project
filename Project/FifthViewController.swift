//
//  FifthViewController.swift
//  Project
//
//  Created by DUC PHAM on 10/05/2017.
//  Copyright © 2017 DUC PHAM. All rights reserved.
//reference of the login code:https://www.youtube.com/watch?v=7ldbBNt3KaM


import UIKit

class FifthViewController: UIViewController {
    
    @IBOutlet weak var Username: UITextField!
    @IBOutlet weak var Password: UITextField!
  
    let username : String = "Admin"
    let pass : String = "Admin"
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

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
