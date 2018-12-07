//
//  ViewController.swift
//  Login
//
//  Created by Peter on 2018/10/30.
//  Copyright © 2018年 Peter. All rights reserved.
//

import UIKit
import Foundation

class LoginViewController: UIViewController {


    @IBOutlet weak var welcome: UILabel!
    @IBOutlet weak var IDtext: UITextField!
    @IBOutlet weak var Passwdtext: UITextField!
    @IBOutlet weak var labeltest: UILabel!
    @IBAction func clickUserID(_ sender: UITextField)
    {
        let userIDColor=UIColor.init(red: 255, green: 255, blue: 0, alpha: 255)
        IDtext.backgroundColor=userIDColor
    }
    
    @IBAction func clickPasswd(_ sender: UITextField)
    {
        let passwdColor=UIColor.init(red: 0, green: 0, blue: 0, alpha: 255)
        Passwdtext.backgroundColor=passwdColor
    }
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
            self.performSegue(withIdentifier: "successfulLogin", sender: self)
        }
    }
    
    @IBAction func SignInButton(_ sender: UIButton)
    {
        
        
        self.performSegue(withIdentifier: "signIn", sender: self)
    
    }
    
    @IBAction func GuestButton(_ sender: UIButton)
    {
        labeltest.text = sender.title(for: .normal)
        //self.performSegue(withIdentifier: "useAsAGuest", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named:"LoginBG")!)
        welcome.font = UIFont.boldSystemFont(ofSize: 30)        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

