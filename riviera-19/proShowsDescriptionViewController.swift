//
//  proShowsDescriptionViewController.swift
//  riviera-19
//
//  Created by Jagruta Advani on 11/01/19.
//  Copyright © 2019 Indresh Arora. All rights reserved.
//

import UIKit

class proShowsDescriptionViewController: UIViewController {
    @IBOutlet weak var shortBtn: UIButton!
    @IBOutlet weak var mediumBtn: UIButton!
    @IBOutlet weak var largeBtn: UIButton!
    @IBOutlet weak var xlBtn: UIButton!
    
    @IBOutlet weak var titleLbl1: UILabel!
    
    @IBOutlet weak var comboLbl: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var dismissBtn: UIButton!
    
    var largeImage: String!
    var comboString: String!
    var descriptionString: String!
    var costString: String!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        print(self.descriptionString)
        setUpShirtView()
        setUpViews()
    }
    
    func setUpShirtView() {
        self.shortBtn.layer.cornerRadius = 43.26/2
        self.mediumBtn.layer.cornerRadius = 43.26/2
        self.largeBtn.layer.cornerRadius = 43.26/2
        self.xlBtn.layer.cornerRadius = 43.26/2
        self.shortBtn.layer.borderColor = UIColor.white.cgColor
        self.shortBtn.layer.borderWidth = 1.0
        self.mediumBtn.layer.borderColor = UIColor.white.cgColor
        self.mediumBtn.layer.borderWidth = 1.0
        self.largeBtn.layer.borderColor = UIColor.white.cgColor
        self.largeBtn.layer.borderWidth = 1.0
        self.xlBtn.layer.borderColor = UIColor.white.cgColor
        self.xlBtn.layer.borderWidth = 1.0
    }
    
    
    func setUpViews(){
        
        
        
        
        guard !(self.comboString.isEmpty) else {
            print("combo string error")
            return
        }
        
        guard !(self.descriptionString.isEmpty) else {
            print("descriptuion string error")
            return
        }
        
        guard !(self.costString.isEmpty) else {
            print("cost string error")
            return
        }
        
        
        self.comboLbl.text = comboString
        self.titleLbl1.text = descriptionString
        
        
        
    }
    
    
    @IBAction func dismissBtnAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    

  
    @IBAction func registerNowAction(_ sender: Any) {
        
        
        UIApplication.shared.open(URL(string: "https://vtop11.vit.ac.in/riviera/")!)
        
    }
    
}
