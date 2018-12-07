//
//  ConfirmViewController.swift
//  CountdownTimer
//
//  Created by Shushen Song on 2018-12-2.
//  Copyright © 2018 Shushen Song. All rights reserved.

import UIKit



extension UIApplication {
    
    var screenShot: UIImage?  {
        return keyWindow?.layer.screenShot
    }
}
extension CALayer {
    
    var screenShot: UIImage?  {
        let scale = UIScreen.main.scale
        UIGraphicsBeginImageContextWithOptions(frame.size, false, scale)
        if let context = UIGraphicsGetCurrentContext() {
            render(in: context)
            let screenshot = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            return screenshot
        }
        return nil
    }
}
class ConfirmViewController: UIViewController {
    
    var fenzhong = UserDefaults().double(forKey: "shijian")
    

    override func viewDidLoad() {
        super.viewDidLoad()
        let power = String(fenzhong*20)
        computepower.text = "\(power)"

        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var computepower: UILabel!
    @IBOutlet weak var show: UIImageView!
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBAction func screenshot(_ sender: UIButton) {
        
        let showalert = UIAlertController(title: "share with friends", message: "Do you want to share this with your friends?", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        imageView.image = UIApplication.shared.screenShot
        let screen = UIImageView(frame: CGRect(x:10, y:10, width: 120, height: 240))
        showalert.view.addSubview(screen)
        showalert.addAction(action)
        
        self.present(showalert, animated: true, completion: nil)
        
    }
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
