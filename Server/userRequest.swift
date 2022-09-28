//
//  userRequest.swift
//  bunjang
//
//  Created by JUNI on 2022/09/28.
//

import Foundation
import Alamofire

//jwt토큰 값 카카오 로그인 후 user default로 받아서 추가하기 지금은 전역
//let jwt = String(ud.string(forKey: "jwt")!)


class userRequest{

    //마이 뷰 - 유저 정보 
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
    
   
    //검색 뷰 - 요즘 많이 찾는 검색어
    func searchPopular(_ viewController : SearchViewController){
        
               
            AF.request(base_url + "/search/popular",
                       method: .get,
                       headers: headers)
            .responseDecodable(of: search_Popular.self) { response in
                
                      switch response.result {
                      case.success(let response):
                          
                          print("성공")
                          viewController.didSuccess_poSearch(response)
                      case.failure(let error):
                          print("오류 \(error.localizedDescription)")
                      }
                      
                  }
        
        }
    


//검색 뷰 - 최근 검색어
func searchRecent(_ viewController : SearchViewController){
    
           
        AF.request(base_url + "/search/recent",
                   method: .get,
                   headers: headers)
        .responseDecodable(of: search_Recent.self) { response in
            
                  switch response.result {
                  case.success(let response):
                      
                      print("성공")
                      viewController.didSuccess_searchRecent(response)
                  case.failure(let error):
                      print("오류 \(error.localizedDescription)")
                  }
                  
              }
    
    }

}

