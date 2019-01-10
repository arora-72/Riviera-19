//
//  signUpViewController.swift
//  riviera-19
//
//  Created by Indresh Arora on 11/01/19.
//  Copyright © 2019 Indresh Arora. All rights reserved.
//

import UIKit

class signUpViewController: UIViewController {
    
    @IBOutlet weak var gradientView: UIView!
    
    @IBOutlet weak var emailTxtArea: UITextField!
    @IBOutlet var nameTxtArea: UITextField!
    @IBOutlet weak var regNoTxtArea: UITextField!
    @IBOutlet weak var passwordTxtArea: UITextField!
    
    
    let gradientLayer = CAGradientLayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        setUpGradientView()
        setPlaceholderWhite()
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
    
    func setUpGradientView(){
        
        
//        self.gradientView.backgroundColor = UIColor.clear
        
        // 2
        gradientLayer.frame = self.view.bounds
        
        // 3
        let color1 = UIColor(red: 0.9882, green: 0.4784, blue: 0.5176, alpha: 1.0)
        
        let color4 = UIColor(red: 0.8745, green: 0.1333, blue: 0.5373, alpha: 1.0)
        gradientLayer.colors = [color4,color1]
        
        // 4
        gradientLayer.locations = [0.0,0.75]
        
        // 5
        self.view.layer.addSublayer(gradientLayer)
        
        
    }
    
    
    @IBAction func doneBtn(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
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
