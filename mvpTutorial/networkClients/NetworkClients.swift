//
//  NetworkClients.swift
//  mvpTutorial
//
//  Created by Aung Ko Ko on 06/10/2019.
//  Copyright © 2019 Phone Zaw Myint. All rights reserved.
//

import Foundation
import Alamofire

class NetworkClients {
    private let baseUrl: String
    private init(baseUrl: String){
        self.baseUrl = baseUrl
    }
    
    private static var sharedNetworkClient: NetworkClients = {
        let url = SharedConstants.BASE_URL
        return NetworkClients(baseUrl: url)
    }()
    
    class func shared()-> NetworkClients {
        return sharedNetworkClient
    }
    
    public func getDta(success:@escaping(Any) -> Void,failure:@escaping(String)-> Void){
        Alamofire.request(baseUrl).responseData { (response) in
            switch response.result {
            case .success:
                guard let data = response.result.value else {return}
                success(data)
                break
            case .failure(let err):
                failure(err.localizedDescription)
                break
            }
        }
    }
}
