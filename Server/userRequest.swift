//
//  userRequest.swift
//  bunjang
//
//  Created by JUNI on 2022/09/28.
//

import Foundation
import Alamofire

//jwt토큰 값 카카오 로그인 후 user default로 받아서 추가하기
//let jwt = String(ud.string(forKey: "jwt")!)


class userRequest{

    //메뉴 - 브랜드 리스트
    func users(_ viewController : MyViewController){
        
               
            AF.request(base_url + "/users",
                       method: .get,
                       headers: headers)
            .responseDecodable(of: Users.self) { response in
                
                      switch response.result {
                      case.success(let response):
                          
                          print("성공")
                          viewController.didSuccess_users(response)
                      case.failure(let error):
                          print("오류 \(error.localizedDescription)")
                      }
                      
                  }
        
        }
    
   
    
}

