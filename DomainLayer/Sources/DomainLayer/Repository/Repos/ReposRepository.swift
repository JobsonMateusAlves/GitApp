//
//  ReposRepository.swift
//  
//
//  Created by Jobson Mateus on 27/07/23.
//

import Foundation

public protocol ReposRepository {
    func fetchAll(isFirstPage: Bool, completion: @escaping (Result<[Repo], Error>) -> Void)
}
