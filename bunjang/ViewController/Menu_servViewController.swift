//
//  Menu_servViewController.swift
//  bunjang
//
//  Created by JUNI on 2022/09/24.
//

import UIKit

class Menu_servViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    struct data{
        var img : String
        var label : String
    }
    
    let sections = ["추천","자주 쓰는"]
    let sec1 = [ data(img:"menu_right", label : "정품 검수"),data(img:"menu_phone", label: "내폰시세"), data(img:"menu_usim", label: "번개유심"),data(img:"menu_event", label: "혜택/이벤트"),data(img:"menu_friend", label: "친구초대")]
    
    let sec2 = [data(img:"menu_heart", label: "찜"),data(img:"menu_his", label: "최근본상품"), data(img:"menu_feed", label: "내피드"),data(img:"menu_loca", label: "우리동네")]
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 70
    }
    

   

}


extension Menu_servViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0 :
            return sec1.count
        case 1 :
            return sec2.count
       
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: Serve_tableViewCell = self.tableView.dequeueReusableCell(withIdentifier: "cell") as! Serve_tableViewCell
        
        switch indexPath.section {
            
        case 0 :             cell.Label.text = sec1[indexPath.row].label
            cell.img.image = UIImage(named: sec1[indexPath.row].img)
//            cell.menuCell_img.image = UIImage(named: menuImg[indexPath.row])


        case 1 : cell.Label.text = sec2[indexPath.row].label
            cell.img.image = UIImage(named: sec2[indexPath.row].img)

       
        default:
            return cell
        }
        
        cell.selectionStyle = .none
        return cell
    }
    

    func numberOfSections(in tableView: UITableView) -> Int {
           return sections.count
       }

       func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
           
           return sections[section]
       }

    
    // header custom
    func tableView(_ tableView:UITableView, heightForHeaderInSection section : Int) -> CGFloat{
        return 80
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {

        let header = view as! UITableViewHeaderFooterView

        if let textlabel = header.textLabel {
            textlabel.textColor = UIColor.black
            textlabel.font = UIFont.boldSystemFont(ofSize: 20)

        }
    }
    
   
    
    
    
}

class Serve_tableViewCell : UITableViewCell {
   

    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var Label: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
