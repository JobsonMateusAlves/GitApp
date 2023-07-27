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

public class UserDetailViewModelImpl: UserDetailViewModel {
    private let getUserDetailUseCase: GetUserDetailUseCase
    public var user: User
    
    public init(
        getUserDetailUseCase: GetUserDetailUseCase,
        user: User
    ) {
        self.getUserDetailUseCase = getUserDetailUseCase
        self.user = user
    }
    
    public func getUser(completion: @escaping (() -> Void)) {
        getUserDetailUseCase.call(user: user) { [weak self] result in
            switch result {
            case .success(let user):
                self?.user = user
            case .failure(let error):
                break
            }
            completion()
        }
    }
}

public struct UserDetailViewModelFactory {
    public static func make(getUserDetailUseCase: GetUserDetailUseCase, user: User) -> UserDetailViewModel {
        UserDetailViewModelImpl(getUserDetailUseCase: getUserDetailUseCase, user: user)
    }
}
