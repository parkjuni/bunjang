//
//  OtherLoginViewController.swift
//  bunjang
//
//  Created by JUNI on 2022/09/23.
//

import UIKit

class OtherLoginViewController: UIViewController {

    @IBOutlet weak var modalview: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        modalview.layer.cornerRadius = 15
                modalview
            .layer.maskedCorners = CACornerMask(arrayLiteral: .layerMinXMinYCorner, .layerMaxXMinYCorner)

    }
    

   

}
