//
//  Day1ViewController.swift
//  riviera-19
//
//  Created by Indresh Arora on 08/01/19.
//  Copyright © 2019 Indresh Arora. All rights reserved.
//

import UIKit
import XLPagerTabStrip
import Alamofire
import SwiftyJSON

class Day1ViewController: UIViewController, IndicatorInfoProvider, UITableViewDelegate, UITableViewDataSource {

    var categoryName: String!
    let eventName: [String] = []
    
    
    
    @IBOutlet weak var tableView: UITableView!
    
    
    var activityViewIndicator = UIActivityIndicatorView()
    let behindView = UIView()
    
    
    var premiumArray = [Premium]()
    
//    let clock = "5am - 11 pm"
//    let venue = "mubarak"
//    let details = "8290642601 - Indresh Arora"
//    let title1 = "Hello World 2.0"
//    let description1 = "hadouken @ master"
//
  
    typealias CompletionHandler = (_ success: Bool) -> Void
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.separatorStyle = .none
        self.navigationItem.title = categoryName
        
        fetchData(completionHandler: {(success) -> Void in
            
            if success {
                self.stopActivityView()
                print(self.premiumArray.count)
                self.tableView.reloadData()
            }else{
                print("failure")
            }
            
        })
        
        
    }
    
    
    
    func fetchData(completionHandler: @escaping CompletionHandler)
    
    {
        
        self.startActivityView()
        let url = "http://rivieravit.com/app-api/api/event"
         Alamofire.request(URL(string: url)!, method: .get, headers: nil)
        .validate()
            .responseJSON { (response) in
                switch response.result
                {
                case.success(let value):
                    let swiftyJson = JSON(value)
                    
                    let event = swiftyJson["events"]
                    let premium = event[self.categoryName].arrayValue
                
                    
                    for items in premium {
                        print(items)
                        let name = items["name"].stringValue
                        let hasExternals = items["hasExternals"].stringValue
                        let fees = items["fees"].stringValue
                        let category = items["category"].stringValue
                        let club = items["club"].stringValue
                        let coordinator1 = items["coordinator1"].stringValue
                        let coordinator2 = items["coordinator2"].stringValue
                        let phone1 = items["phone1"].stringValue
                        let phone2 = items["phone2"].stringValue
                        let description = items["description"].stringValue
                        print(name)
                        print(hasExternals)
                        
                        self.premiumArray.append(Premium(hasExternals: hasExternals, fees: fees, category: category, club: club, name: name, coordinator1: coordinator1, phone1: phone1, coordinator2: coordinator2, phone2: phone2, description: description))
                        
                        completionHandler(true)
                        
                    }
                    

                    
               //     let dance = event?["dance"] as [[String:AnyObject]]
//                    let pre-riviera = event["pre-riviera"] as [[String:AnyObject]]
//                    let drama-art-and-photography = event["drama-art-and-photography"] as [[String:AnyObject]]
//                    let premium = event["premium"] as [[String:AnyObject]]
//                    let premium = event["premium"] as [[String:AnyObject]]
//                    let premium = event["premium"] as [[String:AnyObject]]
//                    let premium = event["premium"] as [[String:AnyObject]]
//                    let premium = event["premium"] as [[String:AnyObject]]
//                    print(array?[0])
                    
                   
                    break
                    
                case.failure(let error):
                    print(error.localizedDescription)
                    break
                }
        }
        
    }
    
    

    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title:"DAY 1")
}

    
    //table view properties
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(self.premiumArray.count==0){
            return 0
        }else{
        return self.premiumArray.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "EventsCell", for: indexPath) as! EventsPageTableViewCell
        
        let premium: Premium
        premium = premiumArray[indexPath.row]
        
        cell.cellBackgroundView.layer.cornerRadius = 15.0
        
        cell.accessoryType = .none
        cell.selectionStyle = .none
        
        cell.clockImage.image = UIImage.init(named: "clock")
        cell.venueImage.image = UIImage.init(named: "venue")
        cell.callImage.image = UIImage.init(named: "call")
        
        cell.clockLabel.text = premium.club
        cell.venueLabel.text = premium.category
        cell.callLabel.text = premium.phone1
        cell.titleLabel.text = premium.name
        
        return cell
    }
    
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 154
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let premium: Premium
        premium = premiumArray[indexPath.row]
        let controller = EventDescriptionViewController()
        controller.titleString = premium.name
        controller.timeString = premium.club
        controller.descriptionString = premium.description
        controller.contactString = premium.phone1
        controller.venueString = premium.coordinator1
        
        performSegue(withIdentifier: "eventDescription", sender: self)
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        self.tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier=="eventDescription") {
            
            if let indexPath = self.tableView.indexPathForSelectedRow{
                let premium: Premium
                premium = premiumArray[indexPath.row]
                let selectedRow = indexPath.row
                let controller = segue.destination as! EventDescriptionViewController
                controller.titleString = premium.name
                controller.timeString = premium.club
                controller.descriptionString = premium.description
                controller.contactString = premium.phone1
                controller.venueString = premium.coordinator1
                
            }
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

