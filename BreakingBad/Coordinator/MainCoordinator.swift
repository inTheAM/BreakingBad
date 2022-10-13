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
        let viewController = ViewController()
        viewController.coordinator = self
        navigationController.pushViewController(viewController, animated: false)
    }
    
    func showDetail(for model: Model) {
        
    }
    
}
