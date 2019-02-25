//
//  aboutViewController.swift
//  riviera-19
//
//  Created by Indresh Arora on 01/02/19.
//  Copyright © 2019 Indresh Arora. All rights reserved.
//

import UIKit

class aboutViewController: UIViewController {

    @IBOutlet weak var dismissBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func dismissAction(_ sender: Any) {
        self.dismiss(animated: true, completion:   nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func dismissBtn(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
