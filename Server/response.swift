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
//    let result: [Result]
}

// MARK: - Result
//struct Result: Decodable {
//    let userID: Int
//    let jwt: String
//
//    enum CodingKeys: String, CodingKey {
//        case userID = "userId"
//        case jwt
//    }
//
//}


//////브랜드 리스트
// MARK: - Welcome
struct brand: Decodable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: [brandResult]
}

// MARK: - Result
struct brandResult: Decodable {
    let brandId: Int
    let brandName, brandEngName, imgUrl: String
    let counting: Int
    let isLike: String


}

//////카테고리  리스트
struct category: Decodable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: [cateResult]
}

// MARK: - Result
struct cateResult: Decodable {
    let categoryId: Int
    let categoryName: String

}
