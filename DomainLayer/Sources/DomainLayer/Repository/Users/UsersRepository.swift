//
//  UsersRepository.swift
//  
//
//  Created by Jobson Mateus on 22/07/23.
//

import Foundation

public protocol UsersRepository {
    func fetchAll(isFirstPage: Bool, completion: @escaping (Result<[User], Error>) -> Void)
    func search(searchText: String, isFirstPage: Bool, completion: @escaping (Result<[User], Error>) -> Void)
    func fetch(user: User, completion: @escaping (Result<User, Error>) -> Void)
}
