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
    var prefixString: String = "https://www.androidthai.in.th/pen/getAllData.php"
    
    

    
    @IBOutlet weak var usetTextFiled: UITextField!
    
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    @IBOutlet weak var messageLabel: UILabel!
    
    
    @IBAction func loginButton(_ sender: Any) {
        
        userString = usetTextFiled.text!
        passwordString = passwordTextField.text!
        
        let postURLString: String = prefixString
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
                    
                    let myComma = ","
                    if let contentArray = canReadData?.components(separatedBy: myComma) {
                        
                        for test in contentArray {
                            print("test ==> \(test)")
                        }
                        let showName = "{" + contentArray[1] + "}"
                        
                        self.convertJSONtoDictionary(jsonText: showName)
                        
                    } // if
                }   //if
            }   // if else
            
            
        }   // task
        task.resume()
        
        
        
        
        
    }   // loginButton
    
    func convertJSONtoDictionary(jsonText: String) -> Void {
//        let jsonText = "{\"first_name\":\"Sergey\"}"
        print("jsonText ==> \(jsonText)")
        var dictonary:NSDictionary?
        
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

