//
//  SetRoutineViewModel.swift
//  Liste
//
//  Created by Danilo on 11/11/21.
//

import Foundation

class SetRoutineViewModel {
    typealias Route = OnboardingCoordinator.Route

    weak var coordinator: OnboardingCoordinator?
    
    init(coordinator: OnboardingCoordinator) {
        self.coordinator = coordinator
    }
    
    func showNextPage() {
        coordinator?.navigate(to: .welcome)
    }
}
