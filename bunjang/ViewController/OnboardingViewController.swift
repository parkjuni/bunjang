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
let jwt = "eyJ0eXBlIjoiand0IiwiYWxnIjoiSFMyNTYifQ.eyJ1c2VySWR4Ijo2LCJpYXQiOjE2NjQxODIyNjAsImV4cCI6MTY2NTY1MzQ4OX0.LaMlzDJcrr72DSz1GfV58rj7EvRsccUy90maACyjwjI"



let userId = 6

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
        
        //if jwt, userid가 유저디폴트에 있다면 -- 카카오 자동로그인(jwt,userId필요)
        //          -- 성공시 홈뷰로 - my탭 유저 정보 세팅
        //없다면 카카오 로그인(토큰필요)
//                  -- 성공시 홈뷰로 - my탭 유저 정보 세팅
        //          -- 실패하면 set nick name view로 전환 회원가입 - (토큰, 닉네임 필요)

        //로그아웃 하면 -- userDefault 값 삭제
        
        if ud.string(forKey: "jwt") != nil {
//            kakaoLogin().auto_loin(self)
            // 성공하면 거기서 홈 뷰로
            kakaoLogin().auto_loin(self)
            
        }
        else {
            
            
            //카톡 설치 됐을 시 간편로그인 - 시뮬레이터에서 동작 안함
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
                                   ud.set(accessToken, forKey: "token")
           
                                   print("access token : ", accessToken!)
           
                               }
                           }
                       }
           
            //카톡 없을 때 브라우저로 카카오 로그인
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
                               ud.set(accessToken, forKey: "token")
                           }
                print(ud.string(forKey: "token"))
                     kakaoLogin().Login(self)  //   -- 성공 -- 거기서 홈뷰로
                // 실패 -- set nick 뷰로
    
        }
    
       
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
//        ud.set(jwt, forKey: "jwt")
//        ud.set(6, forKey: "userId")

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


//api setting 함수
extension OnboardingViewController{
    
    func didSuccess_autoLogin(){
       
       let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "MainViewController")
        vc.modalPresentationStyle = UIModalPresentationStyle.fullScreen
        self.present(vc, animated: true, completion: nil)
    }
    
    
    
    
    func didSuccess_Login(){
        
           let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "MainViewController")
            vc.modalPresentationStyle = UIModalPresentationStyle.fullScreen
            self.present(vc, animated: true, completion: nil)
        }

    func register_user(){
        
        let setNickname = UIStoryboard.init(name: "SetNickname", bundle: nil)
          let vc = setNickname.instantiateViewController(withIdentifier: "SetNicknameViewController") as! SetNicknameViewController
          vc.modalPresentationStyle = UIModalPresentationStyle.fullScreen

          self.present(vc, animated: true)
       
        }
    
    
}
