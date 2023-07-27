//
//  UserListCoordinator.swift
//  GitApp
//
//  Created by Jobson Mateus on 26/07/23.
//

import UIKit
import DomainLayer
import PresentationLayer
import DataLayer

class UserListCoordinator: UserList, Coordinator {
    var finish: (() -> Void)?
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let repository: UsersRepository = UsersRepositoryFactory.make()

        let viewModel: UserListViewModel = UserListViewModelFactory.make(
            getUsersWithPaginationUseCase: GetUsersWithPaginationUseCaseFactory.make(
                repository: repository
            ),
            searchUsersWithPaginationUseCase: SearchUsersWithPaginationUseCaseFactory.make(
                repository: repository
            )
        )
        
        let controller = UserListViewController(
            viewModel: viewModel,
            coordinator: self
        )
        
        UIView.transition(with: navigationController.view, duration: 0.5, options: [.transitionCrossDissolve]) { [weak self] in
            self?.navigationController.setViewControllers([controller], animated: true)
        }
    }
    
    func startUserDetailFlow(user: User) {
        let coordinator: Coordinator = UserDetailCoordinator(navigationController: navigationController, user: user)
        childCoordinators.append(coordinator)
        coordinator.start()
    }
}
