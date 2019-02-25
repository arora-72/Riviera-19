//
//  signUpViewController.swift
//  riviera-19
//
//  Created by Indresh Arora on 11/01/19.
//  Copyright © 2019 Indresh Arora. All rights reserved.
//

import UIKit
import Alamofire
import Toast_Swift

class signUpViewController: UIViewController {
    
    @IBOutlet weak var gradientView: UIView!
    
    @IBOutlet weak var emailTxtArea: UITextField!
    @IBOutlet var nameTxtArea: UITextField!
    @IBOutlet weak var regNoTxtArea: UITextField!
    @IBOutlet weak var passwordTxtArea: UITextField!
    
    @IBOutlet weak var yesBtn: UIButton!
    @IBOutlet weak var noBtn: UIButton!
    
    let gradientLayer = CAGradientLayer()
    
    @IBOutlet weak var segmentedIndex: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        setGradientBackground()
        setPlaceholderWhite()
        
      
    }
    
    
    func setGradientBackground() {
        let colorTop =  UIColor(red:0.84, green:0.13, blue:0.54, alpha:1.0).cgColor
        let colorBottom = UIColor(red:0.99, green:0.48, blue:0.52, alpha:1.0).cgColor
        
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop, colorBottom]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: 80)
        
        
        self.gradientView.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    func setPlaceholderWhite(){
        
        //padding
        
        let paddingEmailView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: self.emailTxtArea.frame.height))
        let paddingNameView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: self.nameTxtArea.frame.height))
        let paddingRegView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: self.regNoTxtArea.frame.height))
        let paddingPasswordView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: self.passwordTxtArea.frame.height))
      
        emailTxtArea.leftView = paddingEmailView
        nameTxtArea.leftView = paddingNameView
        regNoTxtArea.leftView = paddingRegView
        passwordTxtArea.leftView = paddingPasswordView
        
        emailTxtArea.leftViewMode = .always
        nameTxtArea.leftViewMode = .always
        regNoTxtArea.leftViewMode = .always
        passwordTxtArea.leftViewMode = .always
        
        emailTxtArea.attributedPlaceholder = NSAttributedString(string: "Email ID", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        nameTxtArea.attributedPlaceholder = NSAttributedString(string: "Name", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        regNoTxtArea.attributedPlaceholder = NSAttributedString(string: "Registration Number", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        passwordTxtArea.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
    }
    
    
    typealias CompletionHandler = (_ success: Bool) -> Void
    
    
    func sendData(completionHandler: @escaping CompletionHandler)
    {
        
        let url = "http://rivieravit.com/app-api/api/auth/register"
        
        let parameters = [
            "regno" : self.regNoTxtArea.text,
            "email": self.emailTxtArea.text,
            "password": self.passwordTxtArea.text,
            "name": self.nameTxtArea.text
            
        ]
        
        print(parameters)
        
        Alamofire.request(URL(string: url)!, method: .post, parameters: parameters as Parameters, headers: nil)
        .validate()
        .responseJSON { (response) in
            switch response.result{
            case.success(let value):
                print(value)
                completionHandler(true)
                
              
                break
                
            case.failure(let error):
                print(error.localizedDescription)
                completionHandler(false)
                //self.view.makeToast("Sign up unsuccessful please try again later.")
                break
            }
            
        }
        
        
    }
   
    
    
    @IBAction func doneBtn(_ sender: Any) {
        
        
        guard let text = self.nameTxtArea.text, !text.isEmpty else {
            let actionController = UIAlertController(title: "Error", message: "please fill all the fields", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default, handler: nil)
            actionController.addAction(action)
            self.present(actionController, animated: true, completion: nil)
            return
        }

        
        guard let EmailID = self.emailTxtArea.text, !EmailID.isEmpty else {
            let actionController = UIAlertController(title: "Error", message: "please fill all the fields", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default, handler: nil)
            actionController.addAction(action)
            self.present(actionController, animated: true, completion: nil)
            return
        }

        guard let regNo = self.regNoTxtArea.text, !regNo.isEmpty else {
            let actionController = UIAlertController(title: "Error", message: "please fill all the fields", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default, handler: nil)
            actionController.addAction(action)
            self.present(actionController, animated: true, completion: nil)
            return
        }

        guard let password = self.passwordTxtArea.text, !password.isEmpty else {
            let actionController = UIAlertController(title: "Error", message: "please fill all the fields", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default, handler: nil)
            actionController.addAction(action)
            self.present(actionController, animated: true, completion: nil)
            return
        }
        
        
        
        //alamofire functions
        sendData { (success) in
            if(success){
                self.view.makeToast("Sign Up completed")
                  self.performSegue(withIdentifier: "frontPage", sender: self)
                
            }else{
                self.view.makeToast("Sorry! Service temporarily unavailable. Please try again later")
            }
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
    @IBAction func yesBtnAction(_ sender: Any) {
        
      
        
    }
    @IBAction func noBtnAction(_ sender: Any) {
        
//        noBtn.setBackgroundImage(UIImage.init(named: "clicked_1"), for: UIControl.State.selected)
//
//        if(noBtn.isSelected)
//        {
//            yesBtn.setBackgroundImage(UIImage.init(named: "unclicked_1"), for: UIControl.State.normal)
//        }
//    }
    
    
}

    @IBAction func cancelAction(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil
        
        
        
        )
    }
}
