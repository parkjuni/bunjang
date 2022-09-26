//
//  MyViewController.swift
//  bunjang
//
//  Created by JUNI on 2022/09/23.
//

import UIKit

class MyViewController: UIViewController {

    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var segmentedView: UIView!
    
    @IBOutlet weak var bankAcB: UIButton!
    @IBOutlet weak var pointB: UIButton!
   
    
    private let segmentedControl: UISegmentedControl = {
        let segmentedControl = UnderlineSegmentedControl(items: ["판매상품", "상점후기", "찜목록" ])
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        return segmentedControl
      }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        setNavigationBar()
        bankAcB.layer.borderWidth = 1
        bankAcB.layer.borderColor = UIColor.systemGray4.cgColor
        bankAcB.layer.cornerRadius = 4

        pointB.layer.borderWidth = 1
        pointB.layer.borderColor = UIColor.systemGray4.cgColor
        pointB.layer.cornerRadius = 4
        
        
        self.segmentedView.addSubview(self.segmentedControl)
 self.stackView.insertArrangedSubview(self.segmentedView, at: 3)
        
        NSLayoutConstraint.activate([
              self.segmentedControl.leftAnchor.constraint(equalTo: self.segmentedView.leftAnchor),
              self.segmentedControl.rightAnchor.constraint(equalTo: self.segmentedView.rightAnchor),
              self.segmentedControl.topAnchor.constraint(equalTo: self.segmentedView.topAnchor, constant: 5),
              self.segmentedControl.heightAnchor.constraint(equalToConstant: 40),
            ])
       
//           self.segmentedControl.addTarget(self, action: #selector(changeValue(control:)), for: .valueChanged)
           self.segmentedControl.selectedSegmentIndex = 0
//           self.changeValue(control: self.segmentedControl)
//
        

    }
    
    
//    @objc private func changeValue(control: UISegmentedControl) {
//        if control.selectedSegmentIndex == 1 {
//           firstView.alpha = 0
//           secondView.alpha = 1
//
//       }
//
//       else {
//            firstView.alpha = 1
//            secondView.alpha = 0
//
//       }
//
//    }
//
    func setNavigationBar(){
        let notiButtonImage = UIImage(systemName: "bell")!
        let notiButton = UIButton(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        
        let shareButtonImage = UIImage(systemName: "square.and.arrow.up")!
        let shareButton = UIButton(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        
        let setButtonImage = UIImage(systemName: "ellipsis")!
        let setButton = UIButton(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
               
        notiButton.tintColor = .black
        notiButton.setImage(notiButtonImage, for: .normal)
        
        shareButton.tintColor = .black
        shareButton.setImage(shareButtonImage, for: .normal)
        
        setButton.tintColor = .black
        setButton.setImage(setButtonImage, for: .normal)
               
        let notiBarButton = UIBarButtonItem(customView: notiButton)

        let sharehBarButton = UIBarButtonItem(customView: shareButton)
        
        let setBarButton = UIBarButtonItem(customView: setButton)


        self.navigationItem.rightBarButtonItems = [setBarButton, sharehBarButton, notiBarButton]
        
        
        var configuration = UIButton.Configuration.plain()
        configuration.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 0)

        notiButton.configuration = configuration
        shareButton.configuration = configuration
        setButton.configuration = configuration

        
        
        notiButton.addTarget(self, action: #selector(searchbuttonAction), for: .touchUpInside)
        shareButton.addTarget(self, action: #selector(searchbuttonAction), for: .touchUpInside)
        setButton.addTarget(self, action: #selector(setbuttonAction), for: .touchUpInside)

        
    }

    
    @objc func searchbuttonAction(sender: UIButton!) {

        let storyboard = UIStoryboard(name: "Notification", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "NotificationViewController")

         self.show(vc, sender: self)

        
           }
    
    @objc func setbuttonAction(sender: UIButton!) {

        let storyboard = UIStoryboard(name: "My_Setting", bundle: nil)
          let vc = storyboard.instantiateViewController(withIdentifier: "My_SettingViewController")
          
          modalTransitionStyle = .coverVertical
          self.present(vc, animated: true)


           }
    
  

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.title = ""
                  }
    

}




