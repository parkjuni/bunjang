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
  
    @IBAction func switchViews(_ sender: UISegmentedControl){
      
         if sender.selectedSegmentIndex == 1 {
            firstView.alpha = 0
            secondView.alpha = 1
        }
        
        else {
             firstView.alpha = 1
             secondView.alpha = 0
        }
    
    }

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

            self.navigationController?.navigationBar.topItem?.title = "알림"

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
        
            
                  }
    
  

}
