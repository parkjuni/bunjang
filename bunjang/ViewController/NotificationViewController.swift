//
//  NotificationViewController.swift
//  bunjang
//
//  Created by JUNI on 2022/09/18.
//

import UIKit

class NotificationViewController: UIViewController {

    @IBOutlet weak var segmentedControl2 : UISegmentedControl!
    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var secondView: UIView!
  
    
    
    
    private let segmentedControl: UISegmentedControl = {
      let segmentedControl = UnderlineSegmentedControl(items: ["새소식", "키워드 알림"])
      segmentedControl.translatesAutoresizingMaskIntoConstraints = false
      return segmentedControl
    }()
    
   
    
 
    @IBAction func goKeyword(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Keyword_notification", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "Keyword_notiViewcontroller")

         self.show(vc, sender: self)
    }
    
    
    @IBOutlet weak var keyword: UIButton!

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.title = ""
                  }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
        keywordButton.isHidden = true

            self.navigationController?.navigationBar.topItem?.title = "알림"
//        self.title = ""

     
//        self.segmentedControl.selectedSegmentIndex = 0
//
//
        
          self.view.addSubview(self.segmentedControl)
//          self.view.addSubview(self.pageViewController.view)
          
          NSLayoutConstraint.activate([
            self.segmentedControl.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            self.segmentedControl.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            self.segmentedControl.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 80),
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
              
                keywordButton.isHidden = false
           }
           
           else {
                firstView.alpha = 1
                secondView.alpha = 0
               keywordButton.isHidden = true

             

           }
            
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


