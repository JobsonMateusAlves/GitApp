//
//  File.swift
//  
//
//  Created by Jobson Mateus on 27/07/23.
//

import Foundation
import DomainLayer

final class ReposRepositoryImpl: ReposRepository {
    
    let service: ReposService
    
    init(service: ReposService) {
        self.service = service
    }
    
    func fetchAll(isFirstPage: Bool, user: DomainLayer.User, completion: @escaping (Result<[DomainLayer.Repo], Error>) -> Void) {
        service.fetchAll(isFirstPage: isFirstPage, user: User.from(domain: user)) { result in
            switch result {
            case .success(let repos):
                completion(.success(repos.map({ $0.toDomain() })))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}

public struct ReposRepositoryFactory {
    public static func make() -> ReposRepository {
        ReposRepositoryImpl(service: ReposServiceImpl())
    }
}
