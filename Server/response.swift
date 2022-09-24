//
//  response.swift
//  bunjang
//
//  Created by JUNI on 2022/09/22.
//

import Foundation

/////////////////카카오 회원가입 response
struct join_kakao : Decodable {
  
        var isSuccess: Bool?
        var code: Int?
        var message: String?
        var result: [Result]
    }

    struct Result: Decodable {
        var userId: Int?
        var jwt: String?
    }


/////////////////
