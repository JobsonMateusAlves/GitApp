//
//  User.swift
//  
//
//  Created by Jobson Mateus on 22/07/23.
//

import Foundation

public struct User {
    public let login: String
    public let id: Int
    public let avatarUrl: String
    public let htmlUrl: String
    
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
