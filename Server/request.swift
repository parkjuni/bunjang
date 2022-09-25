////
////  request.swift
////  bunjang
////
////  Created by JUNI on 2022/09/22.
////
//
import Foundation
import Alamofire

class kakaoLogin{
    
    
    //기존회원 카카오로 로그인
    func Login(_ viewController : OnboardingViewController){
        
            let params :[String:Any] = [  "token" : ud.string(forKey: "token")]
        
            AF.request(base_url + "/users/login",
                       method: .post,
            parameters: params,
                       headers: nil)
            .responseDecodable(of: Login_kakao.self){ response in
               
                print(base_url+"/users/login")
                print(ud.string(forKey: "token"))
                
                print(response)
                switch response.result {
                case.success(let response):
//                    result code == 1000 - userId 저장하고 home으로 이동
                    if response.isSuccess {
                        //code 저장
                        print("post 성공")
                        ud.set(response.code, forKey: "code")
                        ud.set(response.result[0].userID, forKey: "userId")
                        ud.set(response.result[0].jwt, forKey: "jwt")
                    }
//                    else{
//
//                    }
    //                viewController.didSuccess_ovalue(response)
                case.failure(let error):
                    
                    //if result code ==2017 존재하지 않는 유저 -- set nick name 창으로 이동
//                    ud.set(response.code, forKey: "login_code")
                    print("login 오류 \(error.localizedDescription)")
                    
                }
            
        }
        
    }
    
    
    // 신규회원 카카오로 회원가입
    func join(_ viewController : SetNicknameViewController){
        
        let params = [  "token" : ud.string(forKey: "token"),
                        "nickName" : ud.string(forKey: "nickName")]
        
        AF.request(base_url + "/users/register",
                   method: .post,
        parameters: params,
                   headers: nil)
        .responseDecodable(of: Login_kakao.self){ response in
            
            switch response.result {
            case.success(let response):
                if response.isSuccess {
                    //code 저장
                    print("post 성공")
                    ud.set(response.code, forKey: "code")
                    ud.set(response.result[0].userID, forKey: "userId")
                    ud.set(response.result[0].jwt, forKey: "jwt")
                }
                print("post 성공")
//                viewController.didSuccess_ovalue(response)
            case.failure(let error):
                print("오류 \(error.localizedDescription)")
            }
            
        }
        
    }

    
  
}

