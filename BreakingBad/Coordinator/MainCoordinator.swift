//
//  MainCoordinator.swift
//  BreakingBad
//
//  Created by Ahmed Mgua on 08/10/2022.
//

import UIKit

final class MainCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewController = CharactersListViewController()
        viewController.coordinator = self
        navigationController.pushViewController(viewController, animated: false)
    }
    
    func showDetail(for model: Model) {
        guard let character = model as? BBCharacter
        else { return }
        let viewController = CharacterDetailViewController()
        viewController.character = character
        navigationController.pushViewController(viewController, animated: true)
    }
    
}
