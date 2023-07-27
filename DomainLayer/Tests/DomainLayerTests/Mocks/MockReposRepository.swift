//
//  File.swift
//  
//
//  Created by Jobson Mateus on 27/07/23.
//

import Foundation
@testable import DomainLayer

class MockReposRepository: ReposRepository {
    
    let repos: [Repo] = [
        Repo(
            name: "Agenda",
            language: "Swift"
        ),
        Repo(
            name: "GitApp",
            language: "Swift"
        )
    ]
    
    func fetchAll(isFirstPage: Bool, user: DomainLayer.User, completion: @escaping (Result<[DomainLayer.Repo], Error>) -> Void) {
        completion(.success(repos))
    }
}
