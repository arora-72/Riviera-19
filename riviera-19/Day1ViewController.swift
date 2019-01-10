//
//  Day1ViewController.swift
//  riviera-19
//
//  Created by Indresh Arora on 08/01/19.
//  Copyright © 2019 Indresh Arora. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class Day1ViewController: UIViewController, IndicatorInfoProvider, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    
    let clock = "5am - 11 pm"
    let venue = "mubarak"
    let details = "8290642601 - Indresh Arora"
    let title1 = "Hello World 2.0"
    let description1 = "hadouken @ master"
    
  
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.separatorStyle = .none
        
    }
    

    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title:"DAY 1")
}

    
    //table view properties
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "EventsCell", for: indexPath) as! EventsPageTableViewCell
        
        cell.cellBackgroundView.layer.cornerRadius = 15.0
        
        cell.accessoryType = .none
        cell.selectionStyle = .none
        
        cell.clockImage.image = UIImage.init(named: "clock")
        cell.venueImage.image = UIImage.init(named: "venue")
        cell.callImage.image = UIImage.init(named: "call")
        
        cell.clockLabel.text = "11am - pm"
        cell.venueLabel.text = "Kamaraj Auditorum"
        cell.callLabel.text = "+91-8290642601"
        cell.titleLabel.text = "Hello World 2.0"
        
        return cell
    }
    
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 154
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "eventDescription", sender: self)
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        self.tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier=="eventDescription") {
            
            
            let controller = segue.destination as! EventDescriptionViewController
            controller.titleString = title1
            controller.timeString = clock
            controller.descriptionString = description1
            controller.contactString = details
            controller.venueString = venue
        }
    }
    
/*
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

*/
    
}

