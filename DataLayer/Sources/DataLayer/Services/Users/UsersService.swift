//
//  UsersService.swift
//  
//
//  Created by Jobson Mateus on 22/07/23.
//

import Foundation
import Network

protocol UsersService {
    func fetchAll(isFirstPage: Bool, completion: @escaping (Result<[User], Error>) -> Void)
    func search(searchText: String, isFirstPage: Bool, completion: @escaping (Result<[User], Error>) -> Void)
    func fetch(user: User, completion: @escaping (Result<User, Error>) -> Void)
}

final class UsersServiceImpl: Provider, UsersService {
    var since: Int?
    var page: Int = 1
    
    func fetchAll(isFirstPage: Bool, completion: @escaping (Result<[User], Error>) -> Void) {
        if isFirstPage {
            since = nil
        }
        
        request(target: UsersAPI.fetchAll(since)) { [weak self] result in
            switch result {
            case .success((let data, _)):
                do {
                    let users: [User] = try JSONDecoder().decode([User].self, from: data)
                    self?.since = users.last?.id
                    completion(.success(users))
                } catch {
                    completion(.failure(APIError.parseFailed))
                }
                
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func search(searchText: String, isFirstPage: Bool, completion: @escaping (Result<[User], Error>) -> Void) {
        if isFirstPage {
            page = 1
        }
        
        request(target: UsersAPI.search(searchText: searchText, page: page)) { [weak self] result in
            switch result {
            case .success((let data, _)):
                do {
                    let users: [User] = try JSONDecoder().decode(UserSearchResponse.self, from: data).items
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

    func fetch(user: User, completion: @escaping (Result<User, Error>) -> Void) {
        request(target: UsersAPI.fetch(user: user)) { result in
            switch result {
            case .success((let data, _)):
                do {
                    let users: User = try JSONDecoder().decode(User.self, from: data)
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
