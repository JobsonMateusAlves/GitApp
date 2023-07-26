//
//  File.swift
//  
//
//  Created by Jobson Mateus on 26/07/23.
//

import Foundation
import DomainLayer

struct UserSearchResponse: Codable {
    public let items: [User]
    
    public init(items: [User]) {
        self.items = items
    }
}
