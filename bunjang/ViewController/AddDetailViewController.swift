//
//  AddDetailViewController.swift
//  bunjang
//
//  Created by JUNI on 2022/09/18.
//

import UIKit

class AddDetailViewController: UIViewController {

    @IBOutlet weak var addB: UIButton!
    @IBOutlet weak var payButton: UIButton!
    @IBAction func backButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        payButton.layer.borderWidth = 1
//        payButton.layer.borderColor = UIColor.red.cgColor
        payButton.layer.cornerRadius = 4
        addB.layer.cornerRadius = 4

        // Do any additional setup after loading the view.
    }
    

   

}
