//
//  SetNicknameViewController.swift
//  bunjang
//
//  Created by JUNI on 2022/09/22.
//

import UIKit



class SetNicknameViewController: UIViewController, UITextFieldDelegate {

    
    @IBOutlet weak var setNickText: UITextField!
    
    @IBOutlet weak var done_button: UIButton!
    
    @IBAction func setNickButton(_ sender: Any) {
        ud.set(setNickText.text, forKey: "nickName")
        print("nick name : " + ud.string(forKey: "nickName")!)
        kakaoLogin().join(self)
        
        if ud.integer(forKey: "joincode") == 1000 {

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "MainViewController")
        vc.modalPresentationStyle = UIModalPresentationStyle.fullScreen
         self.present(vc, animated: true, completion: nil)
        }
        
        else{
            print("회원가입 에러 ---------else code")
            print(ud.integer(forKey: "joincode"))
        }
//
    }
    
    //화면터치시 키보드 내리기
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {        setNickText.resignFirstResponder()    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setNickText.becomeFirstResponder()
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
            done_button.transform = CGAffineTransform(translationX: 0, y: -keyboardHeight)

        }
    }

    // 키보드가 사라졌다는 알림을 받으면 실행할 메서드
    @objc func keyboardWillHide(_ noti: NSNotification){
        // 키보드의 높이만큼 화면을 내려준다.
        if let keyboardFrame: NSValue = noti.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let keyboardRectangle = keyboardFrame.cgRectValue
            let keyboardHeight = keyboardRectangle.height
//            done_button.y += keyboardHeight
            done_button.transform = CGAffineTransform(translationX: 0, y: keyboardHeight)

        }
    }
    
    
    
    
}
