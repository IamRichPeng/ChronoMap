//
//  SignInViewController.swift
//  Login
//
//  Created by Peter on 2018/10/31.
//  Copyright © 2018年 Peter. All rights reserved.
//

import UIKit
import Foundation

class SignInViewController: UIViewController
{
    
    @IBOutlet weak var IDtext: UITextField!
    @IBOutlet weak var Passwdtext: UITextField!
    @IBAction func backButton(_ sender: UIButton)
    {
        self.performSegue(withIdentifier: "backToMain", sender: self)
    }
    
    @IBAction func confirmButton(_ sender: UIButton)
    {
        SwiftyPlistManager.shared.start(plistNames: ["User"], logging: true)
         var ID = IDtext.text!
         var Passwd = Passwdtext.text!
         print("UserID is \(ID)")
         print("Password is \(Passwd)")
         SwiftyPlistManager.shared.addNew(ID, key: "\(Passwd)", toPlistWithName: "User", completion: {_ in })
        self.performSegue(withIdentifier: "backToMain", sender: self)
        
    }
}

