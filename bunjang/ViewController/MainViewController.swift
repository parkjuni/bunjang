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
        
//        if tabBarController!.selectedIndex == 1{
//            let add : UIStoryboard = UIStoryboard(name: "AddDetail", bundle: nil)
//            let addVC = add.instantiateViewController(withIdentifier: "AddDetailViewController") as! AddDetailViewController
////            addVC.modalPresentationStyle = .fullScreen
//            self.present(addVC, animated: true, completion: nil)
//        }
        
    }




}

extension MainViewController : UITabBarControllerDelegate{

    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {

        if viewController is SearchViewController{
       
                  let add : UIStoryboard = UIStoryboard(name: "AddDetail", bundle: nil)
                  let addVC = add.instantiateViewController(withIdentifier: "AddDetailViewController") as! AddDetailViewController
      //            addVC.modalPresentationStyle = .fullScreen
                  self.present(addVC, animated: true, completion: nil)

                  return false
              }
              

        if viewController is AddViewController{
//        if tabBarController.selectedIndex == 1{
            let add : UIStoryboard = UIStoryboard(name: "AddDetail", bundle: nil)
            let addVC = add.instantiateViewController(withIdentifier: "AddDetailViewController") as! AddDetailViewController
//            addVC.modalPresentationStyle = .fullScreen
            self.present(addVC, animated: true, completion: nil)

            return false
            }
        
    
        
        return true
    
        }

    
}
