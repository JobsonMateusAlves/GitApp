//
//  File.swift
//  
//
//  Created by Jobson Mateus on 25/07/23.
//

import Foundation

// MARK: protocol
public protocol GetUsersWithPaginationUseCase {
    func call(isFirstPage: Bool, completion: @escaping (Result<[User], Error>) -> Void)
}

public final class GetUsersWithPaginationUseCaseImpl: GetUsersWithPaginationUseCase {
    
    private let repository: UsersRepository
    
    public init(repository: UsersRepository) {
        self.repository = repository
    }
    
    public func call(isFirstPage: Bool, completion: @escaping (Result<[User], Error>) -> Void) {
        repository.fetchAll(isFirstPage: isFirstPage, completion: completion)
    }
}


