//
//  ViewController.swift
//  Project
//
//  Created by DUC PHAM on 1/04/2017.
//  Copyright © 2017 DUC PHAM. All rights reserved.
//reference for the code email function: https://www.youtube.com/watch?v=dsk-BDn6FCI

import UIKit
//import messageui framework
import MessageUI

class ViewController: UIViewController, MFMailComposeViewControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //function to connect with another viewcontroller
    @IBAction func navigatateToTheFirstScene(sender: UIStoryboardSegue)
    {
        
    }
    
    //compile the email funtion for contact button
    @IBAction func ContactButton(_ sender: Any) {
        let mailCompese = MFMailComposeViewController()
        mailCompese.mailComposeDelegate = self
        //set up the email of the recipients
        mailCompese.setToRecipients(["phampeter620@gmail.com"])
        mailCompese.setSubject("Test")
        //set up the default text for the email
        mailCompese.setMessageBody("I want request this book", isHTML: false)
        
        //Function to test if the app can't send the email
        if MFMailComposeViewController.canSendMail()
        {
            self.present(mailCompese, animated: true, completion: nil)
            
        }
        else
        {
            print("Error!")
        }
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }

}

