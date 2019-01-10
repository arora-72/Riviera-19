

import UIKit
import XLPagerTabStrip

class EventPageVC: ButtonBarPagerTabStripViewController {
    
    
    let purpleInspireColor = UIColor(red:0.13, green:0.03, blue:0.25, alpha:1.0)
    
    override func viewDidLoad() {
        
        setUpTabBar()
        setUpNavigationBarImage()
       
        super.viewDidLoad()
        
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
    }
    
    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        let day_1 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "day1")
        let day_2 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "day2")
        let day_3 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "day3")
        let day_4 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "day4")
        
        return [day_1, day_2,day_3,day_4]
    }
    
    
    //function for setting tab bar(android)\
    func setUpTabBar(){
        // change selected bar color
        settings.style.buttonBarBackgroundColor = .red
        settings.style.buttonBarItemBackgroundColor = .clear
        settings.style.selectedBarBackgroundColor = .white
        settings.style.buttonBarItemFont = .boldSystemFont(ofSize: 14)
        settings.style.selectedBarHeight = 2.0
        settings.style.buttonBarMinimumLineSpacing = 0
        settings.style.buttonBarItemTitleColor = .white
        settings.style.buttonBarItemsShouldFillAvailiableWidth = true
        settings.style.buttonBarLeftContentInset = 0
        settings.style.buttonBarRightContentInset = 0
        
        changeCurrentIndexProgressive = { [weak self] (oldCell: ButtonBarViewCell?, newCell: ButtonBarViewCell?, progressPercentage: CGFloat, changeCurrentIndex: Bool, animated: Bool) -> Void in
            guard changeCurrentIndex == true else { return }
            oldCell?.label.textColor = .white
            newCell?.label.textColor = .white
        }
    }
    
    
    func setUpNavigationBarImage(){
//        let logo = UIImage(named: "riviera_events")
//        let imageView = UIImageView(image: logo)
//        self.navigationItem.titleView = imageView
//        self.navigationItem.title = "Riviera"
        
//        var navigationAppearance = UINavigationBar.appearance()
//        navigationAppearance.tintColor = UIColor.red
//        navigationAppearance.barTintColor = UIColor.red
//        let logoContainer = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height))
//
//        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height))
//        imageView.contentMode = .scaleAspectFit
//        let image = UIImage(named: "path-1-1")
//        imageView.image = image
//        logoContainer.addSubview(imageView)
//
//        navigationItem.titleView = logoContainer
//
//        UINavigationBar.appearance().tintColor = UIColor.red
    }
    
    
    
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}

