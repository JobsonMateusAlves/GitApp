//
//  UsersAPI.swift
//  
//
//  Created by Jobson Mateus on 22/07/23.
//

import Foundation
import Network

enum UsersAPI {
    case fetchAll(_ since: Int?)
    case search(searchText: String, page: Int)
}

extension UsersAPI: API {
    var url: String {
        let baseURL: String = "https://api.github.com"
        switch self {
        case .fetchAll:
            return "\(baseURL)/users"
            
        case .search(let searchText, let page):
            return "\(baseURL)/search/users?q=\(searchText)&page=\(page)"
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
        case .fetchAll(let since):
            if let since = since {
                return ["since": since]
            }
            return nil
        case .search(let searchText, let page):
            return [
                "q": searchText,
                "page": page
            ]
        }
    }
    
    var headers: [String : String]? {
        nil
    }
}
