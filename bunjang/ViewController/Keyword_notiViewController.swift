//
//  Keyword_notiViewController.swift
//  bunjang
//
//  Created by JUNI on 2022/09/23.
//

import UIKit

class Keyword_notiViewController: UIViewController {

    var keywordDataList : [keywordResult] = []

    
    @IBOutlet weak var button_set: UIButton!
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var keyword_num_label: UILabel!
    @IBOutlet weak var keywordField: UITextField!
    
    @IBAction func add_keyword(_ sender: Any) {
        //공백검사 추가 하기 
            keywords().key_create(self, key_word: keywordField.text!)}
    
    //화면터치시 키보드 내리기
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {        keywordField.resignFirstResponder()    }
    
    
    override func viewDidLoad() {
        keywords().key_get(self)

        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.navigationController?.navigationBar.topItem?.title = "키워드 알림"
    
        keyword_num_label.sizeToFit()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 50
    }
    
    override func viewWillAppear(_ animated: Bool) {
        keywordField.becomeFirstResponder()
        self.addKeyboardNotifications()
    }
    override func viewWillDisappear(_ animated: Bool) {
        self.removeKeyboardNotifications()
    }

    
   
    
    ///// 확인 버튼 키보드 위로 붙이기
    func addKeyboardNotifications(){
        // 키보드가 나타날 때 앱에게 알리는 메서드 추가
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification , object: nil)
        // 키보드가 사라질 때 앱에게 알리는 메서드 추가
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    // 노티피케이션을 제거하는 메서드
    func removeKeyboardNotifications(){
        // 키보드가 나타날 때 앱에게 알리는 메서드 제거
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification , object: nil)
        // 키보드가 사라질 때 앱에게 알리는 메서드 제거
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardWillShow(_ noti: NSNotification){
        // 키보드의 높이만큼 화면을 올려준다.
        if let keyboardFrame: NSValue = noti.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let keyboardRectangle = keyboardFrame.cgRectValue
            let keyboardHeight = keyboardRectangle.height
//            self.done_button.y -= keyboardHeight
            button_set.transform = CGAffineTransform(translationX: 0, y: -keyboardHeight)

        }
    }

    // 키보드가 사라졌다는 알림을 받으면 실행할 메서드
    @objc func keyboardWillHide(_ noti: NSNotification){
        // 키보드의 높이만큼 화면을 내려준다.
        if let keyboardFrame: NSValue = noti.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let keyboardRectangle = keyboardFrame.cgRectValue
            let keyboardHeight = keyboardRectangle.height
//            done_button.y += keyboardHeight
            button_set.transform = CGAffineTransform(translationX: 0, y: keyboardHeight)

        }
    }
    
    
    
}



extension Keyword_notiViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        
        return keywordDataList.count
    }

    

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! keywordViewCell
        
        cell.keywordName.text = keywordDataList[indexPath.row].keyword

//
        return cell

    }

}

class keywordViewCell: UITableViewCell {


    @IBAction func delButton(_ sender: Any) {
    }
    
    @IBOutlet weak var keywordName: UILabel!
    
    override func awakeFromNib() {

        super.awakeFromNib()
//        keywordName.sizeToFit()

    }


    override func setSelected(_ selected: Bool, animated: Bool) {

        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state

    }


}



//api setting 함수
extension Keyword_notiViewController{
    
    func didSuccess_getkeywords(_ response: Keyword){
        
        //화면 로딩시 세팅
        self.keywordDataList = response.result
        keyword_num_label.text = String(keywordDataList.count)
        self.tableView.reloadData()
  

}

    
    func didSuccess_postkeywords(){
       
        //성공하면 ui에 키워드 추가하기
        print("post 성공")
     
    }
}

