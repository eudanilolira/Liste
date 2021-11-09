//
//  Coordinator.swift
//  Liste
//
//  Created by Danilo on 08/11/21.
//

import UIKit

protocol Coordinator {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }

    func start()
}
