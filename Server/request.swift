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
    
    //카카오로 회원가입
    func join(_ viewController : SetNicknameViewController){
        
        let params = [  "token" : ud.string(forKey: "token"),
                        "nickName" : ud.string(forKey: "nickName")]
        
        
        AF.request(base_url + "/users/register",
                   method: .post,
        parameters: params,
                   headers: nil)
        .responseDecodable(of: join_kakao.self){ response in
            
            switch response.result {
            case.success(let response):
                
                print("post 성공")
//                viewController.didSuccess_ovalue(response)
            case.failure(let error):
                print("오류 \(error.localizedDescription)")
            }
            
            
            
            
        }
        
    }
}
