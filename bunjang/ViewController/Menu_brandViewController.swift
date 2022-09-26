//
//  Menu_brandViewController.swift
//  bunjang
//
//  Created by JUNI on 2022/09/24.
//

import UIKit

class Menu_brandViewController: UIViewController {

    @IBOutlet weak var brandTable: UITableView!
    
    var brandDataList : [brandResult] = []
    
//    struct data{
//        var label : String
//        var swit : Bool
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        goods().Brands(self)
        brandTable.delegate = self 
        brandTable.dataSource = self
        brandTable.rowHeight = 70

        // Do any additional setup after loading the view.
    }
    
}


extension Menu_brandViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(brandDataList.count)
        return brandDataList.count

    }

    

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! brandTableViewCell
        
        cell.brandName.text = brandDataList[indexPath.row].brandName
        cell.brandEngName.text = brandDataList[indexPath.row].brandEngName + " · "+String(brandDataList[indexPath.row].counting)+"개"

        return cell

    }

}

class brandTableViewCell: UITableViewCell {



   @IBOutlet weak var brandImg: UIImageView!
   @IBOutlet weak var brandName: UILabel!
   @IBOutlet weak var brandEngName: UILabel!
   @IBOutlet weak var follow: UIButton!
    
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
        
//        let brandName = response.result[0].brandName
//        self.testlabel.text = brandName
//
        self.brandDataList = response.result
        self.brandTable.reloadData()
                   
               
//
    }
}


