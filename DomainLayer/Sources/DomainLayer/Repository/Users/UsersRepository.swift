//
//  File.swift
//  
//
//  Created by Jobson Mateus on 22/07/23.
//

import Foundation

public protocol UsersRepository {
    func fetchAll(completion: (Result<[User], Error>))
}
