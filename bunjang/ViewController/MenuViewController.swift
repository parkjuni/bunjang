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

    @IBOutlet weak var segmentedControl1: UISegmentedControl!
    
    
    
    private let segmentedControl: UISegmentedControl = {
      let segmentedControl = UnderlineSegmentedControl(items: ["카테고리", "브랜드", "서비스"])
      segmentedControl.translatesAutoresizingMaskIntoConstraints = false
      return segmentedControl
    }()
    
    @IBAction func testButton(_ sender: Any) {
//        goods().Brands(self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.segmentedControl.selectedSegmentIndex = 0

        // Do any additional setup after loading the view.
        
        self.view.addSubview(self.segmentedControl)
//          self.view.addSubview(self.pageViewController.view)
        
        NSLayoutConstraint.activate([
          self.segmentedControl.leftAnchor.constraint(equalTo: self.view.leftAnchor),
          self.segmentedControl.rightAnchor.constraint(equalTo: self.view.rightAnchor),
          self.segmentedControl.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 145),
          self.segmentedControl.heightAnchor.constraint(equalToConstant: 50),
        ])

        self.segmentedControl.addTarget(self, action: #selector(changeValue(control:)), for: .valueChanged)
        self.segmentedControl.selectedSegmentIndex = 0
        self.changeValue(control: self.segmentedControl)
      }
      
      @objc private func changeValue(control: UISegmentedControl) {
        // 코드로 값을 변경하면 해당 메소드 호출 x
//          self.currentPage = control.selectedSegmentIndex
          if control.selectedSegmentIndex == 1 {
             firstView.alpha = 0
             secondView.alpha = 1
             thirdView.alpha = 0
         }
         else if control.selectedSegmentIndex == 2{
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
    
    @IBAction func dismiss(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    

    
   

}
