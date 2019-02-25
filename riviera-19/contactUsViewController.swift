//
//  contactUsViewController.swift
//  riviera-19
//
//  Created by Indresh Arora on 02/02/19.
//  Copyright © 2019 Indresh Arora. All rights reserved.
//

import UIKit

class contactUsViewController: UIViewController {

    @IBOutlet weak var buttonGradient: UIView!
    @IBOutlet weak var gradientView: UIView!
    @IBOutlet weak var rivieraImage: UIView!
    
    @IBOutlet weak var sendMessageBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        setGradientBackground()
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    
    
    func setGradientBackground() {
        let colorTop =  UIColor(red:0.84, green:0.13, blue:0.54, alpha:1.0).cgColor
        let colorBottom = UIColor(red:0.99, green:0.48, blue:0.52, alpha:1.0).cgColor
        
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop, colorBottom]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = self.gradientView.bounds
        
        
        //self.gradientView.layer.insertSublayer(gradientLayer, at: 0)
    }

    
//    func setBtnGradientBackground() {
//        let colorTop =  UIColor(red:0.84, green:0.13, blue:0.54, alpha:1.0).cgColor
//        let colorBottom = UIColor(red:0.99, green:0.48, blue:0.52, alpha:1.0).cgColor
//
//
//        let gradientLayer = CAGradientLayer()
//        gradientLayer.colors = [colorTop, colorBottom]
//        gradientLayer.locations = [0.0, 1.0]
//        gradientLayer.frame = self.buttonGradient.bounds
//
//        self.buttonGradient.layer.insertSublayer(gradientLayer, at: 0)
//    }
}
