//
//  LoginViewController.swift
//  riviera-19
//
//  Created by Indresh Arora on 11/01/19.
//  Copyright © 2019 Indresh Arora. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var signIntn: UIButton!
    @IBOutlet weak var logInBtn: UIButton!
    @IBOutlet weak var passwordTxtArea: UITextField!
    @IBOutlet weak var usernameTxtArea: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        setUpButton()
        
       
        
       
        
    }
    
    
    
    
    func setUpButton(){
        self.signIntn.layer.borderWidth = 1.0
        self.logInBtn.layer.borderWidth = 1.0
        self.signIntn.layer.cornerRadius = 20.0
        self.logInBtn.layer.cornerRadius = 20.0
        
        self.logInBtn.layer.borderColor = UIColor.white.cgColor
        self.signIntn.layer.borderColor = UIColor.white.cgColor
        
       
        
    }

    
    
    @IBAction func signInAction(_ sender: Any) {
        
        if(signIntn.isSelected){
            self.signIntn.backgroundColor = UIColor.white
            self.signIntn.tintColor = UIColor.purple
        }
        
    }
    
    
    @IBAction func logInAction(_ sender: Any) {
        
        if(logInBtn.isSelected){
            self.logInBtn.backgroundColor = UIColor.white
            self.logInBtn.tintColor = UIColor.purple
        }
        
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
