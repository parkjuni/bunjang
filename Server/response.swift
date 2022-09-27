//
//  response.swift
//  bunjang
//
//  Created by JUNI on 2022/09/22.
//

import Foundation

/////////////////카카오 회원가입, 로그인
struct Login_kakao: Decodable {
    let isSuccess: Bool
    
    let code: Int?
    let message: String
    let result: [loginResult]
}
struct loginResult: Decodable {
    let userId: Int
    let jwt: String

}



/////////////////카카오 자동 로그인
struct auto_login: Decodable {
    let isSuccess: Bool
    let code: Int?
    let message: String
    let result: String
}


//////브랜드 리스트
struct brand: Decodable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: [brandResult]
}
struct brandResult: Decodable {
    let brandId: Int
    let brandName, brandEngName, imgUrl: String
    let counting: Int
    let isLike: String


}


//////브랜드 디테일
struct brand_Detail: Decodable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: [brandDeResult]
}
struct brandDeResult: Decodable {
    let goodsId: Int
    let title: String
    let price: Int
    let likes: Int
    let canBungaePay: String
    let imgUrl: String
    let isLike: String
    let status: String


}


//////카테고리  리스트
struct category: Decodable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: [cateResult]
}
struct cateResult: Decodable {
        let categoryId : Int
        let categoryName : String

}

//////카테고리  디테일
struct category_Detail: Decodable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: [cateDeResult]
}
struct cateDeResult: Decodable {
    let goodsId: Int
    let title: String
    let price: Int
    let likes: Int
    let canBungaePay: String
    let imgUrl: String
    let isLike: String
    let status: String

}




//////홈화면 상품리스트
struct homelist: Decodable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: [homegoods]
}
struct homegoods: Decodable {
    let goodsId: Int
    let title: String
    let price, likes: Int
    let canBungaePay, imgUrl, isLike, status: String
}

/// 상품 디테일 뷰
struct goods_Detail: Decodable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: [Detail]
}

struct Detail: Decodable {
    let goodsId: Int
    let title, content, seller: String
    let price, categoryId: Int
    let isFreeShipping: String
    let numberOfGoods: Int
    let isUserGoods, canExchange, isAdvertising, canBungaePay: String
    let region, status: String
    let goodsImgList: [GoodsImgList]
}

struct GoodsImgList: Decodable {
    let imgUrl: String
}

//////user 정보

struct Users: Decodable {
    let isSuccess: Bool!
    let code: Int!
    let message: String!
    let result: [UserResult]
}

struct UserResult: Decodable {
    let nickName: String!
    let content: String!
    let star: Float!
    let transaction: Int!
    let follower: Int!
    let following: Int!
    let gapCreatedAt: Int!
    


}

