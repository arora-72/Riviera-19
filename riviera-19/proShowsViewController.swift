//
//  proShowsViewController.swift
//  riviera-19
//
//  Created by Indresh Arora on 11/01/19.
//  Copyright © 2019 Indresh Arora. All rights reserved.
//

import UIKit

class proShowsViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var rivieraButtn: UIImageView!
    @IBOutlet weak var gradientView: UIView!
    
    
    var comboData = ["COMBO-1","COMBO-2","COMBO-3","COMBO-4","COMBO-5","COMBO-6"]
    var globalImage = ["helloWorldImage","helloWorldImage","helloWorldImage","helloWorldImage","helloWorldImage","helloWorldImage"]
    var descriptionData:[String] = ["Pro shows \n D1+D2+D3+D4 \n D - Day"," Pro Shows \n D1+D2+D3 \n D - Day","Merchandise Combo \n RN+CN+H \n RN - round neck tshirt, CN - Collared tshirt, h - hoodie","Merchandise Combo \n RN+CN \n RN - round neck tshirt, CN - Collared tshirt, h - hoodie", "Merchandise Combo \n RN+H \n RN - round neck tshirt, CN - Collared tshirt, h - hoodie", "Merchandise Combo \n CN+H \n RN - round neck tshirt, CN - Collared tshirt, h - hoodie"]
    var costData: [String] = ["Rs - 1250","Rs - 1100","Rs - 800","Rs - 400","Rs - 550", "Rs - 650"]
    
    
    var globalIndex: Int!
    var selectedIndexPath: IndexPath?
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var pageControl: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        
        setGradientBackground()
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailCollectionSegue" {
        
//           let indexPath = collectionView.indexPathsForSelectedItems
//            print(indexPath)
//            let controller = segue.destination as! proShowsDescriptionViewController
//
//            controller.comboString = comboData[globalIndex]
//            controller.descriptionString = descriptionData[globalIndex]
//            controller.costString = costData[globalIndex]
////            controller.navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem
////            controller.navigationItem.leftItemsSupplementBackButton = true
//
          
        }
    }
    

    @IBAction func pageAction(_ sender: Any) {
        pageControl.currentPage = globalImage.count
        
    }
    
    
    //collection view methods
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return globalImage.count
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath) as! proShowsCollectionViewCell
        cell.layer.cornerRadius = 10.0
        cell.comboLabel.layer.cornerRadius = 5.0
        cell.primaryImage.image = UIImage.init(named: globalImage[indexPath.item])
        cell.comboLabel.text = comboData[indexPath.item]
        cell.costLabel.text = costData[indexPath.item]
        cell.descriptionLabel.text = descriptionData[indexPath.row]
        
        
        //for page control
        self.pageControl.numberOfPages = globalImage.count
        
        
        return cell
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        collectionView.allowsMultipleSelection = false
        
        print(indexPath.row)
        print("didselect clicked")
        
        globalIndex = indexPath.row
        print(globalIndex)
        
   
        
        
        //let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "proShowsDescriptionViewController") as! proShowsDescriptionViewController
        
        vc.largeImage = globalImage[indexPath.row]
        vc.comboString = comboData[indexPath.row]
        vc.costString = costData[indexPath.row]
        vc.descriptionString = descriptionData[indexPath.row]
        print(vc.descriptionString)
        
       present(vc, animated: true, completion: nil)
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.collectionView.frame.width, height: self.collectionView.frame.height)
    }
    
    
    
    //didselectat
    
    
    //pagecontrol
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageNumber = round(scrollView.contentOffset.x/scrollView.frame.size.width)
        pageControl.currentPage = Int(pageNumber)
    }
    
    
    
    //status bar
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    
    
//    //change color when tapped
//    // change background color when user touches cell
//    func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
//        let cell = collectionView.cellForItem(at: indexPath)
//        cell?.backgroundColor = UIColor.red
//    }
//
//    // change background color back when user releases touch
//    func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
//        let cell = collectionView.cellForItem(at: indexPath)
//        cell?.backgroundColor = UIColor.cyan
//    }

    
    func setGradientBackground() {
        let colorTop =  UIColor(red:0.84, green:0.13, blue:0.54, alpha:1.0).cgColor
        let colorBottom = UIColor(red:0.99, green:0.48, blue:0.52, alpha:1.0).cgColor
        
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop, colorBottom]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = CGRect(x: 0, y: 0, width: self.view.bounds.width, height: 100)
        
        self.gradientView.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    
    
    
    
}
