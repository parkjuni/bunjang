//
//  notiSettingViewController.swift
//  bunjang
//
//  Created by JUNI on 2022/09/23.
//

import UIKit

class Setting_notiViewController: UIViewController{
    
    
    struct data{
        var label : String
        var swit : Bool
    }
    
    let sections = ["알림", "번개톡 채팅 알림","상품 알림", "상점 알림","배송 알림", "이벤트 및 혜택 알림","관심상품 알림", "우리동네 알림"]
    let sec1 = [ data(label:    "아이폰 알림이 꺼져있습니다.", swit: false),data(label: "방해금지 시간 설정", swit: false)]
    
    let sec2 = [data(label: "메세지를 받았을 때", swit: false)]
    let sec3 = [ data(label: "상품이 찜 되었을 때", swit: false),data(label: "내가 찜한 상품이 가격 하락 했을 때", swit: false), data(label: "UP하기 예약 실행 알림", swit: false),data(label: "재판매 가능 상품이 있을 때", swit: false), data(label: "내 상품으로 가격 제안 받았을 떄", swit: false)]
    let sec4 = [ data(label: "상점이 팔로우 되었을 때", swit: false),data(label: "상점 리뷰가 등록되었을 때", swit: false)]
    let sec5 = [ data(label: "배송 진행", swit: false),data(label: "배송이 완료되었을 때", swit: false)]
    let sec6 = [ data(label: "이벤트 및 혜택 알림 동의", swit: false),data(label: "", swit: false)]
    let sec7 = [ data(label: "키워드 알림", swit: false),data(label: "팔로잉 상점 알림", swit: false), data(label: "내가 찜한 상품으로 연락받기", swit: false)]
    let sec8 = [data(label: "우리동네 이벤트", swit: false)]

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.navigationBar.topItem?.title = "알림/부가서비스"

        tableView.delegate = self
        tableView.dataSource = self
    }
    

    

}

extension Setting_notiViewController:UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0 :
            return sec1.count
        case 1 :
            return sec2.count
        case 2 :
            return sec3.count
        case 3 :
            return sec4.count
        case 4 :
            return sec5.count
        case 5 :
            return sec6.count
        case 6 :
            return sec7.count
        case 7 :
            return sec8.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: MytableViewCell = self.tableView.dequeueReusableCell(withIdentifier: "cell") as! MytableViewCell
        
        switch indexPath.section {
            
        case 0 :             cell.Label.text = sec1[indexPath.row].label

        case 1 : cell.Label.text = sec2[indexPath.row].label
        case 2 : cell.Label.text = sec3[indexPath.row].label
        case 3 : cell.Label.text = sec4[indexPath.row].label
        case 4 : cell.Label.text = sec5[indexPath.row].label
        case 5 : cell.Label.text = sec6[indexPath.row].label
        case 6 : cell.Label.text = sec7[indexPath.row].label
        case 7 : cell.Label.text = sec8[indexPath.row].label
        default:
            return cell
        }
        return cell
    }
    

    func numberOfSections(in tableView: UITableView) -> Int {
           return sections.count
       }

       func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
           return sections[section]
       }

    
}

class MytableViewCell : UITableViewCell {
   

    @IBOutlet weak var Label: UILabel!
    
    @IBOutlet weak var Switch: UISwitch!
    override func awakeFromNib() {
        super.awakeFromNib()
        Switch.isOn = false
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
