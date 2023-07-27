//
//  GetReposUseCaseTests.swift
//  
//
//  Created by Jobson Mateus on 27/07/23.
//

import XCTest
@testable import DomainLayer

final class GetReposUseCaseTests: XCTestCase {
    
    func testGetOnSaleProductList() {
        let repository = MockReposRepository()
        let useCase: GetReposUseCase = GetReposUseCaseFactory.make(
            repository: repository
        )
        let user: User = User(
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
        
        useCase.call(
            isFirstPage: true,
            user: user
        ) { result in
            switch result {
            case .success(let response):
                XCTAssertEqual(response.count, 2)
                XCTAssertEqual(response.first, repository.repos.first)
                XCTAssertEqual(response.last, repository.repos.last)
                
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
        }
    }
    
}
