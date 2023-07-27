//
//  User.swift
//  
//
//  Created by Jobson Mateus on 22/07/23.
//

import Foundation

public struct User: Equatable {
    public let login: String
    public let id: Int
    public let avatarUrl: String
    public let htmlUrl: String
    public let name: String
    public let bio: String
    public let location: String
    public let publicRepos: Int
    public let followers: Int
    public let following: Int
    
    public init(
        login: String,
        id: Int,
        avatarUrl: String,
        htmlUrl: String,
        name: String,
        bio: String,
        location: String,
        publicRepos: Int,
        followers: Int,
        following: Int
    ){
        self.login = login
        self.id = id
        self.avatarUrl = avatarUrl
        self.htmlUrl = htmlUrl
        self.name = name
        self.bio = bio
        self.location = location
        self.publicRepos = publicRepos
        self.followers = followers
        self.following = following
    }
}
