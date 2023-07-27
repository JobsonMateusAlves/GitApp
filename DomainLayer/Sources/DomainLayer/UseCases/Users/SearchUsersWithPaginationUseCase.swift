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

public final class SearchUsersWithPaginationUseCaseImpl: SearchUsersWithPaginationUseCase {
    private let repository: UsersRepository
    
    public init(repository: UsersRepository) {
        self.repository = repository
    }
    
    public func call(searchText: String, isFirstPage: Bool, completion: @escaping (Result<[User], Error>) -> Void) {
        repository.search(searchText: searchText, isFirstPage: isFirstPage, completion: completion)
    }
}

public struct SearchUsersWithPaginationUseCaseFactory {
    public static func make(repository: UsersRepository) -> SearchUsersWithPaginationUseCase {
        SearchUsersWithPaginationUseCaseImpl(repository: repository)
    }
}