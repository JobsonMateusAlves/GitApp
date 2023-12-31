//
//  File.swift
//  
//
//  Created by Jobson Mateus on 27/07/23.
//

import Foundation

// MARK: protocol
public protocol GetUserDetailUseCase {
    func call(user: User, completion: @escaping (Result<User, Error>) -> Void)
}

public final class GetUserDetailUseCaseImpl: GetUserDetailUseCase {
    
    private let repository: UsersRepository
    
    public init(repository: UsersRepository) {
        self.repository = repository
    }
    
    public func call(user: User, completion: @escaping (Result<User, Error>) -> Void) {
        repository.fetch(user: user, completion: completion)
    }
}

public struct GetUserDetailUseCaseFactory {
    public static func make(repository: UsersRepository) -> GetUserDetailUseCase {
        GetUserDetailUseCaseImpl(repository: repository)
    }
}
