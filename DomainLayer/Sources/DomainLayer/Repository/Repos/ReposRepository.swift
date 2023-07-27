//
//  ReposRepository.swift
//  
//
//  Created by Jobson Mateus on 27/07/23.
//

import Foundation

public protocol ReposRepository {
    func fetchAll(isFirstPage: Bool, user: User, completion: @escaping (Result<[DomainLayer.Repo], Error>) -> Void)
}
