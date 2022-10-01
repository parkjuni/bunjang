//
//  ViewController.swift
//  bunjang
//
//  Created by JUNI on 2022/09/18.
//

import UIKit

class MainViewController: UITabBarController {
    
    private var previousTabIndex: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.delegate = self

        
    }
    

}

extension MainViewController : UITabBarControllerDelegate{
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {

     

        if viewController is AddViewController{

            let add : UIStoryboard = UIStoryboard(name: "AddDetail", bundle: nil)
            let addVC = add.instantiateViewController(withIdentifier: "AddDetailViewController") as! AddDetailViewController
            addVC.modalPresentationStyle = .fullScreen
            self.present(addVC, animated: true, completion: nil)

            return false
             }
        
        if viewController is seViewController{
            print("navigation googo")
            self.navigationController?.pushViewController(SearchViewController(), animated: true)

            }
            
        return true
    
        }

    
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        
        guard let items = tabBar.items else { return }
        print("pre index1")

        print(previousTabIndex)
        
        for (index, tabBarItem) in items.enumerated() where tabBarItem == item {

            if index == 1 {
            // 이전 인덱스로 화면 전환!
        
                selectedIndex = previousTabIndex
//                tabBarController?.selectedIndex = previousTabIndex
                print("selected index")
                print(selectedIndex)
//               // search view push!
//                guard let baseNavigationController = self as? UINavigationController else { return }
//                      baseNavigationController.pushViewController(SearchViewController(), animated: true)
                self.navigationController?.pushViewController(SearchViewController(), animated: true)
            }
            else {
                       // 그 외의 화면들은 인덱스 업데이트!
                           previousTabIndex = index
                           print("pre index2")
                           print(previousTabIndex)

                       }
                   }
    

    }
    
    
}
