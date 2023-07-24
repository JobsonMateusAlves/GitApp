//
//  File.swift
//  
//
//  Created by Jobson Mateus on 22/07/23.
//

import Foundation

/// HTTP Methods
public enum HTTPMethod: String {
   case GET
   case POST
   case DELETE
   case PUT
}

public protocol API {
    
    var url: String { get }
    
    var method: HTTPMethod { get }
    
    var data: Codable? { get }
    
    var parameters: [String: Any]? { get }
    
    var headers: [String: String]? { get }
}
