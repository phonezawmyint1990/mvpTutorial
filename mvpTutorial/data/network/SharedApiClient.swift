//
//  SharedApiClient.swift
//  mvpTutorial
//
//  Created by Aung Ko Ko on 06/10/2019.
//  Copyright © 2019 Phone Zaw Myint. All rights reserved.
//

import Foundation
import RxSwift
class SharedApiClient: BaseApiClient {
    static let shared = SharedApiClient()
    private override init() {}
}

extension SharedApiClient : IApiClient{
    // mvvm rxswift
    func getAllCats2() -> Observable<GetAllCatsResponse> {
        return self.requestApiWithoutHeaders2(url: API_GET_ALL_CATS, method: .post, params: ["category_id":1], value: GetAllCatsResponse.self)
    }
    
    
    // mvvm rxswift
    func getAllCategories2() -> Observable<GetAllPetCategoryResponse> {
        return self.requestApiWithoutHeaders2(url: API_GET_ALL_CATEGORIES
            , method: .get, params: [:], value: GetAllPetCategoryResponse.self)
    }
    
    // mvp
    func getAllCategories(success: @escaping ([CategoryVO]) -> Void, fail: @escaping (String) -> Void) {
        self.requestApiWithHeaders(url:genetateUrl(route: API_GET_ALL_CATEGORIES) , method: .get, params: [:], success: { (response) in
            let apiResponse = try! JSONDecoder().decode(GetAllPetCategoryResponse.self,from: response)
            print(apiResponse.data[0].name)
            success(apiResponse.data)
        }) { (error) in
            fail(error)
        }
    }
    
    // mvp
    func getAllCats(success: @escaping ([CatVO]) -> Void, fail: @escaping (String) -> Void) {
        self.requestApiWithHeaders(url: genetateUrl(route: API_GET_ALL_CATS), method: .post, params: ["category_id":1], success: { (response) in
            let apiResponse = try! JSONDecoder().decode(GetAllCatsResponse.self, from: response)
            print("apiResponse",apiResponse.data[0].age)
            success(apiResponse.data)
        }) { (error) in
            fail(error)
        }
        
    }
    
    
}
