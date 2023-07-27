//
//  File.swift
//  
//
//  Created by Jobson Mateus on 27/07/23.
//

import XCTest
import DomainLayer
@testable import DataLayer

final class UsersRepositoryTests: XCTestCase {
    
    let users: [DomainLayer.User] = [
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
    
    func testFetchProductsWithSuccess() throws {
        let repository: UsersRepository = UsersRepositoryImpl(
            service: MockUsersService()
        )
        
        repository.fetchAll(isFirstPage: true) { result in
            switch result {
            case .success(let response):
                XCTAssertEqual(response.count, 2)
                XCTAssertEqual(response.first, self.users.first)
                XCTAssertEqual(response.last, self.users.last)
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
        }
    }
}

