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

class UserDetailCoordinator: Coordinator {
    var finish: (() -> Void)?
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let controller: UIViewController = UserDetailViewController()
        navigationController.pushViewController(controller, animated: true)
    }
}
