//
//  IApiClient.swift
//  mvpTutorial
//
//  Created by Aung Ko Ko on 06/10/2019.
//  Copyright © 2019 Phone Zaw Myint. All rights reserved.
//

import Foundation
import RxSwift
protocol IApiClient {
    // for mvp
    func getAllCategories(success: @escaping([CategoryVO])-> Void,fail: @escaping(String)-> Void)
    func getAllCats(success: @escaping([CatVO])-> Void, fail: @escaping(String)-> Void)
    
    // for Rx swift Observable
    func getAllCategories2() -> Observable<GetAllPetCategoryResponse>
    func getAllCats2() -> Observable<GetAllCatsResponse>
}
