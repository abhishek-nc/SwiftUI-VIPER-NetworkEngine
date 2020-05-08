//
//  ActivityRequest.swift
//  NetworkLayer
//
//  Created by Abhishek Chandrashekar on 08/05/20.
//  Copyright © 2020 ANC. All rights reserved.
//

import Foundation

enum ActivityRequest : NERequest {
    case fetchActivities
    
    var baseURL: String? {
        return "https://api.npoint.io"
    }
    var path: String? {
        return "/42429d61ede07671d83c"
    }
    var method: HttpMethod {
        return .get
    }
    
    var headers: HeaderParams {
        [HeaderParam(name: "Test", value: "")]
    }
    
    var parameters: APIParams? {
        return nil
    }
    var encoding: EncodingType? {
        return .urlEncoding
    }
}
