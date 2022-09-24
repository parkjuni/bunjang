//
//  MenuViewController.swift
//  bunjang
//
//  Created by JUNI on 2022/09/18.
//

import UIKit

class MenuViewController: UIViewController {

    
    @IBOutlet weak var firstView : UIView!
    @IBOutlet weak var secondView : UIView!
    @IBOutlet weak var thirdView : UIView!

    @IBOutlet weak var segmentedControl: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.segmentedControl.selectedSegmentIndex = 0

        // Do any additional setup after loading the view.
    }
    
    @IBAction func dismiss(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func switchViews(_ sender: UISegmentedControl){
      
         if sender.selectedSegmentIndex == 1 {
            firstView.alpha = 0
            secondView.alpha = 1
            thirdView.alpha = 0
        }
        else if sender.selectedSegmentIndex == 2{
            firstView.alpha = 0
            secondView.alpha = 0
            thirdView.alpha = 1
            
        }
        else {
             firstView.alpha = 1
             secondView.alpha = 0
             thirdView.alpha = 0
        }
        
        
        
    }
    
   

}
