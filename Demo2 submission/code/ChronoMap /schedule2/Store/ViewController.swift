//
//  ViewController.swift
//  4320Store
//
//  Created by 崔皓凡 on 10/23/18.
//  Copyright © 2018 Cui Haofan. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController{
    
    @IBOutlet weak var Label1: UILabel!
    
    @IBOutlet weak var page: UIButton!
    @IBOutlet weak var NameD: UILabel!
    @IBOutlet weak var bought: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var product: UIImageView!
    @IBOutlet weak var money: UILabel!
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var product1: UIImageView!
    var count = 0
    var images = [UIImage(named: "bottle"), UIImage(named:"key")]
    var timer:Timer!;
    
    
    var fenzhong = UserDefaults().double(forKey: "shijian")
    
    
    
    override  func viewDidLoad() {
        super.viewDidLoad()
        page.titleLabel?.textColor = UIColor.black
        NameD.backgroundColor = UIColor.orange
        price.backgroundColor = UIColor.orange
        Label1.text = "Store"
        Label1.font = UIFont.italicSystemFont(ofSize: 60);
        NameD.font = UIFont.italicSystemFont(ofSize: 20);
        price.font = UIFont.italicSystemFont(ofSize: 20);
        bought.text = "you have bought this"
        bought.font = UIFont.italicSystemFont(ofSize: 30)
        bought.textColor = UIColor.gray
        bought.isHidden = true
        self.view.backgroundColor = UIColor(patternImage: UIImage(named:"back")!)
        product1.image = images[count]
        product.image = UIImage(named: "mon")
        button.backgroundColor = UIColor.blue
        Label1.backgroundColor = UIColor.red
        money.font = UIFont.boldSystemFont(ofSize: 30)
        
        self.timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(ViewController.grow),  userInfo: nil, repeats: true);
        
        Label1.text = "Store"
        money.textColor = UIColor.yellow
        
    }
    override func viewDidAppear(_ animated: Bool){
        super.viewDidAppear(animated)
        
    }
    @objc func grow()
    {
        var proper = 0.00
        if let entity = Entity(property: proper){
            do {
                let managedContext = entity.managedObjectContext
                
                self.navigationController?.popViewController(animated: true)
                try managedContext?.save()
            } catch {
                print("Context could not be saved")
            }
        }

        var reward1 = 0.00
        if let entity1 = Entity(reward: reward1){
            do {
                let managedContext1 = entity1.managedObjectContext

                self.navigationController?.popViewController(animated: true)
                try managedContext1?.save()
            } catch {
                print("Context1 could not be saved")
            }
        }

        var showqian = [Entity]()
        var leireward = [Entity]()
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        let managedContext1 = appDelegate.persistentContainer.viewContext
        let fetchRequest : NSFetchRequest<Entity> = Entity.fetchRequest()
        do {
            showqian = try managedContext.fetch(fetchRequest)
            leireward = try managedContext1.fetch(fetchRequest)
            
        } catch {
            print("Fetch could not be perforemd")
        }
        //money.text = String(showqian[0].property)
        

        
        reward1 = fenzhong + leireward[1].reward
        fenzhong = 0
        proper = showqian[0].property
        proper = proper + reward1
        showqian[0].property = proper
        leireward[1].reward = reward1
        //  Entity.init(property: proper)
        let numstr = String(format: "%.2f", proper)
        money.text = numstr
    }
    
    @IBAction func next(_ sender: UIButton) {
        
        count += 1
        if (count >= images.count){
            count = 0}
        
            if count == 0{
            NameD.text = "Name: Sports Bottle"
            price.text = "Price: 5"
            page.titleLabel?.text = "next"
            
        }
        
        if (count == 1) {
                self.bought.isHidden = true
            
            NameD.text = "Name: Cherry Keyboard"
            price.text = "Price: 1000"
            page.titleLabel?.text = "last"
            
        }
       
        
        
        product1.image = images[count]
        
    }
    
    
    @IBAction func ClickButton(_ sender: Any) {
        var proper = 0.0
        if let entity = Entity(property: proper){
            do {
                let managedContext = entity.managedObjectContext
                
                self.navigationController?.popViewController(animated: true)
                try managedContext?.save()
            } catch {
                print("Context could not be saved")
            }
        }
        var showqian = [Entity]()
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest : NSFetchRequest<Entity> = Entity.fetchRequest()
        do {
            showqian = try managedContext.fetch(fetchRequest)
            
        } catch {
            print("Fetch could not be perforemd")
        }
        proper = showqian[0].property
        

         let alertController1 = UIAlertController(title: "Shopping", message: "Use 5 to buy Sports Bottle?", preferredStyle: .alert)

          let   alertController4 = UIAlertController(title: "Shopping", message: "Use 1000 to buy Cherry Keyboard?", preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        
        //    let okAction = UIAlertAction(title: "Confirm", style: .default) { () in
        let alertController2 = UIAlertController(title: "Purchase Failed", message: "Check your property!", preferredStyle: .alert)
        let okAction2 = UIAlertAction(title: "Confirm", style: .default, handler: nil)
        
        alertController2.addAction(okAction2)
        
        let alertController3 = UIAlertController(title: "Purchase Successful", message: "You got it!", preferredStyle: .alert)
        let okAction3 = UIAlertAction(title: "Confirm", style: .default, handler: {action in
            self.bought.isHidden = false})
        
        alertController3.addAction(okAction3)
        
        if count == 0{
            self.present(alertController1, animated: true)
            alertController1.addAction(cancelAction)
            if proper > 5{
            let okAction = UIAlertAction(title: "Confirm", style: .default, handler:  {action in
                self.present(alertController3, animated: true, completion: nil)
                showqian[0].property = proper - 5        })
            
           alertController1.addAction(okAction)
            
        }
        else {
            let okAction = UIAlertAction(title: "Confirm", style: .default, handler:  {action in
                self.present(alertController2, animated: true, completion: nil)})
            alertController1.addAction(okAction)
            
        }
        }
        else {
            
            self.present(alertController4, animated: true)
            alertController4.addAction(cancelAction)
            if proper > 1000{
            let okAction = UIAlertAction(title: "Confirm", style: .default, handler:  {action in
                self.present(alertController3, animated: true, completion: nil)
                showqian[0].property = proper - 1000        })
            
            alertController4.addAction(okAction)
            
        }
        else {
            let okAction = UIAlertAction(title: "Confirm", style: .default, handler:  {action in
                self.present(alertController2, animated: true, completion: nil)})
            alertController4.addAction(okAction)
            
            }
          
    }
}
//}
}




