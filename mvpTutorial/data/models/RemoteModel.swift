//
//  RemoteModel.swift
//  mvpTutorial
//
//  Created by Aung Ko Ko on 06/10/2019.
//  Copyright © 2019 Phone Zaw Myint. All rights reserved.
//

import Foundation
import RxSwift
protocol RemoteModel {
    func getAllCategoriesFromApi(
        success: @escaping([CategoryVO]) -> Void,
        fail: @escaping(String) -> Void)
    
    func getAllCatsFromApi(success: @escaping([CatVO])->Void,
                           fail: @escaping(String)-> Void)
    
    func getAllCatCtaeegory2() -> Observable<GetAllPetCategoryResponse>
}
