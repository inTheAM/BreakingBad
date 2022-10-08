//
//  Coordinator.swift
//  BreakingBad
//
//  Created by Ahmed Mgua on 08/10/2022.
//

import UIKit

protocol Coordinator: AnyObject {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    
    func start()
}
