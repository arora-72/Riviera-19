//
//  FaqViewController.swift
//  riviera-19
//
//  Created by Indresh Arora on 01/02/19.
//  Copyright © 2019 Indresh Arora. All rights reserved.
//

import UIKit

class FaqViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var gradientView: UIView!
    
 
    @IBOutlet weak var tableView: UITableView!
    
    var question: [String] = ["What is Riviera?", "What is Riviera'19s theme?"]
    var answers: [String] = ["VIT Vellore is proud to present Riviera, a cultural extravagance! The birth of Riviera was in the year 2000 with an idea to create something big, and we have stuck to that idea and grown exponentially ever since then. This sports and cultural fest is an ISO 9001-2015 certified event and is considered one of the best college festival in the country. Riviera witnesses over 40,000 students from 700 colleges from all over India and across the globe. From Comedy nights to Gaming Tournaments. From Quizzes to Marathons. From Literary competitions to Sporting leagues. Riviera has it all! This 4-day long fest is not just about fun but also about creating the next generation of extraordinary students who not just excel in academics but also sports and culturals.", "Ever realized how there is a certain sequence to the things you do on daily basis? A subconscious natural rhythm takes over your body as soon as you wake up in the morning. Eat, work, repeat. Monotony is when you let your routine dictate your schedule, your choices and your life. So, Take charge, do something thrilling and electrifying, come Shatter the monotony at Riviera '19"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.navigationItem.title = "FAQ"
        self.tableView.separatorStyle = .none
        
        
    }

    
    func setGradientBackground() {
        let colorTop =  UIColor(red:0.84, green:0.13, blue:0.54, alpha:1.0).cgColor
        let colorBottom = UIColor(red:0.99, green:0.48, blue:0.52, alpha:1.0).cgColor

        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop, colorBottom]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = self.gradientView.bounds
        
        self.gradientView.layer.insertSublayer(gradientLayer, at: 0)
    }

    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "faqCell", for: indexPath) as! faqTableViewCell
        
        cell.questionTitle.text = question[indexPath.row]
        cell.ansTitle.text = answers[indexPath.row]
        cell.ansTitle.layer.cornerRadius = 10.0
    return cell
        
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
 
    @IBAction func dismissAction(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func doneBtn(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
