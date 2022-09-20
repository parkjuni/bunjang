//
//  OnboardingViewController.swift
//  bunjang
//
//  Created by JUNI on 2022/09/19.
//

import UIKit
import KakaoSDKAuth
import KakaoSDKUser


var images = ["onboard1.jpg","onboard2.jpg","onboard3.jpg","onboard4.jpg"]


class OnboardingViewController: UIViewController  {

    //IBOutlet
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var Login_apple: UIButton!

    //이미지
    @IBAction func pageChanged(_ sender: Any) {
        imageView.image = UIImage(named: images[pageControl.currentPage])
    }

    //var
    var imageViews = [UIImageView]()

    
    //kakao login
    @IBAction func Login_kakao(_ sender: Any) {
        
        UserApi.shared.loginWithKakaoAccount {(oauthToken, error) in
                    if let error = error {
                        print(error)
                    }
                    else {
                        print("loginWithKakaoAccount() success.")
                        
                        //do something
                        _ = oauthToken
                        // 어세스토큰
                        let accessToken = oauthToken?.accessToken
                        
                        //카카오 로그인을 통해 사용자 토큰을 발급 받은 후 사용자 관리 API 호출
//                        self.setUserInfo()
                    }
                }
    }
//    
//    func setUserInfo() {
//            UserApi.shared.me() {(user, error) in
//                if let error = error {
//                    print(error)
//                }
//                else {
//                    print("me() success.")
//                    //do something
//                    _ = user
//                    self.infoLabel.text = user?.kakaoAccount?.profile?.nickname
//                    
//                    if let url = user?.kakaoAccount?.profile?.profileImageUrl,
//                        let data = try? Data(contentsOf: url) {
//                        self.profileImageView.image = UIImage(data: data)
//                    }
//                }
//            }
//    }
    
    //임시 애플아이디 누르면 메인으로 가기
    @IBAction func Login_apple(_ sender: Any) {
         
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "MainViewController")
         self.present(vc, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //페이지 컨트롤
        pageControl.numberOfPages = images.count
        pageControl.currentPage = 0
        pageControl.pageIndicatorTintColor = UIColor.lightGray
        pageControl.currentPageIndicatorTintColor = UIColor.black
        imageView.image = UIImage(named: images[0])

        
        
        //애플 로그인 테두리
        Login_apple.layer.borderWidth = 1
        Login_apple.layer.borderColor = UIColor.black.cgColor
    
    }


}



