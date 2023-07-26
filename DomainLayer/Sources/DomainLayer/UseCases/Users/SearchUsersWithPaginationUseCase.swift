//
//  File.swift
//  
//
//  Created by Jobson Mateus on 25/07/23.
//

import Foundation

// MARK: protocol
public protocol SearchUsersWithPaginationUseCase {
    func call(searchText: String, isFirstPage: Bool, completion: @escaping (Result<[User], Error>) -> Void)
}

final class SearchUsersWithPaginationUseCaseImpl: SearchUsersWithPaginationUseCase {
    private let repository: UsersRepository
    
    init(repository: UsersRepository) {
        self.repository = repository
    }
    
    func call(searchText: String, isFirstPage: Bool, completion: @escaping (Result<[User], Error>) -> Void) {
        repository.search(searchText: searchText, isFirstPage: isFirstPage, completion: completion)
    }
}

