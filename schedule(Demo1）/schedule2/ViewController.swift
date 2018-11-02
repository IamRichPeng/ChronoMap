//
//  ViewController.swift
//  4320Store
//
//  Created by 崔皓凡 on 10/23/18.
//  Copyright © 2018 Cui Haofan. All rights reserved.
//

import UIKit

class ViewController: UIViewController{

    @IBOutlet weak var Label1: UILabel!
    
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var product1: UIImageView!
    var count = 0
    var images = [UIImage(named: "bottle")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Label1.text = "Store"
        Label1.font = UIFont.italicSystemFont(ofSize: 60);
        product1.image = images[count]
        button.backgroundColor = UIColor.blue
        Label1.backgroundColor = UIColor.red
      
        
        // Do any additional setup after loading the view, typically from a nib.
    }
   override func viewDidAppear(_ animated: Bool){
        super.viewDidAppear(animated)
    
    }
    @IBAction func buttonClick(_ sender: Any) {
        
        let alertController1 = UIAlertController(title: "Shopping", message: "Use 100000000 to buy Sports Bottle?", preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        
    //    let okAction = UIAlertAction(title: "Confirm", style: .default) { () in
          let alertController2 = UIAlertController(title: "Purchase Failed", message: "Check your property!", preferredStyle: .alert)
           let okAction2 = UIAlertAction(title: "Confirm", style: .default, handler: nil)
        alertController2.addAction(okAction2)
       
        let okAction = UIAlertAction(title: "Confirm", style: .default, handler:  { action in  self.present(alertController2, animated: true, completion: nil)})
        alertController1.addAction(cancelAction)
      alertController1.addAction(okAction)
        self.present(alertController1, animated: true)
       
    
        
    }
}
//}


