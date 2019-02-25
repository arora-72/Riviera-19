//
//  tabBarFile.swift
//  riviera-19
//
//  Created by Indresh Arora on 05/02/19.
//  Copyright © 2019 Indresh Arora. All rights reserved.
//

import Foundation

import UIKit


class tabBarViewController: UITabBarController {
    
    
    let button = UIButton.init(type: UIButton.ButtonType.custom)
    
    let pinkcolor = UIColor(red:0.86, green:0.18, blue:0.53, alpha:1.0)
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        button.frame = CGRect(x: 100, y: 0, width: 30, height: 30)
        //button.backgroundColor = .orange
        button.layer.borderWidth = 4
        button.layer.borderColor = pinkcolor.cgColor
        button.setImage(UIImage.init(named: "riviera_tab"), for: .normal)
        button.setImage(UIImage.init(named: "riviera_tab"), for: .selected)
        button.addTarget(self, action: #selector(tabBarViewController.actionSheet(sender:)), for: .touchUpInside)
        self.view.insertSubview(button, aboveSubview: self.tabBar)
        
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        print(self.view.bounds.height)
        if (self.view.bounds.height > 800){
             button.frame = CGRect.init(x: self.tabBar.center.x - 25, y: self.view.bounds.height - 80, width:50, height: 50)
        }else{
             button.frame = CGRect.init(x: self.tabBar.center.x - 25, y: self.view.bounds.height - 50, width:50, height: 50)
        }
       
        button.layer.cornerRadius = 25
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    
    
    @objc func actionSheet(sender: UIButton)
    {
        
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        
        
        let faq = UIAlertAction(title: "FAQs", style: .default) { (action) in
            self.performSegue(withIdentifier: "faq", sender: self)
        }
        
        alert.addAction(faq)
        
        let aboutRiviera = UIAlertAction(title: "About Riviera", style: .default) { (action) in
            self.performSegue(withIdentifier: "aboutRiviera", sender: self)
        }
        alert.addAction(aboutRiviera)
        
        
        let contactUs = UIAlertAction(title: "Contact Us", style: .default) { (action) in
            UIApplication.shared.open(URL(string: "http://rivieravit.com/")!)
        }
        
        alert.addAction(contactUs)
        
        let logOut = UIAlertAction(title: "Log Out", style: .default, handler: {(action) in
            self.dismiss(animated: true, completion: nil)
        })
        alert.addAction(logOut)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (action) in
//            let storyboard = UIStoryboard(name: "Main", bundle: nil)
//            let secondViewController = storyboard.instantiateViewController(withIdentifier: "tabBarViewController") as! tabBarViewController
//            self.present(secondViewController, animated: true, completion: nil)
            
            
        }

        alert.addAction(cancelAction)
        
        self.present(alert, animated: true, completion: nil)
    }
    
    
}
