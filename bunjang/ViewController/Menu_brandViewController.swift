//
//  Menu_brandViewController.swift
//  bunjang
//
//  Created by JUNI on 2022/09/24.
//

import UIKit

class Menu_brandViewController: UIViewController {


    @IBOutlet weak var brandTable: UITableView!
    @IBOutlet weak var testlabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        goods().Brands(self)
        // Do any additional setup after loading the view.
    }
    
}


extension Menu_brandViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return 10

    }

    

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        return UITableViewCell()

    }

}


class brandTableViewCell: UITableViewCell {


    override func awakeFromNib() {

        super.awakeFromNib()

        // Initialization code

    }


    override func setSelected(_ selected: Bool, animated: Bool) {

        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state

    }


}


//api setting 함수
extension Menu_brandViewController{
    
    func didSuccess_brand(_ response: brand){
        

        let brandName = response.result[0].brandName
    
              self.testlabel.text = brandName
//
    }
}


