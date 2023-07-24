//
//  File.swift
//  
//
//  Created by Jobson Mateus on 22/07/23.
//

import Foundation
import Network
import DomainLayer

protocol UsersService {
    func fetchAll(completion: @escaping (Result<[User], Error>) -> Void)
}

final class UsersServiceImpl: Provider, UsersService {

    func fetchAll(completion: @escaping (Result<[User], Error>) -> Void) {

        request(target: UsersAPI.fetchAll) { result in
            switch result {
            case .success:
                // TODO: Decode
                completion(.success([]))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
