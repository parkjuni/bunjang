//
//  MyViewController.swift
//  bunjang
//
//  Created by JUNI on 2022/09/23.
//

import UIKit

class MyViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()

    }
    
    
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
        setButton.addTarget(self, action: #selector(searchbuttonAction), for: .touchUpInside)

        
    }

    
    @objc func searchbuttonAction(sender: UIButton!) {

        let storyboard = UIStoryboard(name: "Notification", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "NotificationViewController")

         self.show(vc, sender: self)

        
           }


    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.title = ""
                  }
    

}





