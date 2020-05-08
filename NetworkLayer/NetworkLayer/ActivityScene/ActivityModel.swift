//
//  ActivityModel.swift
//  NetworkLayer
//
//  Created by Abhishek Chandrashekar on 08/05/20.
//  Copyright © 2020 ANC. All rights reserved.
//

import Foundation

struct Activity: Codable {
    let what : String?
    let why : [String]?
    
    enum CodingKeys: String, CodingKey {
        
        case what = "what"
        case why = "why"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        what = try values.decodeIfPresent(String.self, forKey: .what)
        why = try values.decodeIfPresent([String].self, forKey: .why)
    }
    
}
