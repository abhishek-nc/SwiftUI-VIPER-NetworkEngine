//
//  NERequest.swift
//  NetworkLayer
//
//  Created by Abhishek Chandrashekar on 08/05/20.
//  Copyright © 2020 ANC. All rights reserved.
//

import Foundation
import Alamofire

typealias HeaderParams = HTTPHeaders
typealias HeaderParam = HTTPHeader
typealias APIParams = [String: Any]
typealias EncodingType = NEEncoding
typealias HttpMethod = Alamofire.HTTPMethod

public enum NEEncoding {
    case urlEncoding, jsonEncoding, queryString, arrayEncoding
}

protocol NERequest : URLRequestConvertible {
    var baseURL: String? { get } // base url of the request
    var path: String? { get } // path component of the url
    var method: HttpMethod? { get } // HTTP Method (e.g. GET, POST etc)
    var headers: HeaderParams { get } // Header parameters
    var parameters: APIParams? { get } // Request Body/ Query Params
    var encoding: EncodingType? { get } // URL encoding for the request
}


extension NERequest {
    var baseURL: String? { return "" }
    var path: String? { return nil }
    var method: Alamofire.HTTPMethod? { return .get }
    var headers: HeaderParams {
        return [HTTPHeader.authorization(username: "Abhishek", password: "Test")]
    }
    var parameters: APIParams? { return nil }
    var encoding: EncodingType? { return .jsonEncoding }
    
    
    func asURLRequest() throws -> URLRequest {
        guard let urlString = baseURL else {
            throw AFError.parameterEncodingFailed(reason: .missingURL)
        }
        guard let encodedUrlString = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {
            throw AFError.parameterEncodingFailed(reason: .missingURL)
        }
        var resourceURL = try encodedUrlString.asURL()
        
        if let pathComponent = path {
            resourceURL = resourceURL.appendingPathComponent(pathComponent)
        }
        
        let urlRequest = try URLRequest(url: resourceURL, method: method!, headers: headers)
        return try URLEncoding.default.encode(urlRequest, with: parameters)
    }
    
    //add common header
    
}


