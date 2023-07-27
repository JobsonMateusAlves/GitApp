//
//  File.swift
//  
//
//  Created by Jobson Mateus on 27/07/23.
//

import Foundation
import DomainLayer

public protocol UserDetailViewModel {
    var user: User { get set }
    func getUser(completion: @escaping (() -> Void))
}

public class UserDetailViewModelImpl: UserListViewModel {
    var user: User
    
    public init(
        user: User
    ) {
        self.user = user
    }
    
    public func getUser(completion: @escaping (() -> Void)) {
       
    }
}
