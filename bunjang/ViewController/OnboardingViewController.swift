//
//  OnboardingViewController.swift
//  bunjang
//
//  Created by JUNI on 2022/09/19.
//

import UIKit
import KakaoSDKAuth
import KakaoSDKUser
import KakaoSDKCommon

let ud = UserDefaults.standard
let base_url = "https://guriman.shop"

var images = ["onboard1.jpg","onboard2.jpg","onboard3.jpg","onboard4.jpg"]


class OnboardingViewController: UIViewController  {

    //IBOutlet
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var Login_apple: UIButton!

    @IBOutlet weak var other_login: UILabel!
    //이미지
    @IBAction func pageChanged(_ sender: Any) {
        imageView.image = UIImage(named: images[pageControl.currentPage])
    }

    //var
    var imageViews = [UIImageView]()

    
    
    

    @objc func otherLoginTapped(sender: UITapGestureRecognizer) {

        let storyboard = UIStoryboard(name: "OtherLogin", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "OtherLoginViewController")
        
        modalTransitionStyle = .coverVertical
        self.present(vc, animated: true)
        

    }

    
    
    
    //kakao login
    @IBAction func Login_kakao(_ sender: Any) {
        
//        토큰 존재 여부 확인하기
        if (AuthApi.hasToken()) {
            UserApi.shared.accessTokenInfo { (_, error) in
                if let error = error {
                    if let sdkError = error as? SdkError, sdkError.isInvalidTokenError() == true  {
                        //로그인 필요
                    }
                    else {
                        //기타 에러
                    }
                }
                else {
                    //토큰 유효성 체크 성공(필요 시 토큰 갱신됨)
                    print("===========================토큰 있음")
//                    print("access token : ", oauthToken?.accessToken)
                    print("access token : ", ud.string(forKey: "token"))
                    print("refresh token : ", ud.string(forKey: "refreshtoken"))

                    kakaoLogin().Login(self)

                    //메인뷰 전환

                }
            }
        }
        
        //토큰 없음 - 회원가입
        else {
            //로그인 필요
            //카톡 설치 됐을 시 간편로그인
            if (UserApi.isKakaoTalkLoginAvailable()) {
                UserApi.shared.loginWithKakaoTalk {(oauthToken, error) in
                    if let error = error {
                        print(error)
                    }
                    else {
                        print("loginWithKakaoTalk() success.")

                        //do something
                        _ = oauthToken
                        
                        let accessToken = oauthToken?.accessToken
                        let refreshToken = oauthToken?.refreshToken
                        ud.set(accessToken, forKey: "token")
                        ud.set(refreshToken, forKey: "refreshtoken")

                        print("access token : ", accessToken!)
                        print("refresh token : ", refreshToken!)

                    }
                }
            }

            //안됐을 시 브라우저 로그인

            else {
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
                           let refreshToken = oauthToken?.refreshToken
                           ud.set(accessToken, forKey: "token")
                           ud.set(refreshToken, forKey: "refreshtoken")

                           print("access token : ", accessToken!)
                           print("refresh token : ", refreshToken!)
                           
                           // 닉네임 설정창 - 회원가입
                            let setNickname = UIStoryboard.init(name: "SetNickname", bundle: nil)
                            let vc = setNickname.instantiateViewController(withIdentifier: "SetNicknameViewController")
                            vc.modalPresentationStyle = UIModalPresentationStyle.fullScreen

                            self.present(vc, animated: true, completion: nil)
    
                       
                       }}



        }
    
       
//        else {
//        UserApi.shared.loginWithKakaoAccount {(oauthToken, error) in
//                    if let error = error {
//                        print(error)
//                    }
//                    else {
//                        print("loginWithKakaoAccount() success.")
//
//                        //do something
//                        _ = oauthToken
////                        // 어세스토큰
////                        let accessToken = oauthToken?.accessToken
////                        ud.set(accessToken, forKey: "token")
////
////                        let setNickname = UIStoryboard.init(name: "SetNickname", bundle: nil)
////                        let vc = setNickname.instantiateViewController(withIdentifier: "SetNicknameViewController")
////                        self.present(vc, animated: true, completion: nil)
////
//
//
//                        //카카오 로그인을 통해 사용자 토큰을 발급 받은 후 사용자 관리 API 호출
////                        self.setUserInfo()
//                    }
//
//
//            let accessToken = oauthToken?.accessToken
//            let refreshToken = oauthToken?.refreshToken
//            ud.set(accessToken, forKey: "token")
//            print("access token : ", accessToken!)
//            print("refresh token : ", refreshToken!)

//            kakaoLogin().Login(self)
            
            //response code 받아서 if == 1000 기존회원 로그인 - 홈뷰 전환
//            if ud.integer(forKey: "code") == 1000 {
//                let storyboard = UIStoryboard(name: "Main", bundle: nil)
//                let vc = storyboard.instantiateViewController(withIdentifier: "MainViewController")
//                vc.modalPresentationStyle = UIModalPresentationStyle.fullScreen
//                self.present(vc, animated: true, completion: nil)
//            }
////
            //else==2017  신규회원 set nick name 창으로 전환 - 가입
//            else{
//                print("로그인---------else code")
//            let setNickname = UIStoryboard.init(name: "SetNickname", bundle: nil)
//            let vc = setNickname.instantiateViewController(withIdentifier: "SetNicknameViewController") as! SetNicknameViewController
//            vc.modalPresentationStyle = UIModalPresentationStyle.fullScreen
//
//            self.present(vc, animated: true)
//            }
            

            
                        
//                }
        }
    }
//    

    
    
    
    
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

        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(otherLoginTapped))

      
        
        other_login.addGestureRecognizer(tapGestureRecognizer)

        other_login.isUserInteractionEnabled = true

        //gesture
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(OnboardingViewController.respondToSwipeGesture(_:)))
               swipeLeft.direction = UISwipeGestureRecognizer.Direction.left
               self.view.addGestureRecognizer(swipeLeft)
               
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(OnboardingViewController.respondToSwipeGesture(_:)))
               swipeRight.direction = UISwipeGestureRecognizer.Direction.right
               self.view.addGestureRecognizer(swipeRight)
               
        
        
        //애플 로그인 테두리
        Login_apple.layer.borderWidth = 1
        Login_apple.layer.borderColor = UIColor.black.cgColor
    
    }

    
    @objc func respondToSwipeGesture(_ gesture: UIGestureRecognizer) {
           // 만일 제스쳐가 있다면
           if let swipeGesture = gesture as? UISwipeGestureRecognizer{
           
               
               // 발생한 이벤트가 각 방향의 스와이프 이벤트라면 해당 이미지 뷰를 빨간색 화살표 이미지로 변경
               switch swipeGesture.direction {
                  
                   case UISwipeGestureRecognizer.Direction.left :
                   if  pageControl.currentPage != 3 {
                       imageView.image = UIImage(named: images[pageControl.currentPage+1])
                       pageControl.currentPage += 1

                   }
                   case UISwipeGestureRecognizer.Direction.right :
                   if  pageControl.currentPage != 0 {
                       imageView.image = UIImage(named: images[pageControl.currentPage-1])
                       pageControl.currentPage -= 1

                   }
               default:
                       break
               }
               
           }
           
       }
    

}

