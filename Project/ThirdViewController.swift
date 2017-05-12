//
//  ThirdViewController.swift
//  Project
//
//  Created by DUC PHAM on 6/04/2017.
//  Copyright © 2017 DUC PHAM. All rights reserved.
//

import UIKit

class BookTableViewCellPaid: UITableViewCell {
    
    
    @IBOutlet weak var BookCoverImage: UIImageView!
    
    
    @IBOutlet weak var BookTitle: UILabel!
}

class ThirdViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    let cellID = "CellID"
    
    var myCSVContents = Array<Dictionary<String, String>>()
    var filtered = Array<Dictionary<String, String>>()
    var searchActive : Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        CSVParser.runFunctionOnRowsFromFile(theColumnNames: ["bookId", "bookTitle", "bookUrl","bookCoverUrl"], withFileName: "datafiles/database_paid", withFunction: {
            
            (aRow:Dictionary<String, String>) in
            
            myCSVContents.append(aRow)
            
        })
        tableView.dataSource = self
        
        self.tableView.delegate = self
        self.tableView.estimatedRowHeight = 50
        searchResultController.delegate = self
    }
    
    @IBOutlet weak var searchResultController: UISearchBar!
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchActive = true;
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searchActive = false;
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchActive = false;
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchActive = false;
    }
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        //filtered = myCSVContents.filter({ (text) -> Bool in
        //    let tmp = text["bookTitle"]
        //    let range = tmp?.range(of: searchText, options: NSString.CompareOptions.caseInsensitive)
        //    return range. != NSNotFound
        //})
        
        
        filtered = myCSVContents.filter() {
            let type = ($0 as Dictionary<String, String>)["bookTitle"]!
            return type.range(of: searchText.lowercased()) != nil
        }
        
        if(filtered.count == 0){
            searchActive = false;
        } else {
            searchActive = true;
        }
        tableView.dataSource = self
        tableView.reloadData()
        
        
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section:Int) -> Int {
        if(searchActive) {
            return filtered.count
        }
        return myCSVContents.count

    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath as IndexPath) as! BookTableViewCellPaid
        var row = Dictionary<String,String>()
        if(searchActive){
            row = filtered[indexPath.row] as Dictionary<String,String>
            
        } else {
            row = myCSVContents[indexPath.row] as Dictionary<String,String>
            
        }

        //var row = myCSVContents[indexPath.row] as Dictionary<String,String>
        let title = row["bookTitle"]
        cell.BookTitle?.text = String (format:"%@",
                                       title!)
        if let filePath = Bundle.main.path(forResource: row["bookCoverUrl"], ofType: "png" ), let image = UIImage(contentsOfFile: filePath) {
            cell.BookCoverImage?.contentMode = .scaleAspectFit
            cell.BookCoverImage?.image = image
        }
        //cell.BookCoverImage?.image = UIImage(named: row["bookCoverUrl"]!)
        return cell;
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueReader" {
            // Setup new view controller
            let selectedIndex = self.tableView.indexPath(for: sender as! UITableViewCell)
            let globalVar = selectedIndex!.row
            var row = Dictionary<String,String>()
            if(searchActive){
                row = filtered[globalVar] as Dictionary<String,String>
                
            } else {
                row = myCSVContents[globalVar] as Dictionary<String,String>
                
            }

            
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
