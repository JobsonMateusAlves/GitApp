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
    public let name: String?
    public let bio: String?
    public let location: String?
    public let publicRepos: Int?
    public let followers: Int?
    public let following: Int?
    
    enum CodingKeys: String, CodingKey {
        case login
        case id
        case avatarUrl = "avatar_url"
        case htmlUrl = "html_url"
        case name
        case bio
        case location
        case publicRepos = "public_repos"
        case followers
        case following
    }
    
    public init(
        login: String,
        id: Int,
        avatarUrl: String,
        htmlUrl: String,
        name: String?,
        bio: String?,
        location: String?,
        publicRepos: Int?,
        followers: Int?,
        following: Int?
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


extension User: DataModel {
    typealias DomainModel = DomainLayer.User
    
    func toDomain() -> DomainLayer.User {
        return DomainLayer.User(
            login: login,
            id: id,
            avatarUrl: avatarUrl,
            htmlUrl: htmlUrl,
            name: name ?? "",
            bio: bio ?? "",
            location: location ?? "",
            publicRepos: publicRepos ?? 0,
            followers: followers ?? 0,
            following: following ?? 0
        )
    }
    
    func from(domain: DomainLayer.User) -> User {
        return User(
            login: domain.login,
            id: domain.id,
            avatarUrl: domain.avatarUrl,
            htmlUrl: domain.htmlUrl,
            name: domain.name,
            bio: domain.bio,
            location: domain.location,
            publicRepos: domain.publicRepos,
            followers: domain.followers,
            following: domain.following
        )
    }
}
