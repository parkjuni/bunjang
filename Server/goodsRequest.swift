//
//  goodsRequest.swift
//  bunjang
//
//  Created by JUNI on 2022/09/26.
//

import Foundation
import Alamofire

//jwt토큰 값 카카오 로그인 후 user default로 받아서 추가하기
    let headers: HTTPHeaders = [
        "X-ACCESS-TOKEN": String(ud.string(forKey: "jwt")!)
//        "X-ACCESS-TOKEN": "abcdddd"

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
    
    
    // 상품 디테일. 
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
                          print(base_url + "/goods/detail/" + goodsId)
                      }
                      
                  }
        
        }
    
    // 브랜드 디테일
    func brandDetail(_ viewController : GDViewController, brandId : String){  /// 뷰 추가 후 수정하기

//        let brandId :String = String(ud.integer(forKey: "brandId"))

            AF.request(base_url + "/goods/brand/" + brandId,
                       method: .get,
                       headers: headers)
            .responseDecodable(of: Brandgoods.self) { response in
                
                      switch response.result {
                      case.success(let response):
                          print("성공")
                          print(brandId)
                          /// 뷰 추가 후 수정하기
                          viewController.didSuccess_brand(response)
                      case.failure(let error):
                          print("브랜드 디테일 오류 \(error.localizedDescription)")
                      }
                      
                  }
        
        }
    
    
    
    
    // 카테고리 디테일
    func cateDetail(_ viewController : CaDViewController, cateId : String){   /// 뷰 추가 후 수정하기

        let categoryId :String = String(ud.integer(forKey: "menu_catedId"))

            AF.request(base_url + "/goods/category/" + categoryId,
                       method: .get,
                       headers: headers)
            .responseDecodable(of: Brandgoods.self) { response in
                
                      switch response.result {
                      case.success(let response):
                          print("성공")
                          /// 뷰 추가 후 수정하기 
                          viewController.didSuccess_cate(response)
                      case.failure(let error):
                          print("카테고리 디테일 오류 \(error.localizedDescription)")
                      }
                      
                  }
        
        }
    
    
    //검색뷰 - 추천 브랜드 리스트
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
    
    
    
    
    
    //검색뷰 - 인기 카테고리 리스트
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
    
    
    // 브랜드 리스트
    func Brands_list(_ viewController : brandListViewController){
        
               
            AF.request(base_url + "/goods/brand-list",
                       method: .get,
                       headers: headers)
            .responseDecodable(of: brand.self) { response in
                
                      switch response.result {
                      case.success(let response):
                          
                          print("성공")
                          viewController.didSuccess_brandList(response)
                      case.failure(let error):
                          print("오류 \(error.localizedDescription)")
                      }
                      
                  }
        
        }
    
    
}

