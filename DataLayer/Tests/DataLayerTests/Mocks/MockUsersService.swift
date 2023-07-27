//
//  File.swift
//  
//
//  Created by Jobson Mateus on 27/07/23.
//

@testable import DataLayer

class MockUsersService: UsersService {
    
    let users: [User] = [
        User(
            login: "JobsonMateus",
            id: 12,
            avatarUrl: "https://avatars.githubusercontent.com/u/44685592?v=4",
            htmlUrl: "https://github.com/JobsonMateusAlves",
            name: "Jobson Mateus",
            bio: "iOS Developer",
            location: "Fortaleza - CE",
            publicRepos: 22,
            followers: 23,
            following: 23
        ),
        User(
            login: "UserTest",
            id: 1,
            avatarUrl: "https://avatars.githubusercontent.com/u/374983?v=4",
            htmlUrl: "https://github.com/UserTest",
            name: "User Test",
            bio: "Android Developer",
            location: "Fortaleza - CE",
            publicRepos: 15,
            followers: 20,
            following: 20
        )
    ]
    
    func fetchAll(isFirstPage: Bool, completion: @escaping (Result<[DataLayer.User], Error>) -> Void) {
        completion(
            .success(
                users
            )
        )
    }
    
    func search(searchText: String, isFirstPage: Bool, completion: @escaping (Result<[DataLayer.User], Error>) -> Void) {
        completion(
            .success(
                users
            )
        )
    }
    
    func fetch(user: DataLayer.User, completion: @escaping (Result<DataLayer.User, Error>) -> Void) {
        completion(
            .success(
                User(
                    login: "JobsonMateus",
                    id: 12,
                    avatarUrl: "https://avatars.githubusercontent.com/u/44685592?v=4",
                    htmlUrl: "https://github.com/JobsonMateusAlves",
                    name: "Jobson Mateus",
                    bio: "iOS Developer",
                    location: "Fortaleza - CE",
                    publicRepos: 22,
                    followers: 23,
                    following: 23
                )
            )
        )
    }
}
