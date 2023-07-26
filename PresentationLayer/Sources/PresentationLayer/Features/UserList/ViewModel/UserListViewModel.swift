//
//  File.swift
//  
//
//  Created by Jobson Mateus on 25/07/23.
//

import Foundation
import DomainLayer

public protocol UserListViewModel {
    var numberOfUsers: Int { get }
    func userAt(index: Int) -> User
    func getUsers(isFirstPage: Bool, completion: @escaping (() -> Void))
}

public class UserListViewModelImpl: UserListViewModel {
    
    private let getUsersWithPaginationUseCase: GetUsersWithPaginationUseCase
    private var users: [User] = []
    
    public var numberOfUsers: Int {
        users.count
    }
    
    public init(getUsersWithPaginationUseCase: GetUsersWithPaginationUseCase) {
        self.getUsersWithPaginationUseCase = getUsersWithPaginationUseCase
    }
    
    public func getUsers(isFirstPage: Bool, completion: @escaping (() -> Void)) {
        getUsersWithPaginationUseCase.call(isFirstPage: isFirstPage) { [weak self] result in
            switch result {
            case .success(let users):
                if isFirstPage {
                    self?.users = users
                } else {
                    self?.users.append(contentsOf: users)
                }
                
            case .failure(let error):
                break
            }
            completion()
        }
    }
    
    public func userAt(index: Int) -> DomainLayer.User {
        users[index]
    }
}
