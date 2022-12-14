//
//  brandListViewController.swift
//  bunjang
//
//  Created by JUNI on 2022/09/27.
//

import UIKit

class brandListViewController: UIViewController {

    
    @IBOutlet weak var tableVIew: UITableView!
    var brandDataList : [brandResult] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        goods().Brands_list(self)
        // Do any additional setup after loading the view.
        tableVIew.delegate = self
        tableVIew.dataSource = self
        tableVIew.rowHeight = 70
    }
    
}


extension brandListViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(brandDataList.count)
        return brandDataList.count

    }

    

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! brandListViewCell
        
        cell.brandName.text = brandDataList[indexPath.row].brandName
        cell.eng_num.text = brandDataList[indexPath.row].brandEngName + " · "+String(brandDataList[indexPath.row].counting)+"개"
        let url = URL(string:brandDataList[indexPath.row].imgUrl)
        let data = try! Data(contentsOf: url!)
        cell.ima.image = UIImage(data: data)

        
        
        return cell

    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            //클릭한 셀의 이벤트 처리
            tableView.deselectRow(at: indexPath, animated: true)
        ud.set(brandDataList[indexPath.row].brandId, forKey: "menu_brandId")
        ud.set(brandDataList[indexPath.row].brandName, forKey: "menu_brandName")
        ud.set(brandDataList[indexPath.row].imgUrl, forKey: "menu_brandUrl")
        ud.set(brandDataList[indexPath.row].brandEngName, forKey: "menu_brandEng")

        let storyboard = UIStoryboard(name: "GDStoryboard", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "GDViewController")
        
         self.present(vc, animated: true)
        }
    

}

class brandListViewCell: UITableViewCell {


    @IBOutlet weak var eng_num: UILabel!
    @IBOutlet weak var brandName: UILabel!
    @IBOutlet weak var ima: UIImageView!
    
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
extension brandListViewController{
    
    func didSuccess_brandList(_ response: brand){
        

        self.brandDataList = response.result
        self.tableVIew.reloadData()
                   
               
//
    }
}


