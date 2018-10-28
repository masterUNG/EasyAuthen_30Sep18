//
//  ViewController.swift
//  EasyAuthen_30Sep18
//
//  Created by MasterUNG on 30/9/2561 BE.
//  Copyright © 2561 MasterUNG. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
//    Explicit
    var userString: String = ""
    var passwordString: String = ""
    var prefixString: String = "https://www.androidthai.in.th/pen/getDataWhere1Column.php?isAdd=true&User="
    
    @IBOutlet weak var usetTextFiled: UITextField!
    
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    @IBOutlet weak var messageLabel: UILabel!
    
    
    @IBAction func loginButton(_ sender: Any) {
        
        userString = usetTextFiled.text!
        passwordString = passwordTextField.text!
        
        let postURLString: String = prefixString + userString
        print("postURLString ==> \(postURLString)")
        
        let urlPHP = URL(string: postURLString)
        let request = NSMutableURLRequest(url: urlPHP!)
        let task = URLSession.shared.dataTask(with: request as URLRequest) {data, response, error in
            
            if error != nil {
                print("Have Error")
            } else {
                
                if let myReadData = data {
                    
                    let canReadData = NSString(data: myReadData, encoding: String.Encoding.utf8.rawValue)
                    
                    let jsonString: String = canReadData! as String
                    print("jsonString ==> \(jsonString)")
                    
                    let blockPrefix = "["
                    var noPrefixJson: String = ""
                    
                    if let myContentArray = canReadData?.components(separatedBy: blockPrefix) {
                        noPrefixJson = myContentArray[1]
                        print("noPrefixJson ==> \(noPrefixJson)")
                    }
                    
                    let blockSubfix = "]"
                    var noSubfixJson = ""
//                    let noPrefixJson1 = noPrefixJson as String
                    
                    
                    let myContentArray2 = noPrefixJson.components(separatedBy: blockSubfix)
                    noSubfixJson = myContentArray2[0]
                    print("noSubfixJson ==> \(noSubfixJson)")
                    
                    let myComma = ","
                    let contentArray = noSubfixJson.components(separatedBy: myComma)
                        
                        var indexInt = 0
                        
                        for test in contentArray {
                            print("test ==> \(test)")
                            
                            print("contentArray[\(indexInt)] ==> \(contentArray[indexInt])")
                            
                            indexInt += 1
                        }   // for
                        
//                        let showName = "{" + contentArray[0] + "}"
//                        print("showName ==> \(showName)")
                        self.convertJSONtoDictionary(jsonText: noSubfixJson)
                        
                    
                }   //if
            }   // if else
        }   // task
        task.resume()
        
    }   // loginButton
    
    func convertJSONtoDictionary(jsonText: String) -> Void {
//        let jsonText = "{\"first_name\":\"Sergey\"}"
       print("jsonText Master ==> \(jsonText)")
        
//        let testJSON = "{\"first_name\":\"Sergey\",\"first_name2\":\"Sergey2\",\"first_name3\":\"Sergey3\"}"
//        print("testJSON ==> \(testJSON)")
        
        var dictonary:NSDictionary?
        
//        if let data = jsonText.data(using: String.Encoding.utf8) {
         if let data = jsonText.data(using: String.Encoding.utf8) {
        
            do {
                dictonary = try JSONSerialization.jsonObject(with: data, options: []) as? [String:AnyObject] as NSDictionary?
                
                if let myDictionary = dictonary
                {
                    print("myDirectionary ==> \(myDictionary)")
                    print(" First name is: \(myDictionary["Name"]!)")
                }
            } catch let error as NSError {
                print(error)
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

