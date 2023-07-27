//
//  File.swift
//  
//
//  Created by Jobson Mateus on 27/07/23.
//

import Foundation
import Network

enum ReposAPI {
    case fetchAll(user: User, page: Int)
}

extension ReposAPI: API {
    var url: String {
        let baseURL: String = "https://api.github.com"
        switch self {
        case .fetchAll(let user, _):
            return "\(baseURL)/users/\(user.login)/repos"
        }
    }
    
    var method: HTTPMethod {
        .GET
    }
    
    var data: Codable? {
        nil
    }
    
    var parameters: [String : Any]? {
        switch self {
        case .fetchAll(_, let page):
            return ["page": page]
        }
    }
    
    var headers: [String : String]? {
        nil
    }
}
