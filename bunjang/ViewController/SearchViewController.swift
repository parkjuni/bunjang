//
//  SearchViewController.swift
//  bunjang
//
//  Created by JUNI on 2022/09/22.
//

import UIKit

class SearchViewController: UIViewController {

    @IBAction func homeButton(_ sender: Any) {
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.topItem?.title = ""

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
