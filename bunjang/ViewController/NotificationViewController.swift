//
//  NotificationViewController.swift
//  bunjang
//
//  Created by JUNI on 2022/09/18.
//

import UIKit

class NotificationViewController: UIViewController {

    @IBOutlet weak var segmentedControl : UISegmentedControl!
    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var secondView: UIView!
  
    
    @IBOutlet weak var keyword: UIButton!
    @IBAction func switchViews(_ sender: UISegmentedControl){
      
         if sender.selectedSegmentIndex == 1 {
            firstView.alpha = 0
            secondView.alpha = 1
           
             keywordButton.isHidden = false
        }
        
        else {
             firstView.alpha = 1
             secondView.alpha = 0
            keywordButton.isHidden = true

          

        }
    
    }

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
        keywordButton.isHidden = true

            self.navigationController?.navigationBar.topItem?.title = "알림"
//        self.title = ""

        self.segmentedControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.gray,.font: UIFont.systemFont(ofSize: 17)], for: .normal)
        
        
        
        self.segmentedControl.setTitleTextAttributes(
             [
               NSAttributedString.Key.foregroundColor: UIColor.black,
               .font: UIFont.systemFont(ofSize: 17, weight: .bold)
             ],
             for: .selected
           )
        self.segmentedControl.selectedSegmentIndex = 0

    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.title = ""
                  }
    
    
    let keywordButtonImage = UIImage(systemName: "square.and.pencil")!
           let keywordButton = UIButton(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
    
    func setNavigationBar(){
       
        
        let setButtonImage = UIImage(systemName: "gearshape")!
        let setButton = UIButton(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
      
               
        keywordButton.tintColor = .black
        keywordButton.setImage(keywordButtonImage, for: .normal)
        
        setButton.tintColor = .black
        setButton.setImage(setButtonImage, for: .normal)
      
        let keywordBarButton = UIBarButtonItem(customView: keywordButton)

        let setBarButton = UIBarButtonItem(customView:setButton)
        
     
        self.navigationItem.rightBarButtonItems = [setBarButton,keywordBarButton]
        
        
        var configuration = UIButton.Configuration.plain()
        configuration.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 0)

        setButton.configuration = configuration
        keywordButton.configuration = configuration

        setButton.addTarget(self, action: #selector(setbuttonAction), for: .touchUpInside)
        keywordButton.addTarget(self, action: #selector(keywordbuttonAction), for: .touchUpInside)
       

        
    }
   
    
    @objc func keywordbuttonAction(sender: UIButton!) {

        let storyboard = UIStoryboard(name: "Keyword_notification", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "Keyword_notiViewController")

         self.show(vc, sender: self)
        
           }
    @objc func setbuttonAction(sender: UIButton!) {

        let storyboard = UIStoryboard(name: "Setting_notification", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "Setting_notiViewController")

         self.show(vc, sender: self)
        
           }
   
    

}
