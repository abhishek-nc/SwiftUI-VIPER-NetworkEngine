//
//  ActivityServiceWorker.swift
//  NetworkLayer
//
//  Created by Abhishek Chandrashekar on 08/05/20.
//  Copyright © 2020 ANC. All rights reserved.
//

import Foundation

struct ActivityServiceWorker {
    
    typealias ActivityResponse = (Activity?,NLError?)->Void
    
    static func fetchActivities(onFetch: @escaping ActivityResponse)  {
        NetworkEngine.sharedInstance.execute(request: ActivityRequest.fetchActivities) { (result: NetworkResponse<Activity>) in
            switch result {
            case let .success(item):
                return onFetch(item,nil)
            case let .failure(error):
                 return onFetch(nil,error)
            }
         }
    }
}
