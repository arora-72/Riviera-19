//
//  LoginViewController.swift
//  riviera-19
//
//  Created by Indresh Arora on 11/01/19.
//  Copyright © 2019 Indresh Arora. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import Toast_Swift

class LoginViewController: UIViewController {
    @IBOutlet weak var signIntn: UIButton!
    @IBOutlet weak var logInBtn: UIButton!
    @IBOutlet weak var passwordTxtArea: UITextField!
    @IBOutlet weak var usernameTxtArea: UITextField!
    
    @IBOutlet weak var gradientView: UIView!
    
    
    var activityViewIndicator = UIActivityIndicatorView()
    let behindView = UIView()
    
    
     typealias CompletionHandler = (_ success: Bool) -> Void
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        setUpButton()
        setGradientBackground()
       

    }
    
    func logIN(completionHandler: @escaping CompletionHandler){
        
        guard !(self.usernameTxtArea.text?.isEmpty ?? false) else {
//            let actionController = UIAlertController(title: "Sorry", message: "Please fill in all fields", preferredStyle: .alert)
//            let actionAlert = UIAlertAction(title: "OK", style: .destructive, handler: nil)
//            actionController.addAction(actionAlert)
//            self.present(actionController, animated: true, completion: nil)
            self.view.makeToast("Please fill in all fields")
            return
        }
        
        
        self.startActivityView()
        let url = "http://rivieravit.com/app-api/api/auth/login"
        
        let parameters = [
            "regno": self.usernameTxtArea.text,
            "password": self.passwordTxtArea.text
        ]
        
        
        
        Alamofire.request(URL(string: url)!, method: .post, parameters: parameters as Parameters, headers: nil)
    .validate()
            .responseJSON { (response) in
               switch response.result
               {
               case.success(let value):
                let swiftyJson = JSON(value)
                print(swiftyJson)
                completionHandler(true)
                break
                
               case.failure(let error):
                print(error.localizedDescription)
                self.view.makeToast(error.localizedDescription)
                completionHandler(false)
                break
                }
        }
    }
    
    func setGradientBackground() {
        let colorTop =  UIColor(red:0.84, green:0.13, blue:0.54, alpha:1.0).cgColor
        let colorBottom = UIColor(red:0.99, green:0.48, blue:0.52, alpha:1.0).cgColor
        
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop, colorBottom]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = self.view.bounds
        
        self.gradientView.layer.insertSublayer(gradientLayer, at: 0)
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
        
        
        logIN { (success) in
            if success {
                self.stopActivityView()
                self.performSegue(withIdentifier: "eventsSegue", sender: self)
            }else{
                self.stopActivityView()
                let actionController = UIAlertController(title: "Error", message: "Invalid credentials", preferredStyle: UIAlertController.Style.alert)
                let action  = UIAlertAction(title: "OK", style: .default, handler: nil)
                actionController.addAction(action)
                self.present(actionController, animated: true, completion: nil)
            }
        }
        
        
    }
    
    
    @IBAction func logInAction(_ sender: Any) {
        
        if(logInBtn.isSelected){
            self.logInBtn.backgroundColor = UIColor.white
            self.logInBtn.tintColor = UIColor.purple
        }
        
    }
    
    
    func setUpActivityViewIndicator(){
        
        self.behindView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        self.behindView.center = self.view.center
        self.behindView.backgroundColor = UIColor.lightGray
        self.behindView.layer.cornerRadius = 10.0
        self.activityViewIndicator.center = self.view.center
        self.activityViewIndicator.hidesWhenStopped = true
        self.activityViewIndicator.style = .whiteLarge
        self.view.addSubview(behindView)
        self.view.addSubview(activityViewIndicator)
    }
    
    func startActivityView(){
        setUpActivityViewIndicator()
        self.activityViewIndicator.startAnimating()
        UIApplication.shared.beginIgnoringInteractionEvents()
    }
    
    func stopActivityView(){
        
        self.activityViewIndicator.stopAnimating()
        UIApplication.shared.endIgnoringInteractionEvents()
        self.behindView.removeFromSuperview()
    }
   

}
