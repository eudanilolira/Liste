//
//  Coordinator.swift
//  Liste
//
//  Created by Danilo on 08/11/21.
//

import Foundation
import UIKit

// App coordinator is the only one coordinator which will exist during app's life cycle
class MainCoordinator: Coordinator {
    weak var finishDelegate: CoordinatorFinishDelegate? = nil
    var navigationController: UINavigationController
    var childCoordinators = [Coordinator]()
    var type: CoordinatorType = .main
    
    enum Route {
        case onboarding
        case tab
    }
    
    required init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
//        navigationController.setNavigationBarHidden(true, animated: true)
    }

    func start() {
        //TODO: Verificar se o usuário já viu o onboarding
        self.navigate(to: .onboarding)
    }
        
    func navigate(to route: Route) {
        switch route {
        case .onboarding:
            let onboardingCoordinator = OnboardingCoordinator(navigationController)
            onboardingCoordinator.finishDelegate = self
            onboardingCoordinator.start()
            childCoordinators.append(onboardingCoordinator)

        case .tab:
            let appCoordinator = AppCoordinator(navigationController)
            appCoordinator.finishDelegate = self
            appCoordinator.start()
            childCoordinators.append(appCoordinator)
        }
    }
}

extension MainCoordinator: CoordinatorFinishDelegate {
    func coordinatorDidFinish(childCoordinator: Coordinator) {
        childCoordinators = childCoordinators.filter({ $0.type != childCoordinator.type })
        
        switch childCoordinator.type {
        case .tab:
            navigationController.viewControllers.removeAll()
            navigate(to: .onboarding)
        case .onboarding:
            navigationController.viewControllers.removeAll()
            navigate(to: .tab)
        default:
            break
        }
    }
}
