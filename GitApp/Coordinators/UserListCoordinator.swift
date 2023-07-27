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
        let viewModel: UserListViewModel = UserListViewModelImpl(
            getUsersWithPaginationUseCase: GetUsersWithPaginationUseCaseImpl(
                repository: UsersRepositoryFactory.make()
            ),
            searchUsersWithPaginationUseCase: SearchUsersWithPaginationUseCaseImpl(
                repository: UsersRepositoryFactory.make()
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
    
    func startUserDetailFlow() {
        let coordinator: Coordinator = UserDetailCoordinator(navigationController: navigationController)
        childCoordinators.append(coordinator)
        coordinator.start()
    }
}
