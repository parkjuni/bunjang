//
//  keywordsRequest.swift
//  bunjang
//
//  Created by JUNI on 2022/09/29.
//

import Foundation
import Alamofire

class keywords{
    
    
    //키워드 불러오기
    func key_get(_ viewController : Keyword_notiViewController){
        
//        let param = ["keyword": keyword]

            AF.request(base_url + "/keywords",
                       method: .get,
                       headers: headers)
            .responseDecodable(of: Keyword.self) { response in
                
                      switch response.result {
                      case.success(let response):
                          
                          print("성공")
                          viewController.didSuccess_getkeywords(response)
                          
                      case.failure(let error):
                          print("오류 \(error.localizedDescription)")
                      }
                      
                  }
        
        }
    
  
    

    //키워드 생성
    func key_create(_ viewController : Keyword_notiViewController, key_word : String) {

     //바디
        let comment = Keybody(keyword: key_word)

        guard let uploadData = try? JSONEncoder().encode(comment)
        else {return}

        // URL 객체 정의
        let url = URL(string: base_url+"/keywords")

        // URLRequest 객체를 정의
        var request = URLRequest(url: url!)
        request.httpMethod = "POST"

        // HTTP 메시지 헤더
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue(ud.string(forKey: "jwt"), forHTTPHeaderField: "X-ACCESS-TOKEN")


        // URLSession 객체를 통해 전송, 응답값 처리
        let task = URLSession.shared.uploadTask(with: request, from: uploadData) { (data, response, error) in
            // 서버가 응답이 없거나 통신이 실패
            if let e = error {
                NSLog("An error has occured: \(e.localizedDescription)")
                return
            }
            // 응답 처리 로직
            print("comment post success")

            DispatchQueue.main.async {
                        
                    do{
                        let object = try JSONSerialization.jsonObject(with: data!, options: []) as? NSDictionary
                        
                        guard let jsonObject = object else {return}
                        let data = object!["result"] as? [String : Any]
//                        print(jsonObject)
                            switch jsonObject["code"] as! Int {
                                case 1000: //로그인 성공
                                print("post 성공 ")

                                viewController.didSuccess_postkeywords()
//                                ud.set(data!["userId"], forKey: "userId")
//                                ud.set(data!["jwt"], forKey: "jwt")
                                
                                case 2001:
                                    print("jwt token 없음")
                               
                                case 2009:
                                    print("body 없음")
                                case 3015:
                                    print("탈퇴유저")
                                case 4000:
                                    print("DB 에러")
                                default :
                                print("error")
                                        }
                        
                    }
                
                catch let e as NSError{
                        print("An error has occured while parsing JSONObject: \(e.localizedDescription)")
                    }

                }
          
        }
        // POST 전송
        task.resume()
    }

    
    
    //키워드 삭제
//    func key_del(_ viewController : Keyword_notiViewController){
//
//
//            AF.request(base_url + "/goods/brand-list",
//                       method: .get,
//                       headers: headers)
//            .responseDecodable(of: brand.self) { response in
//
//                      switch response.result {
//                      case.success(let response):
//
//                          print("성공")
//                          viewController.didSuccess_brand(response)
//                      case.failure(let error):
//                          print("오류 \(error.localizedDescription)")
//                      }
//
//                  }


}


struct Keybody: Codable {
    let keyword: String
    }
