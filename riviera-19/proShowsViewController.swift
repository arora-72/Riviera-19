//
//  proShowsViewController.swift
//  riviera-19
//
//  Created by Indresh Arora on 11/01/19.
//  Copyright © 2019 Indresh Arora. All rights reserved.
//

import UIKit

class proShowsViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    var comboData = ["COMBO-1","COMBO-1","COMBO-1"]
    var globalImage = ["helloWorldImage","helloWorldImage","helloWorldImage"]
    var descriptionData:[String] = ["Pro shows = 1 + 4 \n + \n kakashi","Pro shows = 1 + 4","Pro shows = 1 + 4"]
    var costData: [String] = ["Rs - 30000","Rs - 30000","Rs - 30000"]
    
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var pageControl: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        
        
        
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
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.collectionView.frame.width, height: self.collectionView.frame.height)
    }
    
    
    
    //didselectat
    
    
    //pagecontrol
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageNumber = round(scrollView.contentOffset.x/scrollView.frame.size.width)
        pageControl.currentPage = Int(pageNumber)
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

}
