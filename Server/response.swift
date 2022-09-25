//
//  response.swift
//  bunjang
//
//  Created by JUNI on 2022/09/22.
//

import Foundation

/////////////////카카오 회원가입, 로그인
//struct Login_kakao : Decodable {
//  
//        let isSuccess: Bool?
//    let code: Int?
//    let message: String?
//    let result: Result
//    }
//
//    struct Result: Decodable {
//        let userId: Int?
//        let jwt: String?
//    }


struct Login_kakao: Decodable {
    let isSuccess: Bool
    
    let code: Int?
    let message: String
    let result: [Result]
}

// MARK: - Result
struct Result: Decodable {
    let userID: Int
    let jwt: String

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case jwt
    }
    
}



///////////////// 카카오 로그인
//struct Login_kakao : Decodable {
//
//        var isSuccess: Bool?
//        var code: Int?
//        var message: String?
//        var result: [Result]
//    }

//    struct Result: Decodable {
//        var userId: Int?
//        var jwt: String?
//    }

