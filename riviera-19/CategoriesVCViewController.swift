//
//  CategoriesVCViewController.swift
//  riviera-19
//
//  Created by Indresh Arora on 07/02/19.
//  Copyright © 2019 Indresh Arora. All rights reserved.
//

import UIKit

class CategoriesVCViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    
    let categories = ["premium","dance","pre-riviera","drama-art-and-photography","music","workshop","words-worth-tamil","words-worth-hindi", "quiz", "words-worth-english", "words-worth-telugu", "adventure-sports", "informal", "cyber-engage"]

    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.categories.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "categoriesCell", for: indexPath)
        cell.textLabel?.text = categories[indexPath.row]
        cell.textLabel?.textColor = UIColor.white
        cell.imageView?.image = UIImage.init(named: "venue")
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 67.0
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "eventsCategories" {
            
            if let indexPath = self.tableView.indexPathForSelectedRow{
                let selectedRow = indexPath.row
                let segueDestination = segue.destination as! Day1ViewController
                segueDestination.categoryName = categories[selectedRow]
                print(segueDestination.categoryName)
            }
          
        }
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        let controller = Day1ViewController()
        controller.categoryName = categories[indexPath.row]
        performSegue(withIdentifier: "eventsCategories", sender: self)
    }
    
    
    

   
}
