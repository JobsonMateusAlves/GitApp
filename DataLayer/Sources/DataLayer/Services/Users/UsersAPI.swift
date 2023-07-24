//
//  File.swift
//  
//
//  Created by Jobson Mateus on 22/07/23.
//

import Foundation
import Network

enum UsersAPI {
    case fetchAll
}

extension UsersAPI: API {
    var url: String {
        "https://api.github.com/users"
    }
    
    var method: HTTPMethod {
        .GET
    }
    
    var data: Codable? {
        nil
    }
    
    var parameters: [String : Any]? {
        nil
    }
    
    var headers: [String : String]? {
        nil
    }
}
