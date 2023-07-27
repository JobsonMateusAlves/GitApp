//
//  File.swift
//  
//
//  Created by Jobson Mateus on 27/07/23.
//

import Foundation
import DomainLayer


public protocol RepoListViewModel {
    var numberOfRepos: Int { get }
    func repoAt(index: Int) -> Repo
    func getRepos(isFirstPage: Bool, completion: @escaping (() -> Void))
}

public class RepoListViewModelImpl: RepoListViewModel {
    
    private let getReposUseCase: GetReposUseCase
    private var user: User
    private var repos: [Repo] = []
    public var numberOfRepos: Int {
        repos.count
    }
    
    public init(
        getReposUseCase: GetReposUseCase,
        user: User
    ) {
        self.getReposUseCase = getReposUseCase
        self.user = user
    }
    
    public func getRepos(isFirstPage: Bool, completion: @escaping (() -> Void)) {
        getReposUseCase.call(isFirstPage: isFirstPage, user: user) { [weak self] result in
            switch result {
            case .success(let repos):
                if isFirstPage {
                    self?.repos = repos
                } else {
                    self?.repos.append(contentsOf: repos)
                }

            case .failure(let error):
                break
            }
            completion()
        }
    }
    
    public func repoAt(index: Int) -> DomainLayer.Repo {
        repos[index]
    }
}

public struct RepoListViewModelFactory {
    public static func make(
        getReposUseCase: GetReposUseCase,
        user: User
    ) -> RepoListViewModel {
        RepoListViewModelImpl(
            getReposUseCase: getReposUseCase,
            user: user
        )
    }
}
