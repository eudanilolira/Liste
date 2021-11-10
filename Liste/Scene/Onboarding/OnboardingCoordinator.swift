//
//  OnboardingCoordinator.swift
//  Liste
//
//  Created by Danilo on 09/11/21.
//

import Foundation
import UIKit


class OnboardingCoordinator: Coordinator {
    weak var finishDelegate: CoordinatorFinishDelegate?
    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []
    var type: CoordinatorType = .onboarding
    
    enum Route {
        case firstOnboarding
        case secondOnboarding
        case thirdOnboarding
        
    }
    
    required init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
        
    func start() {
        showOnboardingViewController()
    }
    
    func navigate(to route: Route) {
        
    }
    
    func showOnboardingViewController() {
        let onboardingVC: OnboardingViewController = .init()
        onboardingVC.didSendEventClosure = { [weak self] event in
            self?.finish()
        }
        
        navigationController.pushViewController(onboardingVC, animated: true)
    }
}
