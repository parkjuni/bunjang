//
//  goodsRequest.swift
//  bunjang
//
//  Created by JUNI on 2022/09/26.
//

import Foundation
import Alamofire

//jwt토큰 값 카카오 로그인 후 user default로 받아서 추가하기
//let jwt = String(ud.string(forKey: "jwt")!)
let headers: HTTPHeaders = [
    "X-ACCESS-TOKEN": "eyJ0eXBlIjoiand0IiwiYWxnIjoiSFMyNTYifQ.eyJ1c2VySWR4Ijo2LCJpYXQiOjE2NjQxODIyNjAsImV4cCI6MTY2NTY1MzQ4OX0.LaMlzDJcrr72DSz1GfV58rj7EvRsccUy90maACyjwjI"

//    "X-ACCESS-TOKEN": jwt
    
]

class goods{

    //메뉴 - 브랜드 리스트
    func Brands(_ viewController : Menu_brandViewController){
        
               
            AF.request(base_url + "/goods/brand-list",
                       method: .get,
                       headers: headers)
            .responseDecodable(of: brand.self) { response in
                
                      switch response.result {
                      case.success(let response):
                          
                          print("성공")
                          viewController.didSuccess_brand(response)
                      case.failure(let error):
                          print("오류 \(error.localizedDescription)")
                      }
                      
                  }
        
        }
    
    //메뉴 - 카테고리 리스트
    func Category(_ viewController : Menu_cateViewController){
        
               
            AF.request(base_url + "/goods/category-list",
                       method: .get,
                       headers: headers)
            .responseDecodable(of: category.self) { response in
                
                      switch response.result {
                      case.success(let response):
                          print("성공")
                          viewController.didSuccess_category(response)
                      case.failure(let error):
                          print("오류 \(error.localizedDescription)")
                      }
                      
                  }
        
        }
    //홈 - 상품 리스트
    func homeList(_ viewController : homeGoodsViewController){
        
               
            AF.request(base_url + "/goods/home",
                       method: .get,
                       headers: headers)
            .responseDecodable(of: homelist.self) { response in
                
                      switch response.result {
                      case.success(let response):
                          print("성공")
                          viewController.didSuccess_homelist(response)
                      case.failure(let error):
                          print("오류 \(error.localizedDescription)")
                      }
                      
                  }
        
        }
    
    
    // 상품 디테일
    func goodsDetail(_ viewController : goodsDetailViewController){
        let goodsId :String = String(ud.integer(forKey: "goodId"))

            AF.request(base_url + "/goods/detail/" + goodsId,
                       method: .get,
                       headers: headers)
            .responseDecodable(of: goods_Detail.self) { response in
                
                      switch response.result {
                      case.success(let response):
                          print("성공")
                          viewController.didSuccess_goodsDe(response)
                      case.failure(let error):
                          print("굿즈디테일 오류 \(error.localizedDescription)")
                      }
                      
                  }
        
        }
    
    
    //검색 - 브랜드 리스트
    func recoBrands(_ viewController : SearchViewController){
        
               
            AF.request(base_url + "/goods/brand-list",
                       method: .get,
                       headers: headers)
            .responseDecodable(of: brand.self) { response in
                
                      switch response.result {
                      case.success(let response):
                          
                          print("성공")
                          viewController.didSuccess_recobrand(response)
                      case.failure(let error):
                          print("오류 \(error.localizedDescription)")
                      }
                      
                  }
        
        }
    
    
    //검색 - 카테고리 리스트
    func popuCategory(_ viewController : SearchViewController){
        
               
            AF.request(base_url + "/goods/category-list",
                       method: .get,
                       headers: headers)
            .responseDecodable(of: category.self) { response in
                
                      switch response.result {
                      case.success(let response):
                          print("성공")
                          viewController.didSuccess_poca(response)
                      case.failure(let error):
                          print("오류 \(error.localizedDescription)")
                      }
                      
                  }
        
        }
    
    
    
}

