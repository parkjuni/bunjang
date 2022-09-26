//
//  goodsRequest.swift
//  bunjang
//
//  Created by JUNI on 2022/09/26.
//

import Foundation
import Alamofire


let headers: HTTPHeaders = [
    "X-ACCESS-TOKEN": "eyJ0eXBlIjoiand0IiwiYWxnIjoiSFMyNTYifQ.eyJ1c2VySWR4Ijo2LCJpYXQiOjE2NjQxODIyNjAsImV4cCI6MTY2NTY1MzQ4OX0.LaMlzDJcrr72DSz1GfV58rj7EvRsccUy90maACyjwjI"
]

class goods{

    //브랜드 리스트 불러오기
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
    
}

