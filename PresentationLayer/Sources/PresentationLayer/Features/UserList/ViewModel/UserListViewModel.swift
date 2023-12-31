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
    var isSearching: Bool { get set }
    func userAt(index: Int) -> User
    func getUsers(isFirstPage: Bool, completion: @escaping (() -> Void))
    func searchUsers(searchText: String, isFirstPage: Bool, completion: @escaping (() -> Void))
}

public class UserListViewModelImpl: UserListViewModel {
    
    private let getUsersWithPaginationUseCase: GetUsersWithPaginationUseCase
    private let searchUsersWithPaginationUseCase: SearchUsersWithPaginationUseCase
    private var users: [User] = []
    public var isSearching: Bool = false
    
    public var numberOfUsers: Int {
        users.count
    }
    
    public init(
        getUsersWithPaginationUseCase: GetUsersWithPaginationUseCase,
        searchUsersWithPaginationUseCase: SearchUsersWithPaginationUseCase
    ) {
        self.getUsersWithPaginationUseCase = getUsersWithPaginationUseCase
        self.searchUsersWithPaginationUseCase = searchUsersWithPaginationUseCase
    }
    
    public func getUsers(isFirstPage: Bool, completion: @escaping (() -> Void)) {
        isSearching = false
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
    
    public func searchUsers(searchText: String, isFirstPage: Bool, completion: @escaping (() -> Void)) {
        isSearching = true
        searchUsersWithPaginationUseCase.call(searchText: searchText, isFirstPage: isFirstPage) { [weak self] result in
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

public struct UserListViewModelFactory {
    public static func make(
        getUsersWithPaginationUseCase: GetUsersWithPaginationUseCase,
        searchUsersWithPaginationUseCase: SearchUsersWithPaginationUseCase
    ) -> UserListViewModel {
        UserListViewModelImpl(
            getUsersWithPaginationUseCase: getUsersWithPaginationUseCase,
            searchUsersWithPaginationUseCase: searchUsersWithPaginationUseCase
        )
    }
}