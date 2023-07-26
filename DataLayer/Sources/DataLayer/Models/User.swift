//
//  User.swift
//  
//
//  Created by Jobson Mateus on 22/07/23.
//

import Foundation
import DomainLayer

struct User: Codable {
    public let login: String
    public let id: Int
    public let avatarUrl: String
    public let htmlUrl: String
    
    enum CodingKeys: String, CodingKey {
        case login
        case id
        case avatarUrl = "avatar_url"
        case htmlUrl = "html_url"
    }
    
    public init(
        login: String,
        id: Int,
        avatarUrl: String,
        htmlUrl: String
    ){
        self.login = login
        self.id = id
        self.avatarUrl = avatarUrl
        self.htmlUrl = htmlUrl
    }
}


extension User: DataModel {
    typealias DomainModel = DomainLayer.User
    
    func toDomain() -> DomainLayer.User {
        return DomainLayer.User(
            login: login,
            id: id,
            avatarUrl: avatarUrl,
            htmlUrl: htmlUrl
        )
    }
    
    func from(domain: DomainLayer.User) -> User {
        return User(
            login: login,
            id: id,
            avatarUrl: avatarUrl,
            htmlUrl: htmlUrl
        )
    }
}
