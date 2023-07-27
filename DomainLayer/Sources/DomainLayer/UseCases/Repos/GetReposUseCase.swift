//
//  File.swift
//  
//
//  Created by Jobson Mateus on 27/07/23.
//

import Foundation

public protocol GetReposUseCase {
    func call(isFirstPage: Bool, user: User, completion: @escaping (Result<[Repo], Error>) -> Void)
}

public final class GetReposUseCaseImpl: GetReposUseCase {
    
    private let repository: ReposRepository
    
    public init(repository: ReposRepository) {
        self.repository = repository
    }
    
    public func call(isFirstPage: Bool, user: User, completion: @escaping (Result<[Repo], Error>) -> Void) {
        repository.fetchAll(isFirstPage: isFirstPage, user: user, completion: completion)
    }
}

public struct GetReposUseCaseFactory {
    public static func make(repository: ReposRepository) -> GetReposUseCase {
        GetReposUseCaseImpl(repository: repository)
    }
}
