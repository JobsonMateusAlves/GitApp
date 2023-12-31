//
//  UserDetailCoordinator.swift
//  GitApp
//
//  Created by Jobson Mateus on 26/07/23.
//

import UIKit
import DomainLayer
import PresentationLayer
import DataLayer

class UserDetailCoordinator: Coordinator, UserDetail {
    var finish: (() -> Void)?
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    var user: User

    init(navigationController: UINavigationController, user: User) {
        self.navigationController = navigationController
        self.user = user
    }

    func start() {
        let viewModel: UserDetailViewModel = UserDetailViewModelFactory.make(
            getUserDetailUseCase: GetUserDetailUseCaseFactory.make(
                repository: UsersRepositoryFactory.make()
            ),
            user: user
        )
        
        let controller = UserDetailViewController(
            viewModel: viewModel,
            coordinator: self
        )
        navigationController.pushViewController(controller, animated: true)
    }
    
    func startRepoListFlow(user: User) {
        let coordinator: Coordinator = RepoListCoordinator(navigationController: navigationController, user: user)
        childCoordinators.append(coordinator)
        coordinator.start()
    }
}
