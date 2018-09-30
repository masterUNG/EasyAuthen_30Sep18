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
    var prefixString: String = "https://www.androidthai.in.th/iOS1/getUserWhereMaster.php?isAdd=true&User="
    
    

    
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
                    
                    let jsonString: String = canReadData as! String
                    print("jsonString ==> \(jsonString)")
                    
                    let myComma = ","
                    if let contentArray = canReadData?.components(separatedBy: myComma) {
                        
                        for test in contentArray {
                            print("test ==> \(test)")
                        }
                        
                    } // if
                }   //if
            }   // if else
            
            
        }   // task
        task.resume()
        
        
        
        
        
    }   // loginButton
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

