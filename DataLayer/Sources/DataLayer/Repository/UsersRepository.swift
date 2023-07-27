//
//  UsersRepository.swift
//  
//
//  Created by Jobson Mateus on 22/07/23.
//

import Foundation
import DomainLayer

final class UsersRepositoryImpl: UsersRepository {
    let service: UsersService
    
    init(service: UsersService) {
        self.service = service
    }
    
    func fetchAll(isFirstPage: Bool, completion: @escaping (Result<[DomainLayer.User], Error>) -> Void) {
        service.fetchAll(isFirstPage: isFirstPage) { result in
            switch result {
            case .success(let users):
                completion(.success(users.map({ $0.toDomain() })))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func search(searchText: String, isFirstPage: Bool, completion: @escaping (Result<[DomainLayer.User], Error>) -> Void) {
        service.search(searchText: searchText, isFirstPage: isFirstPage) { result in
            switch result {
            case .success(let users):
                completion(.success(users.map({ $0.toDomain() })))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    func fetch(user: DomainLayer.User, completion: @escaping (Result<DomainLayer.User, Error>) -> Void) {
        service.fetch(user: DataLayer.User.from(domain: user)) { result in
            switch result {
            case .success(let newUser):
                completion(.success(newUser.toDomain()))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}

public struct UsersRepositoryFactory {
    public static func make() -> UsersRepository {
        UsersRepositoryImpl(service: UsersServiceImpl())
    }
}
