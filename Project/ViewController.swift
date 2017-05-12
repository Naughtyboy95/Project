//
//  ViewController.swift
//  Project
//
//  Created by DUC PHAM on 1/04/2017.
//  Copyright © 2017 DUC PHAM. All rights reserved.
//

import UIKit
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
    
    @IBAction func navigatateToTheFirstScene(sender: UIStoryboardSegue)
    {
        
    }

    @IBAction func ContactButton(_ sender: Any) {
        let mailCompese = MFMailComposeViewController()
        mailCompese.mailComposeDelegate = self
        mailCompese.setToRecipients(["phampeter620@gmail.com"])
        mailCompese.setSubject("Test")
        mailCompese.setMessageBody("I want request this book", isHTML: false)
        
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

