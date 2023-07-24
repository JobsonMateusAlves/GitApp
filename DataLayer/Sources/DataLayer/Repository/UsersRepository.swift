//
//  File.swift
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
    
    func fetchAll(completion: (Result<[DomainLayer.User], Error>)) {
        service.fetchAll { result in
            
        }
    }
}
