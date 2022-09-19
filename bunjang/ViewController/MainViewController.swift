//
//  ViewController.swift
//  bunjang
//
//  Created by JUNI on 2022/09/18.
//

import UIKit

class MainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.delegate = self
    }




}

extension MainViewController : UITabBarControllerDelegate{

    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {


        if viewController is AddViewController{

        let modalViewController = MenuViewController()
//            modalViewController.modalPresentationStyle = UIModalPresentationStyle.fullScreen
        tabBarController.present(modalViewController, animated: true)


                   return false

              }
        return true
}


}
