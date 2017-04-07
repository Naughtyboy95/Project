//
//  SecondViewController.swift
//  Project
//
//  Created by DUC PHAM on 7/04/2017.
//  Copyright © 2017 DUC PHAM. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
        let cellID = "CellID"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section:Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath as IndexPath)
        
        cell.textLabel!.text = String (format:"Section %ld, Row %ld",
                                       indexPath.section + 1,
                                       indexPath.row + 1)
        
        return cell;
    }
    
    @IBAction func navigatateToTheSecondScene(sender: UIStoryboardSegue)
    {
        
    }
}
