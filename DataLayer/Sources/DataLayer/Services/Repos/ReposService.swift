//
//  File.swift
//  
//
//  Created by Jobson Mateus on 27/07/23.
//

import Foundation
import Network

protocol ReposService {
    func fetchAll(isFirstPage: Bool, user: User, completion: @escaping (Result<[Repo], Error>) -> Void)
}

final class ReposServiceImpl: Provider, ReposService {
    var page: Int = 1
    
    func fetchAll(isFirstPage: Bool, user: User, completion: @escaping (Result<[Repo], Error>) -> Void) {
        if isFirstPage {
            page = 1
        }
        
        request(target: ReposAPI.fetchAll(user: user, page: page)) { [weak self] result in
            switch result {
            case .success((let data, _)):
                do {
                    let users: [Repo] = try JSONDecoder().decode([Repo].self, from: data)
                    self?.page += 1
                    completion(.success(users))
                } catch {
                    completion(.failure(APIError.parseFailed))
                }
                
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
