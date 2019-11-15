//
//  PetListPresenterImpl.swift
//  mvpTutorial
//
//  Created by Aung Ko Ko on 06/10/2019.
//  Copyright © 2019 Phone Zaw Myint. All rights reserved.
//

import Foundation
import RxSwift
class PetListPresenterImpl: BasePresenter {
    var mView: PetListView? = nil
    var categoryList: [CategoryVO] = []
    var catList:[CatVO] = []
    let bag = DisposeBag()
}
extension PetListPresenterImpl : PetListPresenter{
    func onUIReady() {
        //        RemoteModelImpl.shared.getAllCategoriesFromApi(success: { (data) in
        //            self.categoryList = data
        //            self.mView?.displayCategories(data: data)
        //        }) { (error) in
        //            self.mView?.displayErrot(error: error)
        //        }
        
//        RemoteModelImpl.shared.getAllCatsFromApi(success: { (data) in
//            self.catList = data
//            self.mView?.displayCatsList(data: data)
//        }) { (err) in
//            self.mView?.displayErrot(error: err)
//        }
        
        let categoryObs = RemoteModelImpl.shared.getAllCatCtaeegory2()
        categoryObs
            .subscribeOn(ConcurrentDispatchQueueScheduler.init(queue: DispatchQueue.global()))
            .subscribe(onNext:{ reposne in
                self.categoryList = reposne.data
                self.mView?.displayCategories(data: self.categoryList)
                
            },onError:{ error in
                
                self.mView?.displayErrot(error: error.localizedDescription)
                
            }).disposed(by: bag)
        
        let catObs = RemoteModelImpl.shared.getAllCat2()
        catObs
            .subscribeOn(ConcurrentDispatchQueueScheduler.init(queue: DispatchQueue.global()))
            .subscribe(onNext: {response in
                self.catList =  response.data
                self.mView?.displayCatsList(data: self.catList)
            },onError: {error in
                
                self.mView?.displayErrot(error: error.localizedDescription)
                
            }).disposed(by: bag)
        
    }
    
    func attachView(view: PetListView) {
        mView = view
    }
    
    
    
    
}
