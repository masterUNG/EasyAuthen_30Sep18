//
//  RegisterViewController.swift
//  EasyAuthen_30Sep18
//
//  Created by MasterUNG on 30/9/2561 BE.
//  Copyright © 2561 MasterUNG. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {
    
//    Explicit
    var nameString: String = ""
    var userString: String = ""
    var passwordString: String = ""
    
    
    
    @IBOutlet weak var nameTextField: UITextField!
    
    
    @IBOutlet weak var userTextField: UITextField!
    
    
  
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    
    @IBAction func registerButton(_ sender: Any) {
        
        nameString = nameTextField.text!
        userString = userTextField.text!
        passwordString = passwordTextField.text!
        checkString()
        
    }   // registerButton
    
    func checkString() -> Void {
        print("Name ==> \(nameString)")
        print("User ==> \(userString)")
        print("Password ==> \(passwordString)")
        
        let urlString: String = "https://www.androidthai.in.th/iOS1/addUserMaster.php?isAdd=true&Name=" + nameString + "&User=" + userString + "&Password=" + passwordString
        
        print("urlString ==> \(urlString)")
        
        let postURL = URL(string: urlString)
        let request = NSMutableURLRequest(url: postURL!)
        let task = URLSession.shared.dataTask(with: request as URLRequest){data, response, error in
            
            if (error != nil) {
                
//                Show Error
                print("Error")
                
            } else {
                
//                NO Error
                if let resultString = data {
                    
                    let dataString: String = NSString(data: resultString, encoding: String.Encoding.utf8.rawValue)! as String
                    let responseString: String = dataString
                    print("resopnseString ==> \(responseString)")
                    
                }   // if

            }   // if else
            
            
        }   // task
        task.resume()
        
        
        
        
        
    }   // checkString
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
}
