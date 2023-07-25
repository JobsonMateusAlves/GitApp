//
//  User.swift
//  
//
//  Created by Jobson Mateus on 22/07/23.
//

import Foundation
import DomainLayer

struct User: Codable {
    let id: Int
}

extension User: DataModel {
    typealias DomainModel = DomainLayer.User
    
    func toDomain() -> DomainLayer.User {
        return DomainLayer.User(id: self.id)
    }
    
    func from(domain: DomainLayer.User) -> User {
        return User(
            id: domain.id
        )
    }
}
