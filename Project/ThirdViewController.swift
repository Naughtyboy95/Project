//
//  ThirdViewController.swift
//  Project
//
//  Created by DUC PHAM on 6/04/2017.
//  Copyright © 2017 DUC PHAM. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    let cellID = "CellID"
    
    var myCSVContents = Array<Dictionary<String, String>>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        CSVParser.runFunctionOnRowsFromFile(theColumnNames: ["bookId", "bookTitle", "bookUrl","bookCoverUrl"], withFileName: "database_paid", withFunction: {
            
            (aRow:Dictionary<String, String>) in
            
            myCSVContents.append(aRow)
            
        })
        tableView.dataSource = self
        
        self.tableView.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section:Int) -> Int {
        return myCSVContents.count

    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath as IndexPath)
        
        var row = myCSVContents[indexPath.row] as Dictionary<String,String>
        let title = row["bookTitle"]
        cell.textLabel!.text = String (format:"Book %@",
                                       title!)
        
        return cell;
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueReader" {
            // Setup new view controller
            let selectedIndex = self.tableView.indexPath(for: sender as! UITableViewCell)
            let globalVar = selectedIndex!.row
            let row = myCSVContents[globalVar] as Dictionary<String,String>
            
            //let readController = self.storyboard!.instantiateViewController(withIdentifier: "readbookController") as! readBookViewController
            
            //readController.BookUrl = row["bookUrl"]
            //readController.BookTitle = row["bookTitle"]
            
            
            if let des = segue.destination as? readBookViewController{
                des.BookTitle = row["bookTitle"]
                des.BookUrl = row["bookUrl"]
            }
        }
    }

    
    @IBAction func navigatateToTheThirdScene(sender: UIStoryboardSegue)
    {
        
    }
}
