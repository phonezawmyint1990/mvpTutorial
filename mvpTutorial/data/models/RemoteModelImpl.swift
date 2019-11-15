//
//  RemoteModelImpl.swift
//  mvpTutorial
//
//  Created by Aung Ko Ko on 06/10/2019.
//  Copyright © 2019 Phone Zaw Myint. All rights reserved.
//

import Foundation
import RxSwift
class RemoteModelImpl: BaseModel {
    static let shared = RemoteModelImpl()
    private override init() {}
}

extension RemoteModelImpl: RemoteModel{
    
    
    func getAllCatCtaeegory2() -> Observable<GetAllPetCategoryResponse> {
        
        return SharedApiClient.shared.getAllCategories2()
    }
    
    func getAllCat2() -> Observable<GetAllCatsResponse>{
        return SharedApiClient.shared.getAllCats2()
    }
    
    func getAllCategoriesFromApi(success: @escaping ([CategoryVO]) -> Void, fail: @escaping (String) -> Void) {
        SharedApiClient.shared.getAllCategories(success: { (data) in
            success(data)
        }) { (err) in
            fail(err)
        }
    }
    
    func getAllCatsFromApi(success: @escaping ([CatVO]) -> Void, fail: @escaping (String) -> Void) {
        SharedApiClient.shared.getAllCats(success: { (data) in
            success(data)
        }) { (err) in
            fail(err)
        }
    }
}
