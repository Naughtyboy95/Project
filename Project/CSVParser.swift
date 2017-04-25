//
//  CSVParser.swift
//  Project
//
//  Created by DUC PHAM 22/4/17.
//  Copyright © 2017 DUC PHAM. All rights reserved.
//

import Foundation

class CSVParser {
    
    class func debug(string:String){
        
        print("CSVParser: \(string)")
    }
    
    class func runFunctionOnRowsFromFile(theColumnNames:Array<String>, withFileName theFileName:String, withFunction theFunction:(Dictionary<String, String>)->()) {
        
        
        if let strBundle = Bundle.main.path(forResource: theFileName, ofType: "csv") {
            
            //var encodingError:NSError? = nil
            do {
                
                let fileObject = try String(contentsOfFile: strBundle, encoding: String.Encoding.utf8)
                
                //var fileObjectCleaned = fileObject.replacingOccurrences(of: "\r", with: "\n")
                
                //fileObjectCleaned = fileObjectCleaned.replacingOccurrences(of: "\n\n", with: "\n")
                
                let objectArray = fileObject.components(separatedBy: "\n")
                for anObjectRow in objectArray {
                    
                    let objectColumns = anObjectRow.components(separatedBy: ",")
                    
                    var aDictionaryEntry = Dictionary<String, String>()
                    
                    var columnIndex = 0
                    
                    for anObjectColumn in objectColumns {
                        
                        aDictionaryEntry[theColumnNames[columnIndex]] = anObjectColumn.replacingOccurrences(of: "\"", with: "", options: NSString.CompareOptions.caseInsensitive, range: nil)
                        
                        columnIndex+=1
                    }
                    
                    if aDictionaryEntry.count>1{
                        theFunction(aDictionaryEntry)
                    }else{
                        
                        CSVParser.debug(string: "No data extracted from row: \(anObjectRow) -> \(objectColumns)")
                    }
                }
            
            
            } catch{
                CSVParser.debug(string: "Unable to get path to csv file: \(theFileName).csv")
                print(error)  
            }  

    }
    
}
}
