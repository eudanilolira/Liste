//
//  SetRoutineViewModel.swift
//  Liste
//
//  Created by Danilo on 11/11/21.
//

import Foundation

class SetRoutineViewModel {
    var routine = Routine()
    
    typealias Route = OnboardingCoordinator.Route

    weak var coordinator: OnboardingCoordinator?
    
    init(coordinator: OnboardingCoordinator) {
        self.coordinator = coordinator
        
    }
    
    func showNextPage() {
        coordinator?.routine = routine
        coordinator?.navigate(to: .setSleepTime)
    }
    
}
