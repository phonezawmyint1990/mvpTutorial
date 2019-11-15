//
//  BaseApiClient.swift
//  mvpTutorial
//
//  Created by Aung Ko Ko on 06/10/2019.
//  Copyright © 2019 Phone Zaw Myint. All rights reserved.
//

import Foundation
import Alamofire
import RxCocoa
import RxSwift

open class BaseApiClient{
    fileprivate let BASE_URL = "https://2edd5285-2da8-4bcd-997c-0eb2c4e77da4.mock.pstmn.io/"
    
    func requestApiWithoutHeaders(url:String,
                                  method: HTTPMethod,
                                  params: Parameters,
                                  success: @escaping(Data)-> Void,
                                  fail: @escaping(String)-> Void
        ){
        
        Alamofire.request(url, method: method, parameters: params, headers: [:]).responseJSON{
            response in
            switch response.result {
            case .success:
                success(response.data!)
            case .failure(let error):
                debugPrint(error.localizedDescription)
                fail(error.localizedDescription)
            }
        }
        
    }
    
    func requestApiWithoutHeaders2<T>(url:String,
                                   method:HTTPMethod,
                                   params: Parameters,
                                   value: T.Type
        ) -> Observable<T> where T : Codable{
        
        let headers: HTTPHeaders = [
            "Authorization" : ""
        ]
        let decoder = JSONDecoder()
        return  Observable<T>.create{ (observer) -> Disposable in
            let request = Alamofire.request(self.BASE_URL + url , method: method, parameters: params, headers: headers).responseJSON{ response in
                switch response.result {
                case .success :
                    if 200 ... 299 ~= response.response?.statusCode ?? 500 {
                        let data = response.data!
                        let returndata  = try! decoder.decode(T.self, from: data)

                        observer.onNext(returndata)
                        observer.onCompleted()

                    }else{
                        let error = response.data!
                        let returndata  = try! decoder.decode(ErrorResponse.self, from: error)
                        observer.onError(returndata as! Error)
                    }
                case .failure(let err):
                    observer.onError(err)
                }
            }
            
            return Disposables.create(with: {
                request.cancel()
            })
        }
        
    }
    
    func requestApiWithHeaders(url:String,
                               method: HTTPMethod,
                               params: Parameters,
                               success: @escaping(Data)-> Void,
                               fail: @escaping(String)-> Void){
        let headers: HTTPHeaders = [SharedConstants.HEADER_KEY: "Bearer" + SharedConstants.HEADER_VALUE]
        
        Alamofire.request(url, method: method, parameters: params, headers: headers).responseJSON{
            response in
            switch response.result {
            case .success:
                success(response.data!)
            case .failure(let error):
                debugPrint(error.localizedDescription)
                fail(error.localizedDescription)
            }
        }
    }
    
    func genetateUrl(route:String)-> String{
        return BASE_URL + route
    }
}
