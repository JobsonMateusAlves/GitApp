//
//  RepoListCoordinator.swift
//  GitApp
//
//  Created by Jobson Mateus on 27/07/23.
//

import UIKit
import DomainLayer
import PresentationLayer
import DataLayer

class RepoListCoordinator: Coordinator, RepoList {
    var finish: (() -> Void)?
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    var user: User

    init(navigationController: UINavigationController, user: User) {
        self.navigationController = navigationController
        self.user = user
    }

    func start() {
        let viewModel: RepoListViewModel = RepoListViewModelFactory.make(
            getReposUseCase: GetReposUseCaseFactory.make(
                repository: ReposRepositoryFactory.make()
            ),
            user: user
        )
        
        let controller = RepoListViewController(
            viewModel: viewModel,
            coordinator: self
        )
        navigationController.pushViewController(controller, animated: true)
    }
    
}
