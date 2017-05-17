//
//  readBookViewController.swift
//  Project
//
//  Created by GARRY CHHABRA on 24/4/17.
//  Copyright © 2017 GARRY CHHABRA. All rights reserved.
//

import UIKit

class readBookViewController: UIViewController {
    //declare the varible for booktitle
    var BookTitle: String?
    //declare the variable for content of books
    var BookUrl: String?
    
    
    //@IBOutlet weak var bookTitleLabel: UILabel!
    
    @IBOutlet weak var webViewBook: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // fit bug scale screen
        self.webViewBook.frame = self.view.bounds
        self.webViewBook.scalesPageToFit = true

        
        
        self.title = BookTitle
        if let pdf = Bundle.main.url(forResource: BookUrl, withExtension: "pdf", subdirectory: nil, localization: nil)  {
            let req = NSURLRequest(url: pdf)
            webViewBook.loadRequest(req as URLRequest)
        }

        //let nav : UINavigationController = UINavigationController(rootViewController: self.storyboard!.instantiateViewController(withIdentifier: "SecondViewController") as UIViewController)
        
        //self.navigationController?.present(nav, animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
