//
//  ViewController.swift
//  Login
//
//  Created by Peter on 2018/10/30.
//  Copyright © 2018年 Peter. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {


    @IBOutlet weak var IDtext: UITextField!
    @IBOutlet weak var Passwdtext: UITextField!
    @IBOutlet weak var labeltest: UILabel!
    @IBAction func LoginButton(_ sender: UIButton)
    {
        labeltest.text = sender.title(for: .normal)
        
        SwiftyPlistManager.shared.start(plistNames: ["User"], logging: true)
        var ID = IDtext.text!
        var Passwd = Passwdtext.text!
        print("UserID is \(ID)")
        print("Password is \(Passwd)")
        var result = SwiftyPlistManager.shared.keyAlreadyExists(key: ID, inPlistWithName: "User")
        if result == false
        {
            print("UserID doesn't exist")
            let alertController = UIAlertController(title: "Error", message: "The ID you typed doesn't exist!", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Retry", style: .default, handler: nil))
            self.present(alertController, animated: true, completion: nil)
            return
        }
        var Passwdstored: String = SwiftyPlistManager.shared.fetchValue(for: "\(ID)", fromPlistWithName: "User") as! String
        if Passwd != Passwdstored
        {
            let alertController = UIAlertController(title: "Error", message: "Password doesn't match!", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Retry", style: .default, handler: nil))
            self.present(alertController, animated: true, completion: nil)
            print("login error")
        }
        else
        {
            print("login sucessfully")
            //Jump to the next screen
        }
    }
    
    @IBAction func SignInButton(_ sender: UIButton)
    {
        
        
        self.performSegue(withIdentifier: "signIn", sender: self)
    
    }
    
    @IBAction func GuestButton(_ sender: UIButton)
    {
        labeltest.text = sender.title(for: .normal)
        //jump to the next screen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

