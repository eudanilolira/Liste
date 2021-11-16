//
//  SetTimeViewModel.swift
//  Liste
//
//  Created by Danilo on 11/11/21.
//

import Foundation

class SetTimeViewModel {
    typealias Route = OnboardingCoordinator.Route

    weak var coordinator: OnboardingCoordinator?
    
    init(coordinator: OnboardingCoordinator) {
        self.coordinator = coordinator
    }
    
    func showNextPage() {
        let nextPage = coordinator?.routine?.nextRoutine()
        
        switch nextPage {
        case .work:
            coordinator?.navigate(to: .setWorkTime)
        case .study:
            coordinator?.navigate(to: .setStudyTime)
        case .sports:
            coordinator?.navigate(to: .setSportsTime)
        case .fun:
            coordinator?.navigate(to: .setFunTime)
        default:
            coordinator?.navigate(to: .allReady)
        }
    }
}
