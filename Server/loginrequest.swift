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
    

    // 신규회원 카카오로 회원가입 - 토큰, 닉네임 바디로 보냄 
    func join(_ viewController : SetNicknameViewController) {

     
        let comment = register(token: ud.string(forKey: "token")!, nickName: ud.string(forKey: "nickName")!)

        guard let uploadData = try? JSONEncoder().encode(comment)
        else {return}

        // URL 객체 정의
        let url = URL(string: base_url+"/users/register")

        // URLRequest 객체를 정의
        var request = URLRequest(url: url!)
        request.httpMethod = "POST"

        // HTTP 메시지 헤더
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")


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

                            switch jsonObject["code"] as! Int {
                                case 1000: //로그인 성공
                                print("로그인 성공 ")

                                viewController.didSuccess_join()
                                                            
                                ud.set(data!["userId"], forKey: "userId")
                                ud.set(data!["jwt"], forKey: "jwt")
                                
                                case 2012:
                                    print("access token 없음")
                               
                                case 4000:
                                    print("DB 에러")
                                case 4004:
                                    print("카카오 통신 실패")
                                default :
                                    print("에러")
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

  


    
    
//카카오 자동로그인 - jwt는 헤더로, userId는 바디로 보낸다 - user default 값 사용

    func auto_loin(_ viewController : OnboardingViewController) {

     
        let comment = autologin(userId: ud.integer(forKey: "userId"))

        guard let uploadData = try? JSONEncoder().encode(comment)
        else {return}

        // URL 객체 정의
        let url = URL(string: base_url+"/users/auto-login")

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
                        
                      //자동 로그인 성공 시 결과 코드 1000번
                        if jsonObject["code"] as! Int == 1000 {
                            viewController.didSuccess_autoLogin()
                        }
                        print(jsonObject)
                        
                        switch jsonObject["code"] as! Int {
                            case 1000: //로그인 성공
                                viewController.didSuccess_autoLogin()
                            case 2001:
                                print("jwt 없음")
                            case 2009: // 신규회원 등록
                                print("바디 없음")
                            case 2017:
                                print("존재하지 않는 유저")
                            case 3101:
                                print("jwt토큰 오류")
                            case 3102:
                                print("user id 없음")
                            case 4000:
                                print("DB 에러")
                            default :
                                print("에러")
                                }
                        
                        
                        
                    }catch let e as NSError{
                        print("An error has occured while parsing JSONObject: \(e.localizedDescription)")
                    }

                }
          
        }
        // POST 전송
        task.resume()
    }



    //카카오 로그인 - kakao access token 바디로 보냄
    func Login(_ viewController : OnboardingViewController) {

     
        let comment = login(token: ud.string(forKey: "token")!)

        guard let uploadData = try? JSONEncoder().encode(comment)
        else {return}

        // URL 객체 정의
        let url = URL(string: base_url+"/users/login")

        // URLRequest 객체를 정의
        var request = URLRequest(url: url!)
        request.httpMethod = "POST"

        // HTTP 메시지 헤더
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//        request.setValue(ud.string(forKey: "jwt"), forHTTPHeaderField: "X-ACCESS-TOKEN")


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
                        let object = try JSONSerialization.jsonObject(with: data!, options: []) as? [String : Any]
                        
                        guard let jsonObject = object else {return}
                        
                        let data = object!["result"] as? [String : Any]
                        print(jsonObject)
                            switch jsonObject["code"] as! Int {
                                case 1000: //로그인 성공
                                print("!!!!!!!!!!!!!!!!!로그인 성공 ")
                                    viewController.didSuccess_Login()
                                ud.set(data!["userId"], forKey: "userId")
                                ud.set(data!["jwt"], forKey: "jwt")

                                case 2012:
                                    print("access token 없음")
                                
                                case 2017: // 신규회원 등록
                                    viewController.register_user()
                                print("존재하지 않는 유저")
                                case 4000:
                                    print("DB 에러")
                                case 4004:
                                    print("카카오 통신 실패")
                                default :
                                    print("에러")
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

    
    
  
}



struct autologin: Codable {
    let userId: Int
//    let jwt: String
    
}


struct login: Codable {
    let token: String
//    let jwt: String
    
}

struct register: Codable {
    let token: String
    let nickName: String
    
}
