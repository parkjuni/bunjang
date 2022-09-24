//
//  TalkViewController.swift
//  bunjang
//
//  Created by JUNI on 2022/09/25.
//

import UIKit

class TalkViewController: UIViewController {

    @IBOutlet weak var notiView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

       
        self.notiView.isUserInteractionEnabled = true
        //제쳐스 추가
        self.notiView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.viewTapped)))
    }
    
    @objc func viewTapped(_ sender: UITapGestureRecognizer) {
        let storyboard = UIStoryboard(name: "Setting_notification", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "Setting_notiViewController")

         self.show(vc, sender: self)    }

    
    
    override func viewWillAppear(_ animated: Bool) {
           super.viewWillAppear(animated)
           self.navigationItem.title = " "
                     }
    
}
