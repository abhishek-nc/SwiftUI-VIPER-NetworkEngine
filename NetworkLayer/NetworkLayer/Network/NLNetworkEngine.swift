//
//  NENetworkEngine.swift
//  NetworkLayer
//
//  Created by Abhishek Chandrashekar on 08/05/20.
//  Copyright © 2020 ANC. All rights reserved.
//

import Foundation
import Alamofire

typealias NetworkResponse<R:Decodable> = Result<R,NLError>
typealias NetworkResponseCompletion<R:Decodable> = (NetworkResponse<R>)->Void

protocol NetworkCordinator {
    static var session : Alamofire.Session { get }
    static var backgroundsession : Alamofire.Session { get }
}

class NetworkEngine : NetworkCordinator {
        
    static  let session = Session.default
    static  var backgroundsession : Session {
        Session(configuration: .background(withIdentifier: "com.abhishek.ne"))
    }
    
    
    static let sharedInstance = NetworkEngine()
    
    private init() {
    }
    
    func execute<R:Decodable>(request: NERequest, onResponse:@escaping NetworkResponseCompletion<R>) {
        let dataRequest = NetworkEngine.session.request(request)
        dataRequest.responseJSON { (response) in
            self.parseResultResponse(endpoint: request, dataResponse: response, completion: onResponse)
        }
    }
    
}


extension NetworkEngine {
    
    func parseResultResponse<R: Decodable>(endpoint : NERequest, dataResponse: AFDataResponse<Any>,
                                           completion: NetworkResponseCompletion<R>) {
        switch dataResponse.result {
        case let .success(JSON):
                do {
                    let jsonData = try JSONSerialization.data(withJSONObject: JSON, options: .prettyPrinted)
                    let value = try JSONDecoder().decode(R.self, from: jsonData)
                    completion(Result.success(value))
                    return
                }catch{
                    completion(Result.failure(NLError.somethingWentWrong))
                    return
                }
        case  .failure(_):
            completion(Result.failure(NLError.somethingWentWrong))
            
            
            return
        }
    }
}
