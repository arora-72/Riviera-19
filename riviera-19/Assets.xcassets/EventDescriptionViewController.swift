//
//  EventDescriptionViewController.swift
//  riviera-19
//
//  Created by Indresh Arora on 11/01/19.
//  Copyright © 2019 Indresh Arora. All rights reserved.
//

import UIKit

class EventDescriptionViewController: UIViewController {
    
    //MARK:- Outlets
    @IBOutlet weak var EventImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var contactLbl: UILabel!
    @IBOutlet weak var venueLbl: UILabel!
    @IBOutlet weak var timeLbl: UILabel!
    @IBOutlet weak var eventDescription: UITextView!
    @IBOutlet weak var registerNowBtn: UIButton!
    
    
    //variables
    var eventImageString: String!
    var titleString: String!
    var timeString: String!
    var venueString: String!
    var contactString: String!
    var descriptionString: String!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        // Do any additional setup after loading the view.
        print(titleString)
        setUpDisplay()
        
        
        
    }
    
    
    func setUpDisplay(){
        
       // self.EventImage.image = UIImage.init(named: eventImageString)
        self.titleLabel.text = titleString
        self.venueLbl.text = venueString
        self.contactLbl.text = contactString
        self.eventDescription.text = descriptionString
        self.timeLbl.text = timeString
        
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


    @IBAction func registerAction(_ sender: Any) {
        UIApplication.shared.open(URL(string: "https://vtop11.vit.ac.in/riviera/")!)        
    }
    
}
