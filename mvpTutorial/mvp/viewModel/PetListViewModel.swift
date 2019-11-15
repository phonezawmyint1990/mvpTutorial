//
//  PetListViewModel.swift
//  mvpTutorial
//
//  Created by Aung Ko Ko on 09/11/2019.
//  Copyright © 2019 Phone Zaw Myint. All rights reserved.
//

import Foundation
import RxSwift
import RxRelay
class PetListViewModel : BaseViewModel{
    
    public var isLoadingObs: BehaviorRelay<Bool> = BehaviorRelay(value: false)
    public var _errorObs: BehaviorRelay<String?> = BehaviorRelay(value: nil)
    
    let apiService = SharedApiClient.shared
    let bag = DisposeBag()
    
    public var dataObs: PublishSubject<[CategoryVO]> = PublishSubject()
    public var catObs: PublishSubject<[CatVO]> = PublishSubject()
    
    
    override init() {}
    public func requestData(){
        
   //     self.isLoadingObs.accept(true)
        
        apiService.getAllCategories2()
        .subscribeOn(ConcurrentDispatchQueueScheduler.init(queue: DispatchQueue.global()))
            .subscribe(onNext:{response in
                self.isLoadingObs.accept(false)
                self.dataObs.onNext(response.data)
            },onError:{error in
                self.isLoadingObs.accept(false)
                self._errorObs.accept(error.localizedDescription)
            }).disposed(by: bag)
        
        
        apiService.getAllCats2()
        .subscribeOn(ConcurrentDispatchQueueScheduler.init(queue: DispatchQueue.global()))
            .subscribe(onNext:{response in
                self.isLoadingObs.accept(false)
                self.catObs.onNext(response.data)
            },onError:{error in
                self.isLoadingObs.accept(false)
                self._errorObs.accept(error.localizedDescription)
            }).disposed(by: bag)
    }
}
